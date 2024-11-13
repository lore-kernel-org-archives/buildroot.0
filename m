Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43782D462DA
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 16:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF6FC4016D;
	Wed, 13 Nov 2024 16:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYOmnmDKXwOY; Wed, 13 Nov 2024 16:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A162E4057E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A162E4057E;
	Wed, 13 Nov 2024 16:48:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 416416C
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AB7840B83
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chAgKckcXYvG for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 16:48:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 227BC4011C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 227BC4011C
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:48:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BF1086309; Wed, 13 Nov 2024 16:48:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Nov 2024 16:55:41 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: f5b935ada7e46ec201ba8f0ec2d8a225028825e1
X-Git-Newrev: 3382f699e7ce4f2ffbd65a61b45eb5a99f7deb90
X-Patchwork-Hint: ignore
Message-Id: <20241113164856.1BF1086309@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/qemu: remove
 leftover QEMU_IGNORE_CVES from Qemu 8.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=3382f699e7ce4f2ffbd65a61b45eb5a99f7deb90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Theses CVE are no longer listed by pkg-stats:

  https://nvd.nist.gov/vuln/detail/CVE-2023-4135
  https://nvd.nist.gov/vuln/detail/CVE-2023-3354
  https://nvd.nist.gov/vuln/detail/CVE-2023-3180

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 10b4c31b812128f255e8ea58050879b953d58f0e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 16cff13d18..a2d164d189 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -17,12 +17,6 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #       individual source files.
 QEMU_CPE_ID_VENDOR = qemu
 
-# Need to ignore the following CVEs because the CPE database does
-# not have an entry for the 8.1.1 version yet.
-QEMU_IGNORE_CVES += CVE-2023-4135
-QEMU_IGNORE_CVES += CVE-2023-3354
-QEMU_IGNORE_CVES += CVE-2023-3180
-
 #-------------------------------------------------------------
 
 # The build system is now partly based on Meson.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
