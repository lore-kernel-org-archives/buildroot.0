Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673BCC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04B9C832EA;
	Wed,  9 Feb 2022 21:38:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Bwo8f0SySJE; Wed,  9 Feb 2022 21:38:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A7F783227;
	Wed,  9 Feb 2022 21:38:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC0261BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E15D60E68
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id roebdhP3l7M5 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DDF460E40
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 905788323C; Wed,  9 Feb 2022 21:25:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:07:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf47c53f80a6ab82971b70b5475ecc26beffeef7
X-Git-Newrev: 459dd7a9850c7b3be519ae6bf7cc6a689c22cd32
X-Patchwork-Hint: ignore
Message-Id: <20220209212559.905788323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-compose: drop reference to
 BR2_PACKAGE_PYTHON
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

commit: https://git.buildroot.net/buildroot/commit/?id=459dd7a9850c7b3be519ae6bf7cc6a689c22cd32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And adjust the comments to clarify that the toolchain dependencies are from
python3.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/docker-compose/Config.in | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/docker-compose/Config.in b/package/docker-compose/Config.in
index 761befea4d..f82a0c4bc2 100644
--- a/package/docker-compose/Config.in
+++ b/package/docker-compose/Config.in
@@ -1,10 +1,9 @@
 config BR2_PACKAGE_DOCKER_COMPOSE
 	bool "docker-compose"
-	depends on !BR2_PACKAGE_PYTHON # python-paramiko -> python-bcrypt
-	depends on BR2_USE_MMU # python
-	depends on BR2_USE_WCHAR # python
-	depends on BR2_TOOLCHAIN_HAS_THREADS # python
-	depends on !BR2_STATIC_LIBS # python
+	depends on BR2_USE_MMU # python3
+	depends on BR2_USE_WCHAR # python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on !BR2_STATIC_LIBS # python3
 	# python-paramiko -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
