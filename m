Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9339DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:27:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D0C661165
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D0C661165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2501140417;
	Tue, 21 Sep 2021 19:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RJScb7oDBXP4; Tue, 21 Sep 2021 19:27:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53E56403F9;
	Tue, 21 Sep 2021 19:27:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16DC41BF995
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6720581846
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:26:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NqMUG3x7DorL for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:26:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6C1F8330B
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E95618C1EA; Tue, 21 Sep 2021 19:24:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 21:01:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b83f6f33c16df2850eda65a095e9d2a3972f65e
X-Git-Newrev: fde3bf94b105d94d3d9a04acb11ee31f6e73f11d
X-Patchwork-Hint: ignore
Message-Id: <20210921192442.E95618C1EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: smixer-python module
 supports python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=fde3bf94b105d94d3d9a04acb11ee31f6e73f11d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add simple mixer python bindings to build when "Python support for
alsa-lib" is active. smixer-python is the only python module which
exists in alsa-lib. It is compatible with Python2 and Python3.

Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
index c71ad5dd58..99c53f9408 100644
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
