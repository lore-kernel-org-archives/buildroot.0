From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Aug 2017 01:44:27 +0200
Subject: [Buildroot] defconfigs with upstream kernels
Message-ID: <a1c822f4-061c-527b-5ae2-2a82764159f4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 Currently, we want the defconfigs to have fixed versions of kernel and
bootloader that have been tested on the target platform. However, we *don't*
have fixed versions of GCC, uClibc, and even some bootloaders (grub and syslinux
don't have a version selection).

 Therefore, I wonder if it doesn't make a lot more sense to use
BR2_LINUX_KERNEL_LATEST_VERSION and BR2_TARGET_UBOOT_LATEST_VERSION for boards
that are fully upstream (i.e. without patches).

 It's a divergence from our current philosophy, because the defconfigs are no
longer fixed, but really currently they aren't either. In fact, we see constant
build failures from the GCC bumps (*1) which would be avoided by just using the
latest version (*2). We can assume that upstream does their homework and makes
sure that supported boards remain supported (*3). And we anyway already see
occasional failures due to grub or syslinux bumps.

 Any objections to switching all upstream boards to LATEST?

(*1) Actually, this will be the last time this happens to such a degree, because
both linux and u-boot removed their dependence on the GCC version number.

(*2) Actually, only 5 of the 13 defconfigs that currently fail because of this
use an upstream kernel.

(*3) For the qemu builds, it turns out that we sometimes have to stick to an
older kernel. But qemu is of course special.


 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
