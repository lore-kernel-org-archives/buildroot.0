Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7737C10DC1
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 12:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AEF660D53;
	Sat,  2 Dec 2023 12:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AEF660D53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zf8RgPNmWLhO; Sat,  2 Dec 2023 12:36:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7DBD60AFB;
	Sat,  2 Dec 2023 12:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7DBD60AFB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA8F61BF299
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 12:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 915C68472A
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 12:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 915C68472A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oFqS7i--Peeg for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 12:36:17 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C43CD84728
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 12:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C43CD84728
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c9c18e7990so39847821fa.2
 for <buildroot@buildroot.org>; Sat, 02 Dec 2023 04:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701520574; x=1702125374;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SenfjwwgFakSYyoo9nGO8i+7xyhCxykdAy92eXEZY+I=;
 b=Rf0G/DNAgFqP086YlEVsH55NtNZnkfI8lb2EZDQj3LFdpyjWa+TJUqyprSVfFWan6d
 pEFVW2/9GF9S4B4NcbX52eZhMcOVLixaxTLz0Si8DAFsBdTHVGXU2CUtaqQzcMc9/mnR
 gB+iqMkXHa8NX19d0TjHStvBdfdwtC0xXhU3PkxL5SOOyJA3MRWUEWapBFSS8bb6WfqM
 PD6kIn9YZ/VF9kVGiFsE6aKkoUzEujqeOFXa1MyoIdMmtdZY0QLSa6Mw6ARriUeVGeOT
 s1PNsJlSntyZZF1wLLpTTKoGShv8ZYS5WUyXksLyni7iJlQOyw/H3rKoJKCjqQBQuFjM
 7Q3A==
X-Gm-Message-State: AOJu0Yxz73H9bMmhvvcmCOLDrIfZ+PYR+LjXtCh7czCCiYqE92tKlI0T
 OGxEzepYLjBdxMnFhZzrA+g7HAk+Nj4=
X-Google-Smtp-Source: AGHT+IHMTAieipk0BqS9/kOmcIJdLpSWcd/aPgYHgDEry0ac458DEJ6bVl7zdOMIg+RGBPXRyFFFHA==
X-Received: by 2002:a05:651c:216:b0:2c9:d872:abc3 with SMTP id
 y22-20020a05651c021600b002c9d872abc3mr1664854ljn.65.1701520573979; 
 Sat, 02 Dec 2023 04:36:13 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 k17-20020a2ea271000000b002c9b6e389fbsm692060ljm.10.2023.12.02.04.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 04:36:13 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 15:36:06 +0300
Message-ID: <20231202123611.2327790-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701520574; x=1702125374; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SenfjwwgFakSYyoo9nGO8i+7xyhCxykdAy92eXEZY+I=;
 b=jQKz94r1rvo2E9IqjrMvOyJEWOiQlfGucrM27c3COI87N+bVT502HEbbOBco3XfWH3
 mJ4J/YGN8szgump4vNexu1oUwiPWmHJ5vLy7ayWWxEz78u8+eulzBOCGJlvJPVDjKls5
 JlPBSk/+yl582NkpK3nGtorz8x5pjjRZkGr8+cQbc/ctEAr+nmEhSzQF16mM0owutILY
 Jvck7hmEIqMfuLe6trV0MoEmPcKpFoeuDTFpxLGfr2AmjBNdsiAsuK6ioM7zR/3nqwEQ
 8CLazCnHDoLyqMb9ogFJNHfItMak3oNy6JDS9beZ+i7RvAa77vIiCwrxZJzeTL0qOT5K
 0qSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jQKz94r1
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Synopsys email address
 for S.Matyukevich
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I am no longer work at Synopsys, so remove this email address.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f26e9bc81..904c7ebf2d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2713,10 +2713,6 @@ F:	package/rtl8189fs/
 F:	package/wpa_supplicant/
 F:	package/xr819-xradio/
 
-N:	Sergey Matyukevich <sergey.matyukevich@synopsys.com>
-F:	board/synopsys/nsim/
-F:	configs/snps_arc700_nsim_defconfig
-
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	board/toradex/apalis-imx6/
 F:	configs/toradex_apalis_imx6_defconfig
-- 
2.42.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
