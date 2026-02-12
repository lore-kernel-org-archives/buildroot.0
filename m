Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657F6EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3497541E1E;
	Fri, 13 Feb 2026 19:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwFd4ocHqxUD; Fri, 13 Feb 2026 19:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D03741E5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011377;
	bh=OTPci6yy4wgVYHFn7oKCtSQrCWpHc4LF+TtTdnoGQhE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OPHdiuBj8hGfX4rPAsnbaH+44sXYg2Z2560WGF4XLNFGd0t8EiumB7Iyihi567rDt
	 TYrq+YLSmplOfnZ8CrZerspKJpWd94nxVwB1HiRWZhwIOY0w084n4eYyJ3Zg7/PkA7
	 AgmkYaoTSjEL51SU8VrWPSWqbJPOfbSMGRx3FZLKZEaiPSWtQPbMKRUuj7994LUZkO
	 38ZV213zlq6UJyUVoEfcfkuNMtbXl7EZPVjx4C/vkMkPfaDXBnbD3Zgy64gCPGJ5po
	 xjADhfrOZH1UPk8zMUEKUAgck8CmdeMqYBfEH0ctiNLnVBy+yAON5aTsIuOswPSSLa
	 JOw6vbbM24y7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D03741E5D;
	Fri, 13 Feb 2026 19:36:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14D6D283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C8D484572
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24RITfiSUzCy for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93258844B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93258844B5
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87A0E81EB5; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:36:49 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7c249707447cd810186f449710325fd503363fcf
X-Git-Newrev: 573f77a2e280553773f9dd17b8ff33582e45afb6
X-Patchwork-Hint: ignore
Message-Id: <20260213193527.87A0E81EB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ell: needs MMU
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/573f77a2e280553773f9dd17b8ff33582e45afb6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit e834d23cd792ee57ea80f37ce01d9d50756dba1d bumped ell to
version 0.79 that includes upstream commits in version 0.72 which make
use of fork():

https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=9245dfb84d1e0f58dda102704201d78ddfdfca68
https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=e0628c429d50d50b116717f37a5f5c1f66bef6a2

Fixes:
https://autobuild.buildroot.net/results/036/03690fa454ffb1c4c79b182cc3a165555e2c59eb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b27ee684b1aa9e799bad6dee449d2c56739ba48c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
index 59d4422305..15d128bbec 100644
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
