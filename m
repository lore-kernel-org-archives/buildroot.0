Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A56C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 06:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02C71418DB;
	Wed, 15 Jun 2022 06:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rjLxa_UosJlw; Wed, 15 Jun 2022 06:54:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCCF540933;
	Wed, 15 Jun 2022 06:54:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26D4D1BF2C5
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 06:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2354340933
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 06:54:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Io5GMsQ5ZQEj for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 06:54:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4DE340918
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 06:54:19 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id z14so6424978pgh.0
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 23:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d2ixChWO6m66EmNMWeLg8vvXgmbgSzXKWgr9Ecxfzpo=;
 b=myyBnD7LNuw93uzEqLXYPgGWbNAq9NxbqnJQH0X73f85CcS1xn+wnJLe+EW6ha3xBB
 Ax++u4E25z8/RdVIlOARxR0wtNHS8GhCHFhLn9oQ1CknuknFJST/kmLH//g6XZ4u3mmn
 Rd4oDj2wCqE6XSsM6C02awdkWyPi6Zqh5A83FQLqFq3MU/IEAfq6oq6bE/l4E7B26LA0
 U8OqhgE7xrCEQuTSmp1e0GQCaG6AycSP4pEDAfCC96ulR+GWDOv6Yv29H3hi6QtGlxeq
 xLODCygMTNk7nzOeygnrpuNc6QBsRlOUwgGNq7mtWZfaW2R+lK4FVQUM28B+4zyG2HYS
 +TqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d2ixChWO6m66EmNMWeLg8vvXgmbgSzXKWgr9Ecxfzpo=;
 b=NtBjqHNE3B3ZNliTP9PJguEQSiJzxnclx8T/8l2P64Fi7lZKIChrr1O4o4R6f1QsDF
 Pfptd17Ab+9lV6jw+SkmRJkQ+DfyZkmbakvb72Ie3qgkwXIlV+5qbKR3T7c76xgPLtar
 u7+fa/WqGLxHJNe2mQ0YV9uPoWH+1uDcG/w2APP7bPOv3h4qcF+nzqpBhhLnULlr4Wqn
 UAuwBfYzc4H6udojGx+6JHN9MtWZwKGMCYonYV9hfZKUT3oL0oXlO/SdxPOr3FJtXKhV
 hZPe6HmFNEaya21od0AD7vsFXo9eC6aNKKitd0wNfv9GKypwCVujNXAc4z7cB61aOhKD
 fG9A==
X-Gm-Message-State: AOAM533Y6dd3Kr08McKjwCsEB8i8W3EwXzjQXOZSfQT9hvtISb/vSmHd
 VcnTfjrTQLPLLhlrPync1iflGKyGKS4VmbOS
X-Google-Smtp-Source: ABdhPJxGEPXW3O/uFiXbk5RlPbrizDXWE+JRNXb0BRA4Wg6hcGPaxwvx15zQ/rgbYqTr+TLI0WxdwQ==
X-Received: by 2002:a65:668b:0:b0:3f6:4026:97cd with SMTP id
 b11-20020a65668b000000b003f6402697cdmr7636351pgw.420.1655276059058; 
 Tue, 14 Jun 2022 23:54:19 -0700 (PDT)
Received: from localhost.localdomain ([2409:4041:e81:cda6:9ceb:fac7:7607:5d04])
 by smtp.gmail.com with ESMTPSA id
 i67-20020a62c146000000b0051c1b445094sm8867656pfg.7.2022.06.14.23.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 23:54:18 -0700 (PDT)
From: Ankit Panchal <ankitpanchal202@gmail.com>
X-Google-Original-From: Ankit Panchal <ankit.panchal@einfochips.com>
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 12:24:06 +0530
Message-Id: <20220615065406.2856780-1-ankit.panchal@einfochips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5webkit: fix qt-webkit-kisok
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
Cc: Ankit Panchal <ankit.panchal@einfochips.com>,
 Peter Seiderer <ps.report@gmx.net>, Ankit Panchal <ankitpanchal202@gmail.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Ankit Panchal <ankitpanchal202@gmail.com>

While compilation of qt-webkit-kiosk package we get following error:
ERROR: Unknown module(s) in QT: webkit webkitwidgets

more detail about the bug is provided at:
https://bugs.buildroot.org/show_bug.cgi?id=14606

Following are the changes done:
1. The installation paths of the qt5webkit modules in the .pri files
has been modified.
2. And softlinks of the webkit and webkitwidgets packages has been
created at the expected paths.

Signed-off-by: Ankit Panchal <ankit.panchal@einfochips.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 6912359674..a850a03ca9 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -50,6 +50,23 @@ ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 QT5WEBKIT_CONF_OPTS += -DENABLE_SAMPLING_PROFILER=OFF
 endif
 
+define QT5WEBKIT_CONF_PRI
+	$(SED) 's/QT.webkit.includes =.*/QT.webkit.includes = \$$\$$QT_MODULE_INCLUDE_BASE \$$\$$QT_MODULE_INCLUDE_BASE\/QtWebKit/g' -e 's/QT.webkit.libs =.*/QT.webkit.libs = \$$\$$QT_MODULE_LIB_BASE/g' -e 's/QT.webkit.rpath =.*/QT.webkit.rpath = \$$\$$QT_MODULE_LIB_BASE/g' -e 's/QT.webkit.bins =.*/QT.webkit.bins = \$$\$$QT_MODULE_BIN_BASE/g' -e 's/QMAKE_RPATHDIR +=.*/QMAKE_RPATHDIR += \$$\$$QT_MODULE_LIB_BASE/g' $(@D)/Source/WebKit/qt_lib_webkit.pri
+
+	$(SED) 's/QT.webkit_private.includes =.*/QT.webkit_private.includes = \$$\$$QT_MODULE_INCLUDE_BASE\/QtWebKit\/5.212.0 \$$\$$QT_MODULE_INCLUDE_BASE\/QtWebKit\/5.212.0\/QtWebKit/g' -e 's/QT.webkit_private.libs =.*/QT.webkit_private.libs = \$$\$$QT_MODULE_LIB_BASE/g' -e 's/QT.webkit_private.bins =.*/QT.webkit_private.bins = \$$\$$QT_MODULE_BIN_BASE/g' $(@D)/Source/WebKit/qt_lib_webkit_private.pri
+
+	$(SED) 's/QT.webkitwidgets.includes =.*/QT.webkitwidgets.includes = \$$\$$QT_MODULE_INCLUDE_BASE \$$\$$QT_MODULE_INCLUDE_BASE\/QtWebKitWidgets/g' -e 's/QT.webkitwidgets.libs =.*/QT.webkitwidgets.libs = \$$\$$QT_MODULE_LIB_BASE/g' -e 's/QT.webkitwidgets.rpath =.*/QT.webkitwidgets.rpath = \$$\$$QT_MODULE_LIB_BASE/g' -e 's/QT.webkitwidgets.bins =.*/QT.webkitwidgets.bins = \$$\$$QT_MODULE_BIN_BASE/g' -e 's/QMAKE_RPATHDIR +=.*/QMAKE_RPATHDIR += \$$\$$QT_MODULE_LIB_BASE/g' $(@D)/Source/WebKit/qt_lib_webkitwidgets.pri
+
+	$(SED) 's/QT.webkitwidgets_private.includes =.*/QT.webkitwidgets_private.includes = \$$\$$QT_MODULE_INCLUDE_BASE\/QtWebKitWidgets\/5.212.0 \$$\$$QT_MODULE_INCLUDE_BASE\/QtWebKitWidgets\/5.212.0\/QtWebKitWidgets/g' -e 's/QT.webkitwidgets_private.libs =.*/QT.webkitwidgets_private.libs = \$$\$$QT_MODULE_LIB_BASE/g' -e 's/QT.webkitwidgets_private.bins =.*/QT.webkitwidgets_private.bins = \$$\$$QT_MODULE_BIN_BASE/g' $(@D)/Source/WebKit/qt_lib_webkitwidgets_private.pri
+endef
+QT5WEBKIT_POST_CONFIGURE_HOOKS += QT5WEBKIT_CONF_PRI
+
+define QT5WEBKIT_CREATE_SYMLINK
+	ln -sf $(HOST_DIR)/arm-buildroot-linux-gnueabihf/sysroot/usr/mkspecs/modules/*.pri $(HOST_DIR)/mkspecs/modules/
+	ln -sf $(HOST_DIR)/arm-buildroot-linux-gnueabihf/sysroot/usr/include/QtWebKit* $(HOST_DIR)/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/
+endef
+QT5WEBKIT_POST_INSTALL_STAGING_HOOKS += QT5WEBKIT_CREATE_SYMLINK
+
 QT5WEBKIT_CONF_OPTS += \
 	-DENABLE_TOOLS=OFF \
 	-DPORT=Qt \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
