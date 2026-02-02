Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB1EE7FDD0
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 21:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 624E160BD2;
	Mon,  2 Feb 2026 21:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id asoyLHTTN_CC; Mon,  2 Feb 2026 21:10:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ADB7607A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770066621;
	bh=D6cgfPtGFX5+yyVdAN1JzYkuQWCGkteRDGWF4jlXvIo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cfB4lcs6kjAa8RyJM2Q6irNpK7Cl1OkMPcIKFHVdZk6bK0Mzn9HBQq916DZPsKihC
	 0mOL9/Yk4E5VYWBSC8BIQZKM8oFQqsUPcGQtGlKIaymYPO+W2flKU2SNUhsSKFjd3S
	 tNvYEyTn/UYKmzWPwuB3Tg/lgWRuZxKJMQpZ9infF38awg8vZrItcrN/34BKdd4lGq
	 aTcUMnLVyRBWWYOldenKgsTDylUpgfQxrv4SHRA+JodLtDWKXV/RfQ8sEBUD0Bg31e
	 bvrdML4xeQnQpLPmADL5uCRwIeajOptQoeU/PQ1ji4ZjOheJ+gUFs7O1G08jcXXa62
	 6kRbt8HtY7I8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ADB7607A6;
	Mon,  2 Feb 2026 21:10:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EC6C149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 691C8400A7
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vv-8OTosdbEu for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 21:10:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C5DB4007C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C5DB4007C
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:10:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BA75864AF; Mon,  2 Feb 2026 21:10:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 21:59:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4df3fa1ab50fb280f011550edc5b178e7a4a0482
X-Git-Newrev: b27ee684b1aa9e799bad6dee449d2c56739ba48c
X-Patchwork-Hint: ignore
Message-Id: <20260202211016.3BA75864AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ell: needs MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=b27ee684b1aa9e799bad6dee449d2c56739ba48c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit e834d23cd792ee57ea80f37ce01d9d50756dba1d bumped ell to
version 0.79 that includes upstream commits in version 0.72 which make
use of fork():

https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=9245dfb84d1e0f58dda102704201d78ddfdfca68
https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=e0628c429d50d50b116717f37a5f5c1f66bef6a2

Fixes:
https://autobuild.buildroot.net/results/036/03690fa454ffb1c4c79b182cc3a165555e2c59eb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bluez5_utils/Config.in | 2 +-
 package/ell/Config.in          | 2 ++
 package/iwd/Config.in          | 2 +-
 package/ofono/Config.in        | 2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 49bb719102..2fe25466b4 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS
 	bool "bluez-utils"
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
-	depends on BR2_USE_MMU # dbus
+	depends on BR2_USE_MMU # dbus, ell
 	depends on !BR2_STATIC_LIBS # uses dlfcn
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/ell/Config.in b/package/ell/Config.in
index c7c9164816..124a57f7e9 100644
--- a/package/ell/Config.in
+++ b/package/ell/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ELL
 	bool "ell"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	depends on BR2_USE_WCHAR
@@ -9,5 +10,6 @@ config BR2_PACKAGE_ELL
 	  https://01.org/ell
 
 comment "ell needs a toolchain w/ wchar, headers >= 4.12"
+	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
diff --git a/package/iwd/Config.in b/package/iwd/Config.in
index e4b0ead882..d8fb6a6ea0 100644
--- a/package/iwd/Config.in
+++ b/package/iwd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_IWD
 	bool "iwd"
-	depends on BR2_USE_MMU # dbus
+	depends on BR2_USE_MMU # dbus, ell
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index c1d0cae4ef..c6a45625d9 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_OFONO
 	bool "ofono"
 	depends on BR2_USE_WCHAR # gettext, libglib2, ell
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
-	depends on BR2_USE_MMU # dbus, libglib2
+	depends on BR2_USE_MMU # dbus, ell, libglib2
 	depends on !BR2_STATIC_LIBS # dlopen(), ell
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
