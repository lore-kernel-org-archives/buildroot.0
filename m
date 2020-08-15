From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Aug 2020 22:47:35 +0200
Subject: [Buildroot] [PATCH] Revert "toolchain/toolchain-buildroot:
 enable uclibc for riscv64"
In-Reply-To: <20200815203014.GA24264@scaer>
References: <20200815141039.4774-1-thomas.petazzoni@bootlin.com>
 <20200815203014.GA24264@scaer>
Message-ID: <20200815224735.6cccee26@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sat, 15 Aug 2020 22:30:14 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Applied to master, thanks.
> 
> OTOH, I was wondering why we were not adding an exclusion in the
> genrandconfig script, like we do for all the other libffi limitations...

Our libffi exclusions in genrandconfig are really when there is no
support for a given CPU architecture in libffi.

In the situation we're talking about, libffi does have support for
RISC-V 64-bit. The limitation is not in libffi, but in uClibc-ng.

We could certainly have handled that by an autobuilder exception, but
I've never been a big fan of such autobuilder exceptions. That being
said, if the general feeling is that an autobuilder exception is a
better way of avoiding those build failures, I'm fine with changing to
that solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
