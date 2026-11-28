Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16757606A31C
	for <buildroot@archiver.kernel.org>; Sat, 28 Nov 2026 06:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=c8WVT6A3;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256 header.s=mail header.b=vEx7gjWJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79E4440919;
	Sat, 28 Nov 2026 06:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ODrhyjoDKx8; Sat, 28 Nov 2026 06:39:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9F97740886
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795847972;
	b=p32Prn5k+QvIJzJXzmIucJa/L1XsluGWJ+3A5dBVu8G+4sZk2Wwltw1WU1yHIJQMp/rU
	 uf0g9q7CBG07TD+4rwfRyRS/f1y5U4pZXrBhzYgBHgn01j8cZIk9//tRooPZlywf3eiWs
	 dXbHwa6XlrRZEavUcmz37sWBXIJCXSQ07mUPbXkL0whuIAtQJd3zG2v8z5lSxMSrlCNfc
	 2Yfj2cSLyylehfvkNkn/ypj1wZMR/bXDAVRjSXiOFt/hLc3ovGCbA8vRGPWmdvaRzzsXQ
	 GligvSIruLEGjb8bdZxEJgT9OLtsm3jp8xA4kt8U2pvsXzewqN1U+jl0Dgnf28KiW6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795847972;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Virus-Scanned:X-Virus-Status:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=InOHYDVEl8P6qKWBorP4oUQ2ppRVJdQ2sEz6M4ri4YE=;
	b=VLzESgxj1L7r1O5A/gcSjqsOZHHhCzcQ52WBhY+QTpcRc1NqPPNbgHQNhu6sz1Ffmjan
	 pMu6DrHYwCWIQ09JTDd0DLeD0ckQ8Rp5Yq/OoMEIRPdSppfN96ktVrkTr6Zk7JAuE/PCh
	 tn1crRcfmkVxqulfNPZ4VSp8p5+T4SMq3CCGulx3TG1/keS6HXZdRdGEYdotKcFxFSzim
	 xp+7qFyN3iA7ELo0f5XUPpNMAYiMxNbNC88XojTd5eLgXYY+vzESyZWwipcu6b8a3vf2t
	 vxdG3msRVxgGpno7n8DhVo+eQMH7Nyos0ORC3qzoAgDwXk2pR0uiOhzCDeSsPqcT3Ew==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795847972;
	bh=InOHYDVEl8P6qKWBorP4oUQ2ppRVJdQ2sEz6M4ri4YE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c8WVT6A3yHGVN2tyI4f1JGuK9yhKEpkWfSH4Ucq/XtihUg3ZcLieXO13LYBF7ftkL
	 gXHurLj7owQZap7X0s6wK2k9+g1IMW3XMUTmUjO6AyNGNW2fpqyjwYDRsx979NZs5J
	 0hrmHIOYssRl4Me7zwJLwR6Xd6DoN9X1/6Ze/ToDEZws8aMGCkdbf13il4rWteVN9P
	 vxUB7y1ojyaIaumhdJdysKWk+Oo+qyHGyL7qRNivsXjchfB/Y7Phvz+R3IaIylHBkl
	 YDhFCrKwUQ57eci38QF5nTwXIaQaqeam76Kg0g7TiAFlXVV+h5XAhzYQpC1xfBV2tb
	 FfcQ4Zp38zPww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F97740886;
	Sat, 28 Nov 2026 06:39:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA31649D
 for <buildroot@buildroot.org>; Sat, 28 Nov 2026 06:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBF268128A
 for <buildroot@buildroot.org>; Sat, 28 Nov 2026 06:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0ddbh3g_bew for <buildroot@buildroot.org>;
 Sat, 28 Nov 2026 06:39:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E670381159
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=176.9.89.163
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=vEx7gjWJ
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E670381159
 for <buildroot@buildroot.org>; Sat, 28 Nov 2026 06:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1795847963; bh=vP896LDAHcyQiaYdo6DzAXFCZeFRxNgJZaRAZ+jffPA=;
 h=From:To:Cc:Subject:Date;
 b=vEx7gjWJkORFq9nD3I3p1n5HjB/iDLxxGuScfS35RzfiF+VKKuOFvHa5pnd5T1son
 FC4JbX+6D5X/J5oywoGPBw2YYx0j21m5gsTLqaj5QJhLHvs3knzU6q+xs39zfuyoSs
 YaiEN1IFEcu0eZ43anembnn1TtkhI19COPhiKjVk=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 5D204BDE1719;
 Sat, 28 Nov 2026 07:39:23 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Sat, 28 Nov 2026 07:39:08 +0100
Message-ID: <20261128063909.17943-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.6 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH /next] package/mpd: update to version 0.25
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As usual, a major version update implies API changes. The most
noteworthy changes are: 

  switch to C++23 standard -> required compiler version unchanged
  require Meson 1.2 -> available from 07/2023,
	commit d06e610 ("package/meson: bump to version 1.2.0")

  changes in protocol -> this is backwards compatible
  mms[ht] streaming support (libmms) removed
  DSD1024 support added
  changes in configuration (max_command_list_size)
  changes in database -> requires rescan

Change log:
  https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.25/NEWS

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 Config.in.legacy                                      |  8 ++++++++
 ...t-meson.build-add-atomic-dependency-for-spar.patch |  6 +++---
 package/mpd/Config.in                                 |  6 ------
 package/mpd/mpd.hash                                  |  2 +-
 package/mpd/mpd.mk                                    | 11 ++---------
 5 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8efc476888..5f80aa9734 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2027.02"
+
+config BR2_PACKAGE_MPD_LIBMMS
+	bool "libmms support removed"
+	select BR2_LEGACY
+	help
+	  The MMS plugin was removed in MPD version 0.25.
+
 comment "Legacy options removed in 2026.11"
 
 config BR2_PACKAGE_PRBOOM
diff --git a/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch b/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
index 9ebf7d09d9..670b21135d 100644
--- a/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
+++ b/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
@@ -15,9 +15,9 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Andreas: adapt upstream formatting]
 Signed-off-by: Andreas Ziegler <br015@umbiko.net>
 ---
-Rebase for mpd-0.24
+Rebase for mpd-0.25
 
-Signed-off-by: Andreas Ziegler <br015@umbiko.net>
+Signed-off-by: Andreas Ziegler <br025@umbiko.net>
 ---
  src/event/meson.build | 4 ++++
  1 file changed, 4 insertions(+)
@@ -26,7 +26,7 @@ diff --git a/src/event/meson.build b/src/event/meson.build
 index bc13bbcd2..88370c03a 100644
 --- a/src/event/meson.build
 +++ b/src/event/meson.build
-@@ -46,9 +46,13 @@
+@@ -49,9 +49,13 @@
    ],
  )
  
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 831cbe933d..584789ba2a 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -209,12 +209,6 @@ config BR2_PACKAGE_MPD_CURL
 	help
 	  Enable curl streaming (http) support.
 
-config BR2_PACKAGE_MPD_LIBMMS
-	bool "mms"
-	select BR2_PACKAGE_LIBMMS
-	help
-	  Enable MMS support.
-
 config BR2_PACKAGE_MPD_LIBNFS
 	bool "nfs"
 	# libnfs -> libtirpc
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 1be7c575e1..382b49f56e 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  a1e12f22f1938bd9241aff6e2a925917357a494d143acc32f8dae5373e43c2b9  mpd-0.24.20.tar.xz
+sha256  5ca7802b82589afdc4e7bd313070a367510128ed4b1576c17bd7e8d3053f08eb  mpd-0.25.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index c01771198f..58e0884ee2 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).20
+MPD_VERSION_MAJOR = 0.25
+MPD_VERSION = $(MPD_VERSION_MAJOR)
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
@@ -179,13 +179,6 @@ else
 MPD_CONF_OPTS += -Dlibmpdclient=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MPD_LIBMMS),y)
-MPD_DEPENDENCIES += libmms
-MPD_CONF_OPTS += -Dmms=enabled
-else
-MPD_CONF_OPTS += -Dmms=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_MPD_LIBNFS),y)
 MPD_DEPENDENCIES += libnfs
 MPD_CONF_OPTS += -Dnfs=enabled
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
