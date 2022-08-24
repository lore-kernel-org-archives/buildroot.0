Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C48C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 19:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28F3C82CA5;
	Wed, 24 Aug 2022 19:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28F3C82CA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A6TDt71Di73J; Wed, 24 Aug 2022 19:26:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F03F82BD6;
	Wed, 24 Aug 2022 19:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F03F82BD6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 584CF1C116E
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A379417AD
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A379417AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y0EaUBRTIzSf for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 19:26:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BA6A4174A
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BA6A4174A
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 19:26:14 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id bh13so15876356pgb.4
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 12:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=I7qIoGIyTHv8gpGOP1HNsjvdc+PMVJoIlsfXuD38HQs=;
 b=G8rH/jvmdVgDg/GI2GlSAIiTU+c9VjX5gS1YFUEoyu9KpZX+kNP/PCgP+SrxOyjbkN
 z9Ao5VOGCOtktCHKS1fqndudmyCaLbO4p1LajLfPepVlkqrc7Ab8/2V+zUHBYn3LVST6
 TYD+YY696/Fmf6oOGjwFZ5Ed+zf65uyIZdZ6UoNNERJt471/8InPAf2Jq9cqk/7EVFrs
 IkGoG2tEuVXxjkHfwZoCxQimNEv9ryk0myTRPZ7iJqtsfJ5HdfUMAdj1DDzVpjNsxH8P
 76UeamByMX0Uny80dZDVDPIsKrETcMZl8GI6+sLw0vJ29QXj4wWVNZTRDrChDBXgnmBm
 ZxZQ==
X-Gm-Message-State: ACgBeo062Hw0tJnS9lTLOI6TSwdwO4bhoO/a0KmJI8dQIOqfzACVuiyU
 1W99IvoufiCFTWxXJ6luiOJlLDn6Yrg7iAwondw=
X-Google-Smtp-Source: AA6agR4khBAjDYsT33hqq0BUmF159YVjhNQyLgqpEKd8afcxs5rjpMe8bzUleGIm/AKf7NAYgj8dfA==
X-Received: by 2002:a05:6a00:1828:b0:537:b99:ce88 with SMTP id
 y40-20020a056a00182800b005370b99ce88mr623777pfa.81.1661369173576; 
 Wed, 24 Aug 2022 12:26:13 -0700 (PDT)
Received: from chris-jammy.hollywoodparkca.com
 (2603-8000-3f01-0100-893e-b127-a8ca-bcb9.res6.spectrum.com.
 [2603:8000:3f01:100:893e:b127:a8ca:bcb9])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a17090a1b0100b001fb4a8d82a7sm1741338pjq.56.2022.08.24.12.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 12:26:13 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 12:25:52 -0700
Message-Id: <20220824192604.2549356-2-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
References: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=I7qIoGIyTHv8gpGOP1HNsjvdc+PMVJoIlsfXuD38HQs=;
 b=HtvQGukIeTnIpPv3+pTD+SV+s7malBi29+rpinlkJdBiu2KkShra0SkeAMbznUqfjJ
 eLhtlR8/EYo69le8StibLMXh7JxGr2QHP9zb2wSH4hmw22X0CjjHd3+R8MHdeCrK7NJe
 MnhTrUKyVA2WW1aUn+lS0NUHNsYFj1ut8DgnM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=HtvQGukI
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
