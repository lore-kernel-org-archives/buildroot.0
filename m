Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CEDCFC539
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 13:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC43760D73;
	Sat, 22 Nov 2025 13:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BaBDntr3JpDs; Sat, 22 Nov 2025 13:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D87460656
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D87460656;
	Sat, 22 Nov 2025 13:28:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1C3634E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93AA981799
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9DfxgiBgp31 for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 13:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE6B58174C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE6B58174C
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:28:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6DEE85D60; Sat, 22 Nov 2025 13:28:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 14:00:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 793ebd5d28095c8df45a0d183d273d8a84b3f0a4
X-Git-Newrev: 6e8686912256971f27eee6dcb2908617d365e145
X-Patchwork-Hint: ignore
Message-Id: <20251122132802.C6DEE85D60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: mkeficapsule needs
 gnutls
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6e8686912256971f27eee6dcb2908617d365e145
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While buildroot commit 14a0169714cd5c35be40faadc066412f144bc1a6 forgot
to add the reverse dependencies of gnutls the buildroot commit
f94ba69770e5c5dc1342bf52657b3565b1a56e6d to fix that forgot to select
gnutls.

Fixes:
https://autobuild.buildroot.org/results/595e9af38fef4729ff3d6f32ad320d46c8c88594/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uboot-tools/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index 4ccef30973..da6cd65252 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -70,6 +70,7 @@ config BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE
 	bool "mkeficapsule"
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR # gnutls
+	select BR2_PACKAGE_GNUTLS
 	help
 	  Install the mkeficapsule tool on the target system
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
