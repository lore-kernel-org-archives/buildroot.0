Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5670BC00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 19:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDE2160FF7;
	Wed, 24 Aug 2022 19:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDE2160FF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h1YspVc0I6Jt; Wed, 24 Aug 2022 19:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE75F60FE8;
	Wed, 24 Aug 2022 19:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE75F60FE8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A81CE1BF307
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9038782BD6
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9038782BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v--pwNTjqz31 for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 19:26:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04C6181B52
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04C6181B52
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 19:26:25 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 12so15876513pga.1
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 12:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=I7qIoGIyTHv8gpGOP1HNsjvdc+PMVJoIlsfXuD38HQs=;
 b=Cb872O9iR3L9n7MQXIwREUgKYocNoupjS2rDLWcII90/NZSHlS6D0Gl2pLRoEciaKo
 TeZD6hHU4WPLPQcbPXVnjsx9x7v6DUPZY/Z0Ei/1YciTpPMyRXihwlEfx54zbazcXVuJ
 rX9J0hgDtuZ+Ee7iXXHDiIEw3J9GsXGZbY5QSQaSX0WJ23/KKGjxoFAx5FxCEOFn+L/a
 Fxu2cxyH8prdyTtEsbnIptYm2MtDJfxNjq8IoyzavhONYWBaZocLlOCHIhcwx+p6oHw7
 x1zTAsScpZDUUzDuMqiirI9GAYq/Cwjz5THuZB6CrQEyS2stCiufTsyvGJRalSF+xTgh
 iKcg==
X-Gm-Message-State: ACgBeo3VyOuGxg+uY/0oj5nDJhVFlPKPHwZ52CvMMT+AjCVChxH2IFTc
 X1+q87cB1CqzqeERZxH0xGmp5HqmiGN9Q85Ld+Q=
X-Google-Smtp-Source: AA6agR4Zq+lR6PkOAMF6oPJ+fF0VlzIhYqwRMfZpmRpn3fnbxXuyA7wcpZh2IeOZMowwxiqIu7Z13g==
X-Received: by 2002:a65:6216:0:b0:41d:8248:3d05 with SMTP id
 d22-20020a656216000000b0041d82483d05mr374610pgv.36.1661369185218; 
 Wed, 24 Aug 2022 12:26:25 -0700 (PDT)
Received: from chris-jammy.hollywoodparkca.com
 (2603-8000-3f01-0100-893e-b127-a8ca-bcb9.res6.spectrum.com.
 [2603:8000:3f01:100:893e:b127:a8ca:bcb9])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a17090a1b0100b001fb4a8d82a7sm1741338pjq.56.2022.08.24.12.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 12:26:24 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 12:25:59 -0700
Message-Id: <20220824192604.2549356-9-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
References: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=I7qIoGIyTHv8gpGOP1HNsjvdc+PMVJoIlsfXuD38HQs=;
 b=F8yhCoM9pMpPt+Ubq8CGa4qPx5TEk6jYCFAjgGm7fnxrMLThRkQqR76i45RqZIpbu0
 zrbO+lyzXaZkEY8BhpEitAdkKAeVtYUExHI2cdNzmDWL+Nsd+WlNqdAmq6m56U+Z8SF4
 y9SKcr9HNfInTYHLjBC8y/9m5PvJDs2OvbnL8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=F8yhCoM9
Subject: [Buildroot] [PATCH 2/7] package/weston: add
 BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL config
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the case of the vivante sdk, the deprecated-wl-shell option needs to
be enabled. Otherwise, apps using the sdk cannot run on weston/wayland.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 package/weston/Config.in | 7 +++++++
 package/weston/weston.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 3b4e932b7d..c560c32b50 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -164,4 +164,11 @@ comment "demo clients needs an OpenGL ES provider, an OpenEGL-capable Wayland ba
 		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGLES || \
 		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
+config BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL
+	bool "deprecated wl shell"
+	help
+	  In the case of the vivante sdk, the deprecated-wl-shell option
+	  needs to be enabled. Otherwise, apps using the sdk cannot
+	  run on weston/wayland.
+
 endif
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index e6c54ee7aa..ad4d81425e 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -186,4 +186,8 @@ else
 WESTON_CONF_OPTS += -Ddemo-clients=false
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL),y)
+WESTON_CONF_OPTS += -Ddeprecated-wl-shell=true
+endif
+
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
