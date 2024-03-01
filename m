Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D2AC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 18:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10951838CC;
	Fri,  1 Mar 2024 18:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6M9eCVScoXFI; Fri,  1 Mar 2024 18:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 390C083A75
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 390C083A75;
	Fri,  1 Mar 2024 18:36:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25A791BF354
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 538F883A75
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:36:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yERo3glRsEgp for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 18:36:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 748C2838CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 748C2838CC
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 748C2838CC
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 18:36:37 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-412bfacd146so12313605e9.0
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 10:36:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709318195; x=1709922995;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RQzofy6qhrMrhMw0HUdOrkzggDKVFipk2axdo5zKbe8=;
 b=kXSM5n+hQx8Es1hyjw7SFlo3g+q7c8EUoGXytkQXvYyxoZIzeXWHn+2lLufSBEttFt
 5tk6bL3uZ7VYSrH3/u9gN6p/tH0a5VeGpqdxKPcyanbULOWk+Lk8oO9UiTZ8ELJqdYHb
 TChTmiPFdUY6PUO1CXRrStu2SzpPCCy2d/F0/4jHzNqKA/9ZYpbA1rHZhmKEXfCQb51P
 ffqLkpzivbXm1gHpONumUUPezHiyQ6/h1MNmipJRrYvskuHAVcgRzNu6fAvJOF+g57Aq
 G+EERcCdPSsrXfse0f74L/Zy5VgTnL+NUrDi8A5EWpQ+fATw6rdD5NPgx2NRPtThb2Ie
 aLAA==
X-Gm-Message-State: AOJu0YybaQaRKF8TPoDi0lGplf1OzFjtN6bXUKrLXaiBsyCmW0GGn30Z
 wqJ0ljhHKhysEfFPVxLMrgVZ3jDeo0l7A77CAjKKWqh+39NdYp7rch4D8OnV
X-Google-Smtp-Source: AGHT+IE0M/+1Y3GSLIT1LCOrzrKWkFWs/Dk6W3UTtjWC6SixWd6qsQH3RGQDTYj/xDlqn6RA5sDbkA==
X-Received: by 2002:a05:600c:3108:b0:412:bf3b:ceea with SMTP id
 g8-20020a05600c310800b00412bf3bceeamr3373186wmo.16.1709318194836; 
 Fri, 01 Mar 2024 10:36:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s16-20020a05600c45d000b00412b67388f0sm8512930wmo.6.2024.03.01.10.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 10:36:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 19:36:29 +0100
Message-ID: <20240301183629.810494-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709318195; x=1709922995; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RQzofy6qhrMrhMw0HUdOrkzggDKVFipk2axdo5zKbe8=;
 b=mPDzhfXMCebVhKh4T61iNg6TwQA3WRJ1Bh+Otadv8liDqjbPCsN0w1Cxb+vHC36+WP
 j3sKM5FErQpfgiIeVIaEHk7Ax31YMjV48Z8DrpMMTwTXohYoVpx7V1xBuDZJqGT9hdNr
 +K+Gutpn9rkZvhV077n1R7ZvB52eD8hAN3WQ4YEGUybUI6RkSWDJ+JWfR8aG/0Qt+POc
 2PP9p09pnWUTcNWLuWbggNAWiqiK+kas/JwX8DOtrSTQ2bVi18gBvbz/U1wS+OEeregW
 2cd2vvtym/XeTjRt81BgAuJymlvbHILzsNKEcECgr37in0C7nT9XZ/suVBFRayMESbld
 71ZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mPDzhfXM
Subject: [Buildroot] [PATCH 1/1] package/newlib-bare-metal: fix legal-info
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
Cc: Neal Frager <neal.frager@amd.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hash of COPYING.NEWLIB is wrong since the addition of the package in
commit 3b95ff658bf4859eb5cffd28cbbedd1826fad9a6:

ERROR: COPYING.NEWLIB has wrong sha256 hash:
ERROR: expected: 422aa40293093fb54fc66e692a0d68fd0b24ed5602e5d1d33ad05ba3909057e9
ERROR: got     : 9a59b4ee3af067045fe0ea78786201c42d54756fe48cbccf44f3dfc398474717

Fixes: 3b95ff658bf4859eb5cffd28cbbedd1826fad9a6
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/newlib-bare-metal/newlib-bare-metal.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/newlib-bare-metal/newlib-bare-metal.hash b/package/newlib-bare-metal/newlib-bare-metal.hash
index f8c553cf86..827925373e 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.hash
+++ b/package/newlib-bare-metal/newlib-bare-metal.hash
@@ -5,4 +5,4 @@ sha256  0c166a39e1bf0951dfafcd68949fe0e4b6d3658081d6282f39aeefc6310f2f13  newlib
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
 sha256  f3b7f3e4426b1fa6f60198dae7adfedd94b77b28db2d108adc0253575011e0ff  COPYING.LIBGLOSS
-sha256  422aa40293093fb54fc66e692a0d68fd0b24ed5602e5d1d33ad05ba3909057e9  COPYING.NEWLIB
+sha256  9a59b4ee3af067045fe0ea78786201c42d54756fe48cbccf44f3dfc398474717  COPYING.NEWLIB
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
