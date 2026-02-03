Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E0FE8B367
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 22:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB69D60837;
	Tue,  3 Feb 2026 22:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KX1Cu4zNDKay; Tue,  3 Feb 2026 22:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D043360A53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770156662;
	bh=lzbggpQO8GsRLZ3650rd/inZ+rIJ6HsDOvgmmY89uA8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I0hLpr2QJEwZ62ye/AE8o1iDKhNdbUjOYoiVy8u2+E2woggohfs+/XYsYQpcqE9hX
	 O2sZaHul7i+S0OxSTITxQBcFXT6LJGdlcvmNMyhAOSMQpdzAJ4yCW5wn2JduBDcTMA
	 3e0+Y9HSuM/5/e2xXz2pMNwp+z67SfC1NQsSwFQNYolOdRdRFs46CbSgWTpj3+bbZw
	 0ruLia0vZeJDJdcPT5xjhHCXD82fr2Ri5LNZqb5Q5xOWH12ZwxJ2FWDOGBM7JgDsce
	 wLgLwF1W4jrh1/TN2nSOAsObtqHQBhOroLCWe0sdLYsCidSx1wolIerpUi7UT4IkwG
	 q44Vf7dqvFRMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D043360A53;
	Tue,  3 Feb 2026 22:11:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 14E2A13D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA4BC60A53
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKN7zCY0dGrd for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 22:10:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C23960904
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C23960904
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:10:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21B5E8110A; Tue,  3 Feb 2026 22:10:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 23:09:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4aeb85d6691ce285067a98eef1684c4c5f31d3ef
X-Git-Newrev: 6eaaccf7587b2dcbc78fab0e69042307543bc3d0
X-Patchwork-Hint: ignore
Message-Id: <20260203221059.21B5E8110A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pico{tool,
 -sdk}: install sdk files to $(HOST_DIR)/share
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6eaaccf7587b2dcbc78fab0e69042307543bc3d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commits [1] and [2] are installing host SDK files
"$(HOST_DIR)/usr/share".

check-package (see [3]) reports the error:

    package/pico-sdk/pico-sdk.mk:23: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/
    package/pico-sdk/pico-sdk.mk:24: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/
    package/picotool/picotool.mk:15: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/

This commit installs the host SDK files to "$(HOST_DIR)/share" to fix
this error.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/12970341499

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/ceb800d3c63fe91628f42ce749c211ebef278628
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/926381d360082e926cb6be28cb1e97639d26ea0f
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/29a0dd4a3006c06d4b8d82821bd74b8b9f26715a

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/pico-sdk/pico-sdk.mk | 4 ++--
 package/picotool/picotool.mk | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
index 5bcf71650d..dfb29d2320 100644
--- a/package/pico-sdk/pico-sdk.mk
+++ b/package/pico-sdk/pico-sdk.mk
@@ -20,8 +20,8 @@ define PICO_SDK_INSTALL_STAGING_CMDS
 endef
 
 define HOST_PICO_SDK_INSTALL_CMDS
-	mkdir -p $(HOST_DIR)/usr/share/pico-sdk
-	cp -r $(@D)/* $(HOST_DIR)/usr/share/pico-sdk
+	mkdir -p $(HOST_DIR)/share/pico-sdk
+	cp -r $(@D)/* $(HOST_DIR)/share/pico-sdk
 endef
 
 $(eval $(generic-package))
diff --git a/package/picotool/picotool.mk b/package/picotool/picotool.mk
index bca9489665..cf8e294835 100644
--- a/package/picotool/picotool.mk
+++ b/package/picotool/picotool.mk
@@ -12,7 +12,7 @@ PICOTOOL_LICENSE_FILES = LICENSE.TXT
 PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(STAGING_DIR)/usr/share/pico-sdk
 PICOTOOL_DEPENDENCIES = libusb pico-sdk
 
-HOST_PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(HOST_DIR)/usr/share/pico-sdk
+HOST_PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(HOST_DIR)/share/pico-sdk
 HOST_PICOTOOL_DEPENDENCIES = host-libusb host-pico-sdk
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
