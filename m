Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A355BE8FDD5
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 09:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F9A4406AA;
	Sat, 27 Dec 2025 09:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72L7GclMlNeU; Sat, 27 Dec 2025 09:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60E3740674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766829105;
	bh=Oq4jPN789RFUxCO+G7uH3Wu+V5WFD5lSdKh9074Xa7Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PohLH0NsMO2hvRZC45/h7+yUJTPc7KtmsImxe5vEvAD62y/bMsO8xnGqb5/voArK/
	 nTWGxYMvVqArn0x0UI5s+QvNG3Ylzto5dp2t9dnsHhNyBa9XHf69wfjJL4jfq4qVxq
	 9GzAb59aI5+qk+QnSkJt2CcAeSPZ53QUzvTktX3wztc9/6uGXugc+5S5MzQ1sT8Opm
	 7ez6z6r/2m37teGNbuqXksK+/VlXEtuZDnU3RA7emvhOdLulgXUS5P+NhNWHQkwt+m
	 e8HPL7WKpr8dsiBpBDFc6y0FIrcyWURSwhDhR494OM+I6R89PH3jpWtzPNEnpgLhHe
	 ZxlvJ39lkZmYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60E3740674;
	Sat, 27 Dec 2025 09:51:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A1FEB9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 09:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C10380C36
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 09:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwJ0xX7xfmbz for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 09:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B6DD80C28
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B6DD80C28
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 09:51:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A5A387674; Sat, 27 Dec 2025 09:51:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 10:51:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8df8272281f2b4d2243db3562bb9cc2005f6a24d
X-Git-Newrev: 1abaf013dede73cb148a95d4ed708429776033f3
X-Patchwork-Hint: ignore
Message-Id: <20251227095142.8A5A387674@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shairport-sync: add support for
 AirPlay2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1abaf013dede73cb148a95d4ed708429776033f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds the dependencies necessary to enable the newer version
of shairplay-sync support for the AirPlay2 protocol.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shairport-sync/Config.in         | 13 +++++++++++++
 package/shairport-sync/shairport-sync.mk |  8 ++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index 528767ba9c..89d9c9feb0 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -26,6 +26,19 @@ config BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION
 	help
 	  Enable audio DSP convolution support.
 
+config BR2_PACKAGE_SHAIRPORT_SYNC_AIRPLAY2
+	bool "AirPlay2 support"
+	select BR2_PACKAGE_NQPTP # runtime
+	select BR2_PACKAGE_LIBPLIST
+	select BR2_PACKAGE_LIBSODIUM
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Enable support for the more modern AirPlay2 protocol.
+	  This will also require ffmpeg and many other libraries.
+
 config BR2_PACKAGE_SHAIRPORT_SYNC_DBUS
 	bool "dbus support"
 	depends on BR2_USE_WCHAR # libglib2
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 493eefbd6f..a792e461ef 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -53,6 +53,14 @@ else
 SHAIRPORT_SYNC_CONF_OPTS += --without-convolution
 endif
 
+ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_AIRPLAY2),y)
+# host-vim needed for xxd
+SHAIRPORT_SYNC_DEPENDENCIES += libplist libsodium libgcrypt ffmpeg util-linux host-vim
+SHAIRPORT_SYNC_CONF_OPTS += --with-airplay-2
+else
+SHAIRPORT_SYNC_CONF_OPTS += --without-airplay-2
+endif
+
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_DBUS),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libglib2
 SHAIRPORT_SYNC_CONF_OPTS += --with-dbus-interface --with-mpris-interface
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
