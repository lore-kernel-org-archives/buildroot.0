Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0777C001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 08:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B81D60C01;
	Sun, 23 Jul 2023 08:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B81D60C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mx5u35wj7VfL; Sun, 23 Jul 2023 08:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EC7960BAC;
	Sun, 23 Jul 2023 08:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EC7960BAC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A120B1BF471
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 08:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A5B383196
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 08:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A5B383196
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eBH-TkikF6Tv for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 08:31:55 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86A7683192
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 08:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86A7683192
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22436A4C07EA
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 10:31:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53572)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qNUVM-0002Jp-2y
 for buildroot@buildroot.org; Sun, 23 Jul 2023 10:31:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 10:31:51 +0200
Message-Id: <20230723083152.3147145-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690101113;
 bh=g5NpjwOAAgPsLtmgqJlYGa0WdXJjuNo1d01uZsR4zNI=;
 h=From:To:Subject:Date:From;
 b=dOvL38oslEI8Ml61ISEtbAHfv1rEqwUSzsHvLBGFHsS4NZptwblAQQcZXidYOVIuS
 hBtm2OGvse/kw4bztTYg2s/WVTIXHFsdNvhos8qiA9VtZdCbqQ2Bb/CQCOJBTjNPnP
 CohfMM23WL7exw2J4xks13/YpUlVOCmjpDEZRyfpO7keNHxZGQQGvi7/0r1p3MX5rL
 wmL299AtUBA3r2B742VKMv98GwXfZrRF7Y0T6NjCCtiShTomR8emdFLsx89o3yVWmm
 2vXP+eU/bnYObkU7F9YH2lI12fsA7dRH+8B7ae+gSaAJSDpEP69rbd/4HQVBEsMSmA
 Yqiyo4/UYLQDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=dOvL38os
Subject: [Buildroot] [PATCH 1/2] package/transmission: fix comment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The wrong condition was added with buildroot commit
80793107a65d95f8dfd0317a726d3a737c78ef67.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/transmission/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 84bd85eeff..fd4c897497 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -49,4 +49,4 @@ comment "transmission needs a toolchain w/ dynamic library, threads, C++, gcc >=
 	depends on BR2_USE_MMU
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
