Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768DAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 15:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F55760BEC;
	Sun, 20 Mar 2022 15:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1w3fzuoNtg4A; Sun, 20 Mar 2022 15:38:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68AE260BDA;
	Sun, 20 Mar 2022 15:38:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51D811BF97A
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 15:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F7204056E
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 15:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vNTLM926BSyS for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 15:38:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4020240158
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 15:38:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9828684529; Sun, 20 Mar 2022 15:29:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 16:24:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1bb495e8caa3f15bab8ddb059f07d6ad56634f42
X-Git-Newrev: a0d806dea6bc03ba1464152142baa8b6fd0f2a61
X-Patchwork-Hint: ignore
Message-Id: <20220320152913.9828684529@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.64
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a0d806dea6bc03ba1464152142baa8b6fd0f2a61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed all patches after being applied upstream:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=ec8c8f22efb66ccae533fbd55a236570ffcf756c
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=710220f861b100856711a0a4d4a852874228a57a
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9f09e69ecb077082301dafb745856e1f3731aaa7
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=cfab569484b18407fc117bb96634525cc76ea1f5
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=fb57ad9b9d107856e5f1c8135da04ffa2f7a11ac
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=58dec00edcaa316909cdd5309bd7bd3239ee221a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../bluez5_utils-headers/bluez5_utils-headers.mk   |    2 +-
 .../0001-tools-mesh-cfgtest-include-limits.h.patch |   33 -
 ...red-util-Rename-btd_malloc-to-util_malloc.patch |   67 -
 .../0003-shared-util-Add-util_memdup.patch         |   57 -
 ...-Replace-use-of-g_memdup-with-util_memdup.patch | 1411 --------------------
 .../0005-build-Fix-errors-with-glibc-2-25.patch    |  312 -----
 ...006-src-shared-util.h-include-sys-types.h.patch |   39 -
 package/bluez5_utils/bluez5_utils.hash             |    2 +-
 package/bluez5_utils/bluez5_utils.mk               |    4 +-
 9 files changed, 3 insertions(+), 1924 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
