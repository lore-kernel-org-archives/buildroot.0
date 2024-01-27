Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8803AC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 18:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E89083DC7;
	Sat, 27 Jan 2024 18:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E89083DC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q6lfnRxzIZQp; Sat, 27 Jan 2024 18:08:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8432583DC3;
	Sat, 27 Jan 2024 18:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8432583DC3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A94D91BF388
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81B024031E
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81B024031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lsvb7hQznJ77 for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 18:07:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 983544012F
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 18:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 983544012F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 841D386581; Sat, 27 Jan 2024 18:07:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 19:07:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1dd1a21d4d85146d2593e3db205c458c44dc8c6a
X-Git-Newrev: 74b6774108cae46a53b6d9d08fe2733c5740f439
X-Patchwork-Hint: ignore
Message-Id: <20240127180757.841D386581@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: install
 rtlwifi/rtl8188fufw variant
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=74b6774108cae46a53b6d9d08fe2733c5740f439
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds support for the rtl8188fufw firmware variant, for 802.11n, as
covered by the mainline rtl8xxxu kernel driver since Linux 6.2.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c09dbc523e..ee51ecc930 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -134,6 +134,7 @@ LINUX_FIRMWARE_FILES += \
 	rtlwifi/rtl8192sefw.bin \
 	rtlwifi/rtl8188efw.bin \
 	rtlwifi/rtl8188eufw.bin \
+	rtlwifi/rtl8188fufw.bin \
 	rtlwifi/rtl8192cufw_A.bin \
 	rtlwifi/rtl8192cufw_B.bin \
 	rtlwifi/rtl8192cufw_TMSC.bin \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
