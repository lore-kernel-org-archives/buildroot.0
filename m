Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37A3C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 22:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B44A400AB;
	Fri,  7 Jan 2022 22:26:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LrXQwF2rlsKb; Fri,  7 Jan 2022 22:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A0E9424BD;
	Fri,  7 Jan 2022 22:26:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C7BE1BF30A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37925424C3
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JlgAbpoUooW2 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 22:26:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02C43400AB
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 22:26:20 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id d3so5678729ilr.10
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 14:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pev9TNydsd7pzQTo8KdbFshVV089g/qlRVa2luW0/hY=;
 b=OsMXQK9Lsm7CeWW6IwWBjESR/Z4Ny35X1Dv73zJViToWuZ4Nr4nBhqxGNfrxyHpLPc
 PqD5l80/RStnOKuG7XAdIS3DnlSOtqvyvOEqas4zBN/Gxe9wYxEG4ev4UAFMM5Pr2+Fp
 5cfddYeS69wHlcAbySuCk41CWMuXz1Z7ZMbH5wjLMxmfI59CZSd3Ecga8zGxzcG9qAOL
 mpiFkmqVlOLohR0gwd2lO0LmFKbB8NA6J2EVMY4O6mshPsOeb9qlXle7nre3jdDL5Yqr
 DfhewbSwQemLg27VDA1DThEO648F3lSAHxHE3oNZ4CACak9oX6dUvKwQKlIgWAd6kSju
 +FsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pev9TNydsd7pzQTo8KdbFshVV089g/qlRVa2luW0/hY=;
 b=3s5w1mMdzqH/pQvSvU6irVG2Mn2vY0jUYypgtCtrCo9eCioQxkbRm7ebsDkWVkFLct
 yfbsEiCqQO5GCYvr1WQ83aK0zks1Exhl49AhlUEWsZY3CjXY98A1eKj7YBSpU0BdQdVi
 yIc+qljshJvMwDvt6fb080FeZYPqwr6OoT+hE2B9JE+vijZIYKXob3KjwTb+JfiaC95C
 Q/xNDbRv/eI3jvJc6wZgFbtyDj0ctkA/CQTOnJ44oXhUTPw7DWB0U7XmVzgJIl1cp8fw
 mXTHuPN+d+RABDotG/9NiipwqwV4CoTY0opm+OqI7Fbs7IQPt7Eo2hiPZ2sNTeDYvU+D
 i2Dg==
X-Gm-Message-State: AOAM532LWIm3FkYUtclZE4ko51gr4OavoWiUHSEmDROaV8cKUf05V6AI
 pu5/SBJHa5AMyXZNync3D6aOFBBm3zU=
X-Google-Smtp-Source: ABdhPJyqYcVMAoVwWzt7/qyaaL0N40WtRrg2QMxyyZIAlx8GJRn7IdIEqvJ5wsxd6+jOTFB1SLYqzA==
X-Received: by 2002:a05:6e02:1c4d:: with SMTP id
 d13mr29405283ilg.117.1641594379906; 
 Fri, 07 Jan 2022 14:26:19 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id k12sm3596453ioc.50.2022.01.07.14.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 14:26:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 15:26:10 -0700
Message-Id: <20220107222613.4124764-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107222613.4124764-1-james.hilliard1@gmail.com>
References: <20220107222613.4124764-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] package/sord: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/sord/Config.in |  8 ++++++++
 package/sord/sord.hash |  4 ++++
 package/sord/sord.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/sord/Config.in
 create mode 100644 package/sord/sord.hash
 create mode 100644 package/sord/sord.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d99d7798db..bc54ab590c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1300,6 +1300,7 @@ F:	package/python-weasyprint/
 F:	package/python-yarl/
 F:	package/python-zopfli/
 F:	package/serd/
+F:	package/sord/
 F:	package/zchunk/
 
 N:	James Knight <james.knight@collins.com>
diff --git a/package/Config.in b/package/Config.in
index 18ae22f227..6133d6ce32 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1705,6 +1705,7 @@ menu "JSON/XML"
 	source "package/rapidxml/Config.in"
 	source "package/raptor/Config.in"
 	source "package/serd/Config.in"
+	source "package/sord/Config.in"
 	source "package/tinyxml/Config.in"
 	source "package/tinyxml2/Config.in"
 	source "package/valijson/Config.in"
diff --git a/package/sord/Config.in b/package/sord/Config.in
new file mode 100644
index 0000000000..91dfb41d0b
--- /dev/null
+++ b/package/sord/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SORD
+	bool "sord"
+	select BR2_PACKAGE_SERD
+	help
+	  Sord is a lightweight C library for storing RDF data in
+	  memory.
+
+	  https://drobilla.net/software/sord.html
diff --git a/package/sord/sord.hash b/package/sord/sord.hash
new file mode 100644
index 0000000000..af175f91f0
--- /dev/null
+++ b/package/sord/sord.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking signature
+# https://download.drobilla.net/sord-0.16.8.tar.bz2.asc
+sha256  7c289d2eaabf82fa6ac219107ce632d704672dcfb966e1a7ff0bbc4ce93f5e14  sord-0.16.8.tar.bz2
+sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
diff --git a/package/sord/sord.mk b/package/sord/sord.mk
new file mode 100644
index 0000000000..f805805e9d
--- /dev/null
+++ b/package/sord/sord.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# sord
+#
+################################################################################
+
+SORD_VERSION = 0.16.8
+SORD_SITE = https://download.drobilla.net
+SORD_SOURCE = sord-$(SORD_VERSION).tar.bz2
+SORD_LICENSE = ISC
+SORD_LICENSE_FILES = COPYING
+SORD_DEPENDENCIES = host-pkgconf serd
+SORD_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+SORD_DEPENDENCIES += pcre
+endif
+
+SORD_CONF_OPTS += --no-coverage
+
+ifeq ($(BR2_STATIC_LIBS),y)
+SORD_CONF_OPTS += --static --no-shared --static-progs
+endif
+
+$(eval $(waf-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
