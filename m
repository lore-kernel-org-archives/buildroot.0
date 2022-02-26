Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB421C433F5
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 18:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77BA8404FC;
	Sat, 26 Feb 2022 18:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtOqH7tCurWS; Sat, 26 Feb 2022 18:34:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ED2540186;
	Sat, 26 Feb 2022 18:34:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D11271BF281
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 18:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9A0640186
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 18:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l75aGJxsN4Sk for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 18:34:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8814640125
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 18:34:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j17so9302492wrc.0
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6ALGlyvKRZc1rhozLwQEDD3lgHoK2wcu6S1QoY/DcnA=;
 b=A+oq1Les1i09x7NxysTihyzMPI9CdTyTL2Qmat8lZ/dVbiGTVRm71qn68k9oxfWO5p
 xCzFSQOZcTv05P1Cvcm49uWTRi/czWsr54GH6W/THK2Pt1e5aFdWyL7BUSo1F4FM6MWL
 CKVsAZE9rCXXtaflBMZXBeQN6prZ+ZBAJl0QgAb6WBTpIeGMPEzjqWAF2EOzmuSsDqvq
 W4J8JiXXqNHWg3Ipefa0qLsDLg5t38eHjbsqMk3PxVvlDK0AImdVIwDZqzFJNpivcYTb
 m5bQRVoyMbQnOUWQucQFhXtnTAUPkueSkz64IMldCdpejH6G3oZSjMpfhPcDbGf7UVth
 h26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6ALGlyvKRZc1rhozLwQEDD3lgHoK2wcu6S1QoY/DcnA=;
 b=G2+z+pugecYycZZ1RJloo0ys9bTE0FH6RFNxdaqwT5fywwnjicpkCwG+c2Z1uP9Hix
 JWp0/9CI1SarMSLb2Yun/F5cavme3ZJCXkN00G0t7ra61HrOaFsRphkUloUhsO4xoVtq
 YO85y/+ncxWXV/90beOwYXVHaIYl5OpvvwYkTCMm6alsgZxSVHSoezzhr7MFZ1YaZzTJ
 MCGzodeSb7JTBbp3/wHvK/Rsq7agMy35t5WrD74wIvRjmZigdFRnKclwuoOws4bLd5H2
 IhHA06QyKst3a/v6uURNhfLQFjTRhM5qHoQbDIJD/r+i6eEcIEeQUcYRigKoZ+xkPfzN
 8sdg==
X-Gm-Message-State: AOAM530rB6aYiZ/wzeFAAqZOPsHf/nWvakVL3GwdNR3jX0auq/8LUFSU
 O/cih0XvIPFENSy4H4g/v9NvApYm23U=
X-Google-Smtp-Source: ABdhPJxhwSh9IK4vEsquti1BPq/I6PqJzRviHSYQFXNdA8Lp6nExjJ+p6rHMgrT463PmBA1xbQA+NA==
X-Received: by 2002:a05:6000:50a:b0:1e3:5af:153e with SMTP id
 a10-20020a056000050a00b001e305af153emr10323551wrf.385.1645900476589; 
 Sat, 26 Feb 2022 10:34:36 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i12-20020adfe48c000000b001ef6eab4c81sm5114444wrm.96.2022.02.26.10.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 10:34:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Feb 2022 19:34:23 +0100
Message-Id: <20220226183423.3086505-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/exempi: security bump to version
 2.6.1
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
Cc: Ilya Averyanov <averyanovin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Extract from NEWS:
- Changes in v2021.08
  - Security Fixes
- Changes in v2021.07
  - Security Fixes

https://gitlab.freedesktop.org/libopenraw/exempi/-/blob/2.6.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exempi/exempi.hash | 2 +-
 package/exempi/exempi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exempi/exempi.hash b/package/exempi/exempi.hash
index 5ea9683053..5df610de17 100644
--- a/package/exempi/exempi.hash
+++ b/package/exempi/exempi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  52f54314aefd45945d47a6ecf4bd21f362e6467fa5d0538b0d45a06bc6eaaed5  exempi-2.5.2.tar.bz2
+sha256  072451ac1e0dc97ed69a2e5bfc235fd94fe093d837f65584d0e3581af5db18cd  exempi-2.6.1.tar.bz2
 sha256  3d3c3593c15e0d35bdae0df7c642106250f6be3adc61477419413900f23ae607  COPYING
diff --git a/package/exempi/exempi.mk b/package/exempi/exempi.mk
index f481469d2c..56fbe20379 100644
--- a/package/exempi/exempi.mk
+++ b/package/exempi/exempi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXEMPI_VERSION = 2.5.2
+EXEMPI_VERSION = 2.6.1
 EXEMPI_SOURCE = exempi-$(EXEMPI_VERSION).tar.bz2
 EXEMPI_SITE = https://libopenraw.freedesktop.org/download
 EXEMPI_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
