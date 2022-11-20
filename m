Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D028C4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 09:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 135F081E64;
	Sun, 20 Nov 2022 09:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 135F081E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYxZQEDnJE91; Sun, 20 Nov 2022 09:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C78E81A39;
	Sun, 20 Nov 2022 09:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C78E81A39
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D80111BF40E
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF48E40980
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF48E40980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WXbcRx4_aLQw for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 09:07:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EE7F4097B
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EE7F4097B
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 09:07:09 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id j16so14717201lfe.12
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 01:07:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uqhL33JpX4P4zb4v5zzcL4BYwrcQpxvr0b15N8oHZmU=;
 b=E4dbpm371BOtC1iTfYVcyZuRz/bkrL4NTVhq1S/+zWG3O15TXUwfff5R5RZeXFcAzT
 HKlgNnkHvzUGmGWmiNbeycGgS+oHnxeeUa/onortL0+524StCQk55qWtfJN4KTd5tmcX
 T5IuAxbYyvhNFMBXgh3CcXiR0uKWeCDap/y0vTuFMaL2Pf7zY3OUfeU1bsVNFaPPFBbJ
 ITdhDkOIWs2BmTggnnp+/cDvZ6zah5t7SaZSm+0s58eTTczu2NPPlYaLSbiadOky1IiG
 TvPsjK4dd2I7fkFHppkQf1C6L3iCphwtRfBTtGjxR5lZyiiLQp6AifEXA9ik3Oa2auoc
 u0Ag==
X-Gm-Message-State: ANoB5pkNyTQDNGcjTYaSYH+qf7QBB9gjPj+w6PDxd4JLI+/ymg8Kk7LV
 3GOGansZABP0W1wV4uXDgPTv3jfrK6g=
X-Google-Smtp-Source: AA0mqf5uAcG2sVdOgPLPnyVfgCwRphPhPeEtB8MZ7Z2k/qqNVIPNIFlpSdi0oP5iq3dac1gS7GQnLQ==
X-Received: by 2002:a19:6b09:0:b0:48a:b5ef:c49d with SMTP id
 d9-20020a196b09000000b0048ab5efc49dmr4924335lfa.313.1668935227270; 
 Sun, 20 Nov 2022 01:07:07 -0800 (PST)
Received: from localhost.localdomain (dsl-trebng21-58c18f-58.dhcp.inet.fi.
 [88.193.143.58]) by smtp.googlemail.com with ESMTPSA id
 t22-20020ac25496000000b004b491fe071fsm1439285lfk.36.2022.11.20.01.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 01:07:06 -0800 (PST)
From: Alexander Lukichev <alexander.lukichev@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 11:06:54 +0200
Message-Id: <20221120090654.312078-1-alexander.lukichev@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uqhL33JpX4P4zb4v5zzcL4BYwrcQpxvr0b15N8oHZmU=;
 b=qnIBcQBGWpKkohx3X/KBb4H3kNJTMWGc2QS/1yYE1uB5bQWuFQu9LsGKqVGWxBoSmc
 waOcRCa/eH5DW1cRPhFidf3neZzDeSsFgM6bmLID84Unj4BUMDvqV1zM8zJm0zy8SxCu
 uBsjmxZC097aMeff83/RCjfFgguN8iLQaQyrEhdVa87QYTRjfnAESWOwv9cpwPXFSJc/
 EgHMJTN4oTgHNFjTY7eX/BlRUokt155M44HbvMuzFXGQHEOty/hQL3N+UJ9EMrgPTvH4
 UWp86+tu++zSsm0XBNdgGtg9jBjtbV0nxwbM19Av+O6nti9HvdSwmShVWXil3XG77BvG
 f9QA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qnIBcQBG
Subject: [Buildroot] [PATCH 1/1] package/openpgm: fix build for non-x86
 targets
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
Cc: Alexander Lukichev <alexander.lukichev@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

openpgm-5-3-128 has assembly code for x86 that is not guarded by
architecture defines. A patch to fix that has been merged upstream
some time ago, and the next release will have it. This includes
that patch for the time being.

Fixes: http://autobuild.buildroot.net/results/338291e5bf0671cb7ed7a32cc10e546c7a521acc
Fixes: http://autobuild.buildroot.net/results/3ab6d7f9ee841fa18c1c220d722b1c06ca1fff30
Fixes: http://autobuild.buildroot.net/results/68e840b1fec8f14775cef0b6a14d9b847337324b

Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
---
 .../openpgm/0003-fix-build-on-macOS-ARM.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/openpgm/0003-fix-build-on-macOS-ARM.patch

diff --git a/package/openpgm/0003-fix-build-on-macOS-ARM.patch b/package/openpgm/0003-fix-build-on-macOS-ARM.patch
new file mode 100644
index 0000000000..be52fb27a6
--- /dev/null
+++ b/package/openpgm/0003-fix-build-on-macOS-ARM.patch
@@ -0,0 +1,34 @@
+From 43dfc3e3a66b8e4584eb46219b129197a2428181 Mon Sep 17 00:00:00 2001
+From: Michael Cho <cho-m@tuta.io>
+Date: Thu, 10 Mar 2022 22:46:29 -0800
+Subject: [PATCH] fix build on macOS ARM
+
+Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
+[Upstream status: https://github.com/steve-o/openpgm/pull/71]
+---
+ openpgm/pgm/cpu.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/openpgm/pgm/cpu.c b/openpgm/pgm/cpu.c
+index cbcc988..f5da471 100644
+--- a/openpgm/pgm/cpu.c
++++ b/openpgm/pgm/cpu.c
+@@ -33,6 +33,7 @@
+ //#define CPU_DEBUG
+ 
+ 
++#if defined(__i386__) || defined(__x86_64__)
+ #ifndef _MSC_VER
+ static
+ void
+@@ -59,7 +60,6 @@ _xgetbv(uint32_t xcr) {
+ #endif
+ 
+ 
+-#if defined(__i386__) || defined(__x86_64__)
+ PGM_GNUC_INTERNAL
+ void
+ pgm_cpuid (pgm_cpu_t* cpu)
+-- 
+2.37.2
+
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
