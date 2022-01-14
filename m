Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43538C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 07:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3F7284D0A;
	Fri, 14 Jan 2022 07:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uEFxriAd_18I; Fri, 14 Jan 2022 07:44:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3057A84D08;
	Fri, 14 Jan 2022 07:44:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCEF91BF3A8
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 07:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D61B84D08
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 07:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eVTJd_ZAeGf2 for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 07:44:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4EEB84B35
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 07:44:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s1so14134215wra.6
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 23:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+HF4F2I5IXwygyQ+qgLt4UBtWQx5HH3AVngs3r4OjIE=;
 b=W4mkT91mxmMWtL9ZYuV8k6o7mT71x6klqXM6lUH6hXRjZxRiTxQy4T9lcw8aTs+wwI
 zrZBjV9vDQ4sRulOq2+jbyucs8d5yjKz+TfHLyC+znOFXFzwmKtRqHemY2fboPeNQq7b
 xWtqrg2kq/5F3/cR23wYL4eeyS9nBYYxVti5ehtmPzefAUqUZtaFO3JHL22lFvkwhYmi
 BZ/iQl63L5rSBLxo9nxN3PhEzJgq7Bk7MtALlth2wddDFt2sTFe1ScMO5+gxQYNSA75N
 X4/9RySaAeLXNZ2TP/9hsy8cuWkq/aTa35yPlqMwzXBivmlWAKkfekKdJ35z11cU1TKL
 PtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+HF4F2I5IXwygyQ+qgLt4UBtWQx5HH3AVngs3r4OjIE=;
 b=gdI8QDgsf/qjNOya70TMgsUV4sK3MpYhj5QkoC2JaryeOojWDKejvnagRA9REpKAiW
 l8cujNzaRJs85WsnWWZt8E+EMaHmYi5TwDxd5cbZmxMacKy42ByD/VdGXwOY9aYD8I6V
 5rjqwOjLV9OAFmgacSxI6TeG5SKH2Pyy5ODk9W1mdXBsM+FT/nPK/GjtcxpxfRqJN/T5
 4Ypd1I2fE1ac962FWHQ1xlFTwx244krkHxMeoY5oBc5vw1i6lyCpJL88XYjhYx2sG0NA
 80kRtykM9Mdz2DYJiSxahvYmGHzjP8C9H8LB4gTBY9bUDUrlNiIOmHq5mU6Xd2vl55ki
 nwhg==
X-Gm-Message-State: AOAM532ZvyCzn7XiHUyyDXSc4eeLZTXum/pJFFe0D5+w+mfIccnZ9efV
 25kmKXYwzdEqW09xCWNNhS/lt3SrAnE=
X-Google-Smtp-Source: ABdhPJzEjqPt3LrovGhnqKz0WF7WFR7PCJtBWd/Xibuz7gxboAAeWLMMB4YHxW/SiwqAFaPzCfqmJA==
X-Received: by 2002:a05:6000:1a87:: with SMTP id
 f7mr7382446wry.150.1642146288835; 
 Thu, 13 Jan 2022 23:44:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-1379-66.w86-229.abo.wanadoo.fr.
 [86.229.226.66])
 by smtp.gmail.com with ESMTPSA id b1sm5613910wrd.92.2022.01.13.23.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 23:44:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 08:43:09 +0100
Message-Id: <20220114074309.356873-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libglvnd: needs threads
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

Fix the following build failure raised since the addition of the package
in commit 0378e2e5d9ce9d5676975dfbff501360094fdc1a:

In file included from ../src/util/glvnd_pthread.c:39:
../src/util/glvnd_pthread.h:33:10: fatal error: pthread.h: No such file or directory
   33 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/63624bafc6f7a225d4db0667df977fd6141561aa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libglvnd/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libglvnd/Config.in b/package/libglvnd/Config.in
index cd19fde582..d020c21465 100644
--- a/package/libglvnd/Config.in
+++ b/package/libglvnd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBGLVND
 	bool "libglvnd"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The GL Vendor-Neutral Dispatch library
 
@@ -45,6 +46,6 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 
 endif
 
-comment "libglvnd needs a toolchain w/ dynamic library"
+comment "libglvnd needs a toolchain w/ dynamic library, threads"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
