Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C6EC52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FF2C608B8;
	Wed,  7 Aug 2024 14:34:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qEbtkJAkEFDh; Wed,  7 Aug 2024 14:34:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6313608C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6313608C6;
	Wed,  7 Aug 2024 14:34:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 442431BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FE0740198
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8iaWqEP_moNr for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A566E40201
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A566E40201
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A566E40201
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:11 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f15790b472so24447641fa.0
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041249; x=1723646049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j5p4wRD3+IulVZLF2MZmKB/cw/bAyuQfj6h6r0Qi2hs=;
 b=u+9PpR3AZ7ZdRrk4/UE3JLa73djiHu+1PvAfmVxy7B0qSiiQZzlmeZr7lg1cQ9Xmyj
 Dl5MkRLU96yYN47swaqEiFS0N6s8QXq+IYOZgZRv+M4OXXV2+85t0X5M2TH3KiTjY2yP
 nzBBE3kuK7BOBO4FU1G5m3SQEs4vLtNJgz1RepnsBAMBPr1EnV71nQE/2b7jvhUSH1Jy
 y4Ogp+IPOcqb88JC1s6NFMiSYlQG4nFbetHtqDCGbhin3MzIGImYgeLVkVbfCT2+016L
 F8T6oVOt8T1/dBLuVOzl8kA67M9+CwvKUbs/OV+QGSv5TTXxY0xfRD/lKqsaxcflc4PG
 0OaA==
X-Gm-Message-State: AOJu0YxiehmERpUrfsKjWSF0IadMP8QzB43/6FbuUUoj6kDr7n4q9TGg
 b10qP29fhDlxcNmiycn7upSUPajC/ABfnbm48XMK94yX/ZWBvK0raI5K6g==
X-Google-Smtp-Source: AGHT+IFQ/izNE3L2fZoC8fA+XdvXVXzbstlb+L1B/kQ640bKF0JC+ZdoKaAeouekaAba6wiI+7PQ8g==
X-Received: by 2002:a2e:9e15:0:b0:2ef:2dac:9076 with SMTP id
 38308e7fff4ca-2f15aa95dbcmr114180331fa.11.1723041248634; 
 Wed, 07 Aug 2024 07:34:08 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:34:08 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:02 +0200
Message-Id: <20240807143318.439619-3-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041249; x=1723646049; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j5p4wRD3+IulVZLF2MZmKB/cw/bAyuQfj6h6r0Qi2hs=;
 b=UGUf7Bdh7rc2c5pfJapfJqjvHGVu6pOkgbuFxatwt3eVSsrvd9B7g3sL3s7E+fz99P
 MkQu0L4gfjQRNaKuhzv8IZ6Fs+eUzuiDjNeR0WsgzdEdrl0dii9HkubW36989Tw9jcLi
 uwDf5zjXMN4cqiqh3Konp1plfWEQoIn8aiUBxW6mQzVtyvu8lD3zXvl/9wen8dtTFtGp
 gC5guSGKjDNuJ0HRnVFtfneWF/VF2yLXmR4+3hDo0ceXBdNq3VddgPqx7MEc6RWxU45g
 BPpVYBtK8s6+rBRXqXQhZ31Z7oOBkveJzywm2Q5sYGMwq+rqsw3y0nHs71LIijAnAIx7
 rBMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UGUf7Bdh
Subject: [Buildroot] [PATCH 02/18] package/erlang-fast-xml: renamed from
 erlang-p1-xml
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

and bump version to 1.1.52. This package has been renamed to avoid
patching other packages that expect to find it in a fast_xml/
directory. Delete the corresponding patch in the erlang-p1-xmpp package.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 DEVELOPERS                                     |  2 +-
 package/Config.in                              |  2 +-
 package/ejabberd/Config.in                     |  2 +-
 package/ejabberd/ejabberd.mk                   |  2 +-
 package/erlang-fast-xml/Config.in              |  8 ++++++++
 .../erlang-fast-xml.hash}                      |  2 +-
 package/erlang-fast-xml/erlang-fast-xml.mk     | 18 ++++++++++++++++++
 package/erlang-p1-xml/Config.in                |  8 --------
 package/erlang-p1-xml/erlang-p1-xml.mk         | 18 ------------------
 package/erlang-p1-xmpp/0001-fix-includes.patch | 16 ----------------
 package/erlang-p1-xmpp/Config.in               |  2 +-
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk       |  6 +++---
 12 files changed, 35 insertions(+), 51 deletions(-)
 create mode 100644 package/erlang-fast-xml/Config.in
 rename package/{erlang-p1-xml/erlang-p1-xml.hash => erlang-fast-xml/erlang-fast-xml.hash} (50%)
 create mode 100644 package/erlang-fast-xml/erlang-fast-xml.mk
 delete mode 100644 package/erlang-p1-xml/Config.in
 delete mode 100644 package/erlang-p1-xml/erlang-p1-xml.mk
 delete mode 100644 package/erlang-p1-xmpp/0001-fix-includes.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index abd36c0c59..24841dcc6e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1656,6 +1656,7 @@ N:	Johan Oudinet <johan.oudinet@gmail.com>
 F:	package/ejabberd/
 F:	package/erlang-base64url/
 F:	package/erlang-eimp/
+F:	package/erlang-fast-xml/
 F:	package/erlang-goldrush/
 F:	package/erlang-idna/
 F:	package/erlang-jiffy/
@@ -1670,7 +1671,6 @@ F:	package/erlang-p1-sip/
 F:	package/erlang-p1-stringprep/
 F:	package/erlang-p1-tls/
 F:	package/erlang-p1-utils/
-F:	package/erlang-p1-xml/
 F:	package/erlang-p1-xmpp/
 F:	package/erlang-p1-yaml/
 F:	package/erlang-p1-yconf/
diff --git a/package/Config.in b/package/Config.in
index 7dc4f99ec2..4e2f992abe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -673,6 +673,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-base64url/Config.in"
 	source "package/erlang-eimp/Config.in"
+	source "package/erlang-fast-xml/Config.in"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-idna/Config.in"
 	source "package/erlang-jiffy/Config.in"
@@ -687,7 +688,6 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-stringprep/Config.in"
 	source "package/erlang-p1-tls/Config.in"
 	source "package/erlang-p1-utils/Config.in"
-	source "package/erlang-p1-xml/Config.in"
 	source "package/erlang-p1-xmpp/Config.in"
 	source "package/erlang-p1-yaml/Config.in"
 	source "package/erlang-p1-yconf/Config.in"
diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index fb35a87306..295b0e7744 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_EJABBERD
 	depends on BR2_PACKAGE_ERLANG
 	depends on BR2_INSTALL_LIBSTDCPP # jiffy, stringprep
 	select BR2_PACKAGE_ERLANG_EIMP
+	select BR2_PACKAGE_ERLANG_FAST_XML
 	select BR2_PACKAGE_ERLANG_IDNA # runtime
 	select BR2_PACKAGE_ERLANG_JIFFY # runtime
 	select BR2_PACKAGE_ERLANG_JOSE # runtime
@@ -16,7 +17,6 @@ config BR2_PACKAGE_EJABBERD
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
-	select BR2_PACKAGE_ERLANG_P1_XML
 	select BR2_PACKAGE_ERLANG_P1_XMPP
 	select BR2_PACKAGE_ERLANG_P1_YAML
 	select BR2_PACKAGE_ERLANG_P1_YCONF # runtime
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 1df8145496..e49560d3a7 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -12,7 +12,7 @@ EJABBERD_CPE_ID_VENDOR = process-one
 EJABBERD_DEPENDENCIES = getent openssl erlang-eimp host-erlang-lager \
 	erlang-lager erlang-p1-cache-tab erlang-p1-sip \
 	erlang-p1-stringprep erlang-stun erlang-p1-tls \
-	erlang-p1-utils erlang-p1-xml erlang-p1-xmpp erlang-p1-yaml \
+	erlang-p1-utils erlang-fast-xml erlang-p1-xmpp erlang-p1-yaml \
 	erlang-p1-zlib host-erlang-p1-utils host-erlang-p1-xmpp
 
 # 0001-Makefile.in-do-not-download-or-compile-dependencies.patch
diff --git a/package/erlang-fast-xml/Config.in b/package/erlang-fast-xml/Config.in
new file mode 100644
index 0000000000..04d6634fe8
--- /dev/null
+++ b/package/erlang-fast-xml/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ERLANG_FAST_XML
+	bool "erlang-fast-xml"
+	select BR2_PACKAGE_ERLANG_P1_UTILS
+	select BR2_PACKAGE_EXPAT
+	help
+	  XML utilities for Erlang
+
+	  https://github.com/processone/fast_xml
diff --git a/package/erlang-p1-xml/erlang-p1-xml.hash b/package/erlang-fast-xml/erlang-fast-xml.hash
similarity index 50%
rename from package/erlang-p1-xml/erlang-p1-xml.hash
rename to package/erlang-fast-xml/erlang-fast-xml.hash
index 379ca7ef88..df5557080c 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.hash
+++ b/package/erlang-fast-xml/erlang-fast-xml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  02bcdb0a4350080a10b52de85c11de982e5f7cf2150f5b1b888f7a95ccb31265  erlang-p1-xml-1.1.49.tar.gz
+sha256  2f705191a029ca7df7e62a6cd8622701da59a9e221f8514d2c2b1a5c1d23c739  erlang-fast-xml-1.1.52.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-fast-xml/erlang-fast-xml.mk b/package/erlang-fast-xml/erlang-fast-xml.mk
new file mode 100644
index 0000000000..a04e3f5e09
--- /dev/null
+++ b/package/erlang-fast-xml/erlang-fast-xml.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# erlang-fast-xml
+#
+################################################################################
+
+ERLANG_FAST_XML_VERSION = 1.1.52
+ERLANG_FAST_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_FAST_XML_VERSION))
+ERLANG_FAST_XML_LICENSE = Apache-2.0
+ERLANG_FAST_XML_LICENSE_FILES = LICENSE.txt
+ERLANG_FAST_XML_DEPENDENCIES = expat erlang-p1-utils
+HOST_ERLANG_FAST_XML_DEPENDENCIES = host-expat host-erlang-p1-utils
+ERLANG_FAST_XML_INSTALL_STAGING = YES
+
+ERLANG_FAST_XML_USE_AUTOCONF = YES
+
+$(eval $(rebar-package))
+$(eval $(host-rebar-package))
diff --git a/package/erlang-p1-xml/Config.in b/package/erlang-p1-xml/Config.in
deleted file mode 100644
index 504501d912..0000000000
--- a/package/erlang-p1-xml/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_ERLANG_P1_XML
-	bool "erlang-p1-xml"
-	select BR2_PACKAGE_ERLANG_P1_UTILS
-	select BR2_PACKAGE_EXPAT
-	help
-	  XML utilities for Erlang
-
-	  https://github.com/processone/xml
diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
deleted file mode 100644
index eee2c74c03..0000000000
--- a/package/erlang-p1-xml/erlang-p1-xml.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# erlang-p1-xml
-#
-################################################################################
-
-ERLANG_P1_XML_VERSION = 1.1.49
-ERLANG_P1_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_P1_XML_VERSION))
-ERLANG_P1_XML_LICENSE = Apache-2.0
-ERLANG_P1_XML_LICENSE_FILES = LICENSE.txt
-ERLANG_P1_XML_DEPENDENCIES = expat erlang-p1-utils
-HOST_ERLANG_P1_XML_DEPENDENCIES = host-expat host-erlang-p1-utils
-ERLANG_P1_XML_INSTALL_STAGING = YES
-
-ERLANG_P1_XML_USE_AUTOCONF = YES
-
-$(eval $(rebar-package))
-$(eval $(host-rebar-package))
diff --git a/package/erlang-p1-xmpp/0001-fix-includes.patch b/package/erlang-p1-xmpp/0001-fix-includes.patch
deleted file mode 100644
index f02037fdc1..0000000000
--- a/package/erlang-p1-xmpp/0001-fix-includes.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Without this patch, rebar fails to find include file fxml.hrl.
-
-Signed-off-by: Christophe Romain <cromain@process-one.net>
-
-diff --git a/include/xmpp.hrl b/include/xmpp.hrl
-index afa5f61..678858e 100644
---- a/include/xmpp.hrl
-+++ b/include/xmpp.hrl
-@@ -25,7 +25,7 @@
- -include("ns.hrl").
- -include("jid.hrl").
- -include("xmpp_codec.hrl").
---include_lib("fast_xml/include/fxml.hrl").
-+-include_lib("p1_xml/include/fxml.hrl").
-
- -type stanza() :: iq() | presence() | message().
diff --git a/package/erlang-p1-xmpp/Config.in b/package/erlang-p1-xmpp/Config.in
index c67dc832b7..9cd1a75198 100644
--- a/package/erlang-p1-xmpp/Config.in
+++ b/package/erlang-p1-xmpp/Config.in
@@ -4,8 +4,8 @@ comment "erlang-p1-xmpp needs a toolchain w/ C++"
 config BR2_PACKAGE_ERLANG_P1_XMPP
 	bool "erlang-p1-xmpp"
 	depends on BR2_INSTALL_LIBSTDCPP # erlang-p1-stringprep
+	select BR2_PACKAGE_ERLANG_FAST_XML
 	select BR2_PACKAGE_ERLANG_IDNA
-	select BR2_PACKAGE_ERLANG_P1_XML
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
index 2deb25b315..f8ec0b9823 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
@@ -9,9 +9,9 @@ ERLANG_P1_XMPP_SITE = $(call github,processone,xmpp,$(ERLANG_P1_XMPP_VERSION))
 ERLANG_P1_XMPP_LICENSE = Apache-2.0
 ERLANG_P1_XMPP_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_XMPP_INSTALL_STAGING = YES
-ERLANG_P1_XMPP_DEPENDENCIES = erlang-p1-xml erlang-p1-stringprep \
-	erlang-p1-tls erlang-p1-utils erlang-p1-zlib host-erlang-p1-xml
-HOST_ERLANG_P1_XMPP_DEPENDENCIES = host-erlang-p1-xml
+ERLANG_P1_XMPP_DEPENDENCIES = erlang-fast-xml erlang-p1-stringprep \
+	erlang-p1-tls erlang-p1-utils erlang-p1-zlib host-erlang-fast-xml
+HOST_ERLANG_P1_XMPP_DEPENDENCIES = host-erlang-fast-xml
 
 $(eval $(rebar-package))
 $(eval $(host-rebar-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
