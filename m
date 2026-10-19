Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FD4606A332
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 15:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5509580E04;
	Mon, 19 Oct 2026 15:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGuYJsCm-KD0; Mon, 19 Oct 2026 15:32:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 643C080DA9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792423957;
	b=VY7EwTiKnrsvf18OBnahFcbYtpzQjE+NoU5gA3GpbCfdkG9rYC+DGsOHUYaVyUCtFzpM
	 Md5ZR0fnmvf7GRUUMWk3RgrkLRBu64MRY032dZOWm8XwrUQ0amndE68QIWg1xKLe8m7dv
	 j+VpxNqVsD1vbBDDDY0dFvBipm2qY0aNT0N+OMBz2dKUNN15Qp1gKwjm8Tepc5qU5VN80
	 GPc1Pb8cNIQp4+wytQu/YFZXzfSF+WFNymsdfwARqQBHSWcWgD0lNh8qg96FnYiFCx3QY
	 GbaJBdUI4TG6Y7fpPI2j9OU6nxw3ni0bdbg28GLvZGswnSEaFkF/kUZab4R0R/NO1XA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792423957;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=B/+BKOWoHZ9XhTM2yXB2C9cn/P7NpBn/Qwds1xlnfWU=;
	b=nRpqYIDBzoDEb5R+3raUn+a8fR+1k0OVQqix+kojkFEuy+BSszbCmgj76Sv7CSm7CVQL
	 zAQj3nRU3Jy67HMjAjIAZ2CkLdysL2oxQIu5GcWZBpsBA6TscdcUFQMoe6LwxsDsogoGX
	 zjtBlrXKW99/84ag/WocbLO69QT2Zb+NoSonFADRrxtlutwNDSQ2OPAIJ/zFrjBGF4VtB
	 FnPTRWmJCzzkq0NrmylniWVn9cJIix9Z43qBzm+enBNiEDJGXD2FdwWaMEio6uryWbKvW
	 Su0xZ6smRdbFHGk/p1TbWvrtZ+D73KlnRAhCU/XAUayNnOfXgpRKtya41Nnm/oUu0yQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792423957;
	bh=B/+BKOWoHZ9XhTM2yXB2C9cn/P7NpBn/Qwds1xlnfWU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=e3CN3BWoL+XZpVs8UXwm5TSlZ5AUDQBVf9EJe162N2Z3jmZ3FVRo8uAXKGAMXm7Vt
	 0hNdGvroub8bsLbH6JPKpgp3sn6f77uVxALwV6i7amH5kXrUcJuyvMj94fR1q/io1f
	 2XYsVqYncXI41iiW/uHOzriTtPebQgaYgu6e00ZqBYWuZNm7cMzvZl8Ufks2y7iDY1
	 JL3AXj25AKg3wtPjkgXjHGP5O8jcntb1YMRZa5QQW7/2jepgvOdZhPaKmqVS9YI6ry
	 Nuvkw2MfoRA+0fLhJIwQnQRpZkzTDAHH5aDKfZv7odO+lqAcZFkV/Rxabe7mQvbqGE
	 WfnyJMU8Izx5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 643C080DA9;
	Mon, 19 Oct 2026 15:32:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 876D023A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 15:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7923660608
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 15:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2D_Y57jfuk7R for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 15:32:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9E96B60606
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792423955;
 b=XIRFh9C/c+orMBwLnuBV2t/AAt1er2afbGAUH8CzuMLwyvd3QATAeD4tvlSSQV2EUWu8
 hX4RBX+cNWp0ALncWIK8fA0RVX/jAqCJQPQ0hPc0aOqICsCCcbhwLN4Bwrox+ldgTOUlp
 or0CALFvfgIBPjr80C0utCXR7BNkiDd0wXLoLomafkusrQth8LZh6lAMMPGzuwxyM0cdL
 29qz8lXOWOcZCAHfOOH4ol0Gi37OWGC4rlVyc9/CH1ak4BEqFm8J54G9IKcIE5D3KeaEH
 jBhKaDK3i3iV3moBX3oZDpiEUXozdPt48fXjohZEyOABIsCntQxR2hj9ab2fgqKvZEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792423955;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ntiBQd52ACrtfs68Ffy0araXtYjskdKpE/tpR3Ensa0=;
 b=OXE6uNn4D2jZSKQomv8z30MtzwPWlEDQXNR1cgzioe1D4etorH+kYP3GIxu18J9n+jNW
 n5eKcFipnzHcwNLbb8dxk49ViqiLdUpGUsi2I7k4opVIxZsJd9rtFL70+OLFJnpG9Ldbe
 u//3LJoQ2p4+au65vfw9P3BaZZIjsVkegYiAdFxc/EE8m0ijBEXPP4PA6BnAyarGaq92h
 AXaBvHvjhZ8Y8eQ0Z59pul/XLrBaKh+d+fE6FczUny1Q4sQkzR1CSl6ZsZcw8gYit54Gr
 4j/kWMF4SqoL9BdvX5NyOtNv7jjaY8MRcp5XTHCUMPEno5LFMVBcXrEzzrz085e9X3w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VzpnZt8f; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E96B60606
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 15:32:33 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c411e139259so212775166b.2
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792423951; x=1793028751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ntiBQd52ACrtfs68Ffy0araXtYjskdKpE/tpR3Ensa0=;
 b=et+bXveYlbbFKnqd+iL/HPpDzcOEZ5oa78zj1XVfjXq8E1v8wLRA2OByc4c0cgtOB3
 DPIrCeFIcaeQy7WGbrQ0E8Z4uEoXGtxqdFnAP7WJaLcPDpDAajHX9xUQvHFxYjjT7VLY
 wx9zVnWbKx8Lsiq97dHc/FPSd2wOeaL2eR+Jq2qFEaS9XQNHO+KLJNW0uDJK1fxM9200
 KwE0RB5oJPghCK5rtQ4Xksrkutr49bI6oOf/WOxrfDSqELsIJDbVd7nI7FJevFiyQtDI
 SN4/LYV7GRBCemqwy4v4S56UT2UtChg27Uk7M/VOcBadDqVFmB+YYYckfT7SyRsoQd6k
 KEVQ==
X-Gm-Message-State: AFq9FYK+jYBT1tCnaPcheG/NO03imU/jyMHuAb/KWgyySsPEl9VRoZnX
 lvYVBruU3Dwm/L9cexiN81NwBpjNhUoPNzwZu2lcyoh9Ph2y74ZY705IldgJrck0VyK3xj7TW52
 c6tiU
X-Gm-Gg: AYBFou3uQXXYoB0j0ZgHHFqEB/im7zpMIrSbrvs0HQkA7IGpP4G6rAfeU+eqBm3AFzq
 YWIlDqjnF64QtQgE6bA4T0u4aKcU5XAZHMsEkQMjbgJz16jwsdazrNtjTJbMhBscarTqOOCe+lb
 HbhYJVJTjBWI7G42/L1FLwni8oGa52F2Lh0MgC3uv54iUWKK9cnG2+roTpwm3DndwdlzIuI0/nB
 NYGMf45KkPnoafx5hlYy94VdI2d+y3+H3hAjZ9lQitdDsK3T9QUavV1R8Wvn36EIDYTQec5WSCI
 /NQZVh48eoYAvT/C27avSxOo/MhVlAyZXMUmZk0dIA4lAyoVqdfesRXyjHipg9m0c4EqrE5Elmp
 PIFtp1SShbEgek6nXE0SrPeXdjUNDKAfRuwiFvbR/gOg2JiARymnV6C9KS4fltZX9gbwGvMeW1X
 rxY++UA9ACVeaZCGjqY5lmnChdjsU13NmspwGFnEkMEuQJAH6tNbioLfghTsFz7EJPdS72ivNYD
 lOj6OT9RhgHq/KGusS97yRAqqDQGLiApREI1ILBHcBLwdymm3w=
X-Received: by 2002:a17:907:2d10:b0:c40:5de7:33d3 with SMTP id
 a640c23a62f3a-c419f416e87mr572515866b.35.1792423951550; 
 Mon, 19 Oct 2026 08:32:31 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c408e32874bsm372237866b.9.2026.10.19.08.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 08:32:31 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Mon, 19 Oct 2026 17:32:16 +0200
Message-ID: <20261019153216.917663-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ffmpeg: fix hash for LGPLv2.1 license
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The LGPL v2.1 license file was edit in upstream commit 4225417da2 [1],
which is included in ffmpeg 7.0, and Buildroot commit b68bde5643 [2]
bumped to that version, which made ffmpeg-legal-info fail.

Fixes: b68bde564339e96397929b45c04d137bb65df43e

[1] 4225417da2 ("all: apply linter fixes")
    https://github.com/FFmpeg/FFmpeg/commit/4225417da25e45ec807d44430fd8cc004402df02
[2] b68bde5643 ("package/ffmpeg: bump version to 7.0.3")
    https://gitlab.com/buildroot.org/buildroot/-/commit/b68bde564339e96397929b45c04d137bb65df43e

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 429b11c3d0..481fddcf61 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
 sha256  bbb18f3cc5c1c34b21cf176c0168c4d9aa97697542a97f60d491a58a814dea65  ffmpeg-7.0.3.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
-sha256  246041b6ecf9bc32d718a62c57877c78b5eb397b6467e74ed7ae2626ab189c30  COPYING.LGPLv2.1
+sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
