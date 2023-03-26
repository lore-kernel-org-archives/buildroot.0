Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7457C6FD1C
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 08:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7317260F0F;
	Sun, 26 Mar 2023 08:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7317260F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTi8culSRHkR; Sun, 26 Mar 2023 08:01:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0CF160E0D;
	Sun, 26 Mar 2023 08:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0CF160E0D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24E1C1BF2B6
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 08:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C67D81EB9
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 08:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C67D81EB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wOVRV8np1koS for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 08:00:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8238F81EBD
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8238F81EBD
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 08:00:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.192]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MIdiZ-1pjJq53DL3-00EeaC; Sun, 26 Mar 2023 10:00:36 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sun, 26 Mar 2023 10:00:33 +0200
Message-Id: <20230326080034.14629-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326080034.14629-1-ps.report@gmx.net>
References: <20230326080034.14629-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:5EfLCwPgyR/9BWPcrtOaEHRaTZ5+hJ5Zzg5YqEdbGKtg9E206aN
 /xNIdHPdF1q9eeyMSwU2jKj873+SpeWuaKss9puZ+RwZBEBGTVRFHRwPOgEu3Z22wdnJSJt
 cag0Y2E2SQXrcLNpH/98Qx8/KTflJAxDcMpMrOLny8sybVx5b5h3WE8sQAP80A5w9KGAffz
 LNz0XNjjNEFjRLg54v4eQ==
UI-OutboundReport: notjunk:1;M01:P0:4oi5SCt1kqY=;1IRZOO79+v9nFCgnPfGESAXD9em
 8BkIGyp92Qyrn6O3rAk3RFG+FYe+PsFQN+xFqk6Kk5ULX1bVkYdAgevspL035Dpt3dxPr9s0G
 MpjGAwIU2pC3sWPFDlixAyotGZ8z3LjKlLyDJntmFqvIkUva6FrIrcFt1viNz0Q5H+uNcG6cv
 8Q6DTr222ZaNHnB63E3aXuQMTXEQbcF0bT+jrP1e0wY2zwo224ZDqk0uWJ/DhRb4F2myY6LpR
 owJHmjHCXZwodsosdPtYA2h17U0Q52I+GCEe2BCDxBF8S0mv2Spa+2EnY6W9CpXAQrhVe55EN
 x9re7nJaHT8grJUjONBdxGBz73Wj+HXG0yBTxzfdOSjvcQp5BaJ8IobKgxv45W8veO8wG5Tc8
 Srd/4w70dqC4em9HZ7+OgkYIxYPWkEu0O3WTExp3F5wQLHVpbtPlaFddxSNzi77Lah3NxTCF6
 vA1+SNlbDaIcQwgEF7o/vobncxXeHCNhvbdKWY6YG7GdLNcGQz6NSwax54VOO1jQSFo0IdA2Y
 54Vaf40yXTIA5TCNoIeq18w3uBa5jKitm5tpMnRYCeexB/1eJL9BOk1vnASajHRu2qCJ/1WOi
 iEELF3Z71Ul0dazronEEPwnXfY4qqZyga/SVv/PQyNjrDY2VTR/XGaIAnO2w8ddF5PwNd0ymG
 mzGLVr3/jED6RMCbWqHJCu9lXTNoqlMCAL9IGcU2XVvr2ROaRBu4ERS7COgIeR2YpGkJ6LMvU
 4IClFscotiEvOkhfNofcUvvG+GJv/AFVeg74skpC2ZEhsAz5g0+KJSnrn7HMwpzQvUkhV5/or
 SqhhJLxLdEgqeR+6l+Br3SWhhqYmM8XUtVCE2jJgAzhTpTxscpQm2KWlTOz2GWld/HPMuXwxJ
 WUdqUPwgiVwF2AlKLtR4xDMrYgm7WENxMgXgg3MvEykCoeIwyP8ucWjLGQZIyuYpGXroqHcAk
 W1vrI2RiCs0S0mfYQW+Y4MDVhds=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679817637; i=ps.report@gmx.net;
 bh=VvvG9eqGAvp1H9zwvwPWWb4m5AsPHtvMuKrjoT/aP1s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=piIn+F+IuRGlxv9LGFvWLbt3EWLB6SAQJ0U4rQgqrYku5d8qgopDLccgOI0YXIwnw
 uUgyUrNFhWHiUZ7nSsU2r/WrOGPg+4WSz6on+mhJkLyt4ecuOccT8mSVs1SAlUG4fy
 UGPIygFgkgQRcNffj0rVbwJXc6jUvEc2lw84PRhR/GgXVuVDVfxooxx7tYykjdDjCE
 QdMb0A4vKAfnWTUGDCqYqzpb2jnHtkvp09z32+8CTuDzHjDFxdwsgKV6E/Co6QMM+2
 YCjbHGBGuWNVXNN299QSyaT/UVt/4DNLwUo5tQFLVGbqPvJ156lujicS9PgJrZDIOS
 v8TDE4QZT0gKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=piIn+F+I
Subject: [Buildroot] [PATCH v1 4/5] package/osm2pgsql: fix double space in
 Config.in comment
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/osm2pgsql/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
index e903e92c49..3e73572a80 100644
--- a/package/osm2pgsql/Config.in
+++ b/package/osm2pgsql/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_OSM2PGSQL
 
 	  https://osm2pgsql.org
 
-comment "osm2pgsql needs a toolchain w/ C++,  wchar, threads, gcc >= 4.9"
+comment "osm2pgsql needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
