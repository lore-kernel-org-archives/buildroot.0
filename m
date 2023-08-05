Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A1FC001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 21:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AB0C60803;
	Sat,  5 Aug 2023 21:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AB0C60803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sL1jt2vor3yr; Sat,  5 Aug 2023 21:34:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E91D60B06;
	Sat,  5 Aug 2023 21:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E91D60B06
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D56F1BF28F
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 357488145C
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 357488145C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2wmBif_buDeD for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 21:34:39 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4ED428142D
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 21:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ED428142D
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6F825A4C03A4
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 23:34:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56960)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSOuz-0000kq-0W
 for buildroot@buildroot.org; Sat, 05 Aug 2023 23:34:37 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 23:34:37 +0200
Message-Id: <20230805213437.3588243-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691271277;
 bh=lqDfn5bmx3U28dMhyDhhe4uCGctrLNnYCOJT8XSkIhE=;
 h=From:To:Subject:Date:From;
 b=GcHe29YDvZiP5RM35KQv6OV4uvcy0AvUMC0uzFv1HySg9uBt9TxARpKuxsmyBVYw9
 yPruKPKGd/BTTicafLXSAbptGIlqKP1FGmQnmj0nSd2CtmWf+W4OD+dmPhfoCEsTOr
 VvHFum9Ae3OCRyGEJOUEF4RwlKmCaRe0VMmjQ/F7P9SsDk3pgzOR+nVsNB/PZ85TB8
 tUDiZzFG0hBLfTT43MJeXCt5lwEYMRmfLXNLyTSJFzlOeOBQXkzR3WytrfEbTVEBUN
 oSzsaHLnoLsTsaOwVG9qSY1Va63rFjic3o37RTty1HkqIL9yfRAz48dCNhMhyHiAAU
 VvCu3/yuj0ODA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=GcHe29YD
Subject: [Buildroot] [PATCH 1/1] package/xz: bump version to 5.4.4
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

Release notes: https://git.tukaani.org/?p=xz.git;a=blob;f=NEWS;hb=HEAD

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xz/xz.hash | 4 ++--
 package/xz/xz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 0a8a13f1eb..92bac40463 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://tukaani.org/xz/xz-5.4.3.tar.gz.sig
-sha256  9243a04598d7a70c1f567a0143a255581ac5c64b140fd55fd5cbc1e00b0e6f90  xz-5.4.3.tar.bz2
+# https://tukaani.org/xz/xz-5.4.4.tar.gz.sig
+sha256  0b6fcde1ac38e90433a2556f500c065950b9bcd2d602006efc334782bdfe6296  xz-5.4.4.tar.bz2
 
 # Hash for license files
 sha256  72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index dcdbe142b6..42fee82e80 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.4.3
+XZ_VERSION = 5.4.4
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
