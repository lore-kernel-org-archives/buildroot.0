From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 21:31:29 +0200
Subject: [Buildroot] [PATCH v4 03/15] package/uclibc: remove asm
 constraint
In-Reply-To: <20190620100725.105587-4-giulio.benetti@micronovasrl.com>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-4-giulio.benetti@micronovasrl.com>
Message-ID: <20190622213129.256f4756@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Jun 2019 12:07:13 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> From: Romain Naour <romain.naour@gmail.com>
> 
> uClibc-ng don't build with gcc 9.1 [1] due to a new check that
> "catch illegal asm constraint usage" [2].
> 
> gcc 9.1 print this error:
> "invalid hard register usage between earlyclobber operand and input operand"
> 
> The asm constraint is present in uClibc since it support sparc (back in 2002)[3].
> 
> Note: There is no such constraint is Glibc counterpart code [4].
> 
> [1] https://gitlab.com/kubu93/toolchains-builder/-/jobs/205435757
> [2] https://github.com/gcc-mirror/gcc/commit/b782636f28f5c378897c238081d28d7a4a6ca578
> [3] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=3b6d086531102b6d09ce852feb1e370d5dca3ce9
> [4] https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/sparc/sysdep.h;h=981b2a26b7a91093f821c97876e55bc4be2d9f8a;hb=HEAD
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> I did not fully analyze the asm code to understand why the constraint is present.
> I lightly tested using qemu_sparc_ss10_defconfig.
> Any help is welcome(Romain)
> ---
>  ...arc-syscalls.h-remove-asm-constraint.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/uclibc/0003-RFC-sparc-syscalls.h-remove-asm-constraint.patch

Since the patch was applied upstream in uclibc-ng, I backported the
uclibc-ng patch. Of course the code is the same, but the file name was
a bit different. Also, I updated the commit log to indicate that we're
talking about a sparc issue.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
