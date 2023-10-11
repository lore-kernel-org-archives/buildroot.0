Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AD9CDB470
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 17:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD83460B00;
	Wed, 11 Oct 2023 17:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD83460B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yw_bzHYvpx5I; Wed, 11 Oct 2023 17:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E56E60EED;
	Wed, 11 Oct 2023 17:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E56E60EED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C21931BF3AE
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 17:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BFBB40160
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 17:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BFBB40160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ii3uWSIiExUN for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 17:59:28 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CE6640004
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 17:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CE6640004
Received: from fli4l.lan.fli4l (p54a1b15c.dip0.t-ipconnect.de [84.161.177.92])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75E8FA4C00BC;
 Wed, 11 Oct 2023 19:59:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42610)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qqdUU-0004wc-0i;
 Wed, 11 Oct 2023 19:59:26 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 11 Oct 2023 19:59:26 +0200
Message-Id: <20231011175926.74349-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697047166;
 bh=eg4eIc/cJLjA4lzsuoLqXw3yDJHTbvNSWksSWv6kVx0=;
 h=From:To:Cc:Subject:Date:From;
 b=I0OXJg2jx5o8VNDXdPxlEgmeKslBAagSWK0NcDrPPeZ1K2JxBmXuiCiPG7Zc3+Tll
 VOFXABjR3pywaTXsQsJLSeDRaicTChRQhry8635gZ9FTiX9vGCbcOJWkRP7HBskBrn
 jC6mRZqSI+/JFI4jk2vWLXMvv8eK01MFneQmeTfZ31oInQnv7++y1g0TRhzaQP5SYy
 49MdVuzN1Too0+qHWSQePWcLVxINqxRtRYXpjCE2QwgnNLR26cMxwv+2gRmz7012Lq
 y/YfcsnnoE9CpS+T2Zm2OHt4oHvcgk7xjPGdb8ad/JZtlp0BgFh043hLNhLBAVTBxB
 7Qg4fBMNG4pJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=I0OXJg2j
Subject: [Buildroot] [PATCH 1/1] package/gettext-gnu: bump version to 0.22.3
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
Cc: Vadim Kochan <vadim4j@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=blob;f=NEWS;h=9ed51966572af1c65074fcfbd18db24f1321c55d;hb=c9af3e4eeccc178a0833754e3d8c7083591e75ba

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gettext-gnu/gettext-gnu.hash   | 2 +-
 package/gettext-gnu/gettext-gnu.mk     | 2 +-
 package/gettext-tiny/gettext-tiny.hash | 2 +-
 package/gettext-tiny/gettext-tiny.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gettext-gnu/gettext-gnu.hash b/package/gettext-gnu/gettext-gnu.hash
index 878253bea4..f307b4a9fd 100644
--- a/package/gettext-gnu/gettext-gnu.hash
+++ b/package/gettext-gnu/gettext-gnu.hash
@@ -1,5 +1,5 @@
 # Please keep in sync with package/gettext-tiny/gettext-tiny.hash
 # Locally calculated
-sha256  4c82fbfe5e53d71a97c634aa98a898b9da807b08b27410f6a4641e8bb44dc4b2  gettext-0.22.2.tar.xz
+sha256  b838228b3f8823a6c1eddf07297197c4db13f7e1b173b9ef93f3f945a63080b6  gettext-0.22.3.tar.xz
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
 sha256  3fe5361f24b7c49ba12911c08f5a33f9cb18871d95d9fb881f5b8a4793e04288  gettext-runtime/intl/COPYING.LIB
diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index 06ada568b1..35b79d1926 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -6,7 +6,7 @@
 
 # Please keep in sync with GETTEXT_TINY_ARCHIVE_VERSION in
 # gettext-tiny/gettext-tiny.mk
-GETTEXT_GNU_VERSION = 0.22.2
+GETTEXT_GNU_VERSION = 0.22.3
 GETTEXT_GNU_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
 GETTEXT_GNU_INSTALL_STAGING = YES
diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index 02d9a803da..a72b0c35e4 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -3,4 +3,4 @@ sha256  29cc165e27e83d2bb3760118c2368eadab550830d962d758e51bd36eb860f383  gettex
 sha256  4c938aa3d8fa3c184bba5e87a8a2febc89560627c9d0567536879e3eca1a7b4f  LICENSE
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  extra/COPYING
 # Locally Computed:
-sha256  4c82fbfe5e53d71a97c634aa98a898b9da807b08b27410f6a4641e8bb44dc4b2  gettext-0.22.2.tar.xz
+sha256  b838228b3f8823a6c1eddf07297197c4db13f7e1b173b9ef93f3f945a63080b6  gettext-0.22.3.tar.xz
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 0aef4b0058..e4a3625c5a 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -15,7 +15,7 @@ GETTEXT_TINY_PROVIDES = gettext
 
 # needed for gettextize
 # Please keep in sync with package/gettext-gnu/gettext-gnu.mk
-GETTEXT_TINY_ARCHIVE_VERSION = 0.22.2
+GETTEXT_TINY_ARCHIVE_VERSION = 0.22.3
 
 GETTEXT_TINY_EXTRA_GETTEXT_FILES = \
 	gettext-tools/misc/gettextize.in \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
