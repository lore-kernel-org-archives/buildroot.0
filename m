From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 15:01:05 +0200
Subject: [Buildroot] [PATCH 1/5] linux: split calling "all" and
 "$(LINUX_TARGET_NAME)" targets
In-Reply-To: <20190422200830.2831-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 22 Apr 2019 22:08:25 +0200")
References: <20190422200830.2831-1-thomas.petazzoni@bootlin.com>
 <20190422200830.2831-2-thomas.petazzoni@bootlin.com>
Message-ID: <87h8akyl7y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In commit ffbe46a5295ce4e0442728f2ad3e19afa7eaa8ed ("linux: simplify
 > LINUX_BUILD_CMDS"), we changed LINUX_BUILD_CMDS to essentially do:

 >   make all $(LINUX_TARGET_NAME)

 > Unfortunately, it turns out that it breaks the build of a number of
 > defconfigs, with errors such as:

 >   fixdep: error opening file: arch/xtensa/boot/lib/.inftrees.o.d: No such file or directory

 > Calling "all" and "$(LINUX_TARGET_NAME)" as separate make invocations
 > avoids this problem, and fixes the build of several defconfigs.

 > Fixes:

 >   ts7680_defconfig
 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/199339583

 >   qemu_xtensa_lx60_defconfig
 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/199339553

 >   roseapplepi_defconfig
 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/199339564

 >   qemu_xtensa_lx60_nommu_defconfig
 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/199339554

 >   qemu_ppc64_e5500_defconfig
 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/199339539

 >   freescale_t2080_qds_rdb_defconfig
 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/199339455

 >   arcturus_ucp1020_defconfig
 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/199339399

 > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
