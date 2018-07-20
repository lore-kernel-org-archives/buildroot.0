From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Jul 2018 10:24:17 +0200
Subject: [Buildroot] [PATCH v2] linux: disable attribute alias with gcc
 >= 8.1
In-Reply-To: <20180602143407.20985-1-romain.naour@gmail.com>
References: <20180602143407.20985-1-romain.naour@gmail.com>
Message-ID: <20180720102417.35ab903b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jun 2018 16:34:07 +0200, Romain Naour wrote:
> gcc-8 started warning about function aliases that have a non-matching
> prototype. This seems rather useful in general, but it causes tons of
> warnings in the Linux kernel, where we rely on abusing those aliases
> for system call entry points, in order to sanitze the arguments passed
> from user space in registers.
> 
> See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435
> 
> Disable the attribute-alias warning introduced by gcc-8 by adding
> -Wno-attribute-alias to KCFLAGS.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> v2: use KCFLAGS instead of KBUILD_CFLAGS (ThomasP)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
