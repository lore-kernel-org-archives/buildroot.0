Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024A5C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A16F381771;
	Sun, 13 Feb 2022 15:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gRbSzszfUnCO; Sun, 13 Feb 2022 15:52:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E049181768;
	Sun, 13 Feb 2022 15:52:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04D3D1BF95F
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8A0581768
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0FvXv6s6Nx85 for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:52:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 303468175B
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:52:14 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id j15so3054163lfe.11
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YHGvimSx3xAocwjl1ALclvRh0quEDSfUzeANRhOXNqQ=;
 b=Pjyv1r/j93liCPNBry715CnP2OMVEbbeOCUG9p1U/tGEy8eVJjIJjl60Kwqr9w9XJ8
 exg9KJyqs6s07aNjL6JY3jCJHfR1xGlYBYqSrMPwtkdqlX7BIFgnrY7YxyI8UEFs0APF
 gXK4lEKeE7P1TYAsIqXgWH1W7wxhUybt6BKitQvvP5E8TKyWp/paFlQX2sKegibLe4Gy
 FUhB3MJm0riL+yqksm9164hfAQcrrEs67dwkkAHNUEgFC5P6yE5+CYat9NwrgBiciAzN
 KA6J+yh+w+dYnLBaYtoI73VSlMuLWOmBeMkOl/rJq/7azpLORt24waz6Vs1TImY3pL7l
 AoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YHGvimSx3xAocwjl1ALclvRh0quEDSfUzeANRhOXNqQ=;
 b=Wuthu+j1YI8swgVr9ZcWrfphediMU/s10aUi5tWq+fqTTj6d97zaLFlfb8sHqALe/h
 ZEttUKfd+tbG3agdy8//f2dNusbsD/CHv6ux48Mr1xAOXCimXcBd6kVIHYGS7xp7tGV8
 7/YrYLhOBaJWj/BRN9NtiXVj/CIi+UvrLFh4LUIWqlDCelqK6VqfbCnFo+R0wk8igAB7
 57L3Reju4LSpJX0e5pkw6RDmmFm0FPE6k9OsCPUs0DhTj16xH2AmMEQhXeExSyo9NvKu
 bVPd7yA+uBIuYHuJWYE8RLq2VvaFuBeMzrYXr3hQaQxwuTjPwwJMTCXxJFodGs5DOA1Q
 oRZw==
X-Gm-Message-State: AOAM530Ltz5UuicHVRGSR/Xq0AKqv7xTFu0N+ZwiwTQXxDJmCNzHAmwO
 fOE2HUo5KbWWQT8ZAfiB5APiscsLa5Y=
X-Google-Smtp-Source: ABdhPJzqoBjFLtIfmJqphQ8Ny4Z2dRfFL2eDZ2IzG3yx0pQKzsNM/0UWN7A4MPmoUiuidzvRrePnkg==
X-Received: by 2002:a05:6512:3b0c:: with SMTP id
 f12mr2268078lfv.233.1644767532022; 
 Sun, 13 Feb 2022 07:52:12 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id k18sm1935723lfg.217.2022.02.13.07.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 07:52:11 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 18:52:08 +0300
Message-Id: <20220213155208.560001-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220213155208.560001-1-geomatsi@gmail.com>
References: <20220213155208.560001-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/wpa_supplicant: fix mesh
 configuration build
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
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Consider the following wpa_supplicant configuration:

BR2_PACKAGE_WPA_SUPPLICANT=y
BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=y
BR2_PACKAGE_WPA_SUPPLICANT_EAP=y

This configuration fails to build with the following error:

/path/to/output/build/wpa_supplicant-2.10/build/wpa_supplicant/src/common/sae.o: in function `hkdf_expand':
sae.c:(.text+0x3c8): undefined reference to `hmac_sha384_kdf'
collect2: error: ld returned 1 exit status
make[1]: *** [Makefile:1894: wpa_supplicant] Error 1

Looking into wpa_supplicant Makefile:
- CONFIG_MESH for some reason needs SAE, so it enables CONFIG_SAE
- CONFIG_SAE enables only HMAC_SHA256_KDF

This is apparently not enough. At least HMAC_SHA384_KDF is required
for successful build. This commit adds a minimal patch for
wpa_supplicant that fixes specified build configuration.

Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .../0001-mesh-enable-HMAC_SHA384_KDF.patch    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/wpa_supplicant/0001-mesh-enable-HMAC_SHA384_KDF.patch

diff --git a/package/wpa_supplicant/0001-mesh-enable-HMAC_SHA384_KDF.patch b/package/wpa_supplicant/0001-mesh-enable-HMAC_SHA384_KDF.patch
new file mode 100644
index 0000000000..d765c1dbbc
--- /dev/null
+++ b/package/wpa_supplicant/0001-mesh-enable-HMAC_SHA384_KDF.patch
@@ -0,0 +1,30 @@
+From 08986b7da7e580f5deb570aaa654df38fb23397a Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Sun, 13 Feb 2022 18:26:23 +0300
+Subject: [PATCH] mesh: enable HMAC_SHA384_KDF
+
+Mesh support CONFIG_MESH needs SAE, so it enables CONFIG_SAE.
+In its turn, CONFIG_SAE enables only HMAC_SHA256_KDF option.
+This is apparently not enough for successful build. At least
+HMAC_SHA384_KDF is required for successful build.
+
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ wpa_supplicant/Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
+index cb66defac..c8e53a3c9 100644
+--- a/wpa_supplicant/Makefile
++++ b/wpa_supplicant/Makefile
+@@ -246,6 +246,7 @@ endif
+ ifdef CONFIG_MESH
+ NEED_80211_COMMON=y
+ NEED_AES_SIV=y
++NEED_HMAC_SHA384_KDF=y
+ CONFIG_SAE=y
+ CONFIG_AP=y
+ CFLAGS += -DCONFIG_MESH
+-- 
+2.35.0
+
-- 
2.35.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
