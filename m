Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2991BC433FE
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 19:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B450E61120;
	Tue, 18 Oct 2022 19:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B450E61120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9jTHcCYieCI6; Tue, 18 Oct 2022 19:43:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF2436111B;
	Tue, 18 Oct 2022 19:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF2436111B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 718921BF95F
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 19:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CD1A83E22
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 19:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CD1A83E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aESUAsyBWi7M for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 19:43:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ACBA8349A
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2ACBA8349A
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 19:43:11 +0000 (UTC)
Received: from opfednr02.francetelecom.fr (unknown [xx.xx.xx.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr21.francetelecom.fr (ESMTP service) with ESMTPS id 4MsPRJ4hNWz5vs1; 
 Tue, 18 Oct 2022 21:43:08 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 18 Oct 2022 21:43:06 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 18 Oct 2022 21:43:06 +0200
Message-ID: <10881_1666122188_634F01CC_10881_33_1_cover.1666122184.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX301.corporate.adroot.infra.ftgroup
 (10.115.26.10) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1666122188;
 bh=xeXetC6HudmbqQFwfEYelsrYjkv3r8UQW+FMD+JVWwc=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=gN/lou0a5gmu9AjKm/nJ77OZcNSMeCAgPP8XMJXtyI/xIUYS8UPmzzCtqD0+cw1Ic
 ry5OqgF9qH9Mw3Fpm4GjbuOS88IbM1dKicbiKg4lKgQEqjoQvrwxVZKAcMtpMgVTWm
 kGIup5ODO6SKZDTOcP5J22GSaU+0xcAWU3pjyuIhtRz9r/l4nS1LnHTwYWni+nLK1A
 XKYeS2YZ1nPyoMINnC9oUi7QKixKEAzWuEgYPMVcGxpUSwlAcMJohNxch5K1XU99s4
 26LzmR68WDxT00oqAHhKhbfsWy0pggMAuI7+uyQVg2swaUW9IllId4e4KQW/YHiI+F
 FAhMa1db55yKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=gN/lou0a
Subject: [Buildroot] [PATCH 0/6 v3] systemd: sort out the conflict between
 var factory and tmpfiles
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Je=CC=81re=CC=81my=20Rosen?= <jeremy.rosen@smile.fr>,
 "Yann E . MORIN" <yann.morin@orange.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This six-patch series touches on the delicate intricacies of the systemd
package and how we integrate it in Buildroot, especially with regard to
read-only filesystems.

The underlying issue is that systemd wants a writable /var filesystem
(it will store a bunch of things at runtime in there). A lot of packages
also expect a writable /var.

The solution we implemented in Buildroot is to generate a factory for
/var, and register that as tmpfiles, at build time, and mount a tmpfs on
the then-empty /var at runtime, so that systemd-tmpfiles populates /var
on boot. Having a tmpfs means /var is repopulated from a clean state at
each boot, and people who want a persistent /var have to provide their
own mechanism to mount their actual filesystem instead.

However, for some people, this does not seem to work as expected, so we
introduced a call to systemd-tmpfiles at build time, to pre-populate the
rootfs from all the tmpfiles, of which our var factory, at build time,
entirely leaving them the reponsibility to make /var read-write.

These two mechanisms clash with each others; they do not prevent a
system from booting, but they cause files to be duplicated between the
factory and the pre-populated /var.

To solve the issue, this series introduces new options, so the user can
elect to use either, none, or both mechanisms, as they see fit.

The first two patches make it easier to change the location where /var
is nounted from, by making it a systemd mount unit, rather than use the
legacy fstab, and move the factory to /usr/share as it is a system
factory (/etc is for the administartor to provide overrides).

Then we move together the two mechanisms under the auspices of a common
package, to make it easier to later make them conditional.

Then we introduce those two new options, that drive each mechanism. We
make sure the behaviour so far is kept, for those who have setups that
are functional as is.

Eventually, we add a new way to provide a writable /var, which uses a
pre-populated /var on which an tmpfs is overlayed with an overlayfs.
This new feature still uses a tmpfs as the writable part, and like for
the factory case, leaves to the user the responsiility to provide for a
persitent filesystem should they need one.

This series would not have been entirely possible without the input from
Norbert, who provided the basis for the overlayfs-based solution.
Thanks!

Changes v2 -> v3:
  - introduce the overlayfs-based proposal from Norbert
  - some rewording
  - some typo fixes (yah, Yann being Yann being me...)

Changes v1 -> v2:
  - split Yann@work initial patch into the first two patch
  - move the systemd-tmpfile handling to the skeleton
  - introduce options to enable/disable factory or systemd-tmpfiles


Regards,
Yann E. MORIN.


The following changes since commit 5b5d3befef9c92a7485c1c68989d95749882ee2a

  package/python-django: security bump to version 4.0.8 (2022-10-17 22:37:25 +0200)


are available as patches in this mail series,

for you to apply patches up to b3efa290e26b85b54ab27728bf190316cf2ab1ee

  system: add option to use an overlayfs on /var on a r/o root w/ systemd (2022-10-18 21:37:43 +0200)


----------------------------------------------------------------
Yann E. MORIN (6):
      package/skeleton-systemd: move /var factory tmpfiles out of /etc
      package/skeleton-systemd: systemd-ify mounting /var tmpfs with ro rootfs
      package/skeleton-systemd: host the tmpfiles preparation script
      system: add options for /var factory and tmpfiles pre-seed
      system: introduce a choice for /var management
      system: add option to use an overlayfs on /var on a r/o root w/ systemd

 package/skeleton-init-systemd/factory/var.mount    | 18 ++++++
 .../fakeroot_tmpfiles.sh                           |  0
 .../overlayfs/rootfs-bindmount-var.service         | 21 +++++++
 package/skeleton-init-systemd/overlayfs/var.mount  | 15 +++++
 .../skeleton-init-systemd/skeleton-init-systemd.mk | 36 ++++++++++--
 package/systemd/systemd.mk                         |  6 --
 system/Config.in                                   | 67 +++++++++++++++++++++-
 7 files changed, 150 insertions(+), 13 deletions(-)
 create mode 100644 package/skeleton-init-systemd/factory/var.mount
 rename package/{systemd => skeleton-init-systemd}/fakeroot_tmpfiles.sh (100%)
 create mode 100644 package/skeleton-init-systemd/overlayfs/rootfs-bindmount-var.service
 create mode 100644 package/skeleton-init-systemd/overlayfs/var.mount

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
