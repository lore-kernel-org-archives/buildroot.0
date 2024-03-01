Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148B1C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 21:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9902841FA2;
	Fri,  1 Mar 2024 21:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HiYKf1IYPlP6; Fri,  1 Mar 2024 21:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63B3E41FA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63B3E41FA5;
	Fri,  1 Mar 2024 21:37:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC4CD1BF2F1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 21:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E53D41FA5
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 21:37:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ouQDGsordrK for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 21:37:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A97E241FA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A97E241FA2
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A97E241FA2
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 21:37:27 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33d36736d4eso1567695f8f.1
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 13:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709329045; x=1709933845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YexOLk8HVs3Be2cZeBtkyasl8Pi84JhOi9lQaKlj6BE=;
 b=U9hcVW2fmaPG6Er6zxExH5H1MAU/JvFGHXXvb5qLf2IazOPzicANEprqxg9uSAEG0v
 ZGuJu66GHG0E3f32etm9oeY1OG+C3i/V+EAsy0SI3oFMH2kppovxWD6/UNHu3uvZ9zJT
 tE3lj2mJl5Yrjyi3lfzMn21EWAve4K9bkALJliKF0VI47NznZLgVJl1QzWgRUZ7jPBUk
 RH+zehziNhdUubZf9P8obv0oe4rWrQiQBKyFaitQC+Brw6DbTFNi6rbmQzmek2t26kEk
 MeD7oK5qWpG1Y82QKtI9UppHOOTVvd3zBng2lPxEPzBFlaUOPWj0lRpvw1YkiDg8fPNB
 8TJw==
X-Gm-Message-State: AOJu0YyW9FF43f8LmkR+m0SYXkhAYf+BqpjTYjTOv+RiMWqoA1PqeKN5
 qXw+WEGYqEHb+2iKAAr3hPsYg8fI1AcuY/Dym6oBnXX1psa2PJfpFhcJDzEn
X-Google-Smtp-Source: AGHT+IHJAfGBZBrAoH6ReIVtqG6CDxdMscMDpNwdLKtLRhFBz4Chft9LIKrjyPXJ8gOrsceM/VhOVA==
X-Received: by 2002:adf:9dcd:0:b0:33d:c2c7:469d with SMTP id
 q13-20020adf9dcd000000b0033dc2c7469dmr2245738wre.42.1709329044348; 
 Fri, 01 Mar 2024 13:37:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 cc19-20020a5d5c13000000b0033daa63807fsm5669527wrb.24.2024.03.01.13.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 13:37:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 22:37:22 +0100
Message-ID: <20240301213722.91942-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709329045; x=1709933845; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YexOLk8HVs3Be2cZeBtkyasl8Pi84JhOi9lQaKlj6BE=;
 b=JkUmmV0xKdp5YhfwPTh2zBgdaYC4boTzU3E3ifOxh+bv7JssS2OdRcm3ruvOWzUdHa
 Y/g65mccMrgSt5JJ333pHyOWxd6CObE0Hgc02sYIQcT1yv0r345XP4xE0ox3PEw3n6J+
 Q7NZ4NaVBTkMKqyf6bzYr6Woh+toDdZGKYUZqAWrybLl7EDOhvpr3WlaF24Wzn40zNr1
 a0+amo6CevDo/xYl5VT8LN9/2xuqzebmWng6B1zXmEOb7dPvfrP3TzUQupYO45mYcCYo
 M0nWUO35Yzxolx+9CCB5BDBfN/77SvG1xGVv2PLtcDdU46J8j4EGiH7ETYSFV6asWci6
 AJ4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JkUmmV0x
Subject: [Buildroot] [PATCH 1/1] package/tcf-agent: fix x86 build
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
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following x86 build failure raised since bump to version 1.8.0
in commit 81802e263a12e173e0e1028449d1e1e11b2e5974 and
https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/commit/8df5540c53b862d516ac25f908c2fff4a547b4a6:

/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c: In function 'unpack_elf_symbol_info':
/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27: error: 'STT_ARM_16BIT' undeclared (first use in this function)
 2079 |         if (info->type == STT_ARM_16BIT) {
      |                           ^~~~~~~~~~~~~
/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27: note: each undeclared identifier is reported only once for each function it appears in
/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c: In function 'create_symbol_addr_search_index':
/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2228:78: error: 'STT_ARM_16BIT' undeclared (first use in this function)
 2228 |                     if (type == STT_FUNC || type == STT_ARM_TFUNC || type == STT_ARM_16BIT) {
      |                                                                              ^~~~~~~~~~~~~

Fixes: 81802e263a12e173e0e1028449d1e1e11b2e5974
 - http://autobuild.buildroot.org/results/8388acf59689ed7e621bdf158483e3df1cf9bef7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...tcf-services-tcf_elf.c-fix-x86-build.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch

diff --git a/package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch b/package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch
new file mode 100644
index 0000000000..5f08fa485e
--- /dev/null
+++ b/package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch
@@ -0,0 +1,60 @@
+From 0a847ca035113540ee44d17f364bf4701fe78355 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 1 Mar 2024 22:31:05 +0100
+Subject: [PATCH] agent/tcf/services/tcf_elf.c: fix x86 build
+
+Fix the following x86 build failure raised since version 1.8.0 and
+https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/commit/8df5540c53b862d516ac25f908c2fff4a547b4a6:
+
+/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c: In function 'unpack_elf_symbol_info':
+/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27: error: 'STT_ARM_16BIT' undeclared (first use in this function)
+ 2079 |         if (info->type == STT_ARM_16BIT) {
+      |                           ^~~~~~~~~~~~~
+/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27: note: each undeclared identifier is reported only once for each function it appears in
+/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c: In function 'create_symbol_addr_search_index':
+/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2228:78: error: 'STT_ARM_16BIT' undeclared (first use in this function)
+ 2228 |                     if (type == STT_FUNC || type == STT_ARM_TFUNC || type == STT_ARM_16BIT) {
+      |                                                                              ^~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8388acf59689ed7e621bdf158483e3df1cf9bef7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/merge_requests/1
+---
+ agent/tcf/services/tcf_elf.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/agent/tcf/services/tcf_elf.c b/agent/tcf/services/tcf_elf.c
+index 1b3900ec..b0b948e4 100644
+--- a/agent/tcf/services/tcf_elf.c
++++ b/agent/tcf/services/tcf_elf.c
+@@ -2076,10 +2076,12 @@ void unpack_elf_symbol_info(ELF_Section * sym_sec, U4_T index, ELF_SymbolInfo *
+     }
+ 
+     if (file->machine == EM_ARM) {
++#ifdef STT_ARM_16BIT
+         if (info->type == STT_ARM_16BIT) {
+             info->type = STT_OBJECT;
+             info->type16bit = 1;
+         }
++#endif
+         if (info->type == STT_ARM_TFUNC) {
+             info->type = STT_FUNC;
+             info->type16bit = 1;
+@@ -2225,7 +2227,11 @@ static void create_symbol_addr_search_index(ELF_Section * sec) {
+                 }
+                 add = add && type != STT_GNU_IFUNC;
+                 if (add && file->machine == EM_ARM) {
+-                    if (type == STT_FUNC || type == STT_ARM_TFUNC || type == STT_ARM_16BIT) {
++                    if (type == STT_FUNC || type == STT_ARM_TFUNC
++#ifdef STT_ARM_16BIT
++                     || type == STT_ARM_16BIT
++#endif
++                     ) {
+                         addr = addr & ~(U8_T)1;
+                     }
+                 }
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
