Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B774C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 16:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA27360AC6;
	Sat,  5 Nov 2022 16:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA27360AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uoxij5dx1OVJ; Sat,  5 Nov 2022 16:48:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 075FD60A71;
	Sat,  5 Nov 2022 16:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 075FD60A71
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CFC4B1BF870
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 16:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A81A5410DE
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 16:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A81A5410DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OXdko-fUWZzs for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 16:47:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF91340996
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 16:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF91340996
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAEF487AD2; Sat,  5 Nov 2022 16:47:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 17:45:38 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 06bb421e6bb9bd30352f3b1b6bd91d1eb640d927
X-Git-Newrev: e8cccbb50ce5a754f81c2abc64da331577cfce7e
X-Patchwork-Hint: ignore
Message-Id: <20221105164744.BAEF487AD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/grub2: ignore
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8cccbb50ce5a754f81c2abc64da331577cfce7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This CVE is specific to the SUSE distribution. See
https://security-tracker.debian.org/tracker/CVE-2021-46705.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 259314f016b0cd7cabfdcce88a5c11f1da5edd05)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub2/grub2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index d93e383422..59cc1c2353 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -49,6 +49,8 @@ GRUB2_IGNORE_CVES += CVE-2019-14865
 # grub_linuxefi_secure_validate() is not implemented in the grub2
 # version available in Buildroot.
 GRUB2_IGNORE_CVES += CVE-2020-15705
+# vulnerability is specific to the SUSE distribution
+GRUB2_IGNORE_CVES += CVE-2021-46705
 
 ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
 GRUB2_INSTALL_TARGET = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
