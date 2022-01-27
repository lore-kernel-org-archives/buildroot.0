Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE875C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 19:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0C5B610CA;
	Thu, 27 Jan 2022 19:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MRk3GcQuu3ra; Thu, 27 Jan 2022 19:24:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E05C961037;
	Thu, 27 Jan 2022 19:24:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6954F1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58744818EC
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ISJ_aDcTwdRg for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 19:23:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 653CA817ED
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 19:23:45 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id i62so4911479ioa.1
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 11:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SWI0pwXGQovMk6ZWzeEEOGTYnCdkfEP1vo/2PDJeBP4=;
 b=qTAJnBXZSqvBGQJJj9aoVPZpDxmJ5ImIMh1En3lLzFFfxdVe10r5owoVx+T66YnSBO
 OeFTbjRVfGpz4sF2mx+6hvDqCiJFCjfUDJmf1YJXBMbwDiV3KPgK+0Tlz04N2dfFhYxB
 2Yqosp01MIBQ+l2dyim+ma0ZAkRy0Fl43jkz61sR+yJ2PbeMMMr/atyapajJC5Z5gUvX
 IGrW7ErINRcN9Yn5aTPKpoQWAiY0HcXgUhWK+IuKNfRP8Ucac5tppA53gPNw3ya8r1En
 dDUrl2SDwBUd3WFE1IWOv91uXftiXeCqVpiTJnmzRsRTdIEK01+EEWe9+qOs2HAmPc/l
 jQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SWI0pwXGQovMk6ZWzeEEOGTYnCdkfEP1vo/2PDJeBP4=;
 b=u3Iyv5aqjAIWwG6/PCZGeJpz3Ye4PMztUrOkLDay4MdlYPVB3Fpk227hnFPsyiyMT9
 tHfj1R3tF7ktspVw6o0MrylWEdSD0fUNM3k9jF1GmVKv4ECqVzk+BGk7S2j4kV0h6CeZ
 UBj6SV6JJkCvdpemkOHB12heHc1H1WjkwDfdl2SPBKTnT80kGKGLMVr9FrqSt3XY/CDA
 AukuWl+YUGHdVWEX9Bb46WxTykr6G5AdxRCzkBt/gHxFt4sZeR+8KP1zjz77sNc+L6Aj
 4tZwWhYGCufL1D7uN+PB+xEHUpjZWIIqGfIe3umwH7bhmTUCrR/jSHXRLhguxVWpgvff
 PO6Q==
X-Gm-Message-State: AOAM530gDsfNVv/6Sq2Gky1rpgwAEEtNGS/UXqxWE9ZuwlTUxNtzxpr6
 Ew9/612BdHFi105Q7/QsPln+Des2WLQ=
X-Google-Smtp-Source: ABdhPJyQTxzk+p49904A/S19ilTF6yr6E5fmSC3G63wttxMFD2495iPLLnmStkI76VxTF4to3vnx+w==
X-Received: by 2002:a02:c8d0:: with SMTP id q16mr2675982jao.11.1643311424156; 
 Thu, 27 Jan 2022 11:23:44 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id f12sm669023ilj.47.2022.01.27.11.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 11:23:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 12:23:10 -0700
Message-Id: <20220127192311.1954197-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127192311.1954197-1-james.hilliard1@gmail.com>
References: <20220127192311.1954197-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/5] package/sratom: new package
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
 Gilles Talis <gilles.talis@gmail.com>,
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
index 548570aa46..c4c46fc3bd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1338,6 +1338,7 @@ F:	package/python-yarl/
 F:	package/python-zopfli/
 F:	package/serd/
 F:	package/sord/
+F:	package/sratom/
 F:	package/zchunk/
 
 N:	James Knight <james.knight@collins.com>
diff --git a/package/Config.in b/package/Config.in
index 80d3f9ff3c..547620a266 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1383,6 +1383,7 @@ menu "Audio/Sound"
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
