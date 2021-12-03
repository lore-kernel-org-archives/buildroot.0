Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F96C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 22:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3EA7405C3;
	Fri,  3 Dec 2021 22:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id chGqjDTWk7ap; Fri,  3 Dec 2021 22:52:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD78E40292;
	Fri,  3 Dec 2021 22:52:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 075071BF9D1
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 22:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA40560BC6
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 22:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_rJ0L1jHqmw for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 22:52:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8F5860AA3
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 22:52:07 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso5302303wmh.0
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 14:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nmVAWtov7TOfBDhSvUn6o682dgfhCsVdzyJcmnFoDHs=;
 b=Ji6Dc+QFBEBVkcic0TbbG7JL59QplQVTpQVtpbZA9SwnwNTU4+O8T1kI0MONipBLB7
 di8IjpA4LBbpGUXgC+w0x7AKtjSmG7Rdm1XQN2Y6gZKEhyliCw3lZyMQHHoXZ2lKBYI9
 L9nCmbWddLm6H5CK8aE5jCQxMRvjPFzbfB9rTOeAkwDgH316JMQD6gY/UmrQNzjjx/cB
 DdXsHH5xg4fN2myZo2m7lG2ULm+BxGBlHMQ1Ely3n6PjhOZIWNAPjyWw+mVNBzLt7/4G
 995SnA8qDgdBzybFzB/8maN7GbrpTMkJHYTXB/FJ5wzdsYt3joL2TFXOFJthpMrp8gSC
 BmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nmVAWtov7TOfBDhSvUn6o682dgfhCsVdzyJcmnFoDHs=;
 b=jQ2w4ziuwb2gNMu4JG5Ujub8btVv8aLri0k6+h+r7H+fgXHAMZZvsWICtebPs5dLGQ
 0DD/3l7nMHOVdwO3YljmKSBTP92NA/fX656BwFQ/SAoDsaWrSLzx/teGkDsdJbkCaKCG
 JwcT0tj7VL6YKXxf0cig7gpWnfss1+Lnv+VwXAluYSHg1wJ7Rk7eef+rUJSbhmLonPuB
 ITvKrID/dEEqyYAco9aQhu0bz1Ea8V+JHqdTj7or+FeY2T1U5tsWICrlax+c6z6tovCy
 8Rt/1LDQVD+FQnXrUMEHnHjrwb65fMUhhrrQC+CotfgcHT9W1eKuOLDC6qj5gJ6WX8zc
 Kegg==
X-Gm-Message-State: AOAM530rGrr8NohPnHKO+VDYOj7xm56o6XCl0C+nG6dkEytVn/n6Dox0
 7euwDTAbWtrIgSaq0lfvl0SKr6DGthzG3w==
X-Google-Smtp-Source: ABdhPJyqmsPNehvuTGqFejjnBy6huDW/+oV2XDg1FtSCYd4nDQOVw8CVa2i/yUxE9LhysN6O2SlPig==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr18589622wmh.107.1638571925807; 
 Fri, 03 Dec 2021 14:52:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id m7sm3736242wml.38.2021.12.03.14.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 14:52:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 23:52:08 +0100
Message-Id: <20211203225208.1927795-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gupnp: add GUPNP_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:gnome:gupnp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Agupnp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp/gupnp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index bbba9ecf32..7ee67d3382 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -10,6 +10,7 @@ GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPL-2.1+
 GUPNP_LICENSE_FILES = COPYING
+GUPNP_CPE_ID_VENDOR = gnome
 GUPNP_INSTALL_STAGING = YES
 GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
 GUPNP_CONF_OPTS = -Dexamples=false
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
