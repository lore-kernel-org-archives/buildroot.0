From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Apr 2016 23:14:00 +0200
Subject: [Buildroot] [PATCH] gcc: add support for gcc 6
In-Reply-To: <1461765243-19631-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 27 Apr 2016 15:54:03 +0200")
References: <1461765243-19631-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871t5q21rb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds the support for gcc 6. This release allows to remove
 > a large number of our gcc patches, mainly thanks to the Xtensa and
 > musl related patches being merged upstream.

 > Patches kept with no changes:

 >  100-uclibc-conf.patch
 >  301-missing-execinfo_h.patch
 >  810-arm-softfloat-libgcc.patch
 >  830-arm_unbreak_armv4t.patch
 >  840-microblaze-enable-dwarf-eh-support.patch
 >  860-cilk-wchar.patch
 >  890-fix-m68k-compile.patch

 > Patches dropped because they have been merged upstream, or were
 > already upstream backports:

 >  120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch (merged)
 >  850-libstdcxx-uclibc-c99.patch (merged in a different form, see
 >  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58393)
 >  870-xtensa-add-mauto-litpools-option.patch (upstream backport)
 >  871-xtensa-reimplement-register-spilling.patch (upstream backport)
 >  872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch (upstream backport)
 >  873-xtensa-fix-_Unwind_GetCFA.patch (upstream backport)
 >  874-xtensa-add-uclinux-support.patch (upstream backport)
 >  900-libitm-fixes-for-musl-support.patch (upstream backport)
 >  901-fixincludes-update-for-musl-support.patch (upstream backport)
 >  902-unwind-fix-for-musl.patch (upstream backport)
 >  903-libstdc++-libgfortran-gthr-workaround-for-musl.patch (upstream backport)
 >  904-musl-libc-config.patch (upstream backport)
 >  905-add-musl-support-to-gcc.patch (upstream backport)
 >  905-add-musl-support-to-gcc.patch (upstream backport)
 >  906-mips-musl-support.patch (upstream backport)
 >  907-x86-musl-support.patch (upstream backport)
 >  908-arm-musl-support.patch (upstream backport)
 >  909-aarch64-musl-support.patch (upstream backport)

Nice! Committed, thanks.

-- 
Bye, Peter Korsgaard
