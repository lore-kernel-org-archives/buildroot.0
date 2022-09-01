Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DD8ECAAD3
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 20:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A9D660899;
	Thu,  1 Sep 2022 20:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A9D660899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cP38ncLxJG0l; Thu,  1 Sep 2022 20:12:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE37C60ACD;
	Thu,  1 Sep 2022 20:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE37C60ACD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F58F1BF393
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 20:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A414401E1
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 20:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A414401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ggnrffh2jlrm for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 20:12:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA38540134
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA38540134
 for <buildroot@buildroot.org>; Thu,  1 Sep 2022 20:12:08 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout06.t-online.de (Postfix) with SMTP id 09F563041;
 Thu,  1 Sep 2022 22:12:06 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.182.238]) by fwd79.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oTqXl-3rsyFl0; Thu, 1 Sep 2022 22:12:05 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36488)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oTqXl-0003gc-0F;
 Thu, 01 Sep 2022 22:12:05 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  1 Sep 2022 22:12:03 +0200
Message-Id: <20220901201204.3514426-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901201204.3514426-1-bernd.kuhls@t-online.de>
References: <20220901201204.3514426-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1662063125-014551EF-F7FE261E/0/0 CLEAN NORMAL
X-TOI-MSGID: 6ead7184-96f2-4d30-8faf-e90da97f8dd6
Subject: [Buildroot] [PATCH/next 2/3] package/snort3: bump version to
 3.1.40.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/snort3/snort3/blob/master/ChangeLog.md

Removed flatbuffers support due to its upstream removal:
https://github.com/snort3/snort3/commit/3ec185030ef871dbe4a1df997b5880c098aa7101

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/snort3/snort3.hash | 2 +-
 package/snort3/snort3.mk   | 9 +--------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
index 0ba4505a83..7746547d18 100644
--- a/package/snort3/snort3.hash
+++ b/package/snort3/snort3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  6e45c16b1815d832b5d6edcd2b705e7838e25c76bfd54b3e86c55ecba6de420a  snort3-3.1.18.0.tar.gz
+sha256  d787d954f21d4cd6a048e10b8c53c78cb6287ec448108fc573b951639c8947b3  snort3-3.1.40.0.tar.gz
 
 # Hash for license files:
 sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
index 6f15ce3c92..a76b831838 100644
--- a/package/snort3/snort3.mk
+++ b/package/snort3/snort3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT3_VERSION = 3.1.18.0
+SNORT3_VERSION = 3.1.40.0
 SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
 SNORT3_LICENSE = GPL-2.0
 SNORT3_LICENSE_FILES = COPYING LICENSE
@@ -17,13 +17,6 @@ SNORT3_CONF_OPTS = \
 	-DENABLE_STATIC_DAQ=OFF \
 	-DMAKE_DOC=OFF
 
-ifeq ($(BR2_PACKAGE_FLATBUFFERS),y)
-SNORT3_DEPENDENCIES += flatbuffers
-SNORT3_CONF_OPTS += -DHAVE_FLATBUFFERS=ON
-else
-SNORT3_CONF_OPTS += -DHAVE_FLATBUFFERS=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 SNORT3_DEPENDENCIES += libiconv
 SNORT3_CONF_OPTS += -DHAVE_ICONV=ON
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
