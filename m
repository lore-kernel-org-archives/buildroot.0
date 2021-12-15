Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3024BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 22:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D563982443;
	Wed, 15 Dec 2021 22:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIdw_PB4rG0n; Wed, 15 Dec 2021 22:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35B3B823F6;
	Wed, 15 Dec 2021 22:12:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 959101BF44A
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 22:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B3BA4027C
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 22:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZZMmnH8e7aq for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 22:12:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E2E440164
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 22:12:02 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id i12so17671806wmq.4
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 14:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eq3wEqX1Qfl5orvWFNYFKsPA5Ag5ri89pcdRVY6MCSc=;
 b=EWFWA2fzSARLAMqXb5+K89ZS+6G1CART4BqLq6kfjuVIHV3ndb/OmtC9oqAux4ytJ/
 N7IK3Tbn45mFkx9hssml7PE3K/+iqWwmDqkGtJpPmYPjWTVG++PkjX4G/NGEd236qJIM
 8tnmjF/p+g6eRPz5psX56MLl3ng08q/Vz4rw22FgDEQu3Jl4Chn9lyi265agqGTdChCJ
 iWs5Xn4lRuBkFRPCur7L5dcE+fgayArSBHixjAYMpHlmgTgexxjVJIAAw4cULDKdzf3w
 r9HP5baOciv5ya2QXpTDA21o3BAIlhGvYcIu3AZNleHXURoQ42l+MGQQ40dxgyQlkNMr
 0XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eq3wEqX1Qfl5orvWFNYFKsPA5Ag5ri89pcdRVY6MCSc=;
 b=XuorZ0BekDJFJzB+hJZg+PHaqLsiCHw5WvaLwrW4NPnTjStrWJ1Hl/tsD/Wy9CcAnb
 9qJhiebovGI4yMshaLTllS5Xs8i5HinK/KJ9Oat1EcciAknu8LFbNzC1w3DXhRJpFiPx
 HOQdu6Ews2NsxZp9jvEr032CBcXIYOEoogbJGdnp9PSLL/V+IrmlYAUBZ2gTyOh+u5KF
 wRBg+K/z6Ug1TSYRqsikRp6fHzTfBPOqLmhmyK6aOOwTfsRc3Vzb/XXXogmzQHCCtEV0
 vywx+nCZGvaQBAbP7yJ2ZFwTh5xRSppoDTN7yN0rpubiDHGCiVvoW6v6BeDshK1emQqx
 uWYA==
X-Gm-Message-State: AOAM5314ISDCx4LEfOLRcGoYJR6meBoOFXnunSs8z/lRWMrT+Smpuesp
 jyalpccwwrleaEzcxhf9z2dEjE54x9JkQA==
X-Google-Smtp-Source: ABdhPJxm63RE0oY9OYW9uKf3sJ12sFCYwIPaR2e87RQyVnnfPQEisOM9JpN1/oTy/mliaLFPkrWTZQ==
X-Received: by 2002:a1c:104:: with SMTP id 4mr2084704wmb.31.1639606320711;
 Wed, 15 Dec 2021 14:12:00 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id f1sm3315408wrh.116.2021.12.15.14.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 14:12:00 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 23:11:53 +0100
Message-Id: <20211215221153.6799-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211215221153.6799-1-petr.vorel@gmail.com>
References: <20211215221153.6799-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/iputils: don't build legacy tools
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ninfod, rarpd, rdisc are legacy tools which are going to be removed from
upstream in next release [1], following previous removals [2].
Remove them now from Buildroot.

[1] https://github.com/iputils/iputils/pull/388
[2] https://github.com/iputils/iputils/issues/363

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* move options to Config.in.legacy (Fabrice)

 Config.in.legacy           | 20 ++++++++++++++++++++
 package/iputils/Config.in  | 23 -----------------------
 package/iputils/iputils.mk | 10 ++++------
 3 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3f5ad9132e..38c8afd4a8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -4395,6 +4395,26 @@ config BR2_TARGET_UBOOT_NETWORK
 	help
 	  U-Boot's custom network settings options have been removed.
 
+config BR2_PACKAGE_IPUTILS_NINFOD
+	select BR2_LEGACY
+	bool "ninfod"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # ninfod requires <pthread.h>
+	help
+	  ninfod has been removed from upstream.
+
+config BR2_PACKAGE_IPUTILS_RDISC
+	bool "rdisc"
+	select BR2_LEGACY
+	help
+	  rdisc has been removed from upstream.
+
+config BR2_PACKAGE_IPUTILS_RDISC_SERVER
+	bool "rdisc (server code)"
+	select BR2_LEGACY
+	depends on BR2_PACKAGE_IPUTILS_RDISC
+	help
+	  rdisc has been removed from upstream.
+
 config BR2_PACKAGE_IPUTILS_TFTPD
 	bool "tftpd"
 	select BR2_LEGACY
diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index 1a8b555570..97870d1745 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -33,33 +33,10 @@ config BR2_PACKAGE_IPUTILS_RARPD
 	help
 	  Installs rarpd.
 
-config BR2_PACKAGE_IPUTILS_RDISC
-	bool "rdisc"
-	default y
-	help
-	  Installs rdisc.
-
-config BR2_PACKAGE_IPUTILS_RDISC_SERVER
-	bool "rdisc (server code)"
-	default y
-	depends on BR2_PACKAGE_IPUTILS_RDISC
-	help
-	  Builds rdisc with server code.
-
 config BR2_PACKAGE_IPUTILS_TRACEPATH
 	bool "tracepath"
 	default y
 	help
 	  Installs tracepath.
 
-config BR2_PACKAGE_IPUTILS_NINFOD
-	bool "ninfod"
-	default y
-	depends on BR2_TOOLCHAIN_HAS_THREADS # ninfod requires <pthread.h>
-	help
-	  Installs ninfod.
-
-comment "ninfod needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
 endif
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 84059de330..6420720eff 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -21,19 +21,17 @@ IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 # Selectively build binaries
 IPUTILS_CONF_OPTS += \
 	-DBUILD_CLOCKDIFF=$(if $(BR2_PACKAGE_IPUTILS_CLOCKDIFF),true,false) \
-	-DBUILD_RARPD=$(if $(BR2_PACKAGE_IPUTILS_RARPD),true,false) \
-	-DBUILD_RDISC=$(if $(BR2_PACKAGE_IPUTILS_RDISC),true,false) \
-	-DENABLE_RDISC_SERVER=$(if $(BR2_PACKAGE_IPUTILS_RDISC_SERVER),true,false) \
+	-DBUILD_NINFOD=false \
+	-DBUILD_RARPD=false \
+	-DBUILD_RDISC=false \
 	-DBUILD_TRACEPATH=$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),true,false) \
-	-DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false) \
 	-DSKIP_TESTS=true
 
 # Selectively select the appropriate SELinux refpolicy modules
 IPUTILS_SELINUX_MODULES = \
 	$(if $(BR2_PACKAGE_IPUTILS_ARPING),netutils) \
 	$(if $(BR2_PACKAGE_IPUTILS_PING),netutils) \
-	$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),netutils) \
-	$(if $(BR2_PACKAGE_IPUTILS_RDISC),rdisc)
+	$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),netutils)
 
 #
 # arping
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
