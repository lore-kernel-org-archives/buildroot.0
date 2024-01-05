Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CF1C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 17:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7D9B83D6A;
	Fri,  5 Jan 2024 17:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7D9B83D6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJO9tthx0U4q; Fri,  5 Jan 2024 17:54:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08F9183C5A;
	Fri,  5 Jan 2024 17:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08F9183C5A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C266E1BF3CE
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 17:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BED76146E
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 17:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BED76146E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DwVMPCQxzVdY for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 17:54:49 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A84E61431
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 17:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A84E61431
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33748c4f33dso1485036f8f.1
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 09:54:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704477286; x=1705082086;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+z16tBudqK2s+x9JhV4se7mckAqy852C9B5tSHFyrhQ=;
 b=Ylz6bcWZX3S0xFhv/L6xPzgyiqwB6felvcn/4uOUL4ITmZLDlj36WGRNXrXdUVPKtT
 OiVyLz92SHzTfj8k7nj4plheEetREX5nnBFETtCqxJRkHO3b0njGVORRU2K9gB8aQEit
 K4k4yQgO9qDLSg0zxCuYAu7bpcI4q1qmpiePxP4SDuWT6y5jRYiVMhX1TWEDBBPa8xmJ
 Ig29mPgL1sqqBA6fUp+erKxMdhaggGX7EkrknkINZDM3GaSEC6ZbKDsjopFkwPOJkrih
 rT37hWhkdS7/n3vPc9vg0rGpVpO3skcWn2J7X83GFnkrwFVMFCDtslyFcfqfONk4DUs0
 T+jg==
X-Gm-Message-State: AOJu0YzG3W+tNxxfC7bk3wgEV8sm7ksD/94d1+pwYbvDA3Blz4XmJWob
 j58ZYITmTn61uPLQGzUqQHwGNNdwzLA=
X-Google-Smtp-Source: AGHT+IGEb3cBq0MfwJu5cI1c15CneRLPTZ3Nw+PTsLctqc2JggOGuFJrfnheHHVvIylnoxPmKVZLnQ==
X-Received: by 2002:a05:600c:b8e:b0:40d:6e30:1d6e with SMTP id
 fl14-20020a05600c0b8e00b0040d6e301d6emr1297334wmb.87.1704477285784; 
 Fri, 05 Jan 2024 09:54:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j26-20020a05600c1c1a00b0040e3804ea71sm2266417wms.10.2024.01.05.09.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 09:54:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 18:54:43 +0100
Message-ID: <20240105175443.738516-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704477286; x=1705082086; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+z16tBudqK2s+x9JhV4se7mckAqy852C9B5tSHFyrhQ=;
 b=jgnYB0MJwovfEOwDpF+CwcqBpcgfIB0MRFrC2QHijH0Gp3uOMIcGjtNCNlhob1IL5O
 eRC7DXEDjZ2v772sGWqu5qo+L4m+m8dPFaeIm0GLsPmCZr4JVjfgxpVfrtsXjElfee8b
 yB+2goDptxCmp7hHPyGFOlJkDvGC0IJqzR7Wce97EKPWacCg/8ow/GomuxXIBKCDCpkB
 ktYs1WzmBoILIdSnS9QyQWe+LSe6g9UtkRLiLISJHgsW7BBspsiGFpKNlGcisIfnE9vL
 dN2yQsUan2tnI/zgQYCW59xe+u0V4K3AVZ6Kz35UWXQuI0kH4GN/yNJ1m4sALh7/OvhZ
 9kJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jgnYB0MJ
Subject: [Buildroot] [PATCH 1/1] package/tcpreplay: bump to version 4.4.4
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

https://github.com/appneta/tcpreplay/releases/tag/v4.4.4
https://github.com/appneta/tcpreplay/releases/tag/v4.4.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tcpreplay/tcpreplay.hash | 4 ++--
 package/tcpreplay/tcpreplay.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index 97c2e7ee34..e73e2d2c57 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://github.com/appneta/tcpreplay/releases/download/v4.4.2/tcpreplay-4.4.2.tar.xz.asc
+# https://github.com/appneta/tcpreplay/releases/download/v4.4.4/tcpreplay-4.4.4.tar.xz.asc
 # using key 84E4FA215C934A7D97DC76D5E9E2149793BDE17E
-sha256  91585c247b108ed3c10d3546d18f6a467d44229c9988c97736f953af69a6f438  tcpreplay-4.4.2.tar.xz
+sha256  3ff9753cc43bb15e77832cee657e3030dbcdd957fa247e6abacc605689e24051  tcpreplay-4.4.4.tar.xz
 sha256  07cf5e92d475287a7d1663b33097f40cae5adf03ed8920fcd4374e3dfb48c8ad  docs/LICENSE
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 65eb908932..c5b3f9baa4 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.4.2
+TCPREPLAY_VERSION = 4.4.4
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
