Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751F9C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 20:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 168A660D50;
	Sat, 23 Apr 2022 20:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MfPuEQkJM0O0; Sat, 23 Apr 2022 20:42:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31F8760D5F;
	Sat, 23 Apr 2022 20:42:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 821071BF59E
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 20:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7051760B4A
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 20:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sl-Bu41BHE9f for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 20:41:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 905D160B83
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 20:41:42 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v12so8798037wrv.10
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 13:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K8peXh3ZvpjBQP2JzjqZGSBt7PBp4mJOz/SnNSwnEbM=;
 b=nriQISzOtFGS5yFySphueKzb9le2P0gdy2R58uOiMbsKt7VkolOBx/fwA8e8OACc9c
 xN4xZzWsbLtFOCbb3042CHvYe7imZapN0DuiDq+4bjt7zhthCtsG+fGSZdkOMWJUxRqr
 KQTM37fXXosp9wh/14cx9jMNe9VzzH/zChqxMBy1SEYkGbc2dp7sQ6cFoXsVSZsaUlEC
 5xk93grcBFvdFf8mjijAazC3SwGkJe6Bes9HprybUaby6Tr0i+fzx8X9cKIJMinSkHNc
 W8paw3xHyhYcqKtiyU8FlNWwubPXcIPpJO9K2H2WHBbx1YcLsgwbdkQ+XBcQ5g92zDoO
 IJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K8peXh3ZvpjBQP2JzjqZGSBt7PBp4mJOz/SnNSwnEbM=;
 b=AmNB0aXbUoYGQQzW9EhjUAxiEbpyYtsPKKujJxNPR2qs2e+uhA68OdEKuDhiOBt0Tq
 U2Ndp5WDor5VmMwNsGTvRwfPrxHGDPn7ex2etu8GIIXEgrwsopxj9eVh9pxULekKtqAb
 BCavmpeRqkyYQ1nWZ5fJp0JGgqoOEtZnqUCO0lDXJ0eOcPmBZKbGtdd0uyyNcnzit9uP
 K1nxLKqn3WQka5C/eVwImz37Osukc0fHhGGfe6ZF+vlTVHyMMFi8/bIEjrtLpAgh1aSH
 4AaOLRyip3Tgv08j0VnQfhb+VNvzv8kUgipa7USwP0WhqrZ1OfcK6Xhs5E6my15iRHFn
 wGOg==
X-Gm-Message-State: AOAM532PIctHwwYfS8RaAO1P4VO+Sbi+U0z7Gco5/0HMu2YUZQ4GMH+P
 /q+G93opJIQ62sgVU8zWDYDgR2gdQYA=
X-Google-Smtp-Source: ABdhPJwlgqhcbhjbLBQshg+w14h4HNHptoxSIoEbHBXlshoMzTVLlxhz9L+vAPZzYJ/b7RD/7+F4zg==
X-Received: by 2002:adf:f30f:0:b0:20a:d71f:d85f with SMTP id
 i15-20020adff30f000000b0020ad71fd85fmr1182537wro.342.1650746500559; 
 Sat, 23 Apr 2022 13:41:40 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1c7909000000b0038eb8171fa5sm4782312wme.1.2022.04.23.13.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 13:41:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 22:39:24 +0200
Message-Id: <20220423203924.1796541-4-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423203924.1796541-1-fontaine.fabrice@gmail.com>
References: <20220423203924.1796541-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,4/4] package/quazip: force libzlib
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

Force libzlib instead of depending on it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quazip/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/quazip/Config.in b/package/quazip/Config.in
index a670ed458c..bba5eddf3d 100644
--- a/package/quazip/Config.in
+++ b/package/quazip/Config.in
@@ -1,13 +1,11 @@
 config BR2_PACKAGE_QUAZIP
 	bool "quazip"
-	depends on BR2_PACKAGE_LIBZLIB
 	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
 	help
 	  QuaZIP is a simple C++ wrapper over Gilles Vollant's
 	  ZIP/UNZIP package that can be used to access ZIP
 	  archives. It uses the Qt toolkit.
 
 	  http://quazip.sourceforge.net
-
-comment "quazip needs libzlib"
-	depends on !BR2_PACKAGE_LIBZLIB
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
