Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C912C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 19:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23698402CE;
	Sun,  5 May 2024 19:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTb0hzpGSRH6; Sun,  5 May 2024 19:08:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2708040438
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2708040438;
	Sun,  5 May 2024 19:08:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 076441BF3CE
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 19:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7FBD40438
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 19:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TvPcao0p69q for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 19:08:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 964F5402CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 964F5402CE
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 964F5402CE
 for <buildroot@buildroot.org>; Sun,  5 May 2024 19:08:27 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41c7ac73fddso13247525e9.3
 for <buildroot@buildroot.org>; Sun, 05 May 2024 12:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714936104; x=1715540904;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YH2c6jYLgqoL+4pSCvO2OazYGxlkVGz36iKEbfcLCDo=;
 b=dCdtYOa1ijKc8uRs+fVTEbrfL93KmkPv+DGOLm+/7y+i8L5tFf84Dte6/Yuqa58S4h
 nfyhnAGwuRRoZanHyeAzIr3TdpLQRPXTrskG7iE6cunk0yOUccrdcnqHb0IZRawbCm11
 HkgtlVCWLT+Or72wiy28J6Ppf2Mjii2ZGC16LymEoLfcexaHq55U6JXxRt+dJv7Hlxqw
 AucSb7X7ZtU6MGtOWgvd2/K8YAMvXJwUcEQwzFY/t24geXkYhbstdARFaYM2xrLgroki
 5ivlVI14+D48k7nzF7CkTeEnk0AOy5q2E3skBfh9BY2VHXO6cv0SnH4y4+Cr8vXz0i6Q
 v6uw==
X-Gm-Message-State: AOJu0Yxup0k4NtZxZpMOXNRGCBRr3Tl9RaiKchU+V4hOIhnun7xWwlVJ
 YsL2u6RFIHFrNFczmhzGvJRHTzR4ttNJT1+g07t19fGgYtTJNy76+yWiLA==
X-Google-Smtp-Source: AGHT+IE/K2ME3CvvUF3YeVHBY2xxZ3ka+wTLEiGs1pGaHchOWppCuRbT+B83eyP3iLsd/SoLgCZggQ==
X-Received: by 2002:a5d:50c9:0:b0:34c:fe30:98c5 with SMTP id
 f9-20020a5d50c9000000b0034cfe3098c5mr7556319wrt.60.1714936104465; 
 Sun, 05 May 2024 12:08:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 dn2-20020a0560000c0200b0034e14d59f07sm8899508wrb.73.2024.05.05.12.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 12:08:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 May 2024 21:08:21 +0200
Message-ID: <20240505190821.1252791-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714936104; x=1715540904; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YH2c6jYLgqoL+4pSCvO2OazYGxlkVGz36iKEbfcLCDo=;
 b=Y52etjl009ARgJfWbSXLDDqr834P/xxsHScD+KEiLa37spnVMbropDsye7Bbp7zaxy
 o7EK2FLOv+3VPy4ZqurR0ts5+SQwBhDcX4LruR++rZ0mTCiiNW5IMmGBkdOZ01MchThw
 GDP5ziPfh5mI78ejlTzHS00wJeb0srF8gdJaAVer3NRpseYCcT9v1QBxyM/cI4CH0FOd
 UaTGCHHJ1jERePmipA9v6YCrb21okxBXYW1j1lcpmBfVKx66j3SJn6diS/1di18tdPKf
 ROau4D8FOXfpzSjS1sofkMLFlnfJcCiEyrCrFh4IWfNU/e9YnWtcgjfDs8w8bnE8+pQY
 E4hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y52etjl0
Subject: [Buildroot] [PATCH 1/1] package/liburiparser: security bump to
 version 0.9.8
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fixed: [CVE-2024-34402]
    Protect against integer overflow in ComposeQueryEngine
- Fixed: [CVE-2024-34403]
    Protect against integer overflow in ComposeQueryMallocExMm

https://github.com/uriparser/uriparser/blob/uriparser-0.9.8/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liburiparser/liburiparser.hash | 2 +-
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index 73b4ec6867..f2e3317897 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1ddae35cb3cc2c36e8199829d46f1c7f8b222e74a723fdae67ec8561e1ac5a39  uriparser-0.9.7.tar.xz
+sha256  1d71c054837ea32a31e462bce5a1af272379ecf511e33448e88100b87ff73b2e  uriparser-0.9.8.tar.xz
 sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 6d25b1d9bb..b0ba8c387b 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 0.9.7
+LIBURIPARSER_VERSION = 0.9.8
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
