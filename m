Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09F8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 13:23:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02A2661019
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 13:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02A2661019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C628381CA5;
	Sun, 26 Sep 2021 13:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3tCyGSIUYA5N; Sun, 26 Sep 2021 13:23:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1206481C81;
	Sun, 26 Sep 2021 13:23:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5EF71BF30A
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 13:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B224981C81
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 13:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IrFnQYPqrtu1 for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 13:23:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 832EC81A4E
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 13:23:22 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout10.t-online.de (Postfix) with SMTP id 54735198C6
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 15:23:19 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.205.79]) by fwd78.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mUU7i-2sNW0P0; Sun, 26 Sep 2021 15:23:18 +0200
Received: from [192.168.1.109] (port=47026 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mUU7i-0006uc-9C
 for buildroot@buildroot.org; Sun, 26 Sep 2021 15:23:18 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 15:23:18 +0200
Message-Id: <20210926132318.2664943-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1632662598-0000146A-CFAC5B43/0/0 CLEAN NORMAL
X-TOI-MSGID: 56af99c1-ff75-4297-8e3a-a3ff1a53fcce
Subject: [Buildroot] [PATCH v2 1/1] package/kodi-visualisation-shadertoy:
 bump version to 19.1.1-Matrix
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

Upstream added a dependency to jsoncpp:
https://github.com/xbmc/visualization.shadertoy/commit/5cdc855df6c3f755be68c83da0ea63c3b0f4857a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added dependency to jsoncpp

 package/kodi-visualisation-shadertoy/Config.in               | 5 +++++
 .../kodi-visualisation-shadertoy.hash                        | 2 +-
 .../kodi-visualisation-shadertoy.mk                          | 4 ++--
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/kodi-visualisation-shadertoy/Config.in b/package/kodi-visualisation-shadertoy/Config.in
index aa671aae13..50fd38c247 100644
--- a/package/kodi-visualisation-shadertoy/Config.in
+++ b/package/kodi-visualisation-shadertoy/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_KODI_VISUALISATION_SHADERTOY
 	bool "kodi-visualisation-shadertoy"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
 	select BR2_PACKAGE_GLM
+	select BR2_PACKAGE_JSONCPP
 	help
 	  Shadertoy visualiser for Kodi
 
 	  https://github.com/notspiff/visualization.shadertoy
+
+comment "kodi-visualisation-shadertoy needs a toolchain w/ gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index 74cbfc5efc..a27334d2cc 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f489d404332d1832d9b45612e4564c4aabcfe03504a46899e29bae8a1c27e0f3  kodi-visualisation-shadertoy-19.0.1-Matrix.tar.gz
+sha256  c556003a46ebf11595fb04343bf21a135365342f09e2280da2e7fd5e802944e7  kodi-visualisation-shadertoy-19.1.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index 0340cd6c6c..e15264bb44 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = 19.0.1-Matrix
+KODI_VISUALISATION_SHADERTOY_VERSION = 19.1.1-Matrix
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = LICENSE.md
-KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = glm kodi
+KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = glm jsoncpp kodi
 
 $(eval $(cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
