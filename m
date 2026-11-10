Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB41606A321
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 11:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z2x/Xw1e
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36E67810FD;
	Tue, 10 Nov 2026 11:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1FXTFHdWeZiR; Tue, 10 Nov 2026 11:29:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BFAAF810FE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794310173;
	b=DL3S0iY8/O4kb+1ruWrzxwOTFyDuRkS0jm/iPKgBi42M+edNLCVGWMgKq7BXLn3+U0R2
	 Unlmp9+mVe1ylRq43fSpn1J01oFJLq7VkPPUJ9nGVsc9FLCy50x0YtP/gbEdLsrtJtIzM
	 +Z5RSlttMmOASLMCkmZDj9ZN7ZWGR52HiuAQgiwIo5COT1LY1DomJfZjsYsCba4btUnab
	 +Ou20CTk2Dm0F91zVolYw/79VqtR3R+TMnIxojFUa2Av2k8zffnubUccG10xvjqH7NwAx
	 EeKYnXC0YWH5rulBhJkP75artucHRlwfoomQvqBHFZvHRGUrDNmQ6A+CA4Z17jshhSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794310173;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NEIrQ/RnyMRA0U8ZTCimTxSt5bsxKLwui3ileG/m1iY=;
	b=ekyH8BNJqW+tJGBOscdqiMtiHsN20gDfnv1xUdP+JaKgVCCGArW3uDYkZ7XhkXhNi7rY
	 WY6DTsmnvQF8hxxfw3yBYUWW21E6YlPBwTJJ2rRQ4KKcazL37jKxi9o3c1Q25smfmdN/O
	 OOLMoZyuNqgyZz47rPAfpWfHj1LhWgvp40r1XvLqLIotRe4icbuE+OgfDQvyDW5D6KeW1
	 q32YrZSBzmz+ccHESveBRCqu1x496vUrkR99WxMti8hi8V6fI1JYp8Vcv6IEkajfE/nZ6
	 IqLqi+6X1ahgPF9oyFVjM6DC6AwMnsw6lRJVcvqyPatBOGssvZV1/Q4OeCQm1bmTgfg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794310173;
	bh=NEIrQ/RnyMRA0U8ZTCimTxSt5bsxKLwui3ileG/m1iY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z2x/Xw1eGpbPrnLYjuUaYft5XNBtdWjxoz/IpQcU0x6JN8lxZ/RU6RCiWkgpMd2SC
	 VKF9aLsPqztGg8acq1d8QHoqdkNG8yu+rwK9Mx9/dyepargcmnaT6swA5rh83o0k5P
	 aNb4sW/CkF49lcTsIl5mmlNEv1TwhdZC6f6kKJGPEivdYHkWdWAIYX7A13PJsFrjQW
	 Dvrylb4uWus8+DUN/9wMr5KdE9SQ0m3dYnlnGKVjMzic6uxEvDwlUcCz2kzdo7iE/8
	 jwtokNrwMur03u7B5r6j2Fvsqqkdv0Yq5gX921vLUB5rngGosjivBgdTSZB1c4s8Gr
	 1KUtmdDFsCAAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFAAF810FE;
	Tue, 10 Nov 2026 11:29:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A09DAF2
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 11:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76BD4810FE
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 11:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50JGIPG0wl3R for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 11:29:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 43432810FD
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43432810FD
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 11:29:30 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c505c561fd5so25921466b.1
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 03:29:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794310168; x=1794914968;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nkNcQR8zVIIIh5ggkN1M6hOAVmAbq/Qil2r0gkRY3wM=;
 b=UXM/u8igG8z4Yx24XpCCo/nkwjBG6oFyO4OtrFjjKL3t9phr8CvejToadpYUtu0lw9
 8el/KLCccC6nz62q88cgmMBc47FiUVwIqLDwqZIGclQIiTzXvLudr0dkwbBLu1jT/bye
 GKnoGOFdiMUut0chEUGkOUsV4oKkHr5SyDcYfLbSpXci8e3I1AaHLmLE8Oqym4mYnWwq
 VbCfFd12u6bTcv+d79ggO42V/evyGh1MPZ4OBHFx3JSSCS55lhpfrlgH9SDZi77OP2A/
 36eQ5A9lM5XSbuXd7M3s0l8KTHYCnhLj8qQtG+y7QYrLT1afM3LW6uiTTxiP828wexK5
 PpNQ==
X-Gm-Message-State: APuU4Z+ugqEL2wBOSAT31+vKEiKpmmDGPhI5vQwu6yUDKXOJt1VbjUGM
 ZGnzXlRsyeIoW3tfKx/h5EX0by6imaSy8RFUEZz3tJkzWQ/MefSyHL40WbUMbw==
X-Gm-Gg: AYBFou25ZW2GM2tDMVNfC2+DBIdSchJG17gICo4k9SWvtEpUjOm+z7viZyBfoiZeUde
 U8CL5oreVOu9+atg2tF4nVoa+GteppxoLbKRT67dny2mcqShzZBaUJozoqccfbLzX0yqr9mOYzA
 QlhETPwUtRSGDH44M89fC1/7AN2tH+hjZ0Hedt6Q8VUucXOsulUJ3+yOaeWpX2ZB0CdYyKKYoAb
 /UMH1bWgmbsTopiU8+InEQwT6F5EQfmRUsAhQsCLKf5EwNoS+wdo0UTwsX4ktyz0utia2G769rj
 h/qwGrXVjEXt2m3kz/sAqZ3MTdcgueRHXG7G4alfegLkYpTvShgSwa7YN4bD3rRToS+Vr9TjamX
 XzG2LQGCUphDtF+k1iQ3wpucgXogzpFZzNPAwdnennTTkaBjDru9FiFPx6y6qawSJ3pAQOgQ3HE
 vM/zq92ImbiIdsARNONJBua5VrKofJeWpc/v7xR1HdfB9GIed2f+an2hi63SlPC4TZA85I1MRXd
 ZEUqzxT5tOc4Uq+gwPsIBTwxK4YP5F9tdWbIr8vdf52agy0BORoS+ax5/RWJFtOBcTobPPoQl42
 hWV+ZSfG8LrT8rTjDKDEiTnvYx8KK0nB9YmZeV3uIHYMB9MZAXXWaB0ryzNoDJIRjIxwOQ0HDT4
 VFProR8nG
X-Received: by 2002:a17:907:9404:b0:c34:83c0:b92b with SMTP id
 a640c23a62f3a-c504953f507mr181163366b.23.1794310167587; 
 Tue, 10 Nov 2026 03:29:27 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c504a693e82sm97668866b.83.2026.11.10.03.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 03:29:25 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 10 Nov 2026 12:29:24 +0100
Message-Id: <20261110112924.1662842-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/shairport-sync: bump to version 5.6.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Bug fix release. The mDNS sources moved to a separate mdns/
subdirectory, which only affects the upstream Makefile.am.

Release notes:
https://github.com/mikebrady/shairport-sync/releases/tag/5.6.3

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index ed30ad50a4..9dc0a208a3 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0747706e19a64ec550ec8a6a5c26bf8e231a4d032de31644f5a5daa0632c41c4  shairport-sync-5.6.2.tar.gz
+sha256  670f9cefdb9c2d70f7df71890e63ab0a31d08a815dd0734245d935bfd01e766e  shairport-sync-5.6.3.tar.gz
 sha256  5ffb12379c3293e48010d0ed04185940e107b54e48b520d58d847da53a153c33  LICENSES
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 0d0b4ca404..d2f6f3a8fb 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 5.6.2
+SHAIRPORT_SYNC_VERSION = 5.6.3
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
