Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5107BC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:08:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFD8A600AA
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFD8A600AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B982741576;
	Fri, 10 Sep 2021 20:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BCOFgkdcCTDJ; Fri, 10 Sep 2021 20:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90F4B4157B;
	Fri, 10 Sep 2021 20:08:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 568EF1BF580
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4679D83B75
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VHFfIY2kQdVP for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 20:08:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93F8C83B67
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 20:08:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3A06488E61; Fri, 10 Sep 2021 20:06:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 22:06:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36c115d0bc9dca5ddfc5e054f0a73691a08ef4f1
X-Git-Newrev: 5045cab63d0ed033ce1a1b3c7ee6b098ed2abaeb
X-Patchwork-Hint: ignore
Message-Id: <20210910200638.3A06488E61@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuradio: drop gr-pager (gr-flex)
 option
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5045cab63d0ed033ce1a1b3c7ee6b098ed2abaeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gr-pager (labeled 'gr-flex' in our menuconfig) is not available since
bump to version 3.8.0.0 in commit 0d6a7b2981d4 (package/gnuradio: bump
to version 3.8.0.0) and upstream commit:
    https://github.com/gnuradio/gnuradio/commit/2d2caa205f3c3059deab7c82660908656167fd90

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy             | 8 ++++++++
 package/gnuradio/Config.in   | 6 ------
 package/gnuradio/gnuradio.mk | 6 ------
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6f71575f8a..c550abf419 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2021.11"
+
+config BR2_PACKAGE_GNURADIO_PAGER
+	bool "gnuradio gr-flex support removed"
+	select BR2_LEGACY
+	help
+	  gr-flex has been removed from gnuradio since version 3.8.0.0.
+
 comment "Legacy options removed in 2021.08"
 
 config BR2_PACKAGE_LIBMCRYPT
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 183b49fe9b..77163c611d 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -130,12 +130,6 @@ config BR2_PACKAGE_GNURADIO_FILTER
 	help
 	  Filter signal processing blocks
 
-config BR2_PACKAGE_GNURADIO_PAGER
-	bool "gr-flex support"
-	select BR2_PACKAGE_GNURADIO_ANALOG
-	help
-	  FLEX pager decoder implementation blocks
-
 config BR2_PACKAGE_GNURADIO_QTGUI
 	bool "gr-qtgui"
 	depends on BR2_PACKAGE_GNURADIO_PYTHON
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index d8292dac08..36d7ee65cf 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -130,12 +130,6 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_GNURADIO_PAGER),y)
-GNURADIO_CONF_OPTS += -DENABLE_GR_PAGER=ON
-else
-GNURADIO_CONF_OPTS += -DENABLE_GR_PAGER=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_GNURADIO_QTGUI),y)
 GNURADIO_DEPENDENCIES += qt5base python-pyqt5 qwt
 GNURADIO_CONF_OPTS += -DENABLE_GR_QTGUI=ON
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
