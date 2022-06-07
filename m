Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5DEC43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 15:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE46A40B30;
	Tue,  7 Jun 2022 15:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E5u57HCQ8BHs; Tue,  7 Jun 2022 15:17:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DDA040AE6;
	Tue,  7 Jun 2022 15:17:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13AE91BF39F
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0243760C28
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJuucW_DzXzr for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 15:17:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B85B607B5
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 15:17:28 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id u12so35894203eja.8
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4IXBKXDSSFEuVlJRXSZHqEevosZ3N4hk8LYyfESIp88=;
 b=HeKYnnDMoZypa5o6bSz0661hyztqpzGfqPf4d0yhoKOQoXgA+2xf2jDJkKQs3LFOx7
 xWbwRhpJRfvYCALcSX6NRQoRyvTyVks0RJYmD5McYAMmUpbYCjd2M9uAo9W9rqqkbWqW
 ZbO4iBjGHedb4ZWhERtJY599o2fHiop02l/cI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4IXBKXDSSFEuVlJRXSZHqEevosZ3N4hk8LYyfESIp88=;
 b=RarGtjFaAEpiaZoAQaEHRBylHiEvRDsy2qgOtxFO1STyZ8TeYOoXDx6152DC/vXz1J
 TID3DlmHI5nK7/FMkj+51k7p/lan7BjjcHqF3yX58lqzLL7nXYBYWRlbjt3V6e+TAxMp
 yWaeG+VrqJxGBNm1CvMES5OQSx5oa+3BDwiE60PGlRANce80cjliWEzb8ouEL9wH8sJg
 /ZY14uOYgnHup1ZTVnWko4hDwUCr4LJAPxk1YVIcOLIUkriLOzqf1FhfVc9MLlSM8NaE
 6Bs1FVE1xjy7or/ckbuLLT5U1Y3RzQKqi21azPePp6rz9vQ1Vgm/BgSONKFdz2hYafoa
 SCMw==
X-Gm-Message-State: AOAM531bnO4njF2ID6ifcPttclUt7tjZT2d5WuBJ2IgoVIA+MDFziDbY
 2PAe8dXcU8BENgkvR1Z6shjGGYrjCGVdeQ==
X-Google-Smtp-Source: ABdhPJx+Ncil1h+9Nek6K5z1p3chFBtePEhRebAjxMB0b/eJAXw8kQeEBs/DDI3IrZ9I1oD0IsVkLg==
X-Received: by 2002:a17:906:dc89:b0:6f4:d3a9:34ed with SMTP id
 cs9-20020a170906dc8900b006f4d3a934edmr26878105ejc.459.1654615046463; 
 Tue, 07 Jun 2022 08:17:26 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 ay25-20020a056402203900b0042cf43e1937sm10588291edb.75.2022.06.07.08.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 08:17:26 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Jun 2022 17:17:17 +0200
Message-Id: <20220607151719.2305134-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220607151719.2305134-1-angelo@amarulasolutions.com>
References: <20220607151719.2305134-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/3] package/wpa_supplicant: fixing "Invalid
 configuration line"
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
Cc: jagan@amarulasolutions.com,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Default configuration file is wrong for the default compiling options.

Fixes:

Successfully initialized wpa_supplicant
Line 1: unknown global field 'ctrl_interface=/var/run/wpa_supplicant'.
Line 1: Invalid configuration line
'ctrl_interface=/var/run/wpa_supplicant'.
Failed to read or parse configuration '/etc/wpa_supplicant.conf'.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/wpa_supplicant/wpa_supplicant.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.conf b/package/wpa_supplicant/wpa_supplicant.conf
index 1994a6c739..f8a73d465f 100644
--- a/package/wpa_supplicant/wpa_supplicant.conf
+++ b/package/wpa_supplicant/wpa_supplicant.conf
@@ -1,4 +1,3 @@
-ctrl_interface=/var/run/wpa_supplicant
 ap_scan=1
 
 network={
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
