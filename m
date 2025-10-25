Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A286BCCF9E9
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 19:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 540C58128D;
	Sat, 25 Oct 2025 19:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inAYK6fzfY1A; Sat, 25 Oct 2025 19:06:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 399D08126E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 399D08126E;
	Sat, 25 Oct 2025 19:06:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE76FD7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 19:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C79740A0D;
 Sat, 25 Oct 2025 19:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UuF9uwpiyjW0; Sat, 25 Oct 2025 19:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.184.2.64;
 helo=mx1a.swcp.com; envelope-from=hudson@swcp.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97FB440A0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97FB440A0B
Received: from mx1a.swcp.com (mx1a.swcp.com [216.184.2.64])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97FB440A0B
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 19:06:12 +0000 (UTC)
Received: from ame3.swcp.com (ame3.swcp.com [216.184.2.120])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 59PJ6BDK004494
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 13:06:11 -0600
Received-SPF: pass (ame3.swcp.com: domain of hudson@swcp.com designates
 216.184.2.83 as permitted sender) receiver=ame3.swcp.com;
 client-ip=216.184.2.83; helo=hachi.swcp.com; envelope-from=hudson@swcp.com;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.10; 
DKIM-Filter: OpenDKIM Filter v2.10.3 ame3.swcp.com 59PJ6AAU054971
Received: from hachi.swcp.com (hachi.swcp.com [216.184.2.83])
 by ame3.swcp.com (8.17.2/8.17.1) with ESMTPS id 59PJ6AAU054971
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 13:06:11 -0600 (MDT)
 (envelope-from hudson@swcp.com)
Received: from hachi.swcp.com (localhost [127.0.0.1])
 by hachi.swcp.com (8.17.1.9/8.17.1.9/Debian-2+deb12u2) with ESMTP id
 59PJ6Agx3612875
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 13:06:10 -0600
Received: (from hudson@localhost)
 by hachi.swcp.com (8.17.1.9/8.17.1.9/Submit) id 59PJ6A4d3612874
 for buildroot@buildroot.org; Sat, 25 Oct 2025 13:06:10 -0600
Date: Sat, 25 Oct 2025 13:06:10 -0600
To: buildroot@buildroot.org
Message-ID: <aP0fooArqo5kwOnV@hachi.swcp.com>
References: <aP0fWpti-9PiGKxn@hachi.swcp.com> <aP0fg9gNzZ0xspy0@hachi.swcp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aP0fg9gNzZ0xspy0@hachi.swcp.com>
X-Scanned-By: MIMEDefang 2.86
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.6.4
 (ame3.swcp.com [216.184.2.127]); Sat, 25 Oct 2025 13:06:11 -0600 (MDT)
X-Virus-Scanned: clamav-milter 1.2.1 at ame3
X-Virus-Status: Clean
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=trmm.net
Subject: [Buildroot] [PATCH 2/2] package/shairport-sync: Add support for
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
From: Trammell Hudson via buildroot <buildroot@buildroot.org>
Reply-To: Trammell Hudson <hudson@trmm.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the dependencies necessary to enable the newer version
of shairplay-sync support for the AirPlay2 protocol.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
---
 package/shairport-sync/Config.in         | 15 +++++++++++++++
 package/shairport-sync/shairport-sync.mk |  5 +++++
 2 files changed, 20 insertions(+)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index 528767ba9c..fddba4a439 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -26,6 +26,21 @@ config BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION
 	help
 	  Enable audio DSP convolution support.
 
+config BR2_PACKAGE_SHAIRPORT_SYNC_AIRPLAY2
+	bool "AirPlay2 support"
+	select BR2_PACKAGE_NQPTP
+	select BR2_PACKAGE_LIBPLIST
+	select BR2_PACKAGE_LIBSODIUM
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_GPL
+	select BR2_PACKAGE_FFMPEG_NONFREE
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
index 493eefbd6f..fa0858a85b 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -53,6 +53,11 @@ else
 SHAIRPORT_SYNC_CONF_OPTS += --without-convolution
 endif
 
+ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_AIRPLAY2),y)
+SHAIRPORT_SYNC_DEPENDENCIES += libplist libsodium libgcrypt ffmpeg util-linux
+SHAIRPORT_SYNC_CONF_OPTS += --with-airplay-2
+endif
+
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_DBUS),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libglib2
 SHAIRPORT_SYNC_CONF_OPTS += --with-dbus-interface --with-mpris-interface
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
