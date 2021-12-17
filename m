Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630B6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 22:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D90CA61119;
	Fri, 17 Dec 2021 22:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlAy9sbBsg10; Fri, 17 Dec 2021 22:54:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 500ED60E9B;
	Fri, 17 Dec 2021 22:54:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 881E21BF5AA
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 22:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 709F960E9B
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 22:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MRhnYX16fkZ4 for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 22:54:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78D2B60E06
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 22:54:48 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id z206so2576153wmc.1
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 14:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bhIzMsdmSkIbWSsSW0bTL700SN4zJsDGNX9Yfj4tytM=;
 b=DDYUnrJ4PCe7OA4Z06JZuw7MiBotAHGa8ZWPWD0ieekzCnSnIKL10hTgE5JuxR6D5W
 z3G8+Drte5zREOUXIaPVz6tZOe2XMTr9I99rrs75xhgM4pzyhZAFSgYnVSc5HK83iU6H
 sCidUhBFLHZVV4kZ67KgDnu/zNA5HkDSlOvyehWaOCdDfnHXRNBl/Tz6Oo4X1ZQMo8Xq
 NKe4s+7Bw62kkFd0oqk518XDZLjH7bvLyyfJuOS7xpCMCsrfKV+WdPkAKX/Bk+F0EcHo
 owahyvQc3+4aRpYwpo4JjddQSyzIRuMHmYg2cp7+RpAhT3N1Vb6nemsTPh2ls7BLXMBt
 6N0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bhIzMsdmSkIbWSsSW0bTL700SN4zJsDGNX9Yfj4tytM=;
 b=aRlce6DrDvr4NaggmDcAgZCgU95iOESMxpr7aybDp5MlfdzjhLW8wSLYeEtUeESkox
 LUIGGGLKA0aBvS2ydBBlhQvOW19SDtxyJMYK8XjQtmqre6ZrVjdd7990Jw+zFld798Ry
 g6BpXktiCStHrjql5f2A41uljH2xIZhAN0m5LknTiQAfWaXbaB5EJ8wDDWD49Ievdl1b
 hFjqEMDs6Obgb9EKhc9TZInowHuihidcbLixD7T6idgcrxSt4/j3h2ZcWE6MY+jGr8U7
 cpAcqA9X23cGe1ec0cKxMAJqcFPHMdplS6gLTjGzHaAuFNuuxHndzy4KljrYjxeWyb0Q
 ghdw==
X-Gm-Message-State: AOAM531pQJ72spvAG/NZsrxOshXhRbwXkEVvxeXw6LPhPAMoJC6EALfM
 XjxWyi7yklMk2a/MrHukLpwOTFnXRBh9Rw==
X-Google-Smtp-Source: ABdhPJzxRfaXC8AA4RQOfrolz0eN7lk6IESCrQmjSVbtsebpBf55+xoL+LVIgvWmyUrUqFuvT04gQA==
X-Received: by 2002:a05:600c:1e24:: with SMTP id
 ay36mr3976956wmb.84.1639781686566; 
 Fri, 17 Dec 2021 14:54:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id b10sm9683963wri.78.2021.12.17.14.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 14:54:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 23:54:16 +0100
Message-Id: <20211217225416.107885-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cups-pk-helper: fix dependencies
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

Fix dependencies which are wrong since the addition of the package in
commit e13c9ccf436cf13b53bec6933e5be4bb071cfad9 resulting in the
following build failure:

Makefile:587: *** duktape is in the dependency chain of polkit that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/706a09b245880e99109a4cc99faffe83f458afc4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cups-pk-helper/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/cups-pk-helper/Config.in b/package/cups-pk-helper/Config.in
index 63a0d3acd8..113f433795 100644
--- a/package/cups-pk-helper/Config.in
+++ b/package/cups-pk-helper/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_CUPS_PK_HELPER
 	bool "cups-pk-helper"
+	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # polkit -> c++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, polkit
 	depends on BR2_USE_WCHAR # libglib2
+	depends on !BR2_STATIC_LIBS # polkit -> duktape
 	depends on BR2_PACKAGE_CUPS
 	select BR2_PACKAGE_POLKIT
 	help
@@ -11,7 +13,7 @@ config BR2_PACKAGE_CUPS_PK_HELPER
 
 	  https://wiki.freedesktop.org/www/Software/cups-pk-helper/
 
-comment "cups-pk-helper support needs a toolchain with threads, wchar, gcc >= 7"
+comment "cups-pk-helper support needs a toolchain with threads, wchar, dynamic library, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
