Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CB9C433FE
	for <buildroot@archiver.kernel.org>; Wed,  5 Oct 2022 09:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBB0240CDA;
	Wed,  5 Oct 2022 09:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBB0240CDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RvQLz8hCESSw; Wed,  5 Oct 2022 09:11:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5F0D40CB4;
	Wed,  5 Oct 2022 09:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5F0D40CB4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F1071BF95D
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 09:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43FAD4182D
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 09:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43FAD4182D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9yPFdTv3unt for <buildroot@lists.busybox.net>;
 Wed,  5 Oct 2022 09:11:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78E4F41835
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78E4F41835
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 09:11:16 +0000 (UTC)
Received: from iago.. (unknown [151.19.224.153])
 by serv15.avernis.de (Postfix) with ESMTPSA id F3BDDBDE2F83;
 Wed,  5 Oct 2022 11:11:12 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Wed,  5 Oct 2022 11:10:30 +0200
Message-Id: <20221005091032.3014-3-br015@umbiko.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220409160921.GA3547512@scaer>
References: <20220409160921.GA3547512@scaer>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.7 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH v2 2/4] package/mpd: add/enhance (kconfig +
 code) comments
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
Cc: Andreas Ziegler <br015@umbiko.net>, YANN E MORIN <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Align kconfig comments with descriptions in the mpd manual.
Add a kconfig comment to highlight the impact of ogg/vorbis selection.
Add comments to makefile to explain remaining multiple dependency creation.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
Changes v1 -> v2:
 - make this a separate patch 

 package/mpd/Config.in | 9 ++++++---
 package/mpd/mpd.mk    | 2 ++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 8f0af7b2d3..2606008e90 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -33,7 +33,7 @@ config BR2_PACKAGE_MPD_SQLITE
 	select BR2_PACKAGE_SQLITE
 	help
 	  Enable sqlite database support.
-	  If you don't use sqlite it will use an ASCII database.
+	  This is mandatory for the sticker database.
 
 config BR2_PACKAGE_MPD_ZZIP
 	bool "zzip"
@@ -81,8 +81,8 @@ comment "Decoder plugins"
 config BR2_PACKAGE_MPD_DSD
 	bool "dsd"
 	help
-	  Enable Digital Speech Decoder (DSD) support to play audio
-	  files encoded in a digital speech format.
+	  Direct Stream Digital (DSD) support to play audio
+	  files encoded in single bit format.
 
 config BR2_PACKAGE_MPD_FAAD2
 	bool "faad2"
@@ -210,6 +210,9 @@ config BR2_PACKAGE_MPD_TWOLAME
 	help
 	  Enable TwoLAME mp2 encoding.
 
+comment "for ogg/vorbis encoding enable vorbis decoder"
+	depends on !BR2_PACKAGE_MPD_VORBIS
+
 comment "Input plugins"
 
 config BR2_PACKAGE_MPD_CDIO_PARANOIA
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 4d73e6de03..feab894f0f 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -230,6 +230,7 @@ else
 MPD_CONF_OPTS += -Dopenal=disabled
 endif
 
+# opus needs to be encapsulated in a container format, here ogg
 ifeq ($(BR2_PACKAGE_MPD_OPUS),y)
 MPD_DEPENDENCIES += opus libogg
 MPD_CONF_OPTS += -Dopus=enabled
@@ -317,6 +318,7 @@ else ifeq ($(BR2_PACKAGE_MPD_UPNP_DISABLED),y)
 MPD_CONF_OPTS += -Dupnp=disabled
 endif
 
+# handle decoder and encoder simultaneously
 ifeq ($(BR2_PACKAGE_MPD_VORBIS),y)
 MPD_DEPENDENCIES += libvorbis
 MPD_CONF_OPTS += -Dvorbis=enabled -Dvorbisenc=enabled
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
