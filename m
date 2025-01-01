Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41467E7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 20:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E421480F83;
	Wed,  1 Jan 2025 20:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnF_w84cBg48; Wed,  1 Jan 2025 20:42:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06EFC80F4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06EFC80F4F;
	Wed,  1 Jan 2025 20:42:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80725E0F
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C07260666
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0eqC5gNwBiJN for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 20:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 757A760611
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 757A760611
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:42:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FAFE8324E; Wed,  1 Jan 2025 20:42:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jan 2025 21:20:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 192e1d2147a3de03ac68126b1bedecf1abee4948
X-Git-Newrev: eb9bb656299700a543dc675e6baca0bfe9f53870
X-Patchwork-Hint: ignore
Message-Id: <20250101204227.5FAFE8324E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/ti-k3-r5-loader: add host-gnutls to
 dependencies
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eb9bb656299700a543dc675e6baca0bfe9f53870
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Newer versions of U-Boot (2024.10 and newer) will require the GnuTLS
library to be installed on the host machine to build the mkeficapsule
tool for U-Boot's image packaging phase to generate the final capsule
for all the boot images including the tiboot3.bin image.

Add host-gnutls to the list of dependencies.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483578 (ti_am62x_sk_defconfig)

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index e426f039e0..db5c3cdaf8 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -46,6 +46,7 @@ TI_K3_R5_LOADER_DEPENDENCIES = \
 	host-pkgconf \
 	$(BR2_MAKE_HOST_DEPENDENCY) \
 	host-arm-gnu-toolchain \
+	host-gnutls \
 	host-openssl \
 	host-python3 \
 	host-python-jsonschema \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
