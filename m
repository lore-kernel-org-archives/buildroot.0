Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCC2C54E5D
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 21:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF4F760863;
	Thu, 14 Mar 2024 21:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QHEAJnGBA7Eb; Thu, 14 Mar 2024 21:13:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CECA660874
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CECA660874;
	Thu, 14 Mar 2024 21:13:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E684E1BF3E9
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D299A413A3
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WoSpn9cNBj2q for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 21:13:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 85DCF410E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85DCF410E0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85DCF410E0
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 21:13:13 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41312232c7aso15779905e9.0
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 14:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710450791; x=1711055591;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EgCKAHiwiRZBH2/hs6ZhJZBaahXqIyWpe17AYlSALnA=;
 b=Y7/2SJRJkBJPGWpIDP31Rd70w/ibPNG44bACZ1nIJyzV7YLw1ma+CGbwPei9tw8c3Q
 437GqaxduGP0LJ1H66ltAGq3UJBo1RsiH/wx9YptdJ3lcIVVy7xSbLwUFNkhWq8qMFrf
 MwxqGqpdFxm3p7hLhAHYKIWaP9HnOWvT7OSkwxhMvvfbcXamOP+/DxGNGpoZ337mEKUn
 VPRqlD8QB/ILiovmNWmE5CBQ+1QL6p8pJUxcYKfpA9QAfqzjdwjrKXm94qUVw6iCxk/3
 6f0og1e7TdoPm4aIe4b0fP86mUyXCVOFIH8OnUJooeSkMAEWqx1H2+60rxAI8CFGJllH
 VBIg==
X-Gm-Message-State: AOJu0YyS3uPiBAOiCvzmcJRQ64Ug0qEbxLODz9Fw4RyqfBK/ya0BArMl
 PvYOrO7GdKMFVub4yazXOHKl6BsPrFeHTxpF9P1xCir9LxobMgK3ZIzqAK4R
X-Google-Smtp-Source: AGHT+IERcR+5qeVqbTrAPFhS5ijnetklp6RQvuUAohkcaefYK4Hwq3w1T979jiusdtJnRJneogMp7g==
X-Received: by 2002:a05:600c:35c3:b0:410:78fb:bed2 with SMTP id
 r3-20020a05600c35c300b0041078fbbed2mr2551048wmq.19.1710450790451; 
 Thu, 14 Mar 2024 14:13:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 be10-20020a05600c1e8a00b00412f428aedasm6744814wmb.46.2024.03.14.14.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 14:13:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Mar 2024 22:11:17 +0100
Message-ID: <20240314211117.9103-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710450791; x=1711055591; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EgCKAHiwiRZBH2/hs6ZhJZBaahXqIyWpe17AYlSALnA=;
 b=HlBfzaisoZSWXQYU+Y4yXNQ9BVHlPsVXyIj2k/2KkFlFsaE+W4h1U+/ShmIKF8w6SW
 s5N/3ZMUjLoOPr79NbH/dgxBCL3iRwwlzXjW2pVOeL2GDdMb/ICtIJ85PQa4NWgmO2gR
 OjCtoXzHSvv4tgXU1dWz9mu5gC+gi6Hq0z+FwlTCt+JlghPkml4SFQstxV5Yg7EWPTRm
 f/5dDNGoR9Ux9cSQKcEw+TQ3q0bly/S1uFLmTy7uM1msfNhngvbdWN2JVknJwt9hulF1
 WvL0+QY8Svze0R3YgFUN4NWsxPFpX9XfIiUUh1C+q+DIPz76gz9i+4/Um4kCQpIRl5rW
 InNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HlBfzais
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: fix legal info
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit cc363e9a93484e734313b17962b931b3df6eedaa forgot to update hash of
README.md (changes not related to license)

Fixes: cc363e9a93484e734313b17962b931b3df6eedaa
 - http://autobuild.buildroot.org/results/d41b3eedb337ac7559afceed459c3e28a9bf15a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/multipath-tools/multipath-tools.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index 0f51c38846..c1f32e7a3b 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -4,4 +4,4 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1
-sha256  5887418b2e0e595da5aca08b2dff25298f20618f9894d5e26ce852d9d1ae90c4  README.md
+sha256  9c69bb0089aa0b82b10a25095c04a7c4aec6b5bbf0776b7129123c8459fe7725  README.md
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
