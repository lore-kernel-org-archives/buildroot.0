Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8791C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 07:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15682408E0;
	Wed, 10 Aug 2022 07:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15682408E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QuNY84Si8vj0; Wed, 10 Aug 2022 07:46:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DEFD408CB;
	Wed, 10 Aug 2022 07:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DEFD408CB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11AB61BF44A
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 07:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E025760DE5
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 07:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E025760DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obeHzuZTFdgT for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 07:46:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D50E260D66
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D50E260D66
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 07:45:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so1349208wmq.0
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 00:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Xr5w5MEScX/XylSmuP03eAFCpNAxyOcwsp4mBQJarEs=;
 b=N6WLVXRBkuQCpRhxq8Fle1AOlTChmIrNIoBaYnN+fa8eJIJ7Qa6VqkixNrJ9LTFYm0
 ROai2dULyg3onu+qzVkKuRw6HkIKjwwUa3ormcCiPfps2oq+qtvq+5XOqdBI0Pywzx5K
 O4PSJC8fIlq14XzC80rIYxqaW7V5I9ZvbF0x6cS7XzFxGxekzReMlAfB8MZ06Lo9P3+p
 f+3zvIFe3lg0F3c1upwtURuKNJ3C9KenFOd/COsA9de49Jj72ajlNwBusBLhK4jpwjDd
 9YTao2PuUBo2tccXlz60HP4GTocB1KFViiLPKqROWiwuNrYeK58jzcMcV3qctTzsHtfU
 f+iQ==
X-Gm-Message-State: ACgBeo3r7TX/nNFVoNP+ejU+cXdF5wMr0aM2XYmnssXLw8oqqzruDlbM
 6khf3T6iGBsMylJoGg6q4w+pKl0H0NQ=
X-Google-Smtp-Source: AA6agR6TZ+642lbKNv3U4CBKvrdLhGLGVL1OMXCys3jp73xQWQHsoLz3IUn0xwI1MufjWBsGVIxj2A==
X-Received: by 2002:a05:600c:1f08:b0:3a3:1b00:c201 with SMTP id
 bd8-20020a05600c1f0800b003a31b00c201mr1434648wmb.171.1660117557666; 
 Wed, 10 Aug 2022 00:45:57 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b00220606afdf4sm15739058wro.43.2022.08.10.00.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 00:45:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 09:45:47 +0200
Message-Id: <20220810074547.2833007-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Xr5w5MEScX/XylSmuP03eAFCpNAxyOcwsp4mBQJarEs=;
 b=HQSQ/Vf/jLyRPb3uI4G6GK/TZgBjL13rbFasXN4InNjeldkvsInLoq+DEGQgoT8iPK
 SUzzceU+3sDXvbeFLRpd81BgtUxM7YYAY12UhOf3KGcjJSaPRolqgKOMtAU/2nFqQmaj
 tI2mbRQSffET5GwB50jRR8JuyMVsG0653Qgzt47GeaH3QSCK7et7qP+TCVDK1PY6ig5d
 dB9MqoeCT6IgOJCO7GqJsOtymid0pQNwwpf24wS2Mr2Mtlfs0iF+as6paadaTGlKPvIf
 a/GzOshrDZMVxfTDVI5rLUJYqULZuXM1IDKSaS5NSNRu4wowk/fY2uv9vUeGD5uA0dyk
 jdvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HQSQ/Vf/
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: improve ARM trusted
 firmware fixup
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

Improve commit 541e794a959914d1189570c3674908eb5db08ce8 by adding a
custom case to make sure that a random configuration with an empty
platform for arm-trusted-firmware doesn't fail:

make_helpers/plat_helpers.mk:15: *** "Error: Unknown platform. Please use PLAT=<platform name> to specify the platform".  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/1b67220008223d1bcbe70b76d643f9d04362ba6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/genrandconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index a00ff8ee8b..54eae42063 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -428,6 +428,10 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n')
         configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n')
 
+    if 'BR2_TARGET_ARM_TRUSTED_FIRMWARE=y\n' in configlines and \
+       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=""\n' in configlines:
+        return False;
+
     if 'BR2_TARGET_ARM_TRUSTED_FIRMWARE=y\n' in configlines and \
        'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y\n' in configlines and \
        'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=""\n' in configlines:
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
