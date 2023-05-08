Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17C7C7EE22
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 14:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0A3C41B61;
	Mon,  8 May 2023 14:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0A3C41B61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-hCAR3n800a; Mon,  8 May 2023 14:36:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1ACC414E2;
	Mon,  8 May 2023 14:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1ACC414E2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C1581BF279
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 14:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 329F0605EC
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 14:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 329F0605EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tgoMl0237iiC for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 14:36:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CCE26150D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CCE26150D
 for <buildroot@buildroot.org>; Mon,  8 May 2023 14:35:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.225.6.203]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MfYLQ-1qOm4x1jOS-00fxTz; Mon, 08 May 2023 16:35:55 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Mon,  8 May 2023 16:35:06 +0200
Message-Id: <20230508143506.137329-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Sy4Gwf38uwFyIwubS7rR00OzBNkq11gCKaDZbWCgVwgJtk1tTT/
 S6VGYI9b2D23cnemQ6kHonYNXRhpTJDvI3qtH5024wfukvMNAhErHjOkHdwNkQzOR9O11Vk
 c9EWQKStcRJw29cmHtHfxhuBPb7wqj7URMUG8LBfocNmL+rg5CtnPN53FehdFHg9QICf3j5
 NqT5EnZAWaSIuFaBEVUiQ==
UI-OutboundReport: notjunk:1;M01:P0:QrWFvanmOqI=;bGHic3NNevRkwiy4vC3vZKq9xh0
 51VTUHl8gccYq8hdBgGPvjVzUJFb33mlWrDq/mZIDQffGDE6vucKILoHt7t7qRqMWCnb3UKHD
 wOmfAnBZkm7iRhugfq2TMmQPC4gU/jmE2PJmiFsDib69KyyJ+aR52EP5vb26/elW44XhfnP2C
 6VOdSyWLQX0c8FmlgYQ9WoshBScIfL/yPnRasTIJKoII/HFGk3Fq/ARNin2v70EhdGPAWjvV6
 Rh9g/Np7fHiBOo2LdMVmu+f+Qga0NaZmvXUboApQFFg3QfPy5VNh24sZvhiYe4EdXtAnWn3q9
 Zeagt+Wbz8FkMFQa/W1LuhzA3vxSIzt9txjaOSSwuyUaxidPOyUvHuMty4aJFNuabjsTc1QkX
 WLgayD7mWoIdzeXu7WKzzFq6cqcKwdfiwgWfWPVM0yRaZP2zDCH7lVg3CvwDBDUb1bWkhQ/70
 Rdbm7diXUJRhks5y7HoRgk5aCbPaauRx6PBOLuh05xNjQ+/nRaisBCMyY2cAaH1UH2ANVPqo4
 wJAG+BYCM6tPmL33qCMuwegrNhPAXWz6Vooc11E0a7fcDHcpFSdoV+0BolL2UblQLZ9I6fbET
 gGuWZzZYoRWOUI0SNlhywucx9YGPtUnTtZCCZF9TU0XBBgFs1Jb5qbVXBDoZfoL84L3/hCzvH
 i58iLQtP0hUMucvNBy9+UKFCFE+zQwFTdxQ6fiswp7Gn4BH6DlKOi6rbOVfXyBa68apaKuOFW
 J9yZp8L1v1bcE7xuThv2Uv2s+rALVOE8XeWA+f2GXqrp2WDDB+gnTS8ntyQP8rYQqELztpDZA
 HOeARPjKv5yKZk6Lj21tyE54VhF+nbTSHlNYg5ItS1C8R959TOudaZwUQHU+MQ42D2kETK+Ec
 Rq+ufyerlAX4lX4wmyuX7MgDFN+hPeRLBWAmnec+kDGQk8eMlAXryCA3E5BY+gJbEswMS6glQ
 zvrqsh88MtrD+0Bueo0EdSD8adw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1683556555; i=dalang@gmx.at;
 bh=kYy5i9C2sP8kwLLq26QpGQ5jvPYLIiql8tZqtECAt5E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=lgtQ4Sd1wYHv2lPJAfchLzYh27R4te8aNIui8BAuUYcLZ0T3XZWisXeLJSZjHyi/c
 O+1WS5Ib/uS0OsT4CXy+kgRfX6Yqnpkor2ZTEhyodmgQlTMbUwVc2B48XY6IxP7lEr
 7GvikzxoJWuCzHg20Ry2Z+/lL9/Rj7wTd8hoVf+C/h+639VrbWI4Fjylrqch68V82y
 QwRSuehcG3QgLxsj2DGEjntdejmiKtugZuUSsyhI8bVMnLw8ggcZGHEHPIy02aUrIR
 GZQf040nsSpqwNKA87jLu/h1TDS+A5y7LnCDaEB8Y4Qu8mUHGbtVEJqE0B1UrFpp08
 DKUWWBGsM4OLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=lgtQ4Sd1
Subject: [Buildroot] [PATCH] package/dbus-cxx: bump version to 2.4.0
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
Cc: Daniel Lang <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/dbus-cxx/dbus-cxx/releases/tag/2.4.0

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/dbus-cxx/dbus-cxx.hash | 2 +-
 package/dbus-cxx/dbus-cxx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-cxx/dbus-cxx.hash b/package/dbus-cxx/dbus-cxx.hash
index 6a7a634ced..4ed9d73bac 100644
--- a/package/dbus-cxx/dbus-cxx.hash
+++ b/package/dbus-cxx/dbus-cxx.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  88d4bd1d9af8563bda03f24b26ffe4efbc555ca82ac664ced572b053928f739a  dbus-cxx-2.3.1.tar.gz
+sha256  c38456ed70023d93e6e689087e4bbe030f1650bbda9de7c035d6f4ebac788379  dbus-cxx-2.4.0.tar.gz
 sha256  99e5d0ad951d96567a6f9a17f3f17ac000c0582f53357c7f3601851c2dcbb786  COPYING
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  cmake-modules/LICENSE_1_0.txt
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  tools/libcppgenerate/LICENSE
diff --git a/package/dbus-cxx/dbus-cxx.mk b/package/dbus-cxx/dbus-cxx.mk
index 554acaa67d..8e2b4f70fa 100644
--- a/package/dbus-cxx/dbus-cxx.mk
+++ b/package/dbus-cxx/dbus-cxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_CXX_VERSION = 2.3.1
+DBUS_CXX_VERSION = 2.4.0
 DBUS_CXX_SITE = $(call github,dbus-cxx,dbus-cxx,$(DBUS_CXX_VERSION))
 DBUS_CXX_LICENSE = LGPL-3.0+ or BSD-3-Clause, Boost license (cmake-modules), Apache 2.0 (libcppgenerate)
 DBUS_CXX_LICENSE_FILES = COPYING cmake-modules/LICENSE_1_0.txt tools/libcppgenerate/LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
