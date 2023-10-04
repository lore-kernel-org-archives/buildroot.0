Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2737E7B614
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 13:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B4AD60AD0;
	Wed,  4 Oct 2023 13:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B4AD60AD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W0l186T9RfWk; Wed,  4 Oct 2023 13:13:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 475F160E1B;
	Wed,  4 Oct 2023 13:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 475F160E1B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 888491BF2BC
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 13:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6211A820C7
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 13:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6211A820C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A4MtKGXMSbXD for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 13:13:20 +0000 (UTC)
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FDDA82033
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 13:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FDDA82033
ARC-Seal: i=1; a=rsa-sha256; t=1696425196; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eN4lePRZmMBbf5Z9rHN9ajmV6DqCAnYJ6IExp4dbNqeJ/aU+9BZZOcSwJmh1rZXANqBJYL4bC3SJ/VzPHerq7PTsZZgqAF99EBJNuIwNqlKGwkI/CE57433xyfvn7+aLHJgmdmDWO8LbGZu3nR5vxoOSw41zX6inxPpgfQOgE64=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1696425196;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=BgGUOBdunBYYSicKf/VU+TtrT5dBHeXhYUm/NxlWKvo=; 
 b=Jv0C9FpJ1eoKViDakrh5sVaFzyrR0aAwALBtIibBBEpYIHC1j7oJhzXEd6x8WMgfvpSZPixnJXyDhFxLHBIb65GQcjfUzoMDSwJrhltl2Q8wRak1J/+Da/MYma3plmnqEktx00BrSPF5TxbesfpYyfm0Jd/iL4aCV7B14udg7I8=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=fsck.pl;
 spf=pass  smtp.mailfrom=enki@fsck.pl;
 dmarc=pass header.from=<enki@fsck.pl>
Received: from newton.shill.gq (193.93.205.86 [193.93.205.86]) by
 mx.zohomail.com with SMTPS id 1696425194059377.4388370796805;
 Wed, 4 Oct 2023 06:13:14 -0700 (PDT)
From: Maciej Grela <enki@fsck.pl>
To: buildroot@buildroot.org
Message-ID: <20231004131256.2113233-2-enki@fsck.pl>
Date: Wed,  4 Oct 2023 15:12:53 +0200
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003094612.62025-2-enki@fsck.pl>
References: <20231003094612.62025-2-enki@fsck.pl>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1696425196; 
 s=zoho; d=fsck.pl; i=enki@fsck.pl;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=BgGUOBdunBYYSicKf/VU+TtrT5dBHeXhYUm/NxlWKvo=;
 b=ZXG9hWnUvDjtjIQXyF6ovPd2F6x/jSLumlT9OPCQNBfMRszsZAJ8qf/MVUidxEpS
 M9ZbJL2BdtTeSUn/8GUHzAcVPraw46LswWNVB26iYxjLnT0v/XkNoCUiZNhGaq3iPhR
 A9GA9Rf9INOTfhMtBysV4AYZCA67RYS2sk4cHcww=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=fsck.pl header.i=enki@fsck.pl
 header.a=rsa-sha256 header.s=zoho header.b=ZXG9hWnU
Subject: [Buildroot] [PATCH v2 1/3] package/iniparser: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maciej Grela <enki@fsck.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

iniparser is a required dependency of dns320l-daemon

Signed-off-by: Maciej Grela <enki@fsck.pl>
---
 package/Config.in                |  1 +
 package/iniparser/Config.in      |  6 ++++
 package/iniparser/iniparser.hash |  2 ++
 package/iniparser/iniparser.mk   | 56 ++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 package/iniparser/Config.in
 create mode 100644 package/iniparser/iniparser.hash
 create mode 100644 package/iniparser/iniparser.mk

diff --git a/package/Config.in b/package/Config.in
index 009f7ba186..228e9eb1e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2085,6 +2085,7 @@ menu "Other"
 	source "package/gtest/Config.in"
 	source "package/gumbo-parser/Config.in"
 	source "package/highway/Config.in"
+	source "package/iniparser/Config.in"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
 	source "package/libabseil-cpp/Config.in"
diff --git a/package/iniparser/Config.in b/package/iniparser/Config.in
new file mode 100644
index 0000000000..4932869943
--- /dev/null
+++ b/package/iniparser/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_INIPARSER
+	bool "iniparser"
+	help
+	  ini file parser
+
+	  https://github.com/ndevilla/iniparser
diff --git a/package/iniparser/iniparser.hash b/package/iniparser/iniparser.hash
new file mode 100644
index 0000000000..a745062fcd
--- /dev/null
+++ b/package/iniparser/iniparser.hash
@@ -0,0 +1,2 @@
+# From https://github.com/ndevilla/iniparser/releases
+sha256  960daa800dd31d70ba1bacf3ea2d22e8ddfc2906534bf328319495966443f3ae  iniparser-4.1.tar.gz
diff --git a/package/iniparser/iniparser.mk b/package/iniparser/iniparser.mk
new file mode 100644
index 0000000000..f3f74601f3
--- /dev/null
+++ b/package/iniparser/iniparser.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# iniparser
+#
+################################################################################
+
+INIPARSER_VERSION = 4.1
+INIPARSER_SITE = $(call github,ndevilla,iniparser,v$(INIPARSER_VERSION))
+INIPARSER_INSTALL_STAGING = YES
+INIPARSER_LICENSE = MIT
+INIPARSER_LICENSE_FILES = LICENSE
+INIPARSER_SO_TARGET = libiniparser.so.1
+INIPARSER_A_TARGET = libiniparser.a
+INIPARSER_BUILD_TARGETS =
+INIPARSER_STAGING_INSTALL_TGTS =
+INIPARSER_TARGET_INSTALL_TGTS =
+
+INIPARSER_CONFIGURE_OPTS = $(TARGET_CONFIGURE_OPTS)
+
+ifeq ($(BR2_STATIC_LIBS),y)
+INIPARSER_BUILD_TARGETS = $(INIPARSER_A_TARGET)
+INIPARSER_STAGING_INSTALL_TGTS = $(INIPARSER_A_TARGET)
+INIPARSER_TARGET_INSTALL_TGTS = $(INIPARSER_A_TARGET)
+else ifeq ($(BR2_SHARED_LIBS),y)
+INIPARSER_LINK_SO = y
+
+INIPARSER_BUILD_TARGETS = $(INIPARSER_SO_TARGET)
+INIPARSER_STAGING_INSTALL_TGTS = $(INIPARSER_SO_TARGET)
+
+INIPARSER_TARGET_INSTALL_TGTS = $(INIPARSER_SO_TARGET)
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+INIPARSER_LINK_SO = y
+
+INIPARSER_BUILD_TARGETS = $(INIPARSER_A_TARGET) $(INIPARSER_SO_TARGET)
+INIPARSER_STAGING_INSTALL_TGTS = $(INIPARSER_A_TARGET) $(INIPARSER_SO_TARGET)
+
+# Don't install static libs on target
+INIPARSER_TARGET_INSTALL_TGTS = $(INIPARSER_SO_TARGET)
+endif
+
+define INIPARSER_BUILD_CMDS
+	$(INIPARSER_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(INIPARSER_BUILD_TARGETS)
+endef
+
+define INIPARSER_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/src/iniparser.h $(@D)/src/dictionary.h $(STAGING_DIR)/usr/include/
+	$(foreach target,$(INIPARSER_STAGING_INSTALL_TGTS),$(INSTALL) -D -m 0755 $(@D)/$(target) $(STAGING_DIR)/usr/lib/)
+	$(if $(INIPARSER_LINK_SO),ln -s -r $(STAGING_DIR)/usr/lib/$(INIPARSER_SO_TARGET) $(STAGING_DIR)/usr/lib/libiniparser.so)
+endef
+
+define INIPARSER_INSTALL_TARGET_CMDS
+	$(foreach target,$(INIPARSER_TARGET_INSTALL_TGTS),$(INSTALL) -D -m 0755 $(@D)/$(target) $(TARGET_DIR)/usr/lib/)
+	$(if $(INIPARSER_LINK_SO),ln -s -r $(TARGET_DIR)/usr/lib/$(INIPARSER_SO_TARGET) $(TARGET_DIR)/usr/lib/libiniparser.so)
+endef
+
+$(eval $(generic-package))
-- 
2.39.2


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
