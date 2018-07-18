From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 13:14:30 +0200
Subject: [Buildroot] [PATCH] package/elf2flt: fix build with Binutils >=
 2.31
In-Reply-To: <1531845102-20058-1-git-send-email-romain.naour@smile.fr>
References: <1531845102-20058-1-git-send-email-romain.naour@smile.fr>
Message-ID: <20180718131430.1f02f07f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Tue, 17 Jul 2018 18:31:42 +0200, Romain Naour wrote:
> Binutils added diagnostics.h to bfd.h [1], so elf2flt must create a
> symlink for this header.
> 
> Fixes:
> https://gitlab.com/free-electrons/toolchains-builder/-/jobs/82284139
> 
> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=95da9854466ada2572b42f5528711a06a2d42db1
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks for this fix. After it was applied by Peter, I used it for the
Bootlin toolchains, and I was able to build the ARMv7-M and m68k
Coldfire toolchains with binutils 2.31. They are now online on
toolchains.bootlin.com.

The only remaining toolchain not building with binutils 2.31 is the
xtensa toolchain.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
