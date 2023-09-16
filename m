Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BEBC2BA12
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 22:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F3D2405FA;
	Sat, 16 Sep 2023 22:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F3D2405FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3-I_EQk8CVkt; Sat, 16 Sep 2023 22:03:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FA3E40A78;
	Sat, 16 Sep 2023 22:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FA3E40A78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DAC61BF30D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 22:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 051E160D52
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 22:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 051E160D52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UtWBu3vp_rMS for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 22:03:02 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 043D260B90
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 22:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 043D260B90
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-404fbfac998so6597055e9.3
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 15:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694901780; x=1695506580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TX6yWCeIEBE+eD1N6jt9xXqw5oq5lQKWrVenk9igziA=;
 b=M4IJ7iJOqbgPeRGWHvTXwVvp3F7Qan8TVKDQjQrmAel7Y2in8vWsKp2YqmYk5MIOg+
 0EYNuQ/yCengx0uUJEPi9uLyuifcWdRIlzV5jiwq5LBi66Oe5dqgc2CptJk/r+ViiaWo
 tnrqR68m5uufunC4icu/jiiVoI7rdTClgFcejPyKCr2rIDXRd6ueQGzftoOn+D9B4t2C
 5981oOqqc4VcxS5jVR9UVkKM7sI72XuPyc4gCRs+CURuWIV+Oy9EQAdHGYa6vEm9x1i3
 SO/QxdOdlslDvI8QHnXM6tYNuk1QoGDoEC2oZiXrCFknLlvysIAENTuaAVhfVTe5yiy4
 R/Ew==
X-Gm-Message-State: AOJu0YxPFC1RESNhmnO/Y4Q2rg2UszZE9W+6znLlwAv4krUsGuOuVjNa
 3BBU3v66CeYftL9fl/hWef3thieGX5o=
X-Google-Smtp-Source: AGHT+IGPn+YZyHqwLfIwWWV/FwYcTqiq4NUlODbU42kMgBwECaUiophoc5wwzuqrkzkibSWGP29tKw==
X-Received: by 2002:a05:600c:b52:b0:3fc:7eb:1119 with SMTP id
 k18-20020a05600c0b5200b003fc07eb1119mr4878033wmr.15.1694901779505; 
 Sat, 16 Sep 2023 15:02:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e25-20020a5d5959000000b003143c9beeaesm8249491wri.44.2023.09.16.15.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 15:02:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 00:02:53 +0200
Message-Id: <20230916220253.1624248-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694901780; x=1695506580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TX6yWCeIEBE+eD1N6jt9xXqw5oq5lQKWrVenk9igziA=;
 b=SmEWddJZ6sutuwCsg+c8OH3jcv/csYn0tkE8tgnj6JBXvaOuCloYecIj2vUc4UEgvj
 uKqe0vIPQEHwvecOEhREP5fOCnbhI2eryVA2rH0DSN1GHQVOpV4fnbLJNbnMIrpL4aeS
 iov3TSCh5WBS017L3kD/+AYwu/w0ba57F3J7hSBEqNGKhOarr2yG7fLugFJ3cIN1SxF+
 S+C9DYAQwKZCnjBs+BfDNSb2j8bDwmMpT8k1XHFylffDRzHD4amwAmGVFA/TpvqEdmgS
 uEFZwX3foqOdrZMojxVGDAo6jaNdeC2U8LaxUYAjWkcd9WJx3B7El8JJX7dn3K/eiCjE
 Mjyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SmEWddJZ
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 9.0.1903
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

- Fix CVE-2023-2426, CVE-2023-2609, CVE-2023-2610, CVE-2023-4733,
  CVE-2023-4734, CVE-2023-4735, CVE-2023-4736, CVE-2023-4738,
  CVE-2023-4750, CVE-2023-4752 and CVE-2023-4781
- Update hash of license file and readme (maintainers updated with
  https://github.com/vim/vim/commit/e978b4534a5e10471108259118c0ef791106fd92
  https://github.com/vim/vim/commit/1688938dd5ac78ab67e54299b9d5b93499dba762)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 6 +++---
 package/vim/vim.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 26bc913b8a..024c014bc9 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  c2bddf283a19c8714d7b21716e0a6a3214f9edb60b080f233cce4143fe228ff3  vim-9.0.1414.tar.gz
-sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
-sha256  d187aff219161f37138479257f82d687ea10b2cdd17d58b53a3ec9b79d6dc870  README.txt
+sha256  ba769f8513f2f75d71518f817f945809a5cb1310fd58cd86daca96e658cccf7d  vim-9.0.1903.tar.gz
+sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
+sha256  b475d5d3f8c855dc1a84813bbe45c44054d7f7aee20c800950bf89d5958873de  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index bb6d4a8d27..b8b50cb91a 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.1414
+VIM_VERSION = 9.0.1903
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
