Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F90C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 20:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0843760C2C;
	Sat, 23 Apr 2022 20:41:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lPKM_Urz4M6q; Sat, 23 Apr 2022 20:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B85660B83;
	Sat, 23 Apr 2022 20:41:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A69A21BF59E
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 20:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8798F8301F
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 20:41:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qyd7kLlZsjSv for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 20:41:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D805D8301D
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 20:41:35 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso10132436wml.1
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 13:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=worX31l7cRS7Wf88dVhZPFB7ixYLCYMvXL+zuGSEvrc=;
 b=f1gFuP6hJpW1GqJHgVR9OATPy7LJrXQc9cG4VGErqw+rgO9Tv1XxVNgpxHioLzuBbj
 uttSbokGX5mknGvn8biO8y1E50+t6PugcTX2RMIeljrjQuDYxD5nxW+y2As9rbQOvZO6
 tLIGehF92piPtK4eyVCEWezfyHh80w0cIABeX/ZsBo6wU+wmh8UBC2OvXbj/tMh9W5WA
 BNuvzDyNMz77LwERlhJhI3y/6MwjrMEp0lq2XRPudMhjeHeRCM7xdpjpTqxMj1/mCEjq
 czZjKz+tTDFa96Dt55nskz6Cc7LmNCC1i1IOb2tI0ZJuUdIjBCMmp1X+zs3OO+QpRSs8
 riRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=worX31l7cRS7Wf88dVhZPFB7ixYLCYMvXL+zuGSEvrc=;
 b=UMGToU5y+vaAxSCIBEJ+CVrlEg2L9I4dSlBvqwRqTCDJEAn0vgfsIBNF++pdXFaHo+
 AVv0jM3jI1EeWTpQ58virBllEqYM05CXDSgcoj7jBVYYf7HCFXhs8qAlkd7qe1GJqhJW
 5deDv8FwXq1H5SOxVlIUMrDp15mPYvsxIyeXp29sFnETUPVYX7a7Lj8cf+qCqtb01FZb
 U48xyqSsqwSP1ja270b/smhF/nEzQP83D6yIubiuPtWhqXlaw+REQPn5AECOykZXeUNv
 jI0A703uzLOnQCYGUaC6iySNch5VuM0cvFbZ7Iy8mwr+kqfUSlLbT7bw3YbbnATn5hRK
 cuxg==
X-Gm-Message-State: AOAM533i+nOJfZD3lM5fHjR4J0Rh59dUaJ1+dHRuwGSyhqrmN9Wds/Vm
 ReNOOsv5oxHczih1Y7rSuLL2DRZbnQ0=
X-Google-Smtp-Source: ABdhPJwzVJI9ScjJBUxsR8MRE2J5XhsNyWunNSxuQibyoCrYaCbPOoFAcw4uCpB+OfXPCJZitKaXTA==
X-Received: by 2002:a7b:c4d1:0:b0:38e:c1a7:c796 with SMTP id
 g17-20020a7bc4d1000000b0038ec1a7c796mr19006810wmk.150.1650746493712; 
 Sat, 23 Apr 2022 13:41:33 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1c7909000000b0038eb8171fa5sm4782312wme.1.2022.04.23.13.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 13:41:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 22:39:21 +0200
Message-Id: <20220423203924.1796541-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/4] package/zlib: add BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
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

Add BR2_PACKAGE_ZLIB_FORCE_LIBZLIB

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zlib/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/zlib/Config.in b/package/zlib/Config.in
index d6d94889a7..3a486376ac 100644
--- a/package/zlib/Config.in
+++ b/package/zlib/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
+	bool
+
 config BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS
 	bool
 	default y if BR2_arm
@@ -33,6 +36,7 @@ config BR2_PACKAGE_LIBZLIB
 config BR2_PACKAGE_ZLIB_NG
 	bool "zlib-ng"
 	depends on BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
 	select BR2_PACKAGE_HAS_ZLIB
 	help
 	  Zlib replacement with optimizations for
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
