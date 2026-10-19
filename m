Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E103606A319
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n4NWXhYc
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53C29607AE;
	Mon, 19 Oct 2026 21:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWdJ_8dyxHxT; Mon, 19 Oct 2026 21:47:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5A33A607BC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792446431;
	b=aevQEndN/DYyi5VhQBwQmZHMkNa8VyliM8qWbqZW5PQ+qQv6grG+btMnx3xzHY0K2QaW
	 ZCQhl0ETrXDLpZ0ylqc1HMOkCIRHXP3c0OFGn/VOBaCwG1fB2OEDUNLA3zXoGB2ddxAKp
	 TcjlbgHI+NxejOFSa3lg5Em3jVp8jAVpFE8vkOXDTWDd9hUqm13VMpPt9P1T4/y7z9Pvo
	 m49fQ9QJ9KPv5irJ+q5MH6YixD60SzGWK8v4ANC/DCR1DBgFyoaDTxPSUVguzSX9sh+DF
	 2W3ABSP3lN3YKsOeCEmFuIdvz8xHfy4zDMFU1CcJnLuiDm51uAQT9s05kEEmutD3kgg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446431;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Vs+S7LF3x3zDzngbbkq+2zCaD9aRob/6eLKr+6u6bQU=;
	b=Dy1ilaP54PCb9rp0ihLJWGJ/YfehnXp+dyZkUt5xvkCxooZTf+ged9vB1C0hbb5oqgzt
	 okKCY8ogm/xA4BoPHQxg1WsC3X52uR/mzwhKS2faVNgKaj3bTJtRHAlkIcq8qyQsh59eC
	 8UK9vy8oibeeV+kUALYjuM5GSN98eYUqfr3WwH1EpVS0wHRkedGhYVPj/fvX6g1IbKCMx
	 vWsIBY2lgYI19/MKqiOioTq+vOXe4OLLiL5jDUgWCHUexPWr35ttdVDFGEMU3Hgtar5L8
	 XcWMgSaJ4hQWxSPuaE1+CuzdPS8j/uFFShg27Hj0hmhGXSpZsvx6O+9G8BALcEGGw7A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792446431;
	bh=Vs+S7LF3x3zDzngbbkq+2zCaD9aRob/6eLKr+6u6bQU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n4NWXhYcUtPkeFUzVv5/+0/od8dT6Mlx0nom2C8lwkpY+2Lm8ozDClqwILWqAYLH+
	 jYJIENSYzp/I47awI6knic1S2SggznMOpPvZo0gyw9cIMtOQ3nqqo8Qz7M5u6hhsXq
	 effEbcU6F4pgRPBV5b5T8nQDL+0Zi4MTMc2qI1R0CChPJxpd6cd2eRnzF5uatPWDOP
	 bvXNsl3+vMw70zI2BJv8gsujMVILmONI1Ay2ugmU8aAqmsAL5WsbbDonb1Z6jH6mmU
	 tO4MZ+5GsSK6ZfJAPXK6zoRzNBh6Kba+yJhQLbRweqtkTRe0TQFlrEyD14qRGI+NZB
	 kQwtkEGbUPhiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A33A607BC;
	Mon, 19 Oct 2026 21:47:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA1E611CC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEAD260778
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYfgOgTpxytH for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 00B0160600
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792446424;
 b=W7uPvxkvyB4DLqBofTS4R3E7k+yzcjsCcrY60yLzTwJyYjeF+/bC4CiLQCRZP1RUTD7s
 uemOdHraEjTzucgv/Gs6tgbMb4gjRT+Pf/3PWVBDgiyDjV2U32lDIlXmn/Oui/PZPWSnr
 feoYhPQKu/2GksCCKSCDMm5whqYxGn82xcWdqvz0HdncnbG3yHVXCuisxsd1yvnlTXH4J
 YrAQ5YcGYI+n945Wrr0VUqpv7dEljQCH4gHCoMroeHHBEhnP/Uy0b5ItHHj1af/TxPNAf
 dkRkUvOD7CME1S2dufJK4E1QK4P/xsVP8ZuH5fcW2sB3SfCBjdk3oTPkHxHQXltMeMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792446424;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PIj3wKWbBXzbcrPhjb9KGZJdcuujiw78l7oR8VbwZ6c=;
 b=SK6fqUTYxvCjg3dKxNTFGa0PqTV0QFYQoQHYA/E7X/seqROXIAOyhPZkCMY4ehFIhUTh
 sGTHRgOlHFClHKWjrbMDF3V6eyGTXE/N77rOHF4wh/t/k5ygQ7fyNQAe415IuUovfv8W9
 w7irOZcyj0azur7t3EGBw8MaoZLyDwU357F9uPcO/sJIQhjMO17lFvWhWLJv+NLg6quEB
 qgnfv0oh7gJsIWjPEiN6Bs9H4CucBlqUSrTCNRXmQFu92v5XOIGooI/IciN/4ZIqtGvm7
 BHgxdwdIN3EW4oX9iy7H82j/VaDIaofuCoSQTUjQRQjy6S3qSCMjd8OJ6eoypNUYN2g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00B0160600
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3863F99626; Mon, 19 Oct 2026 21:45:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 22:47:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a40ba95b1e28d7b080a5f6f2d632c7f063ad618
X-Git-Newrev: bc8a47c1ef07eabd14789bf11a41eee97d887466
X-Patchwork-Hint: ignore
Message-Id: <20261019214541.3863F99626@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3_image: disable vendoring,
 use direct dynamic linking
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bc8a47c1ef07eabd14789bf11a41eee97d887466
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Be explicit about the fact that we don't want to use vendored
dependencies, and that we want to use normal dynamic linking instead
of dlopen()ing dependencies.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
[Thomas: extracted from https://patchwork.buildroot.org/project/buildroot/patch/20260816191830.533747-5-alseycmiller@gmail.com/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl3_image/sdl3_image.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sdl3_image/sdl3_image.mk b/package/sdl3_image/sdl3_image.mk
index 43127c463c..8f0718abbf 100644
--- a/package/sdl3_image/sdl3_image.mk
+++ b/package/sdl3_image/sdl3_image.mk
@@ -12,6 +12,12 @@ SDL3_IMAGE_LICENSE_FILES = LICENSE.txt
 SDL3_IMAGE_INSTALL_STAGING = YES
 SDL3_IMAGE_DEPENDENCIES = sdl3
 
+# Do not use vendored dependencies
+# Request dynamic linking to dependencies instead of dlopen()
+SDL3_IMAGE_CONF_OPTS = \
+	-DSDLIMAGE_VENDORED=OFF \
+	-DSDLIMAGE_DEPS_SHARED=OFF
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 SDL3_IMAGE_DEPENDENCIES += libpng
 SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
