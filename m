Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C0AC4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 16:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A0D60A84;
	Sat,  5 Nov 2022 16:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63A0D60A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IpDFPxDRLIef; Sat,  5 Nov 2022 16:49:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B25760A71;
	Sat,  5 Nov 2022 16:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B25760A71
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1989D1BF38C
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 16:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9B36400D9
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 16:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9B36400D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BaM2C6_PzMUJ for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 16:48:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBAD240148
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 16:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBAD240148
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBE2B87B80; Sat,  5 Nov 2022 16:48:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 17:23:26 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: b1ff39b71191464b49bf9513d211e3f5e687515b
X-Git-Newrev: c7b46b59dc1b467dbd59fe8024e6ef1fbebedaa2
X-Patchwork-Hint: ignore
Message-Id: <20221105164858.DBE2B87B80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] boot/grub2: ignore
 CVE-2021-46705
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7b46b59dc1b467dbd59fe8024e6ef1fbebedaa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

This CVE is specific to the SUSE distribution. See
https://security-tracker.debian.org/tracker/CVE-2021-46705.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 259314f016b0cd7cabfdcce88a5c11f1da5edd05)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
