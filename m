Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905A5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:16:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6048F61056
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6048F61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AF7140458;
	Sun, 12 Sep 2021 20:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2dK7aAUBhIE; Sun, 12 Sep 2021 20:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8982B404F1;
	Sun, 12 Sep 2021 20:16:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 494051BF966
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43B8140458
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PctU1uv1S1Mk for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 20:15:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8045340433
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 20:15:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7B5D78A47B; Sun, 12 Sep 2021 20:13:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 21:15:35 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 2f688432496dae98203005a712b8bf812471909f
X-Git-Newrev: 8476428660987f3d2b43efc2daf5bc443c72c704
X-Patchwork-Hint: ignore
Message-Id: <20210912201359.7B5D78A47B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/gnuradio: drop
 gr-pager (gr-flex) option
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

commit: https://git.buildroot.net/buildroot/commit/?id=8476428660987f3d2b43efc2daf5bc443c72c704
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

gr-pager (labeled 'gr-flex' in our menuconfig) is not available since
bump to version 3.8.0.0 in commit 0d6a7b2981d4 (package/gnuradio: bump
to version 3.8.0.0) and upstream commit:
    https://github.com/gnuradio/gnuradio/commit/2d2caa205f3c3059deab7c82660908656167fd90

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5045cab63d0ed033ce1a1b3c7ee6b098ed2abaeb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy             | 6 ++++++
 package/gnuradio/Config.in   | 6 ------
 package/gnuradio/gnuradio.mk | 6 ------
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a0c1a6898f..031948a2eb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2021.05"
 
+config BR2_PACKAGE_GNURADIO_PAGER
+	bool "gnuradio gr-flex support removed"
+	select BR2_LEGACY
+	help
+	  gr-flex has been removed from gnuradio since version 3.8.0.0.
+
 config BR2_PACKAGE_UDISKS_LVM2
 	bool "udisks lvm2 support removed"
 	select BR2_LEGACY
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 738088802e..c10e0fa3f5 100644
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
index 1f4458db92..10402da49f 100644
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
