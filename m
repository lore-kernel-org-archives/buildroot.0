Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF939E75455
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 12:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B15D420A0;
	Tue,  3 Oct 2023 12:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B15D420A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2k_i5yuwHknw; Tue,  3 Oct 2023 12:39:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FA01420A9;
	Tue,  3 Oct 2023 12:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FA01420A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C60B31BF352
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 12:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F62B82612
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 12:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F62B82612
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Toujx0TRqPmv for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 12:39:05 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF9AD825DF
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 12:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF9AD825DF
Received: from fli4l.lan.fli4l (p54a1b0e1.dip0.t-ipconnect.de [84.161.176.225])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05E30A4C1040
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 14:39:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44506)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qneg2-00020d-2Y
 for buildroot@buildroot.org; Tue, 03 Oct 2023 14:39:02 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Oct 2023 14:39:02 +0200
Message-Id: <20231003123902.2706496-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696336743;
 bh=dOT+tq47v6jaMU8DOkPh8YoGxj/HGY4jF2XD7Gm1AMA=;
 h=From:To:Subject:Date:From;
 b=w+X+J9KXIJ7cnR4KY/oPbw98+9AFYTMnwMnUCZR2gLeRrr9rtOzVpQijnMjnadANP
 0iDg41OsRRV/Vu0cEO/QlKLaYInsYBifXWjop4jR/WIXGYPNZ6UJ0DNaVc8ELma0hD
 ZCAF9GcdvPJ58uXb7nF4gte/XN6oPIhAkNAkV9YY5mLmdCd7UvZG8+YjpLXpttft8/
 AIvHdOQKwhz2bCLBhEIO5+RNeUOOjAKkk/q2ehwFNwiFwGs5uTzwseGNHz6hSKCtFf
 RlwvtLMv9FyWxGVtLiOURfgMz3m2OfDKSQ6tkOGPqOW6J0D+LPfIEWy079CepSU+sZ
 V5cZ5fLM4DTVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=w+X+J9KX
Subject: [Buildroot] [PATCH 1/1] package/libdeflate: bump version to 1.19
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

Release notes:
https://github.com/ebiggers/libdeflate/blob/master/NEWS.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdeflate/libdeflate.hash | 2 +-
 package/libdeflate/libdeflate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libdeflate/libdeflate.hash b/package/libdeflate/libdeflate.hash
index c6a50efbfc..8609f5ab02 100644
--- a/package/libdeflate/libdeflate.hash
+++ b/package/libdeflate/libdeflate.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  225d982bcaf553221c76726358d2ea139bb34913180b20823c782cede060affd  libdeflate-1.18.tar.gz
+sha256  27bf62d71cd64728ff43a9feb92f2ac2f2bf748986d856133cc1e51992428c25  libdeflate-1.19.tar.gz
 sha256  5d246dd2537307b80fed9ba5fdddf5d0fe7a8f023393a071182b9daed56b40fe  COPYING
diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 00de2e82a9..3000a58407 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDEFLATE_VERSION = 1.18
+LIBDEFLATE_VERSION = 1.19
 LIBDEFLATE_SITE = $(call github,ebiggers,libdeflate,v$(LIBDEFLATE_VERSION))
 LIBDEFLATE_LICENSE = MIT
 LIBDEFLATE_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
