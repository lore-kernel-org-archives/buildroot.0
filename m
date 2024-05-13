Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7408C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5137A40824;
	Mon, 13 May 2024 21:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDk2kHWeYawg; Mon, 13 May 2024 21:17:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C38EB408BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C38EB408BC;
	Mon, 13 May 2024 21:17:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33FD91BF947
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DF3360A9C
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_2t1oPiHs4e for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B52860A61
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B52860A61
 for <buildroot@buildroot.org>; Mon, 13 May 2024 21:17:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E50787300; Mon, 13 May 2024 21:17:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 23:13:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 580f6ef46dfec9db8483eeab8d639b935641289f
X-Git-Newrev: cd65b5e7551fe59a663f7c73818ca1777c66c117
X-Patchwork-Hint: ignore
Message-Id: <20240513211740.3E50787300@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvmtool: enable build for riscv
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
Content-Type: multipart/mixed; boundary="===============0766707354745805989=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0766707354745805989==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cd65b5e7551fe59a663f7c73818ca1777c66c117
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kvmtool now supports riscv, enable it and select BR2_PACKAGE_DTC which
is needed to build it.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kvmtool/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/kvmtool/Config.in b/package/kvmtool/Config.in
index bf19a25376..35225e0150 100644
--- a/package/kvmtool/Config.in
+++ b/package/kvmtool/Config.in
@@ -6,11 +6,12 @@ config BR2_PACKAGE_KVMTOOL
 	# Only mips big-endian seems to be supported (build breaks)
 	# Should work on powerpc64 but the build breaks with missing types
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
-		BR2_mips || BR2_x86_64
+		BR2_mips || BR2_x86_64 || BR2_riscv
 	# libfdt is only required for DT architectures...
 	# ...but it's not able to build for static targets
-	depends on !(BR2_STATIC_LIBS && (BR2_aarch64 || BR2_arm || BR2_armeb))
-	select BR2_PACKAGE_DTC if BR2_aarch64 || BR2_arm || BR2_armeb
+	depends on !(BR2_STATIC_LIBS && (BR2_aarch64 || BR2_arm || \
+		BR2_armeb || BR2_riscv))
+	select BR2_PACKAGE_DTC if BR2_aarch64 || BR2_arm || BR2_armeb || BR2_riscv
 	help
 	  kvmtool is a lightweight tool for hosting KVM guests.
 	  As a pure virtualization tool it only supports guests using

--===============0766707354745805989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0766707354745805989==--
