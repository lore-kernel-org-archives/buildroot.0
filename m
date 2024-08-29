Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D34C83F2E
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA5734078F;
	Thu, 29 Aug 2024 14:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdHu8X0wF7VD; Thu, 29 Aug 2024 14:50:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B788409FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B788409FE;
	Thu, 29 Aug 2024 14:50:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 910431BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B9976069B
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nx-1QpPrLBym for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 46665606B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46665606B9
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46665606B9
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:04 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-429da8b5feaso8718615e9.2
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943002; x=1725547802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vOdGGmueYIA+yRcsbFcJ54CS/d6/QWZ6EUCa9HP8Va8=;
 b=hBbjMTpID9kj7j+ZZtQAHT4Wpoz4Z1ttfaYI3rEfD+DL2EMGKN7DO3jyoVNvWpZI7s
 FDhSJfT8AxtNlBLbXf2KFAoAIM6LZDamrrshjZWlY9OJwtYdnUXT1WDvxfref+wWgEpA
 mdixzxZ5yC965Hg1TB2X3Cpxcdf0b96hGACXThzSSwGFLSV+m+lCsHJSEje6QdKQplZ1
 mKg92kraDeOZ00zyMXoUy/3z6Un2Ep89Z8P+C4ZBEhNYPd4KZaVFI2agiCVNOU+McEZk
 IZZy8t6F1c+Yrq4c6BxSOxl1B+oz4Uoc8msKehZp1jTjZ529nA9zJGBB9xCQsFkm7hTQ
 Rc+A==
X-Gm-Message-State: AOJu0YwaLA3BMV8ivOI6Rr6Km6UpV0QvdGJqH91uos+ZOGYJDi+Yodoc
 pqxJz6v9xTmGFOMgEniQuDIYhqH2sI1RFqI+SziQmJfY1rmTg8RYRU1J8A==
X-Google-Smtp-Source: AGHT+IHaBv1h9JKTYwugeccplvnDM8JCDmGzkJm+/gnxW0ddVr6BZLOcuAtxd6MDlZxtNrLUnQHUXQ==
X-Received: by 2002:adf:f4c3:0:b0:371:7dfc:5868 with SMTP id
 ffacd0b85a97d-3749b5843cfmr2659505f8f.57.1724943002164; 
 Thu, 29 Aug 2024 07:50:02 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:01 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:17 +0200
Message-Id: <20240829144940.209964-2-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943002; x=1725547802; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vOdGGmueYIA+yRcsbFcJ54CS/d6/QWZ6EUCa9HP8Va8=;
 b=I/CxF6CWQuI5Lw8GGBQjzN7wuTpEeCP2xT9hYLn6HU5it5g0r1Sbfrqa7VlFseAAZB
 ArAZm7EmVVA3pKZf1bVpOoBAirOFwAT8Eu5uSAEdhvMx8T7sb71svXjAWJz7e0Tpr86T
 GWLPM4M0onqoMRZW2SVIVFniCTEaT22Xl0unsCVTT2nzzSeC50m+mpSJInI42VAs9K92
 30WyVPK0hhbLVShd9NON7p/g2MfMlK5vnrIin+ppe9OvIRNEJvv75RUa73Nw/ycuMcz+
 8WdVXng7nLyGrfGS8CR2q9EHn1ngYcOiBQNCO4K8ScyN1wMywlDwqvVIr7uSnMouGOPZ
 XB3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I/CxF6CW
Subject: [Buildroot] [PATCH v2 01/23] package/erlang-stun: renamed from
 erlang-p1-stun
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

This package is renamed to avoid fixing other packages that expect to
find its content inside a stun/ directory instead of p1_stun/. Thus,
remove the corresponding patch from the erlang-p1-sip package.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 Config.in.legacy                              |  7 +++++
 DEVELOPERS                                    |  2 +-
 package/Config.in                             |  2 +-
 package/ejabberd/Config.in                    |  2 +-
 package/ejabberd/ejabberd.mk                  |  2 +-
 .../erlang-p1-sip/0001-correct-include.patch  | 31 -------------------
 package/erlang-p1-sip/Config.in               |  2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk        |  2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk      | 14 ---------
 .../{erlang-p1-stun => erlang-stun}/Config.in |  4 +--
 .../erlang-stun.hash}                         |  2 +-
 package/erlang-stun/erlang-stun.mk            | 14 +++++++++
 12 files changed, 30 insertions(+), 54 deletions(-)
 delete mode 100644 package/erlang-p1-sip/0001-correct-include.patch
 delete mode 100644 package/erlang-p1-stun/erlang-p1-stun.mk
 rename package/{erlang-p1-stun => erlang-stun}/Config.in (71%)
 rename package/{erlang-p1-stun/erlang-p1-stun.hash => erlang-stun/erlang-stun.hash} (81%)
 create mode 100644 package/erlang-stun/erlang-stun.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index d8480106ba..6964520231 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_ERLANG_P1_STUN
+	bool "erlang-p1-stun has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_ERLANG_STUN
+	help
+	  The erlang-p1-stun package has been renamed to erlang-stun.
+
 config BR2_PACKAGE_FROTZ
 	bool "frotz has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 0b590f0ec2..6025d62ebd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1660,7 +1660,6 @@ F:	package/erlang-p1-oauth2/
 F:	package/erlang-p1-pkix/
 F:	package/erlang-p1-sip/
 F:	package/erlang-p1-stringprep/
-F:	package/erlang-p1-stun/
 F:	package/erlang-p1-tls/
 F:	package/erlang-p1-utils/
 F:	package/erlang-p1-xml/
@@ -1668,6 +1667,7 @@ F:	package/erlang-p1-xmpp/
 F:	package/erlang-p1-yaml/
 F:	package/erlang-p1-yconf/
 F:	package/erlang-p1-zlib/
+F:	package/erlang-stun/
 F:	package/forge/
 F:	package/nginx-dav-ext/
 F:	package/vis-network/
diff --git a/package/Config.in b/package/Config.in
index 211080345a..1d8df4a977 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -683,7 +683,6 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-pkix/Config.in"
 	source "package/erlang-p1-sip/Config.in"
 	source "package/erlang-p1-stringprep/Config.in"
-	source "package/erlang-p1-stun/Config.in"
 	source "package/erlang-p1-tls/Config.in"
 	source "package/erlang-p1-utils/Config.in"
 	source "package/erlang-p1-xml/Config.in"
@@ -691,6 +690,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-yaml/Config.in"
 	source "package/erlang-p1-yconf/Config.in"
 	source "package/erlang-p1-zlib/Config.in"
+	source "package/erlang-stun/Config.in"
 endmenu
 endif
 	source "package/execline/Config.in"
diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index e24c7fee6b..fb35a87306 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -14,7 +14,6 @@ config BR2_PACKAGE_EJABBERD
 	select BR2_PACKAGE_ERLANG_P1_PKIX # runtime
 	select BR2_PACKAGE_ERLANG_P1_SIP
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
-	select BR2_PACKAGE_ERLANG_P1_STUN
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
 	select BR2_PACKAGE_ERLANG_P1_XML
@@ -22,6 +21,7 @@ config BR2_PACKAGE_EJABBERD
 	select BR2_PACKAGE_ERLANG_P1_YAML
 	select BR2_PACKAGE_ERLANG_P1_YCONF # runtime
 	select BR2_PACKAGE_ERLANG_P1_ZLIB
+	select BR2_PACKAGE_ERLANG_STUN
 	select BR2_PACKAGE_GETENT
 	select BR2_PACKAGE_OPENSSL
 	help
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 574f9492e8..1df8145496 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -11,7 +11,7 @@ EJABBERD_LICENSE_FILES = COPYING
 EJABBERD_CPE_ID_VENDOR = process-one
 EJABBERD_DEPENDENCIES = getent openssl erlang-eimp host-erlang-lager \
 	erlang-lager erlang-p1-cache-tab erlang-p1-sip \
-	erlang-p1-stringprep erlang-p1-stun erlang-p1-tls \
+	erlang-p1-stringprep erlang-stun erlang-p1-tls \
 	erlang-p1-utils erlang-p1-xml erlang-p1-xmpp erlang-p1-yaml \
 	erlang-p1-zlib host-erlang-p1-utils host-erlang-p1-xmpp
 
diff --git a/package/erlang-p1-sip/0001-correct-include.patch b/package/erlang-p1-sip/0001-correct-include.patch
deleted file mode 100644
index 90d68b5184..0000000000
--- a/package/erlang-p1-sip/0001-correct-include.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5ad4f871df7cbbc973708cb7380c3410b20bde1c Mon Sep 17 00:00:00 2001
-From: Philipp Huebner <debalance@debian.org>
-Date: Tue, 1 Dec 2020 23:07:51 +0100
-Subject: [PATCH] correct include
-
-This part of the code was moved into it's own project and was packaged
-separately by me. To make the build process work, this small fix is
-necessary.
-
-Author: Philipp Huebner <debalance@debian.org>
-Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
----
- src/esip_socket.erl | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/esip_socket.erl b/src/esip_socket.erl
-index 4154faa..db5fa92 100644
---- a/src/esip_socket.erl
-+++ b/src/esip_socket.erl
-@@ -37,7 +37,7 @@
- 
- -include("esip.hrl").
- -include("esip_lib.hrl").
---include_lib("stun/include/stun.hrl").
-+-include_lib("p1_stun/include/stun.hrl").
- 
- -define(TCP_SEND_TIMEOUT, 15000).
- -define(CONNECT_TIMEOUT, 20000).
--- 
-2.28.0
-
diff --git a/package/erlang-p1-sip/Config.in b/package/erlang-p1-sip/Config.in
index 70cf819a37..74494d3c94 100644
--- a/package/erlang-p1-sip/Config.in
+++ b/package/erlang-p1-sip/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_ERLANG_P1_SIP
 	bool "erlang-p1-sip"
-	select BR2_PACKAGE_ERLANG_P1_STUN
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
+	select BR2_PACKAGE_ERLANG_STUN
 	help
 	  SIP library for Erlang
 
diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index 61f728cb1b..45c70e8899 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -8,7 +8,7 @@ ERLANG_P1_SIP_VERSION = 1.0.49
 ERLANG_P1_SIP_SITE = $(call github,processone,esip,$(ERLANG_P1_SIP_VERSION))
 ERLANG_P1_SIP_LICENSE = Apache-2.0
 ERLANG_P1_SIP_LICENSE_FILES = LICENSE.txt
-ERLANG_P1_SIP_DEPENDENCIES = erlang-p1-stun erlang-p1-tls erlang-p1-utils
+ERLANG_P1_SIP_DEPENDENCIES = erlang-stun erlang-p1-tls erlang-p1-utils
 ERLANG_P1_SIP_INSTALL_STAGING = YES
 
 $(eval $(rebar-package))
diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1-stun/erlang-p1-stun.mk
deleted file mode 100644
index 7438bd2186..0000000000
--- a/package/erlang-p1-stun/erlang-p1-stun.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# erlang-p1-stun
-#
-################################################################################
-
-ERLANG_P1_STUN_VERSION = 1.2.7
-ERLANG_P1_STUN_SITE = $(call github,processone,stun,$(ERLANG_P1_STUN_VERSION))
-ERLANG_P1_STUN_LICENSE = Apache-2.0
-ERLANG_P1_STUN_LICENSE_FILES = LICENSE.txt
-ERLANG_P1_STUN_DEPENDENCIES = erlang-p1-tls erlang-p1-utils
-ERLANG_P1_STUN_INSTALL_STAGING = YES
-
-$(eval $(rebar-package))
diff --git a/package/erlang-p1-stun/Config.in b/package/erlang-stun/Config.in
similarity index 71%
rename from package/erlang-p1-stun/Config.in
rename to package/erlang-stun/Config.in
index 70cdd91599..dcf3817a2d 100644
--- a/package/erlang-p1-stun/Config.in
+++ b/package/erlang-stun/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_ERLANG_P1_STUN
-	bool "erlang-p1-stun"
+config BR2_PACKAGE_ERLANG_STUN
+	bool "erlang-stun"
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
 	help
diff --git a/package/erlang-p1-stun/erlang-p1-stun.hash b/package/erlang-stun/erlang-stun.hash
similarity index 81%
rename from package/erlang-p1-stun/erlang-p1-stun.hash
rename to package/erlang-stun/erlang-stun.hash
index 49e1963ff0..85dc6a42fa 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.hash
+++ b/package/erlang-stun/erlang-stun.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d7e9d3d591a88a91abf053c068f7152495e37d17f4c9ac58992c544d6f8f5e86  erlang-p1-stun-1.2.7.tar.gz
+sha256  d7e9d3d591a88a91abf053c068f7152495e37d17f4c9ac58992c544d6f8f5e86  erlang-stun-1.2.7.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-stun/erlang-stun.mk b/package/erlang-stun/erlang-stun.mk
new file mode 100644
index 0000000000..9def30a857
--- /dev/null
+++ b/package/erlang-stun/erlang-stun.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# erlang-stun
+#
+################################################################################
+
+ERLANG_STUN_VERSION = 1.2.7
+ERLANG_STUN_SITE = $(call github,processone,stun,$(ERLANG_STUN_VERSION))
+ERLANG_STUN_LICENSE = Apache-2.0
+ERLANG_STUN_LICENSE_FILES = LICENSE.txt
+ERLANG_STUN_DEPENDENCIES = erlang-p1-tls erlang-p1-utils
+ERLANG_STUN_INSTALL_STAGING = YES
+
+$(eval $(rebar-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
