Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BAFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 20:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF88D404F1;
	Sat, 23 Apr 2022 20:41:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PsxjBl_BlLHn; Sat, 23 Apr 2022 20:41:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D37D2403D6;
	Sat, 23 Apr 2022 20:41:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16FD71BF59E
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 20:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13DE660B4A
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 20:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wFm9ltaRo7JR for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 20:41:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04D1160AB9
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 20:41:37 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so7290952wmn.1
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 13:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cp1GY9iyi15Zvf+ZlnZ9RvkpKcSJxNsDSkJAd19ZupI=;
 b=ZojWL1r+fa6J6XkzGMuYboFbLKEqD2LSnySxFy3q+TI9SoCKJCiOITLTAmarUtLaNh
 5V3sk0NoUt/ev9xVH7sPjt8fGn9+PkhvVi3jhVAjMLca4QzhgGipgJl8Z/PUHj+Ezn4g
 SMT1GgtgtFKGo1btdSBifzJiVF/qfbW6xjYAJrWoNO15+7Jmc1gVCnvI3zFgnm8+T2Cz
 qfT5Br/FuyZOfgyJnF9f62TM/3DcM41xMyzuN/a5Vz+JPbdGh0KfgSTIq4TaVAhEQIAy
 WVOxRksrVbAP9YlVvh0fUdGOp6EhjPsC64GmuUtEBWmOQKCTw6e/LD4l4GPQjhj8rDhr
 JjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cp1GY9iyi15Zvf+ZlnZ9RvkpKcSJxNsDSkJAd19ZupI=;
 b=RRuLHk1ROUj/mIXJ3cU1czJvH0+hJJM5rogKPANo/dD35zdtamga05i8kI3rxqKq6i
 eTXJU2FxiumK4Bl++Q0BWbrWYeKTUMLeeDhGuSD6uI4RBUBuVkPcDnG9N8Z/iCqO1sTP
 2/YHYUuSmZ5E5YGSGOJn5MSJ3cuV21YAQF2mt4sVc1moTG8HH2jbxtb7ZPxzJOyYoXaT
 67TCQprRkOCWg9Y7JHt+3NClpxLl1VIOZO+kUdzEo1ygLDCtkOA0pt3DSkFPg7H0B4yb
 apMGimuq6nUdZIHo1Ho1svPgjLrHoTnXxPJfnHaZ6uMjZaBc/oJpL9NwVE2XwAeMJO6h
 WZJg==
X-Gm-Message-State: AOAM533CpGlwEOItxnRZO0280vOrc0i74v3B+U2D++IavpL/jfv5HAmD
 wve8hFy5KW1ikNqFxTpZ4rGjlVXFsn0=
X-Google-Smtp-Source: ABdhPJxNLJ1b2yGXHGpONZTtnX2FUKps6/UtFf3Hhqk813aE1k1wf0ZC6VvFeslmbS8hfMI/KRN63Q==
X-Received: by 2002:a7b:ce99:0:b0:38e:b72a:382c with SMTP id
 q25-20020a7bce99000000b0038eb72a382cmr19210429wmj.128.1650746496003; 
 Sat, 23 Apr 2022 13:41:36 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1c7909000000b0038eb8171fa5sm4782312wme.1.2022.04.23.13.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 13:41:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 22:39:22 +0200
Message-Id: <20220423203924.1796541-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423203924.1796541-1-fontaine.fabrice@gmail.com>
References: <20220423203924.1796541-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 2/4] package/clamav: doesn't build with zlib-ng
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

clamav doesn't build with zlib-ng since bump to version 1.9.9-b1 in
commit 1f7b12a0b4572d7e763c431a63c22cfb912b8b14 and the removal of FAR:
https://github.com/zlib-ng/zlib-ng/commit/0db1040667b13c0f9405af810f669857a487b08e:

In file included from nsis/nsis_zlib.h:32,
                 from nsis/nulsft.c:38:
nsis/nsis_zutil.h:36:17: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'uchf'
   36 | typedef uch FAR uchf;
      |                 ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/524ee31face8be6a813829b036c4d6134ee5ca98

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Force libzlib instead of depending on it to avoid a recursive
   dependency

 package/clamav/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index 990a818b5c..2857f9cbf4 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_CLAMAV
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
 	help
 	  ClamAV is an open source antivirus engine for detecting
 	  trojans, viruses, malware & other malicious threats.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
