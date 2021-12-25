Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16018C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 18:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CCC560C1F;
	Sat, 25 Dec 2021 18:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJyziWd0d_Q3; Sat, 25 Dec 2021 18:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A06060C1B;
	Sat, 25 Dec 2021 18:43:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E8391BF313
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 18:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C7AE60C1B
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 18:43:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1P5hRaOXMZ4u for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 18:43:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F2F3605A9
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 18:43:30 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d9so23613664wrb.0
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 10:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X2r+02e0SOan82VvpNwKHOgxcBLAys3YLSApM2xyLb8=;
 b=mSMeuQmTtXRajFqQjtthuIm54ycc8xQgh3jgD9e3c9yuHK5fosN8Pt9xP3UUmvLSIQ
 mOCxcs56IB8eumsFvJYL/ziWHH/RgTJkPSawMclJFkxSdkF2QJPfISKDwxXQHRIjnUJ+
 onWRepmriddGV0BFdSo29oDhcJ/bvqsA2weAxkv6+ZXA1GZtlZWVAR1XenIuvFWs0aQ1
 Ghn5nmOMnTMmL0hq7C/MuXuLBjG+62MJPLK7yt4byjEUdD5uGVmMyqKtfAEkbPtSGVZ1
 GAEGqif9h3/otGyctoK7H3r97uzLp3rsFfeEzUcvYkNQUE2AZ+1O7Qxv4zlP0Mopwc5Q
 oLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X2r+02e0SOan82VvpNwKHOgxcBLAys3YLSApM2xyLb8=;
 b=Yr2rSvgeFPTsfUPWpyw4fWOl4n7s1UhwXXu7ex/aeC7qyAk84a/DrlBzIdQH3Xsh1y
 FQqO6noee7wtZY54tvtEpf/7V4Lpf8Mr5rMlpw5/BRED9fAfa5YNGk7Drvq4OVJkRUU6
 AboaUTeWlz0RsaX7XKHYRjmJanFKErkTIqv8Tm8B6ty7FPjTqFBNjfCSwepEWn3It72f
 0MDIgvL/wnqICJH86KSPimMZfyBnH+5gre8O6JIzT+Iqta1mr/dW8GvG3TyR5m/cj6/g
 yvtSn8nWQesSgFVPWh/G3eyVIqkoEO5obg/cD63WHWPdSgL0rYrEU8qRKB3YmjveZKcO
 0wZg==
X-Gm-Message-State: AOAM532AoeNoEn0LtSoRXkkPZeCHglZu7V9JqCd0mFFfm4air4wXXtHR
 dpzfiJH6AdwFadUyAhSbGNZazO8LJFMtUA==
X-Google-Smtp-Source: ABdhPJxRVkVz5boXeO24h/n8m7kkOupQlF8dcZw7KFafr8b+wdauPr7i6sA9jLoO9tC2+8SU/2S+Ww==
X-Received: by 2002:a5d:6842:: with SMTP id o2mr3628896wrw.615.1640457808633; 
 Sat, 25 Dec 2021 10:43:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id m12sm11656491wrp.49.2021.12.25.10.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 10:43:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Dec 2021 19:42:50 +0100
Message-Id: <20211225184250.189902-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gupnp-dlna: gstreamer backend needs
 dynamic library
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gstreamer backend needs dynamic library to avoid the following build
failure raised since bump to version 0.12.0 in commit
68c8c37d7d15a11d91b699f15dbaa00adcd4773e:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
__uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'

Fixes:
 - http://autobuild.buildroot.org/results/3b580c8d9cb136455c710549909bb78c8b38b9c1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp-dlna/gupnp-dlna.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
index 4f75c9b527..64146f894b 100644
--- a/package/gupnp-dlna/gupnp-dlna.mk
+++ b/package/gupnp-dlna/gupnp-dlna.mk
@@ -22,7 +22,7 @@ else
 GUPNP_DLNA_CONF_OPTS += -Dintrospection=false -Dvapi=false
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE):$(BR2_STATIC_LIBS),y:)
 GUPNP_DLNA_CONF_OPTS += -Dgstreamer_backend=enabled
 GUPNP_DLNA_DEPENDENCIES += gstreamer1 gst1-plugins-base
 else
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
