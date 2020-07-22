From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Jul 2020 09:27:00 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/libabseil-cpp new package
In-Reply-To: <20200721214522.3719304-1-aduskett@gmail.com>
References: <20200721214522.3719304-1-aduskett@gmail.com>
Message-ID: <20200722092700.76f8decd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

Thanks for the new iteration.

On Tue, 21 Jul 2020 14:45:21 -0700
aduskett at gmail.com wrote:

> +Because libabseil-cpp builds static libraries, it is better to set the
> +POSITION_INDEPENDENT_CODE to ON instead of forcing fPIC, as forcing fPIC may
> +cause relocation errors when shared libraries link against the built static
> +libraries.

Duh? This doesn't make much sense to me. Did you perhaps misunderstand
what I said in my previous e-mail ?

When building static libraries, -fPIC is normally not needed.

Except when such static libraries end up being linked into a shared
library, in which case all the code of the shared library (which
includes the static library) must have been compiled with -fPIC.

The reason is pretty simple: the load address of shared libraries is
decided at runtime, and it may be different for every program using a
given shared library. Hence the shared library code must be Position
Independent, so that it can run from any memory address.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
