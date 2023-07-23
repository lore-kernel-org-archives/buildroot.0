Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF25C001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 08:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5BCC60BA2;
	Sun, 23 Jul 2023 08:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5BCC60BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UodSUqtYqznJ; Sun, 23 Jul 2023 08:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 061D960C16;
	Sun, 23 Jul 2023 08:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 061D960C16
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C76F31BF471
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 08:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE31283196
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 08:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE31283196
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XSvki_OCqf8Z for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 08:32:08 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCE9E83192
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 08:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCE9E83192
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 30FC3A4C0C73
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 10:31:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53572)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qNUVM-0002Jp-36
 for buildroot@buildroot.org; Sun, 23 Jul 2023 10:31:53 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 10:31:52 +0200
Message-Id: <20230723083152.3147145-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230723083152.3147145-1-bernd@kuhls.net>
References: <20230723083152.3147145-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690101113;
 bh=lzuK+MkrzPkONNlJiTL9oN8aUXtwXdLAjuGHb8Y60jc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=x9cQhcA01f3cquYZ2dp/ABtXiwH2u8wJHjw2zp7gDUlZe5HSir/50lDwhQoufh6Ue
 QRZpm4K78+Ag98/G98nr0a2keyC0twRH1NM2pWio0I3oteNHmtuDomOg8FD3XOEGgb
 RK4HQ2xN3O+1vUAvYobjpWpBZTVXfHbT7Di2GsutzyPnxOJto7GTiKW7hsGtR/Hde8
 c5ETNeXBu9s1ADAsk5AwtO9uSeRSJSW04TNha0oe8sWZSaRjXTJfyrQ6S1+7VZkhjm
 BcGQOjoYd2fRcW1wdtSiNSLhSsCY+tUbaQIg38iU4V5b244lWlDVL76oOgB8nriJks
 UKu/0ixVTe7ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=x9cQhcA0
Subject: [Buildroot] [PATCH v2 2/2] package/transmission: fix gtk
 dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 80793107a65d95f8dfd0317a726d3a737c78ef67 forgot to add
packages needed for gtk support:
https://github.com/transmission/transmission/blob/main/CMakeLists.txt#L40

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: removed unneeded glibmm, added gtkmm3 dependencies (Thomas)

 package/transmission/Config.in       | 8 +++++++-
 package/transmission/transmission.mk | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index fd4c897497..7ac18ae6d9 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -37,11 +37,17 @@ config BR2_PACKAGE_TRANSMISSION_DAEMON
 
 config BR2_PACKAGE_TRANSMISSION_GTK
 	bool "transmission-gtk"
+	depends on !BR2_nios2 # gtkmm3
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pangomm, libgtk3 -> pango -> harfbuzz -> gtkmm3
+	depends on BR2_INSTALL_LIBSTDCPP # glibmm, libpangomm -> glibmm/pango -> gtkmm3
+	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2 -> gtkmm3
 	depends on BR2_PACKAGE_LIBGTK3 && BR2_SYSTEM_ENABLE_NLS
+	select BR2_PACKAGE_GTKMM3
 	help
 	  Install transmission GTK-based GUI interface.
 
-comment "transmission-gtk needs NLS enabled"
+comment "transmission-gtk needs libgtk3 and a toolchain with NLS enabled"
+	depends on !BR2_nios2
 	depends on BR2_PACKAGE_LIBGTK3 && !BR2_SYSTEM_ENABLE_NLS
 endif
 
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index f3a200ced3..26deeefa34 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -74,7 +74,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_GTK),y)
 TRANSMISSION_CONF_OPTS += -DENABLE_GTK=ON
-TRANSMISSION_DEPENDENCIES += libgtk3
+TRANSMISSION_DEPENDENCIES += gtkmm3 libgtk3
 else
 TRANSMISSION_CONF_OPTS += -DENABLE_GTK=OFF
 endif
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
