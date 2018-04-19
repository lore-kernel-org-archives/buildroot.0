From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 22:54:08 +0200
Subject: [Buildroot] [PATCH] package/flann: fix build with cmake >= 3.11
In-Reply-To: <20180418191912.25410-1-romain.naour@gmail.com>
References: <20180418191912.25410-1-romain.naour@gmail.com>
Message-ID: <20180419225408.2ba57fb6@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Wed, 18 Apr 2018 21:19:12 +0200, Romain Naour wrote:

> From [1]:
> "add_library() and add_executable() commands can now be called without
>  any sources and will not complain as long as sources are added later
>  via the target_sources() command."

I must be misunderstanding something then. The code currently is:

add_library(flann_cpp SHARED "")

So it has no source code, and this works fine with CMake < 3.11. And
you're saying that it's only in CMake >= 3.11 that having no source
code is valid.

And you fix that by adding a dummy source code file. I'm totally
confused here.

Also, why do they build a library with nothing inside ? Does it make
sense ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
