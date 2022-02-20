Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F6BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 20:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3928840353;
	Sun, 20 Feb 2022 20:47:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a4vRVXCNgv_a; Sun, 20 Feb 2022 20:47:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CEE240355;
	Sun, 20 Feb 2022 20:47:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75C961BF4E6
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 20:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FB36400C8
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 20:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9N8hyMr6rNZ for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 20:47:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 413B14013A
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 20:47:29 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id n8so8406824wms.3
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 12:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9DoEnH+wrYQTfGW8MKjMFhv4aQX/3FWSJBijdh7hzWc=;
 b=p+iF8pqkOeMFQCgNxGh1fOdSbvWk02b+7R1yRa5NekAHGkAR6sd+PRmiqWu1hnGhWu
 9ns2rzEN1FBJ1e08t92rgtz/0JvJ69AGAAAERdqqvYvYT6YWhIPy6fjN/G4mvRvjPBX9
 MwRnR0oCUQDw6YfjG9ipFncBSKZzuQGBEdMSvoJazVWGDaefKL5BZOh7K0pDLZZC6mEb
 scHMnPY25h/KPx6dd9ZoBAZLwjwzo9utYuhCpBRV71ASCHfdkmokBNAHSQQ1JtseyyrA
 LzbqZVBYeJbY1ll1y4CM+EdOQ6AssAwLWJ+HKpm6FO81UGI2fS1dOxz9NiKLH/WzKHpI
 8haA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9DoEnH+wrYQTfGW8MKjMFhv4aQX/3FWSJBijdh7hzWc=;
 b=mMLxeKjhshkOPwLpod/SSWITdTCVJhuf8O0OKoIWbI8Qf1OWxDuawC0iOJVa/vM8bV
 fSm3nWsL1Hhwj3+AqDFDUBDL5oO2/FJdiQKBnrfTZAswoZ/DYpxHsIpWrZ5X4ihhh19v
 n/PCVT8L5XOlhcyJYu0+1QwifEe0QWuewt0icb3Re4gdfS4d8OLg5dvgRdnBxTSPLf8F
 fhjsT2j8O73JFmnnCyVIyUsaBlHFzo6Ew4uNChqxSo8iO9f7ClLvva74u0VbYxmV7V5w
 4QjBzUTny8QzHfX60kLAebUEUSOzdO2Ff6H8SkPlO2c8bUn+sSywNhYshz7+Fo+F75fQ
 aJaA==
X-Gm-Message-State: AOAM530WuLZUCz8AldQwHiTz3Bsd0APvNUMlcl1Dx7stTYQHETNlnEJn
 dX68WEDj36IDjl5adGkEB54ZGGf2j7k=
X-Google-Smtp-Source: ABdhPJzKuEqU1X9jknBzNxAJK+VBnAVJsvlQ44MoI1anjRGmO5MsmoZoXOunqjNcmChz6s4NJqleYA==
X-Received: by 2002:a05:600c:898:b0:37c:30b8:2f with SMTP id
 l24-20020a05600c089800b0037c30b8002fmr15357728wmp.27.1645390046909; 
 Sun, 20 Feb 2022 12:47:26 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c190600b0037c3659a12fsm6710670wmq.6.2022.02.20.12.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 12:47:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 21:47:22 +0100
Message-Id: <20220220204722.1737731-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/expat: bump to version 2.4.6
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

This release fixes a regression introduced by one of the security fixes
in 2.4.5.

https://blog.hartwork.org/posts/expat-2-4-6-released
https://github.com/libexpat/libexpat/blob/R_2_4_6/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index cd2e8c7fb9..0d9f60931f 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.5/
-md5  9dc183e6c1eebc1b658c1e71be0885e1  expat-2.4.5.tar.xz
-sha1  360a49b55c442e91cb7b328bc0335083909ddf4f  expat-2.4.5.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.6/
+md5  22a30c888752fdda9f8dd1b7281c54b0  expat-2.4.6.tar.xz
+sha1  26e223c4795c242814b0e3299a5027c22b9dc733  expat-2.4.6.tar.xz
 
 # Locally calculated
-sha256  f2af8fc7cdc63a87920da38cd6d12cb113c3c3a3f437495b1b6541e0cff32579  expat-2.4.5.tar.xz
+sha256  de55794b7a9bc214852fdc075beaaecd854efe1361597e6268ee87946951289b  expat-2.4.6.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 7815d61027..c481b5c225 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.5
+EXPAT_VERSION = 2.4.6
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
