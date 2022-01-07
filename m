Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7762C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 22:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57FDD424C3;
	Fri,  7 Jan 2022 22:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5yqviLYV7HFf; Fri,  7 Jan 2022 22:27:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3202D424CE;
	Fri,  7 Jan 2022 22:26:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37E2A1BF30A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23EC9429BA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PExLUhPOyqZN for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 22:26:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41AAE429B7
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 22:26:22 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id r16so3997067ile.8
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 14:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lxHa+Oa1PyIN73gPGVQwmToijnDbbfPtfb54d+Y2X20=;
 b=IbMdtemviPvxo8BS8IHmj097wf47IC7PRMIrU5fEHaBMyMjsWYr7aI5ZGbkOEje/fe
 wP3P4oqEhGl8Hj+TX+m2wYQauODlsoGki3rzH39lEZ/kTf9cNO8qLZZjJVjMmAHm5j4C
 MV7bOQODVuRwr/lSOoAymqd37a2IyRrccJbR9oSi1++1Ol44bJlFFrOAWe3ePVeP/WSJ
 wpN18mCG65s5e1fILjdaX6McDD7Vh6HKKJw0IOsBibngKb7SWgIOtS4nPUEsLfwHtfzh
 qBKdezqKyc7XhghnwCtOO/fRSylTOq5212zzXO8ySEErpCQCqlaAv3OR5qV/ToYhwMqS
 Z78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lxHa+Oa1PyIN73gPGVQwmToijnDbbfPtfb54d+Y2X20=;
 b=l7ZI6yqz4Kf3MrScg1LNxRbJVfjT6QLPMpDQMVyBFLbTi5u5Rn4wrKwlr0fGtByQox
 SPCiIwjfXlm/Fs9mFSqLP2woIu+PmjekrjQ8DOKyOx+abgnQQD/U4+94l4M5j5Ossrri
 cvkNHn0jCwHlIOlAOufShqFAESn9CmpT4WnHVGSgOH8+fGrQFKzEI/9F9RABv/3nqvz+
 792MleGfj6aC4hT+Z3WJZwsjFV77t7FtF7w5ZKfUlbF40yr1KqEU/mb/nMcUUzF6mJ0u
 QB7eYCeR5lGIEfH2N509TP5dqJeUP5ApfeG2uw/ej9/MdiKiibwiKxIs7ADP7CpO5tXc
 ZJTQ==
X-Gm-Message-State: AOAM531kOFqhmAQrbgkP0QYy5owUQjMzEZp2AbJ1yWH0S5SRNJYghIIi
 TRzhWKWyDEKkN254HvO24YK+vR9tKgQ=
X-Google-Smtp-Source: ABdhPJw71zCgLQbNLMhQ+5AkrhlLDtuPJa/33uKVbsqzZ+8RDWRrDj4VE3y9aOUNAUnwGure9K+GRQ==
X-Received: by 2002:a92:7d11:: with SMTP id y17mr31936677ilc.64.1641594381257; 
 Fri, 07 Jan 2022 14:26:21 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id k12sm3596453ioc.50.2022.01.07.14.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 14:26:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 15:26:12 -0700
Message-Id: <20220107222613.4124764-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107222613.4124764-1-james.hilliard1@gmail.com>
References: <20220107222613.4124764-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] package/sratom: new package
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
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/sratom/Config.in   | 10 ++++++++++
 package/sratom/sratom.hash |  4 ++++
 package/sratom/sratom.mk   | 21 +++++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/sratom/Config.in
 create mode 100644 package/sratom/sratom.hash
 create mode 100644 package/sratom/sratom.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6c6e93f089..f8aa809294 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1302,6 +1302,7 @@ F:	package/python-yarl/
 F:	package/python-zopfli/
 F:	package/serd/
 F:	package/sord/
+F:	package/sratom/
 F:	package/zchunk/
 
 N:	James Knight <james.knight@collins.com>
diff --git a/package/Config.in b/package/Config.in
index a439a456a4..51a4180569 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1369,6 +1369,7 @@ menu "Audio/Sound"
 	source "package/spandsp/Config.in"
 	source "package/speex/Config.in"
 	source "package/speexdsp/Config.in"
+	source "package/sratom/Config.in"
 	source "package/taglib/Config.in"
 	source "package/tinyalsa/Config.in"
 	source "package/tremor/Config.in"
diff --git a/package/sratom/Config.in b/package/sratom/Config.in
new file mode 100644
index 0000000000..771e82073d
--- /dev/null
+++ b/package/sratom/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SRATOM
+	bool "sratom"
+	select BR2_PACKAGE_LV2
+	select BR2_PACKAGE_SERD
+	select BR2_PACKAGE_SORD
+	help
+	  Sratom is a library for serialising LV2 atoms to and from
+	  RDF, particularly the Turtle syntax.
+
+	  https://drobilla.net/software/sratom.html
diff --git a/package/sratom/sratom.hash b/package/sratom/sratom.hash
new file mode 100644
index 0000000000..64d460b2ea
--- /dev/null
+++ b/package/sratom/sratom.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking signature
+# https://download.drobilla.net/sratom-0.6.8.tar.bz2.asc
+sha256  3acb32b1adc5a2b7facdade2e0818bcd6c71f23f84a1ebc17815bb7a0d2d02df  sratom-0.6.8.tar.bz2
+sha256  3fc429d6b944fa20306357196a28bb4dd7c25e2d67edebec771f44de5bd7f9e8  COPYING
diff --git a/package/sratom/sratom.mk b/package/sratom/sratom.mk
new file mode 100644
index 0000000000..e1e0f4e033
--- /dev/null
+++ b/package/sratom/sratom.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# sratom
+#
+################################################################################
+
+SRATOM_VERSION = 0.6.8
+SRATOM_SITE = https://download.drobilla.net
+SRATOM_SOURCE = sratom-$(SRATOM_VERSION).tar.bz2
+SRATOM_LICENSE = ISC
+SRATOM_LICENSE_FILES = COPYING
+SRATOM_DEPENDENCIES = host-pkgconf lv2 serd sord
+SRATOM_INSTALL_STAGING = YES
+
+SRATOM_CONF_OPTS += --no-coverage
+
+ifeq ($(BR2_STATIC_LIBS),y)
+SRATOM_CONF_OPTS += --static --no-shared
+endif
+
+$(eval $(waf-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
