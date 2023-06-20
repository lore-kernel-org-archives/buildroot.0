Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D29EB64D7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jun 2023 17:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4FC640901;
	Tue, 20 Jun 2023 17:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4FC640901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JEYcvzfFd5Fd; Tue, 20 Jun 2023 17:38:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 215C241768;
	Tue, 20 Jun 2023 17:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 215C241768
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D722A1BF83B
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 17:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B03DC82314
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 17:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B03DC82314
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGGXgQ1hM6pr for <buildroot@lists.busybox.net>;
 Tue, 20 Jun 2023 17:38:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0515D82312
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0515D82312
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 17:38:18 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-56ff9cc91b4so56638997b3.0
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 10:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687282697; x=1689874697;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MRwyGUlA7E5yfH/hdG19JBebdZncrnhz07lyfT/Wch4=;
 b=XQ+BpppnueBqMD+k9yUZ7FVxuaioXNlJMCY38dpJPjgEVqEgZ1Bwge1a6zGLV4jvmc
 +2Rj+3eTRT21WdtFurYV/D+lYejvOszykZm4dCHSDzZ/netgcefUY4N3XXMfxBdQLgO7
 UWghdzI8cEK+wXi+g1JwMNWeaEaxIaXCmTSUcyekRD6ZjL8r3cXZ4lqnViCzNuEAnWv9
 t6dq19s8jhTWKQySc4kiYpDkEAc5uNQG8Y3WaTU2beAd6reKvzXczTmwr6Ewo2yZ2cdA
 NiRv3sfhatnkrM9Cf/deTdtUSnvQ8RmQIMbnetRG1gWUyLSnIvgFmMk991N4XnE7hQFB
 AQEg==
X-Gm-Message-State: AC+VfDwYr75XEHbBB5ghtq3czV32FJW6LtroAcdMBVxfgVMvCUitH84M
 VCvlPnl23HUD7dnN+WEBTKFH304eORw=
X-Google-Smtp-Source: ACHHUZ728F8QuWFs7ODk9c7qfFwc8LnDX7g2m5j02lSUMa0ngUoos6VdCoG5+Q3+oaWloWc57a/b7Q==
X-Received: by 2002:a81:6887:0:b0:565:cf47:7331 with SMTP id
 d129-20020a816887000000b00565cf477331mr15321932ywc.2.1687282697503; 
 Tue, 20 Jun 2023 10:38:17 -0700 (PDT)
Received: from CP-WR7J591QQC.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 m125-20020a817183000000b0056d4c86b639sm609213ywc.9.2023.06.20.10.38.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Jun 2023 10:38:16 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jun 2023 10:38:12 -0700
Message-Id: <20230620173813.4590-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687282697; x=1689874697;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MRwyGUlA7E5yfH/hdG19JBebdZncrnhz07lyfT/Wch4=;
 b=cXxDHGDDCw/4dm++Nn/UPWb4h3gtb1LRDqrathUpAM6pg1Z7XSZMGEn+Y89Mvm4qyR
 l4+/XRgfCJ5P0y3vkVb92WAPdr7jK0KQVfFS3csSwFgzEsWLfTddkLoyUYmLfa53CFGp
 bLrxxWQaWTf7m737fdQ2SYDM793qwUTrYR3UQuSrIdjcV0+/m801vwxi8eb4gqC+QlXv
 IMhl3J6kBXE0k3u/AhLsEtg6BVVIS++hM5WhGqdlPFhGXYhzpaGZgVmvWgau9+hS+gxa
 BfmTRETF1w5yXUOMELUislsr7Kr8nZkHJc29RvqVlvlgE1htFSpzyiqHwJQmyo2FC5fc
 ytAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=cXxDHGDD
Subject: [Buildroot] [PATCH 1/2] package/alsa-plugins: fix dependencies for
 the alsa plugin package
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The alsa-utils will remove and create the /usr/share/alsa dir
as a whole and since the alsa plugins needs to add config into
this same directory it should come after those install steps.

Also, the bluez alsa needs the plugins installed to find them
during the configuration phases - so, interlock the plugins
when configured.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/alsa-plugins/alsa-plugins.mk | 4 ++++
 package/bluez-alsa/bluez-alsa.mk     | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/alsa-plugins/alsa-plugins.mk b/package/alsa-plugins/alsa-plugins.mk
index 5728ebfe37..d23a81c5ee 100644
--- a/package/alsa-plugins/alsa-plugins.mk
+++ b/package/alsa-plugins/alsa-plugins.mk
@@ -20,6 +20,10 @@ ALSA_PLUGINS_CONF_OPTS = \
 	--disable-maemo-resource-manager \
 	--with-speex=no
 
+ifeq ($(BR2_PACKAGE_ALSA_UTILS),y)
+ALSA_PLUGINS_DEPENDENCIES += alsa-utils
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
 ALSA_PLUGINS_CONF_OPTS += --enable-samplerate
 ALSA_PLUGINS_DEPENDENCIES += libsamplerate
diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index 83dfce6177..649810b0ad 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -20,6 +20,10 @@ BLUEZ_ALSA_CONF_OPTS = \
 	--with-alsaplugindir=/usr/lib/alsa-lib \
 	--with-alsaconfdir=/etc/alsa/conf.d
 
+ifeq ($(BR2_PACKAGE_ALSA_PLUGINS),y)
+BLUEZ_ALSA_DEPENDENCIES += alsa-plugins
+endif
+
 ifeq ($(BR2_PACKAGE_FDK_AAC),y)
 BLUEZ_ALSA_DEPENDENCIES += fdk-aac
 BLUEZ_ALSA_CONF_OPTS += --enable-aac
-- 
2.39.2 (Apple Git-143)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
