Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0604C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 07:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 913A440ADE;
	Thu, 16 Dec 2021 07:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8oHCp7sCGRA3; Thu, 16 Dec 2021 07:02:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97C3240AD1;
	Thu, 16 Dec 2021 07:02:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A6F11BF40D
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 07:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3864240AD1
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 07:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gqKRaTduwTwO for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 07:02:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30F9940ABE
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 07:02:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v11so42271492wrw.10
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 23:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Qc3CtjwHaD9v43gipEG8tN6PGZYfPFrf3LMlM2rtwI=;
 b=MhGx9ggpMhoMaynRzwwbQWKJc4/h5UGjqSlOlYmT+MyQi5Q43QS4ORIBBACBjQGGIp
 GMidIPKfI8D/7FV20r4RrhkoE1r3IdHFZj7j+MuqnQ3tNxfxX6ZeL5zojQUgAHoyezhb
 ZZNdNSYoB/BgDVM8tsDfow5MXdLql8Z/5qeUxAgEWc1BC5LFFlWnid52OR6/MqFpUoLC
 lC50kBS+5IzxA5n/GOJDeu9DTuIC3zS60h/r4+JqXGV1PIfst2i2B2fcqA/GdLzH5epg
 hOKIcnjDBAjtAbhjyws03ZYpNGBrMpwxUxZvQReZbiFsBohM8jZJuVtvOkdTD4PuQN0i
 NnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Qc3CtjwHaD9v43gipEG8tN6PGZYfPFrf3LMlM2rtwI=;
 b=dtWnrsybQZ8+vIcn+BUdIDV5ySyhC+6g7XMPCikXGS28mROQNS6eieICJP1021zDE7
 Nz1zg9gBCUMtgKbLQ1mvqvKXv74dyBZcMPEriMNPrhqyVgDfT6rnWyFZNOs1+TjSxU/h
 ZhPOMBIZRNPKOXW9Siz7d/xiM4qMR9hkkHiriyIz5g/wxgGd3glqJTh0PlAPrdc/gimn
 0XnENSO+vcAB8vDyYhs6ZH68grOMoyaCNeMeC3e6gHZAKC/6pXZeMJkYV86v25zEcs7j
 iFamv714osUrTBLovU85Xw+YHIydnBWCsp6VujuMQUsUuzoekZJNKtCMg4vDAvZkvHDE
 6v3g==
X-Gm-Message-State: AOAM531sRueN3gh+RHsFlvWogxotOzTZhPj10PgY1e89wu0PHxRquJC4
 fETaBDIPeYVAU4tWzfzvynw4Zps6/z5dWQ==
X-Google-Smtp-Source: ABdhPJyQlmUTNLicUHEkp3WnDghLXaCChVsc0qPwXTryD+CrjTLe5LGk0REXqtwlLeumw9vGFmKp2g==
X-Received: by 2002:adf:da41:: with SMTP id r1mr7814449wrl.443.1639638150119; 
 Wed, 15 Dec 2021 23:02:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id n10sm3801452wri.67.2021.12.15.23.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 23:02:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 08:02:01 +0100
Message-Id: <20211216070201.113909-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lapack: security bump to version
 3.10.0
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
Cc: Benjamin Kamath <kamath.ben@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2021-4048: An out-of-bounds read flaw was found in the CLARRV,
  DLARRV, SLARRV, and ZLARRV functions in lapack through version 3.10.0,
  as also used in OpenBLAS before version 0.3.18. Specially crafted
  inputs passed to these functions could cause an application using
  lapack to crash or possibly disclose portions of its memory.
- Update license hash, year changed:
  https://github.com/Reference-LAPACK/lapack/commit/f67034373ee2972b4ea5de5a3d635b30ad3026c2
- Update indentation in hash file (two spaces)

http://netlib.org/lapack/lapack-3.10.0.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lapack/lapack.hash | 4 ++--
 package/lapack/lapack.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lapack/lapack.hash b/package/lapack/lapack.hash
index bac7210c29..6f6dbff1a6 100644
--- a/package/lapack/lapack.hash
+++ b/package/lapack/lapack.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 106087f1bb5f46afdfba7f569d0cbe23dacb9a07cd24733765a0e89dbe1ad573  lapack-3.9.0.tar.gz
-sha256 d56bd4441b999b80c88df04faf0d8b3d7d3b2bd781cf91242c4188e8a6d0f8be  LICENSE
+sha256  328c1bea493a32cac5257d84157dc686cc3ab0b004e2bea22044e0a59f6f8a19  lapack-3.10.0.tar.gz
+sha256  66246b7d3e6736aea46e63fd5e087659474d07edfe2f9b051d085d9b42aaac61  LICENSE
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index 41774f6167..f34f685ae2 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LAPACK_VERSION = 3.9.0
+LAPACK_VERSION = 3.10.0
 LAPACK_LICENSE = BSD-3-Clause
 LAPACK_LICENSE_FILES = LICENSE
 LAPACK_SITE = $(call github,Reference-LAPACK,lapack,v$(LAPACK_VERSION))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
