Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3E1FA3722
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 22:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B426860749;
	Thu,  1 Jan 2026 22:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIZL-f9VkD1R; Thu,  1 Jan 2026 22:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD28260762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767307157;
	bh=U6meyOwjA52MaOOJ11L5665i0cPYIwn4FY2Jzwfs9cU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KYeeysRreC2Iv8X0vEqK4QQaHLR7JeTyKSSOWGrkiqHIxxDN6EcFxob3Wd2Z974YE
	 KLICiJKquviA2oxpfT+P1xwR5zjIB28tKw3CI+yxiMl+dGpjaOc5lAjQ0HTM6D4f4B
	 AqeVQ7LFGvaCV9iWSsBc5qUfM4o7R+qNkygI+A+b60TsH4n5toG70Rlx0orMAujYZM
	 rMx4D7VxCAOTNt4eaHQuaOa69KDa+83bgWT25fTnDH2Vgp3Vyz12UDhgxepRo2ylwm
	 HJNqTWJ0otSpASiq9mf5cqXHZT8JPd5TLKxKWU9MGPsMDl3X4fPKHUNc9G/+d7NZWl
	 nA7Hqkj8CExwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD28260762;
	Thu,  1 Jan 2026 22:39:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A694351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C9B340193
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SABfbNf65nw5 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 22:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E11D4036A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E11D4036A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:39:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EA4887D51; Thu,  1 Jan 2026 22:39:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 23:36:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1bfe97aa691a6fafa6dc25d7c78a831c64a139e
X-Git-Newrev: 114628419252ed962146465167c18d70a2f0caed
X-Patchwork-Hint: ignore
Message-Id: <20260101223914.4EA4887D51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cegui: bump version
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=114628419252ed962146465167c18d70a2f0caed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches which are included in this release.

Updated dependencies and configure options due to upstream commits:
https://github.com/cegui/cegui/commit/36c0eaf629b46bdaa3448d20d46294cb0dbc6db5
https://github.com/cegui/cegui/commit/c9adaa03d67e2ba650e063dc7b60c63113ba6cf0
https://github.com/cegui/cegui/commit/20f5ac6658ce151e73772906cdb9be93603c5064

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-XMLParser.cpp-include-string.h.patch      | 37 ----------------------
 ...-type-of-xmlGetLastError-for-libxml2-2-12.patch | 29 -----------------
 package/cegui/cegui.hash                           |  2 +-
 package/cegui/cegui.mk                             | 29 ++++++++---------
 4 files changed, 15 insertions(+), 82 deletions(-)

diff --git a/package/cegui/0002-XMLParser.cpp-include-string.h.patch b/package/cegui/0002-XMLParser.cpp-include-string.h.patch
deleted file mode 100644
index e117d6220d..0000000000
--- a/package/cegui/0002-XMLParser.cpp-include-string.h.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b98ed87225fa3c0f156b0798ca5c285d8fa8fac1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 15 Jun 2021 07:27:41 +0200
-Subject: [PATCH] XMLParser.cpp: include string.h
-
-Include string.h to avoid the following build failure:
-
-/home/buildroot/autobuild/run/instance-3/output-1/build/cegui-00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0/cegui/src/XMLParserModules/RapidXML/XMLParser.cpp:73:5: error: 'memcpy' was not declared in this scope
-   73 |     memcpy(buf, source.getDataPtr(), size);
-      |     ^~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/1cb09e5f52435efc505c61707b2d5d2ee871524b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: 628f7edf4b420f752f1965ea11e5e747e3ff93b0
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- cegui/src/XMLParserModules/RapidXML/XMLParser.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/cegui/src/XMLParserModules/RapidXML/XMLParser.cpp b/cegui/src/XMLParserModules/RapidXML/XMLParser.cpp
-index 810ea6bbf..59822fc80 100644
---- a/cegui/src/XMLParserModules/RapidXML/XMLParser.cpp
-+++ b/cegui/src/XMLParserModules/RapidXML/XMLParser.cpp
-@@ -38,6 +38,8 @@
- #include "CEGUI/Logger.h"
- #include "CEGUI/Exceptions.h"
- 
-+#include <string.h>
-+
- // Start of CEGUI namespace section
- namespace CEGUI
- {
--- 
-2.31.1
-
diff --git a/package/cegui/0003-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch b/package/cegui/0003-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
deleted file mode 100644
index 9091062e28..0000000000
--- a/package/cegui/0003-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 285ba5a2c0c435ed865c6e86afe314a822fd1e3f Mon Sep 17 00:00:00 2001
-From: oreo639 <oreo6391@gmail.com>
-Date: Sun, 18 Feb 2024 14:16:21 -0800
-Subject: [PATCH] Fix return type of xmlGetLastError for libxml2 2.12
-
-https://gitlab.gnome.org/GNOME/libxml2/-/commit/45470611b047db78106dcb2fdbd4164163c15ab7
-
-Upstream: https://github.com/cegui/cegui/commit/285ba5a2c0c435ed865c6e86afe314a822fd1e3f
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- cegui/src/XMLParserModules/Libxml2/XMLParser.cpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp b/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp
-index 74a3dbddd..a408f9305 100644
---- a/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp
-+++ b/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp
-@@ -109,7 +109,11 @@ void LibxmlParser::parseXML(XMLHandler& handler,
- 
-     if (!doc)
-     {
-+#if LIBXML_VERSION >= 21200
-+        const xmlError* err = xmlGetLastError();
-+#else
-         xmlError* err = xmlGetLastError();
-+#endif
- 
-         throw GenericException(
-             String("xmlParseMemory failed in file: '") +
diff --git a/package/cegui/cegui.hash b/package/cegui/cegui.hash
index 131b248619..be0939148c 100644
--- a/package/cegui/cegui.hash
+++ b/package/cegui/cegui.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5b6f9e209e8a29b2f30d6aef92efd125c8bedaab5be04b562208be51e5e7f04e  cegui-00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0.tar.gz
+sha256  9460cbbe7fc3bb3cf6abfd7f5a9c5f135b20e9898400bd698a5fa0d0fe879865  cegui-e7a03afc70c6182a091ff31accb9d77c6bdf6f60.tar.gz
 sha256  cc869e2ece8ad039f6d7fd17259db4ea0ae0a502d02a1bb506c0168deb12e40d  COPYING
diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 835658763e..9b2a1704b6 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -4,20 +4,19 @@
 #
 ################################################################################
 
-CEGUI_VERSION = 00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0
+CEGUI_VERSION = e7a03afc70c6182a091ff31accb9d77c6bdf6f60
 CEGUI_SITE = $(call github,cegui,cegui,$(CEGUI_VERSION))
 CEGUI_LICENSE = MIT
 CEGUI_LICENSE_FILES = COPYING
 CEGUI_INSTALL_STAGING = YES
 CEGUI_CONF_OPTS = \
-	-DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF \
+	-DCEGUI_BUILD_RESOURCE_PROVIDER_MINIZIP=OFF \
 	-DCEGUI_BUILD_IMAGECODEC_FREEIMAGE=OFF \
 	-DCEGUI_BUILD_RENDERER_IRRLICHT=OFF \
 	-DCEGUI_BUILD_RENDERER_OGRE=OFF \
 	-DCEGUI_BUILD_RENDERER_OPENGLES=OFF \
 	-DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
 	-DCEGUI_USE_FRIBIDI=OFF \
-	-DCEGUI_SAMPLES_ENABLED=OFF \
 	-DCEGUI_BUILD_APPLICATION_TEMPLATES=OFF \
 	-DCEGUI_BUILD_PYTHON_MODULES_SWIG=OFF
 CEGUI_DEPENDENCIES = glm \
@@ -60,16 +59,16 @@ endif
 
 ifeq ($(BR2_PACKAGE_PCRE),y)
 CEGUI_DEPENDENCIES += pcre
-CEGUI_CONF_OPTS += -DCEGUI_HAS_PCRE_REGEX=ON
+CEGUI_CONF_OPTS += -DCEGUI_REGEX_MATCHER=PCRE
 else
-CEGUI_CONF_OPTS += -DCEGUI_HAS_PCRE_REGEX=OFF
+CEGUI_CONF_OPTS += -DCEGUI_REGEX_MATCHER=std
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 CEGUI_DEPENDENCIES += freetype
-CEGUI_CONF_OPTS += -DCEGUI_HAS_FREETYPE=ON
+CEGUI_CONF_OPTS += -DCEGUI_USE_FREETYPE=ON
 else
-CEGUI_CONF_OPTS += -DCEGUI_HAS_FREETYPE=OFF
+CEGUI_CONF_OPTS += -DCEGUI_USE_FREETYPE=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
@@ -79,18 +78,18 @@ else
 CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_LIBXML2=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_RAPIDXML),y)
-CEGUI_DEPENDENCIES += rapidxml
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_RAPIDXML=ON
+ifeq ($(BR2_PACKAGE_PUGIXML),y)
+CEGUI_DEPENDENCIES += pugixml
+CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_PUGIXML=ON
 else
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_RAPIDXML=OFF
+CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_PUGIXML=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_TINYXML),y)
-CEGUI_DEPENDENCIES += tinyxml
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML=ON
+ifeq ($(BR2_PACKAGE_TINYXML2),y)
+CEGUI_DEPENDENCIES += tinyxml2
+CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML2=ON
 else
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML=OFF
+CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML2=OFF
 endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
