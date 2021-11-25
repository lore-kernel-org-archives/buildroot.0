Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F28BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 07:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEEDE82553;
	Thu, 25 Nov 2021 07:12:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c2id43RzLH1u; Thu, 25 Nov 2021 07:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1653082410;
	Thu, 25 Nov 2021 07:12:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 105EB1BF36C
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 07:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDB5D4019B
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 07:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4MuyoD49GB9o for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 07:12:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C124D40018
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 07:12:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a9so9412634wrr.8
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 23:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xsCmpcQhTfDvfT8dq2+9RcslIkVHwY2sMGxsR+JBN94=;
 b=FW3+hThg63UirwBTzsfJ025EFUivYefPVE69yo1SpysKu2GSTWZr7XUv+aT6h2uYMG
 HARnccdVsYa5vySXwMaWCwJiU83puf/CpdU3hTblKVngUkK8y14pcGphxvS1kKUgwkxW
 TvnDw9EnlLidOLh1uxKu6m0AOfyXBbJ408ji95NOfdWsVrAOiNDEYeOheTI/uYcZu6kD
 Y3XfToeNeejlHoqvp4VRzBWvapmgU6Wi+JtV3BccpckBt5kkx9Ed3TDeRrXTpOljihMG
 +KOVYsARFxzZGXMn/65qkAgECRaExteGVJR98tAVEHj3XRGG294pe94YnjjbmLCH5UJk
 RubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xsCmpcQhTfDvfT8dq2+9RcslIkVHwY2sMGxsR+JBN94=;
 b=ww+3+STZLk0VMr3kyzCAaJa2ipmZgM1Js+5PxxessZvg5is/Z6sAwDnXu87ATFVdyL
 6E9iBgXLSh4psSZF88zQU0XfjOaC4Ap+DlB3WKHYGBCJDfM2INYZj81Cz9615HwAocKu
 8InapCM/9/5u6BqDoosFOx4L7MUeOFP8VKBGUbucfm8vgoJFv35msEDJpquu82RC+bfw
 OMOFOfmceDi4ci974f9ws0OYl61rK/0t91ZU7nG6AOuFRGYohahBGWTxQ3MHSdWrVfck
 jItvuCk33UhLefc2j8AWOoJs8gja5xPtXLEut2+40xnaEPT9rvYjdWrreQ5ajOgJepHU
 duVA==
X-Gm-Message-State: AOAM533xtpQUHyg7LR5UPX4B5k9sdZFxQBvVYiADo6PpHIiVC0aUD6xg
 YogOI6R7J3IOfacQxdUBYgQbOad4ry4=
X-Google-Smtp-Source: ABdhPJwWUNkE+DgjkBozFmpaASVlA25YpehZNdZe7bq+cvYVTjFQV855iraWFb2bvHTUBoBU8/Tf5g==
X-Received: by 2002:adf:fed0:: with SMTP id q16mr4365187wrs.276.1637824372627; 
 Wed, 24 Nov 2021 23:12:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id n184sm6538978wme.2.2021.11.24.23.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 23:12:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 08:10:23 +0100
Message-Id: <20211125071023.4163954-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: security bump to
 version 3.0.6
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support configurable limit on depth of JSON parsing (possible DoS issue)

https://github.com/SpiderLabs/ModSecurity/releases/tag/v3.0.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmodsecurity/libmodsecurity.hash | 4 ++--
 package/libmodsecurity/libmodsecurity.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index dff39569c1..341dbc3765 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.5/modsecurity-v3.0.5.tar.gz.sha256
-sha256  751bf95a7a8d39c440d0c26ec1f73961550ca2eb2ac9e2e7a56dce2dd7b959e9  modsecurity-v3.0.5.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.6/modsecurity-v3.0.6.tar.gz.sha256
+sha256  06315d9a32fc830997178f30a69e933c9c2364b263a2f036959bebc4dde59a08  modsecurity-v3.0.6.tar.gz
 # Localy calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index be46eb6e02..8fa3d59845 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.5
+LIBMODSECURITY_VERSION = 3.0.6
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
