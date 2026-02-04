Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE030E9538F
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 12:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F3B6608C2;
	Wed,  4 Feb 2026 12:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMLaajFOl_dU; Wed,  4 Feb 2026 12:13:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74CA360A55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770207231;
	bh=iBlLT779Jh+bJMQ5BMm6Yb38lOsJhH/m6inm3jK23dM=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cMaiAj2ahOAVHUBv+EzxTS+EEmNRe19A12llqTFpA9T7L5jZNOQP+9keVxlVM+egL
	 FTuy0V7thSeO81cfOWLD91rIqms/b3J6bSllpnLfdk/R3x8LmS5hlfaZihAmrt27r1
	 DIkSV9e7NqM7sDPUieDI5/V2iFWsYWXPwaE/MQrhjLlnO7LOf7OU+1HQbUJdb8ldhK
	 gWlpp1qOpA1p4glvH8So8uOoBkOfN3gRJ7VJrZKftH7MRCiiz8IEyATjNaEiS3nU3a
	 9FovRVb9mo/R9IvcSvpkLzmyoYG++93WYuTuUyWdsXLRprpMxx07jn8AXlt8RROiFs
	 1nuuwlkSvw/bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74CA360A55;
	Wed,  4 Feb 2026 12:13:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59946F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41F9740AE2
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5Na2S9vyFid for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 12:13:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 22A0440AE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22A0440AE1
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22A0440AE1
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:13:47 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id EF26531E0B83; Wed, 04 Feb 2026 13:13:45 +0100 (CET)
Date: Wed, 4 Feb 2026 13:13:45 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aYM3-YJ9EDSSoiQx@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1770207225; bh=rLDd16yAi/7oSFQJ0CTt0xGF5UPnZ2dA9r6yFecdGNU=;
 h=Date:From:To:Subject:From;
 b=mQh+CmnwFFxX5T4FKCePyk0QT81D4MPzqPMSfUOMr/OGYEOugR22dMhH+jkvykib9
 urWwYB8bNC/0JVBWLcdUTCHPCk1NwELbtsSVSgwj0+yShn+m6tCS/wqUG9QZ879Lvt
 Sz+x6wWWm0haDiQTyOiUvWfd/Z5UyJUp5Np4B7RWPqHNasOtwPyq38HcpLnfu44oKD
 FDAsjWYqRq39byPRy1yuob33PaG5MFmlgop7t8Toee6yqGO4anZGjkQjUXHgmEPYNA
 hnJvu6CVaFf1oBDyh+EU7W9jzaSBXt903thgnWWaZNy8GxrEfYxxfGihGiFih9/Q7b
 hR3Q2py4akCeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH v3 1/5] package/libaom: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This contains a reference version of the Alliance for Open Media video codec.
This codec is a patent free alternative to H.265, and is starting to be
used throughout the internet.
This library is used by firefox.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 no changes
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libaom/Config.in   |  8 ++++++++
 package/libaom/libaom.hash |  2 ++
 package/libaom/libaom.mk   | 15 +++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/libaom/Config.in
 create mode 100644 package/libaom/libaom.hash
 create mode 100644 package/libaom/libaom.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 13bf5244fe..e964886da6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3431,6 +3431,7 @@ F:	package/asterisk/
 F:	package/evilwm/
 F:	package/fbv/
 F:	package/libpam-pkcs11/
+F:	package/libaom/
 F:	package/mksh/
 F:	package/ruby/
 F:	package/uclibc/
diff --git a/package/Config.in b/package/Config.in
index 258ad1883d..2f9fa35fb2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1930,6 +1930,7 @@ menu "Multimedia"
 	source "package/dav1d/Config.in"
 	source "package/kvazaar/Config.in"
 	source "package/libaacs/Config.in"
+	source "package/libaom/Config.in"
 	source "package/libass/Config.in"
 	source "package/libbdplus/Config.in"
 	source "package/libbluray/Config.in"
diff --git a/package/libaom/Config.in b/package/libaom/Config.in
new file mode 100644
index 0000000000..8ff06219be
--- /dev/null
+++ b/package/libaom/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBAOM
+	bool "libaom"
+	help
+	  This contains a reference version of the Alliance for Open Media
+	  video codec. This codec is a patent free alternative to H.265,
+	  and is starting to be used throughout the internet.
+
+	  https://aomedia.org/
diff --git a/package/libaom/libaom.hash b/package/libaom/libaom.hash
new file mode 100644
index 0000000000..5d5a8b0e32
--- /dev/null
+++ b/package/libaom/libaom.hash
@@ -0,0 +1,2 @@
+sha256  19e45a5a7192d690565229983dad900e76b513a02306c12053fb9a262cbeca7d  libaom-3.13.1.tar.gz
+sha256  4764a286d8b2faeaf42f4418e7d7a28d58fc8fd4d00a3d0a7f44b0a4099de7f2  LICENSE
diff --git a/package/libaom/libaom.mk b/package/libaom/libaom.mk
new file mode 100644
index 0000000000..733cc24c94
--- /dev/null
+++ b/package/libaom/libaom.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libaom
+#
+################################################################################
+
+LIBAOM_VERSION = 3.13.1
+LIBAOM_SITE = https://storage.googleapis.com/aom-releases
+LIBAOM_DEPENDENCIES = host-nasm
+LIBAOM_INSTALL_STAGING = YES
+LIBAOM_LICENSE = BSD-2-Clause
+LIBAOM_LICENSE_FILES = LICENSE
+LIBAOM_SUPPORTS_IN_SOURCE_BUILD = NO
+
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
