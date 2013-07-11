From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 11 Jul 2013 16:27:41 +0200
Subject: [Buildroot] [PATCH] gcc: remove BR2_GCC_SHARED_LIBGCC option
In-Reply-To: <1373299185-9359-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 8 Jul 2013 17:59:45 +0200")
References: <1373299185-9359-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r4f5dvdu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Commit 6b48b4803450 ("add a know to enable/disable building a shared
 Thomas> libgcc"), from october 2006, isn't really as to why a
 Thomas> BR2_GCC_SHARED_LIBGCC option was needed. However, now that gcc has
 Thomas> been converted to the package infrastructure, it causes problems
 Thomas> because the host packages are always being passed --enable-shared
 Thomas> --disable-static, so re-adding --disable-shared on top of that break
 Thomas> things.

 Thomas> Moreover, our tests indicate that both a shared *and* a static version
 Thomas> of libgcc are built, and that linking dynamically and statically a
 Thomas> program that uses libgcc_s gives correct results: dynamically linked
 Thomas> against libgcc_s in the first case, statically linked in the second
 Thomas> case.

 Thomas> Therefore, it appears that this option is no longer necessary, and
 Thomas> removing it has the advantage of fixing the builds of
 Thomas> qemu_mips64_malta_defconfig and qemu_sparc_ss10_defconfig, both of
 Thomas> which had BR2_GCC_SHARED_LIBGCC not enabled.

COmmitted, thanks.

-- 
Bye, Peter Korsgaard
