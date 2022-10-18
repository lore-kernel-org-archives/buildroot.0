Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD73C4332F
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 23:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9DE4419D0;
	Tue, 18 Oct 2022 23:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9DE4419D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMclg0hTKrhm; Tue, 18 Oct 2022 23:46:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7211419D3;
	Tue, 18 Oct 2022 23:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7211419D3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1C721BF59C
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 23:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA1D783F1C
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 23:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA1D783F1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U99vgj0jQxy0 for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 23:46:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D676083F11
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTP id D676083F11
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 23:46:20 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kwHpowviNaWj1kwHpoEi0W; Wed, 19 Oct 2022 01:46:18 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 01:46:17 +0200
Message-Id: <20221018234617.225947-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIGWS8ghiqYnC1DcDEqpieMti4XvLuB8qt3C2Qx8oJ5FeOPr/LwDK4iZqoms0HHH3t+uyXs2oQNPVb1ZPMNMATlg7Q3qK3yWZBt48SRGKfbpizmfKZTS
 ZQfcwbkm+9e9vc5A7r2qX+9ferDnxlN5DX8rFGyjRT+J5ziSq29MV5tnMrNyLfwny4DjecKH9BdDm8ioJykiRUWotyHNLg9kWzMWz0/oO7dPkseTfsBo7TOT
 yYIdMIs4Zw7ynTNpEO0KJ5aZqAv+GTwI2DLeKVF1qn2EDoppOOULQqFk/3LwgOqguGvkMytNe9vCuGTZPxt16TpQp7sep18nxvsg5yulXUk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666136778; bh=2xT2fYQVDFc6THWZwNrUK9JEb9zHe3vw7JPZuqVYyaQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=XNZzD4GKkmmKWtRQYQOUbZJzZT3vnfLqfnsvq+jW1AZ8NslqCMdL85XWNUvzz4Ll0
 wtUgyNwtLuYRxTCeETIlKf/8L7p1dozuwM8j9iGAiiVXP+wJTVTV/ZKkYcCYQJE31A
 ZiJIRlda6714DW+WXlb8IOtHyW8H9uf40nnGKwiJbx+6XHHADo/kgSxwrywQsCahw7
 N//S2eNbOA0SOfoIXWeB9HoGf50MbtBeqkFwr4frArf25DejDffv1csseIYNfsIxVD
 9MZFj1amAp+oG7Gt1gqIAwJ+B27Q/oa/AKZMTdTWNSeTgTf+HOS7P8rlCXh55xq1+z
 3NANaZEguHI8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=XNZzD4GK
Subject: [Buildroot] [PATCH] package/mono: allow to select which folders to
 install to target
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At the moment all APIs folders are copied to target increasing the size of
rootfs of ~190MB. Allow to select which API folders we want to copy to
target to shrink rootfs down.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mono/Config.in | 16 ++++++++++++++++
 package/mono/mono.mk   | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index 76178bcf9b..8690ee68ef 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -23,6 +23,22 @@ config BR2_PACKAGE_MONO
 
 	  http://download.mono-project.com/sources/mono/
 
+config BR2_PACKAGE_MONO_SPECIFY_FOLDERS_TO_INSTALL
+	bool "Specify folders to install to target"
+	help
+	  Allow to specify which Mono folder to install to target
+
+if BR2_PACKAGE_MONO_SPECIFY_FOLDERS_TO_INSTALL
+
+config BR2_PACKAGE_MONO_FOLDERS_TO_INSTALL
+	string "Mono folders to install to target"
+	help
+	  Paths to Mono folders to install to target /usr/lib/mono/.
+	  Only these folders will be copied to the target and not all
+	  the built ones. You can provide a list of folders separated by
+	  by spaces.
+
+endif
 comment "mono needs a toolchain w/ C++, NPTL, dynamic library"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 219effc5d3..8036d23205 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -30,10 +30,22 @@ MONO_CONF_OPTS = $(MONO_COMMON_CONF_OPTS) --disable-mcs-build
 
 # The libraries have been built by the host-mono build. Since they are
 # architecture-independent, we simply copy them to the target.
+ifeq ($(BR2_PACKAGE_MONO_SPECIFY_FOLDERS_TO_INSTALL),y)
+# Copy only selected folders
+define MONO_INSTALL_LIBS
+	mkdir -p $(TARGET_DIR)/usr/lib/mono
+	(for dir in $(call qstrip,$(BR2_PACKAGE_MONO_FOLDERS_TO_INSTALL)); do \
+		rsync -av --exclude=*.so --exclude=*.mdb \
+		$(HOST_DIR)/lib/mono/$${dir} $(TARGET_DIR)/usr/lib/mono; \
+	done)
+endef
+else
+# Copy all folders
 define MONO_INSTALL_LIBS
 	rsync -av --exclude=*.so --exclude=*.mdb \
 		$(HOST_DIR)/lib/mono $(TARGET_DIR)/usr/lib/
 endef
+endif
 
 MONO_POST_INSTALL_TARGET_HOOKS += MONO_INSTALL_LIBS
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
