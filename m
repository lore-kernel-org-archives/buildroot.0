Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCBFC46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 15:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FB7E4028D;
	Tue, 26 Dec 2023 15:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FB7E4028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fUfIpSx7gQ81; Tue, 26 Dec 2023 15:07:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6473F4058D;
	Tue, 26 Dec 2023 15:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6473F4058D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32E981BF5A7
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 15:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A2F84058D
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 15:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A2F84058D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8Z9EdAqMhAK for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 15:07:25 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B548C4028D
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 15:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B548C4028D
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d3ae326f6so51599615e9.3
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 07:07:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703603243; x=1704208043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KO8fyIQKENf0+opCW0rZPrkWL+nYxZAGeHHDeyFDlJY=;
 b=BJ0UyTkTjqo5kEL9kKftga+Vro87XCyDPcJvQj4TzPVvSgfob0mORLcu6KGsPqCGRP
 IZfEPX4vwbD1Iucht3GRqtnqlgZhz9b1xkMCa3u3lqXmTAYsx3+EuAUtLog+z17NEknF
 pNSWFFXiUtCcDF1LnEYB0qxDj4q+7X01EI/Qiu2fT+0eqXG+podSZMC3c/JNVtVibH1D
 ULDsLfrn3ZvxFVXSWE6HmN7CPHltUHdcLbPdWHJb1mTkmSWMx+AY2IfB3DHghfYiFwcZ
 vve5BeNbTAvdK/eUHcnwS+2BdaiN05bSepuNTqcU1HgINcRvNJ3ncepd/qCiqiOyGsJ9
 J4mg==
X-Gm-Message-State: AOJu0YxOnu0nlp1BM89vHl5Imp2myj0RJq227eOHNVmWcQ8iLiIU1NeW
 4XfHSHQvb+QN6wN04vgxF/unx4ge3Yw=
X-Google-Smtp-Source: AGHT+IG1ND2w3sGNwNMJDWQYG/zpr+TXqdTfxyUhgaQjYAXUrC5HPa+ZnzfiTcKoiCk/OgovNcfGhQ==
X-Received: by 2002:a7b:c40a:0:b0:40d:5c85:43ca with SMTP id
 k10-20020a7bc40a000000b0040d5c8543camr120832wmi.29.1703603242584; 
 Tue, 26 Dec 2023 07:07:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fa25-20020a05600c519900b0040d5a401fdcsm2547877wmb.32.2023.12.26.07.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 07:07:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 16:07:17 +0100
Message-ID: <20231226150717.440864-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703603243; x=1704208043; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KO8fyIQKENf0+opCW0rZPrkWL+nYxZAGeHHDeyFDlJY=;
 b=mtDBuPFlsyqgZVb3ysY/XpC5pOYoOD3KHsncofvU6VBrs3Lv3e+LDwyQQZgFnypylB
 Jap/6t2sIuQOepG3ZiPmduN24DAEhvababEgJEnzUl+P47BSku0fBKfxzT4AAjVPWNHM
 WPvaMd3uqB7hiJNXAxQfHGsiBfGqGTC5N8n0kEi86rsvu8cvTII4pKW1T05QLNvu3JUv
 lBK8/NxKqh/hmY8xQtWPw4EnGLj9bV5MlVWVMBP08hbx/vWm549YHpHyu/Exe4vTWhQH
 awyRJCR7WbE6z+fgjLMyeb8qSB67b4aWuaqJOgKP6CtozL7CzymYVK9nPvqzE72Nnw9+
 dJLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mtDBuPFl
Subject: [Buildroot] [PATCH 1/1] package/libheif: security bump to version
 1.17.6
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

A couple of build fixes and bug fixes detected by fuzzing.

Corrects these issues:
 - CVE-2023-49462
 - CVE-2023-49463

https://github.com/strukturag/libheif/releases/tag/v1.17.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libheif/libheif.hash | 2 +-
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 6ea3ba6eec..a2ca065b7a 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  38ab01938ef419dbebb98346dc0b1c8bb503a0449ea61a0e409a988786c2af5b  libheif-1.17.5.tar.gz
+sha256  8390baf4913eda0a183e132cec62b875fb2ef507ced5ddddc98dfd2f17780aee  libheif-1.17.6.tar.gz
 sha256  b2eb4f6588b005bebac44cfb2dfd23f6a16c5ca9b8a619a315158b0215a917a3  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 419a864ef3..bd307deb7b 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.17.5
+LIBHEIF_VERSION = 1.17.6
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
