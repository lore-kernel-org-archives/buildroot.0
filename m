From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 22:56:44 +0100
Subject: [Buildroot] [PATCHv2 1/2] package/elf2flt: bump version to fix
 build with Binutils >= 2.32
In-Reply-To: <20190310104428.11398-1-romain.naour@smile.fr>
References: <20190310104428.11398-1-romain.naour@smile.fr>
Message-ID: <20190312225644.21b59dea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Sun, 10 Mar 2019 11:44:27 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> From: Romain Naour <romain.naour@gmail.com>
> 
> Binutils added bfd_stdint.h to bfd.h [1], so elf2flt must create a
> symlink for this header.
> 
> Bump the elf2flt version that include the upstream fix [2].
> 
> Keep our local patch 0001-ld-elf2flt-behave-properly-when-called-with-a-name-d.patch
> that was not integrated with the recent project activity [3].
> 
> Fixes:
> [armv7m-uclibc]
> https://gitlab.com/kubu93/toolchains-builder/-/jobs/148356410
> 
> [m68k-coldfire-uclibc]
> https://gitlab.com/kubu93/toolchains-builder/-/jobs/148356412
> 
> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=2d5d5a8f0a8b5a03454bf168b7fa7024bb1ebbd8
> [2] https://github.com/uclinux-dev/elf2flt/commit/429521f695c6f4212d809a141bfa4417b733f395
> [3] https://github.com/uclinux-dev/elf2flt/pull/8
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

I've applied both patches. I have pinged on the elf2flt pull request as
well.

Regarding binutils, we now support 5 versions, which is not good, we
should get back to just 3 versions, and move to binutils 2.31 as the
default. Do you think you could send patches doing that ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
