Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FF1C25B07
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 09:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F1804055A;
	Tue,  9 Aug 2022 09:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F1804055A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tVNtFmRc3I9Q; Tue,  9 Aug 2022 09:15:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CDC840283;
	Tue,  9 Aug 2022 09:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CDC840283
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01CDF1BF5EA
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 09:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D113640283
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 09:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D113640283
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RIeuhSoHL0ao for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 09:15:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94F1B40151
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94F1B40151
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 09:15:51 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 ay36-20020a05600c1e2400b003a4e30d7995so8649707wmb.5
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 02:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=kahxuT4cLKWDqTH9R/rm9PIsQnw1mHsitwcdwP9bTEc=;
 b=fpyjHDxCyzJW0IlavIgEvaqOhmraWSSbJKyrJiKXYYh1imZHqcMA0b5qfVX5YGQ+nT
 pV0X2PrSxFTz8YhiSoGkgc4uiXu2gkx7jrT5LkUNrgiJ6AH+uX3LyPqO6OVC3060gUyU
 nqtR2Q+BuPCxwiOhJV6e18B32lqhL35Much3ufjN+pRkYXvVB0fUyJcp+8f674BGmvAZ
 Hz79P2xEBFvnoV33OnCqtLw1ubfZWdkuLRlqwIiDstE2UhOx9HFN4k69oG//oEUhQm89
 FrjFIaEnU5pMjafJbMRspxTI3EswnW/mRawOrJYFEkSnnXt9NyfU4sh2qET/D7m7pA4W
 5Ucg==
X-Gm-Message-State: ACgBeo2JDW3ch+z+/47OFxALbgMv4iVAqi9anbZSktcitCKbhvHtx8KI
 JghAIy9iTC3TsY7yOEJvArED6dIdp/RPHg==
X-Google-Smtp-Source: AA6agR7boKwaLE6mexct2JZoiS5VIWIbxxwMSvfAKnlIRUoqYsdltfaNTRva3EBstcTSG2GpYiWo6w==
X-Received: by 2002:a1c:2783:0:b0:3a2:fd82:bf46 with SMTP id
 n125-20020a1c2783000000b003a2fd82bf46mr19938895wmn.29.1660036549643; 
 Tue, 09 Aug 2022 02:15:49 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a05600010d100b002206b4df832sm12936515wrx.110.2022.08.09.02.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 02:15:49 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 11:15:47 +0200
Message-Id: <20220809091547.27395-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=kahxuT4cLKWDqTH9R/rm9PIsQnw1mHsitwcdwP9bTEc=;
 b=kqEbrVW6Ed99vjFgblzQ5Ejsngvo76i88atcSAL1FYHkq5R6gEuYrXYRBisoBObKbi
 nFkoMKq7e6uH9uyZSeupUgwM0FCuMgPIcumFPxBgCqE6Hl8lsFiswn1Cmg4OL0HzmKXW
 9bFdcgGtA4bjC+1VOHKT+nTFIESPObTPlp0fjShwG9EDEsBgFhBSoQo18cePZcooYa1/
 TZLTPXG+kF2tk52R2OTKDowFStRTWR2L+KV7O/3m/E5C2lVwGaWk7d0shGlGEBnEOg+y
 Q/ZSlxZC8Nkco7Qubh7ATQSfEYVjx3MYF4znAk2rz/5qXQluY+a0/63YMZpUcPGwUhJ/
 RqVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=kqEbrVW6
Subject: [Buildroot] [PATCH] package/weston: remove md5 and sha1 hashes
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
Cc: Romain Naour <romain.naour@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since weston 10.0.0, md5 and sha1 hashes are not published
with the release announce email.

The values were probably calculated locally, so remove them
since upstream provide stronger hashes.

Fixes:
f67a6e9b7a7be9adbc405b3126000056120a01af

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
 package/weston/weston.hash | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 951d62a100..d58ca1ef70 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,6 +1,4 @@
 # From https://lists.freedesktop.org/archives/wayland-devel/2022-June/042260.html
-md5  dac91aecc97a85bf9664dec0d5c90ae3  weston-10.0.1.tar.xz
-sha1  87cc339503f01317a0ca8d986b1b211c8aae99bb  weston-10.0.1.tar.xz
 sha256  8a9e52506a865a7410981b04f8341b89b84106db8531ab1f9fdd37b5dc034115  weston-10.0.1.tar.xz
 sha512  688d843096a95b463161b98e85ca3443b31ba2ee49fc8d456a2780cc96f576e9d097054e9f361997a66e9cc8373cf29e406a742dae3884b3b50b26acf1710c8c  weston-10.0.1.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
