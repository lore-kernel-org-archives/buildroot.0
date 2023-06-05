Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F04FC77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 19:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D08EB81D46;
	Mon,  5 Jun 2023 19:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D08EB81D46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epDoFpNyYvmX; Mon,  5 Jun 2023 19:53:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09F2681BF4;
	Mon,  5 Jun 2023 19:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09F2681BF4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51BDA1BF400
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 19:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 231CE4091A
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 19:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 231CE4091A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g8GINrINTVZh for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 19:53:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C13D040918
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C13D040918
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 19:53:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f78a32266bso16199115e9.3
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 12:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685994831; x=1688586831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f1LPNREkHcDVOJdfiFpkSAja/9zuwAvkP+hzQLku/Oo=;
 b=OOMCnMUYQzp4QZnEeBs3QBmM2Tox7RTRzkZBzpFSeVPItsuESz8dQV4btgDfZ3ZIkY
 bzrr2FxmvYdVQ4hw87MS9vOoPF0Ffpj30TfWfYXPL820+X68dY93fY/2qSKBLyKbcmwX
 D1xUBoOFuBKDHJxyVi1C8PRqRDzgndoBFVEgyAbnHV91yGhya3cZsq25oXsR4xDoZ+Nu
 uyOy4Dv3jVdip5nRbqyrAnC9q8OVRLShU3ag2MKyYIMZgjr1xpo2RYCxacfRzauGIi5n
 mhBErJuf7v2B4xv3rcDgOT94GlJUXFgh3kUNzqECCMfzP/SvrvmI+FqSrbg/RJsHXag9
 6khA==
X-Gm-Message-State: AC+VfDxHmixceW4/HkQCWr7lTZ2IMaF/lmIKsMHBuvn3DdstFMxSPhhd
 e5CWEpGnCQnWbAEq1Y32YTHFTmOMiHI=
X-Google-Smtp-Source: ACHHUZ5nPQJ7USlV/qWBu1GYr+3+yZT9cjYeahKlLktZg8Zrs9dm03fnm1jnw6xcPb4YfbbJHZ4UTA==
X-Received: by 2002:a7b:cd8f:0:b0:3f6:984:4e43 with SMTP id
 y15-20020a7bcd8f000000b003f609844e43mr227671wmj.21.1685994830482; 
 Mon, 05 Jun 2023 12:53:50 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f60101074dsm15419674wmc.33.2023.06.05.12.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 12:53:49 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 21:53:45 +0200
Message-Id: <20230605195345.728177-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685994831; x=1688586831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f1LPNREkHcDVOJdfiFpkSAja/9zuwAvkP+hzQLku/Oo=;
 b=bVWOUwwKxhEn0HCSCLm+4ArnAtQ4zphRSCn1FKnTweLieOePCNRiRsyd5JIKME2xE5
 xtQ9QtyfM3qlmcE+jRBP6yLO2YAFlRiAWhwzn9iiCNvKdke/L8cWbm0QOxrRnyur1GOY
 2OiCH2JyI3prvNZUViR3Ih+gEvb1ltfCi1EmXiTxXeo/OOYZ73pr22xLGbY50AofCzDs
 R0Xql/wLxHHHdC9n4MjE/uu99qLdpA01eiE2zElk7Ha3PmPTUXbtIxrMB0iBlNS/qg5A
 KIEMDBS3udA/KC+2vTVY8g3bZvYLrwMzq+HHDnLc+uxMZi7UsTsx3F0Pzu4PDMP3RMdJ
 Oh/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bVWOUwwK
Subject: [Buildroot] [PATCH] support/testing/infra/emulator.py: fix typo in
 comment
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Artefact (British) and Artifact (American) are both valid spelling
but ARTIFACTS_URL is used in the emulator code.

Surprisingly, the url actually use "artefacts"

  http://autobuild.buildroot.net/artefacts

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/infra/emulator.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 53876f828c..02cf486128 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -20,7 +20,7 @@ class Emulator(object):
     #
     # kernel: path to the kernel image, or the special string
     # 'builtin'. 'builtin' means a pre-built kernel image will be
-    # downloaded from ARTEFACTS_URL and suitable options are
+    # downloaded from ARTIFACTS_URL and suitable options are
     # automatically passed to qemu and added to the kernel cmdline. So
     # far only armv5, armv7 and i386 builtin kernels are available.
     # If None, then no kernel is used, and we assume a bootable device
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
