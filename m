Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6DFC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC69A60D73;
	Wed,  9 Feb 2022 16:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sK2v2B1xNdj2; Wed,  9 Feb 2022 16:57:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDF0260B05;
	Wed,  9 Feb 2022 16:57:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 08A291BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9368D409B1
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XzdYSPbAZa01 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:52:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4431409E3
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C5B1B24000D;
 Wed,  9 Feb 2022 16:52:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqCs-0001HG-An; Wed, 09 Feb 2022 17:52:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:50:58 +0100
Message-Id: <20220209165213.4498-33-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 032/107] package/opkg-utils: drop reference to
 python2
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opkg-utils/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/opkg-utils/Config.in b/package/opkg-utils/Config.in
index 3c5a3ee347..2973055baf 100644
--- a/package/opkg-utils/Config.in
+++ b/package/opkg-utils/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_OPKG_UTILS
 	depends on BR2_USE_WCHAR # python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python3 <- libffi
 	depends on !BR2_STATIC_LIBS # python3
-	depends on !BR2_PACKAGE_PYTHON # python3
 	select BR2_PACKAGE_BINUTILS if !BR2_PACKAGE_BUSYBOX # runtime
 	select BR2_PACKAGE_BINUTILS_TARGET if !BR2_PACKAGE_BUSYBOX # runtime
 	select BR2_PACKAGE_COREUTILS if !BR2_PACKAGE_BUSYBOX # runtime
@@ -27,8 +26,3 @@ comment "opkg-utils needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_nios2 || BR2_PACKAGE_BUSYBOX
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
-comment "opkg-utils needs python3"
-	depends on !BR2_nios2 || BR2_PACKAGE_BUSYBOX
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_PYTHON
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
