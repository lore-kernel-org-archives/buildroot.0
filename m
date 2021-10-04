Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31297C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 15:21:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A74F961154
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 15:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A74F961154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D12C427D3;
	Mon,  4 Oct 2021 15:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eEeGNel-t3re; Mon,  4 Oct 2021 15:21:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCF8C427CD;
	Mon,  4 Oct 2021 15:21:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 866721BF2FE
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 15:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83115427D2
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 15:21:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hU0Km0GJOSSw for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 15:21:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8B74427CD
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 15:21:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 598A78E2B0; Mon,  4 Oct 2021 15:18:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 15:42:15 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 5f8e900d5e73ffc0abafd428cb189af7ed09886f
X-Git-Newrev: a3f3c3c417f85ff379df86a6d06ff4dca0c3f70f
X-Patchwork-Hint: ignore
Message-Id: <20211004151852.598A78E2B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/alsa-lib:
 smixer-python module supports python3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a3f3c3c417f85ff379df86a6d06ff4dca0c3f70f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Add simple mixer python bindings to build when "Python support for
alsa-lib" is active. smixer-python is the only python module which
exists in alsa-lib. It is compatible with Python2 and Python3.

Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit fde3bf94b105d94d3d9a04acb11ee31f6e73f11d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-lib/Config.in   |  2 +-
 package/alsa-lib/alsa-lib.mk | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index f334b66bff..4168d1f220 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -22,7 +22,7 @@ if BR2_PACKAGE_ALSA_LIB
 
 config BR2_PACKAGE_ALSA_LIB_PYTHON
 	bool "Python support for alsa-lib"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  Add python support for alsa-lib.
 	  Python will be built and libpython will be installed
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index b1bfaf30e5..ad205aaa1d 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -57,12 +57,22 @@ ALSA_LIB_CONF_OPTS += --disable-old-symbols
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
+ALSA_LIB_CONF_OPTS += \
+	--enable-mixer-pymods
+ifeq ($(BR2_PACKAGE_PYTHON),y)
 ALSA_LIB_CONF_OPTS += \
 	--with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
 	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_DEPENDENCIES = python
 else
+ALSA_LIB_CONF_OPTS += \
+	--with-pythonlibs=-lpython$(PYTHON3_VERSION_MAJOR) \
+	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
+ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
+ALSA_LIB_DEPENDENCIES = python3
+endif
+else
 ALSA_LIB_CONF_OPTS += --disable-python
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
