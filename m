Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193BEC38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 21:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD89140122;
	Tue, 25 Oct 2022 21:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD89140122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kn2uBeAqYW7F; Tue, 25 Oct 2022 21:06:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFD5A400D1;
	Tue, 25 Oct 2022 21:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFD5A400D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F1E61BF3AE
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 21:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B56560B6C
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 21:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B56560B6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id APUTLSi2gl1E for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 21:06:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F8F860B01
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 21:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F8F860B01
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E380870B2; Tue, 25 Oct 2022 21:06:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 23:06:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51b04fc02c8ec204b13cbf1f854328c7ca276a20
X-Git-Newrev: 259314f016b0cd7cabfdcce88a5c11f1da5edd05
X-Patchwork-Hint: ignore
Message-Id: <20221025210622.2E380870B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: ignore CVE-2021-46705
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

commit: https://git.buildroot.net/buildroot/commit/?id=259314f016b0cd7cabfdcce88a5c11f1da5edd05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This CVE is specific to the SUSE distribution. See
https://security-tracker.debian.org/tracker/CVE-2021-46705.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/grub2/grub2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index f04be05227..875884cf5c 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -32,6 +32,8 @@ GRUB2_IGNORE_CVES += CVE-2019-14865
 GRUB2_IGNORE_CVES += CVE-2020-15705
 # 0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
 GRUB2_IGNORE_CVES += CVE-2021-3981
+# vulnerability is specific to the SUSE distribution
+GRUB2_IGNORE_CVES += CVE-2021-46705
 
 ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
 GRUB2_INSTALL_TARGET = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
