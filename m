Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED77C433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 22:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1045260AD1;
	Mon, 17 Jan 2022 22:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M10i8oD3ABW3; Mon, 17 Jan 2022 22:32:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 482E160AB3;
	Mon, 17 Jan 2022 22:32:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6801BF37E
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 22:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79A6281310
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 22:32:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AA0XMeYHkWNC for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 22:32:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C89E81271
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 22:32:03 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 g81-20020a1c9d54000000b0034cd1acd9b5so1329831wme.1
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 14:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E0zRntO8JEN2JXSVdwGi1L0Q+NSbgQka5Udr8a0LzQA=;
 b=JUpayfLB2+wwBHdHaDR1jBXR8AfWFxOrjAVzcwo/eHJwWJuEPTwU7wxOlAO+vgqdNg
 hpfKqRqT7QCu+rRes3Bl5vwnIr9ZKd3tKTFeGnRZ5/FDBOCsDBJzjjHbpUhASTUByf/Y
 HKwUUU3jqjnM9SCrOg/hJ/Vbc4hO5twVgCZwyw4hkX50zn6Hk4EVlOJUymviY7MjSYJj
 nP1l6iVD5bHQnTAofnssmEhPqAxN01fF05f6iaPXbXMnhJw0jkRzIUWae5NQdn5xuqb/
 BBcFrBGtbjPbWbFLqpZn7UnCiHN2d7zR/QG9zjLsBkcTMvH8nDmUN7M+aL6enCfwyDqd
 C/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E0zRntO8JEN2JXSVdwGi1L0Q+NSbgQka5Udr8a0LzQA=;
 b=h3PmRIF/gSRyeF+OL14QGcOq3GiQ7aYwDKvWJo4iSvwZzVovF070D83SbIPy87+cKG
 KkHPaXOgQn7lagKIyvq+4DAGjHwjszGgf77UvPiMt6akmgFtOmQj7WElsiOOcg1LYiZX
 t8oTyRuNDGxxODa6i58ehG/UnetfhPBqmZpK79sTTLRa4hRK6GoM8yU8J+xsU89QjR6R
 qbhOD15LEqJpBCUrl9RMeMMNt+V3oxJkNSq9y5rB1RBDHCwsXnx9A1XqiXP1KbOi+xtt
 I4Plc67TiTS/qAIZu/zr/DJ8sDUSWPCG87CgEa9QtQ4NkmWhgb02O89N69WVNZJhXn+2
 Uong==
X-Gm-Message-State: AOAM532fOuzHc59ldCLgHvTP4MGOtDqUwLbs77+aSgNYFk+emdEKMkuQ
 y0GbI+qhuiyQeHymfOWLTL1HOCDDjxU=
X-Google-Smtp-Source: ABdhPJwA9UlASB5fFBi6JwaL0KMA+bF3EEJGJo1W8gLuFLbVqGCkQggF8JPbGQRD/cis+26lq1lFCg==
X-Received: by 2002:a1c:7c10:: with SMTP id x16mr4782382wmc.35.1642458721420; 
 Mon, 17 Jan 2022 14:32:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id ay21sm799462wmb.0.2022.01.17.14.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 14:32:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jan 2022 23:30:26 +0100
Message-Id: <20220117223026.3567941-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libjpeg: security bump to version 9e
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

rdgif.c, cderror.h: add sanity check for GIF image dimensions.
Thank to Casper Sun for cjpeg potential vulnerability report.

- Update hash of README (changes not related to license)
- Update indentation in hash file (two spaces)

https://jpegclub.org/reference/reference-sources/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libjpeg/libjpeg.hash | 4 ++--
 package/libjpeg/libjpeg.mk   | 8 ++------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/libjpeg/libjpeg.hash b/package/libjpeg/libjpeg.hash
index 4f0a677d04..1a2e82caef 100644
--- a/package/libjpeg/libjpeg.hash
+++ b/package/libjpeg/libjpeg.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256	99cb50e48a4556bc571dadd27931955ff458aae32f68c4d9c39d624693f69c32	jpegsrc.v9d.tar.gz
-sha256	3dc4e4a145c907a96bd6a0e40be3f722fecf061951909143cdff5365cba9c78c	README
+sha256  4077d6a6a75aeb01884f708919d25934c93305e49f7e3f36db9129320e6f4f3d  jpegsrc.v9e.tar.gz
+sha256  50c1c5978d490c7f13062d91c4b89affc83774f87bc4568a714f748b62a5b216  README
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index 6b55aba7e5..caf7f05f44 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -4,12 +4,8 @@
 #
 ################################################################################
 
-LIBJPEG_VERSION = 9d
-# 9d was released 2020-01-12, but the tarball was replaced upstream circa
-# 2021-03, causing hash mismatch. Until there is a new version released,
-# use our cached copy from s.b.o.
-#LIBJPEG_SITE = http://www.ijg.org/files
-LIBJPEG_SITE = http://sources.buildroot.org/libjpeg
+LIBJPEG_VERSION = 9e
+LIBJPEG_SITE = http://www.ijg.org/files
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = IJG
 LIBJPEG_LICENSE_FILES = README
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
