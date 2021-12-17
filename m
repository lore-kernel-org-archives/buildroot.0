Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21F1C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 19:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5018740ACC;
	Fri, 17 Dec 2021 19:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qf3gO9Rq2lJZ; Fri, 17 Dec 2021 19:10:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88E224091F;
	Fri, 17 Dec 2021 19:10:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 608E51BF35E
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 19:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D4B761152
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 19:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b3OMUTG9UdqU for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 19:10:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06A9D60FC3
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 19:10:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 y83-20020a1c7d56000000b003456dfe7c5cso3800265wmc.1
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 11:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ysUJ53uvvFjMS6sV/rsujOHVRmM0U3Oy/k1+jbgFSfQ=;
 b=fi20w9+bxLgXLlhZZgIsgf7rcK7br3c1xCb12rdWbCD0U7ZylTXFl4++QSzMe0+4az
 M6gDFqRYWAv2qJcPb7fC58lhxUYPl4S8W1Yt7BUi2jAov6heYKgR86saey1pGn0g8mrB
 CfLWrtxPfKiNXcOuIC7xhFi1uxU/16dobVAfKJsfykoal9/E6R3FSs9z5n2D50gf8nfZ
 kbajxyHZOQNr1ePIKMBmr8CIG1Ad6H0O9Q0FiTkrrr0O6tIL0GDUdsUksdEUoBOwr5MT
 w/RVt0aCB+UwDSopheTSCrmYbjAN25CkZdONvhI4nlIIZHrahwAQFKCFNQRlwSAf81an
 flVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ysUJ53uvvFjMS6sV/rsujOHVRmM0U3Oy/k1+jbgFSfQ=;
 b=hVh8L0N6BVZTL4lf259dpZRv/OcOvgqrC6wC5ztkUJcFYicEWMJ+E99scpFBHsFNJo
 KJbPplm/A23txSF2qXpWX06noi5O9ZDCm9Cs07Ys+aC1X6BhzRFEPoATKxzXYN3JKFt8
 /Q5Brsk+hHunqKDpW+9jBV1XI3kk7+E+gij9CCUBfgikUhKbCNfEmad5LoNo+VIG2/Gt
 4liVFN8JemfCq/wKnkusMRxhIq2Is1Pb9C5oNiKTyhsmtC+IDnuUK1YoA9vDFU5Pew1R
 H0l4iuYPYIsBKfnbpNmPeEW6e5vgkJ1QBbJdsFtT3oh9MTdwCwmR5FvStt190bytisXH
 9O5A==
X-Gm-Message-State: AOAM530KSRRCz+Ih7uDYNP8L//pC7LeRxsmFhirUTdIK5AXvajVDVxCc
 9L0hJc/JDpvinjRHejq416DBurAggNiwgg==
X-Google-Smtp-Source: ABdhPJyzYI92fYKP43CYEHtl/Y+B84ioGyV8PLrgF+wO3oZRjYR7U6Anw+Fm8UHJnDvcNQM6grSLEA==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr10605400wmq.148.1639768200921; 
 Fri, 17 Dec 2021 11:10:00 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id z22sm2860101wmi.26.2021.12.17.11.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 11:10:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 20:08:51 +0100
Message-Id: <20211217190853.18713-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/gupnp-dlna: add introspection
 support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- introspection support is needed to build latest rygel version
- build vala bindings to avoid a build failure as already done in other
  packages such as gssdp in commit
  d513e55930eda15a5fb15e00c1da774e6c18f66c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp-dlna/gupnp-dlna.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
index 85d30b7cd2..dd548e3e2d 100644
--- a/package/gupnp-dlna/gupnp-dlna.mk
+++ b/package/gupnp-dlna/gupnp-dlna.mk
@@ -15,9 +15,14 @@ GUPNP_DLNA_LICENSE_FILES = COPYING
 GUPNP_DLNA_INSTALL_STAGING = YES
 GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2
 
-GUPNP_DLNA_CONF_OPTS = \
-	--disable-introspection \
-	--disable-legacy-gstreamer-metadata-backend
+GUPNP_DLNA_CONF_OPTS = --disable-legacy-gstreamer-metadata-backend
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GUPNP_DLNA_CONF_OPTS += --enable-introspection
+GUPNP_DLNA_DEPENDENCIES += host-vala gobject-introspection
+else
+GUPNP_DLNA_CONF_OPTS += --disable-introspection
+endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 GUPNP_DLNA_CONF_OPTS += --enable-gstreamer-metadata-backend
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
