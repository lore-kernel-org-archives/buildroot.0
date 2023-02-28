Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3937C7EE30
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 22:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7083780F57;
	Tue, 28 Feb 2023 22:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7083780F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ax16J6vHEPsM; Tue, 28 Feb 2023 22:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A191580CF2;
	Tue, 28 Feb 2023 22:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A191580CF2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A73B1BF580
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 22:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00FAD80C2E
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 22:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00FAD80C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PmQTR0JTlva0 for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 22:07:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E93180C22
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E93180C22
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 22:07:49 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso10185686wmi.4
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 14:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677622068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1fff5PvBnaigOatYYT8U4I3Hb2MLaDWO/fq5G9S2QEs=;
 b=ZSeAjQf/mDnYPEnkITKObo8k/SJdzz92hvyvQvjwwGXjPhQz5fC0sofnpQkR1W2ber
 YGtw8DrVzNcWX2+zJLvg9neLC91Qq89Fmr3LuRjtDyQYcKlL3HDuVyRG8GOWs/wFkhhk
 GT/hWb/+kAZcshAxmFRUJdRpDaRnzw/r98nhWH8p91bnlkQBZiPLxqXEynymEn2v22q3
 PsiNgzOX9/qzxFi/1Jvx2dKa5rlTYldHcUjsAXh8W/B4p2qnPt9vEUP1bepziIpLYTv3
 Stcbib+ffp3Yfu0pqF8WYzw7aojctT45dlYRaXy2U9qTIbpZBjp/xzLvx2aLdSYogly+
 JJXQ==
X-Gm-Message-State: AO0yUKV8rp+i2Bc9H+5rZKf1Gdrh7fGw605Q3bEZMiQEPn6PQ+tYDlud
 9GpNo23TJ+Z5RVWZ/z4UoMxT188+Zmk=
X-Google-Smtp-Source: AK7set+6jZt5lpDpW8ZwjTeN4YezZ6FFDOxk2Bp3TMF+ou+NUzMkhTcnpklD3a3fEf8so3VPn+EQoQ==
X-Received: by 2002:a05:600c:997:b0:3eb:578d:ded3 with SMTP id
 w23-20020a05600c099700b003eb578dded3mr340608wmp.35.1677622067766; 
 Tue, 28 Feb 2023 14:07:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c20-20020a7bc854000000b003dd1bd66e0dsm13588380wml.3.2023.02.28.14.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:07:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 23:07:39 +0100
Message-Id: <20230228220741.54827-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677622068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1fff5PvBnaigOatYYT8U4I3Hb2MLaDWO/fq5G9S2QEs=;
 b=bJa+DXxSzPW2DtMgUcbSZLnKINwNLqLC8Pdfm6whE3yen4KJsrE0ujiZ56fJQuXzZ2
 Szv8BhEm4DJF/mgOK/e+iX2yl00WrlwpaHzPOHsuxW+qiXVtLS/EVBKfuy4kvSvNy/Bt
 kLYkpaweSazW2DbLj6HsI3Qj7yVHPjFFT3IYAof7t/O/LjDlm2dZySvQMeOTkr+ZqKxK
 mkFlkK7vyaRRPchzeOXW4OYXUw2Ae6BPlWmr3C/Q+47M6B44ZyS7sxVtQiFS1NXFmozh
 r+r6+QduuAAuc7LDhkf9oFYY7/Tj7B+0hQ8rO1GUD7VdvjDGPSXaW6DbE+mPxAIjXTHI
 05yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bJa+DXxS
Subject: [Buildroot] [PATCH 1/3] package/proftpd: add libidn2 optional
 dependency
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

libidn2 is an optional dependency which is enabled by default since
version 1.3.8 and
https://github.com/proftpd/proftpd/commit/5f61ac028e0930e7de9ea2a00864ccb6dc048f64

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/proftpd/proftpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 8e7d108c9e..d3b6308185 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -27,6 +27,10 @@ PROFTPD_CONF_OPTS = \
 	--with-gnu-ld \
 	--without-openssl-cmdline
 
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+PROFTPD_DEPENDENCIES += libidn2
+endif
+
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_CAP),y)
 PROFTPD_CONF_OPTS += --enable-cap
 PROFTPD_DEPENDENCIES += libcap
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
