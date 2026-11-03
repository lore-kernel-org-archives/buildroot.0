Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FE160A2623
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 14:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38480607BE;
	Tue,  3 Nov 2026 14:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4K23YDfHeJpw; Tue,  3 Nov 2026 14:00:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4572C606CB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793714406;
	b=OVsAHYP3jSYIs5O1WByCKIP+r+y24QlZvljcfq7papw//DoNv+HBcXxsqxhK2kao+HT6
	 pjmHlhvAydL12FW5aBBFOD9dp8KG5X58FjHAFnd8USBUSeHbFMyIVFWvdyBcpGOk+kvz6
	 MAQeRxG4m8yLWarDJHjrG5rpQ61uE1SjR7tGkosdV4lqjdP7AWrXVG1PkKtOoRx9XZauN
	 naT4YnxbeLMjIYPDJj5c6r1qFg0cZ0g+HrrwY1JkYRn9iftS0eS5N/D4NkZQITm7DQAB8
	 31ONsd5cQJcDPvd82nlft1Kk4S4jH104G8HgUsrUEea9hn7lbShS2b7GKh4/RWJhzKQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793714406;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NnlCrhBQ20Ok1U8IwhCX+vZQmpMp181hsQ+KKHXvX3o=;
	b=pwgVMUUYIKLD0NXfN/rlPPCzuD3xEzRMDrrdrKgR2JvAvTY968TI4HxEmKJNh/JIp8px
	 D15Okir0xo6wc6jbGAtiGRCac6ScwOEOInnOiMcpmLh7QCmGFZawzK4hSI6QWavRktoh9
	 vSli8XnRRu+AVADFTtZiwlFx5jNCBhfVlkvtxsH5aFTpWwLWA0YhNfwrNyMbTOAQ2J21z
	 RKBcJwxi+Cx/yVKf64bbYjWlOMOtW69Yq2Qm1YBXFDxAj3/hJS1O3gI5M+Da2OshfgGlJ
	 SPByCNIDKaGKE9gVX4bHDa8kp9I5X6T3kXbusKKq3DaY07o7Rm/4aVPKRqb4nDowQtQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793714406;
	bh=NnlCrhBQ20Ok1U8IwhCX+vZQmpMp181hsQ+KKHXvX3o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nvMmnranozgkus8zPJNiYuAeGic1roQfJ80FFr+Kr18QfvCtXnIHffil3z3DKYvOT
	 LEsyAA6GxFu4zLoRYR2+CS3mAwFA/Iz5b6FW7Z+yASPobZN6pP3s5AG4aZame4oniZ
	 q8GHekLdLLxrXf3QgNXg2p2/BQCNoEIbYdCkbXBO1wTNM83YqyoodVOUWehdqNDqlv
	 jYVROSOU14xjhAS7d35F9lbSKPR30tyBYg8ZfYC8QO9MI/vual6q/PXGeETqyDaZGh
	 +q5jmZnvDO8M83rvf00Uskaufuubrh7CeOGM8VPecYCjfEd8gm3O7jwPfTZA87uk8h
	 xwSJIoNMQXNiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4572C606CB;
	Tue,  3 Nov 2026 14:00:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7A19D3A
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 14:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD13C810D3
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 14:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iMiEgMVw8OH for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 14:00:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 305F8810D1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793714403;
 b=Iz8vwgFVbFgkCDGTbyZ7PtolfW3D6sprPpy4+pnDpDQifp0gz0lnS49EmgXxFM4ttB9p
 b7gHfZijBO4Ffu2lqAH+DRAJcUxaBRv7dtLiYKjTmUNGaSw49jON9hONnyFI+zCRg85Mx
 jXjO6uV4x9QjCRul0q/a0H/0Ur5yx/2BFF92Ksn+Adftc+O7FJ3+JsJ5TREhfFOPoi5Lx
 JApf+u/u6m2XixgOQmYLLIW5sKQ0H6a/BxJv9NLOPezww0gpl8pth17wd5sxD6uN03ORy
 GGvXOa6MzW6qNmeLTSzQoXAet5zhySDuEtf8NTd7KBLP8zLK9glBeHUdRiYdqdUCvng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793714403;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=h1IXrVAETgL0hSwy3iKub4+1W05cFe+5FWrknZ4HPMI=;
 b=tCsIeqjW9rmGjTsLgUKGEagfMF3I/se/L/KqOgurjgV0GN670DJGb70w7tph7B3flAr5
 AZzROyMpkK5efFd5/ntsKTOmJwczgkkytG58CVFjVGOrh7eDXyuk6PZ/ZHTWebL8RlW+A
 lEydKoKAQ/8uWV7XE7u2xT6zaJBas522e8tQo1yvdSwpe/Ha9dBTrMbE2b2N/O2gybZsU
 UiPQzIyzpdHe27DURI4jsb+tZEh1fOtSBT71I6YvC4WDaP6jwgn2vmDXcFSf7GL4CQrET
 SkufT/T2ctGKnuGAzmdZUdvcbEjrrWo9WDsup/S3xHAaKid8FTh4mvV9eWWoO1jDVjQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=grx+rtVJ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 305F8810D1
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 13:59:59 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6b1d8944cb0so7041012a12.3
 for <buildroot@buildroot.org>; Tue, 03 Nov 2026 05:59:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793714398; x=1794319198;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=h1IXrVAETgL0hSwy3iKub4+1W05cFe+5FWrknZ4HPMI=;
 b=lNsfL9VXJ4f2DsuBsQO32XjSAVxOi6h25Z14OtJkI9Fi5xDX8d08cL9d58NzeFeKWM
 SOXq6NWYXCqwLofwtNYX52qH51EbgyxVtOye/nzVEZWWiLSGBgqBHOyXRYPgat3wpACZ
 ME2tySYoNNUFuS5h3YniHg0pghQ1f6HJuVZZHBQWc8PUuA9X8n61up+yzULpBEfIrs1Y
 bTAOg5mkmbH250GqHy6tKCXVj+18i/2OJPpIsGU2LVAzIHIP83ZUBBSrc/tNQADmHS2+
 ZWseQicHeKQ5Lh+MKnng3p9RMVHHwop+wap51A4aiSEYULAaKl1ARrwjxsnzVcbs8o9y
 CPPw==
X-Gm-Message-State: APuU4Z9265r5zjvxo4W4Mg7lURHdExMBFj6KedU7TlDivVae6lBFqiTF
 GCWfjhKk2nGcrp1vfsGt6kaOkDBlppRkStQ5Z2VpXnyUOPh72sFK0FBkjKmsfA==
X-Gm-Gg: AYBFou1dHhcMJxwkL9o6LrZSWele+wBhOU7NqFjB84rK6BgBH0CABRwfrkw9r9xWaoi
 hLf7fA1Ge/BjKX4PAb21jiYfWZi3PT4FQNifzdub9+MFZy2vWCdwF87A+xgQzdfsL85p+NxT9iU
 5VBMVQxg0CF5RPWngZG9POFuMXqXsn6PENcdqQ0xasPdbDVJsQiZ74khdd5fpetgzx7RZIKwBAJ
 HRtoAwk1WseQk29CudEgDzu0Y7VEM9qA5dUpigCKSarNaDhgLPBVSvY/my2FLBj25jWJmf8pjDy
 NePprb9usmdjw0KMHRGGk3KP4k8740gpIr4izdAYdyKoP4VhFxR5+AyV2yo4Z4p/Ga8b7kZtvoz
 nTbgbXoznBq6QFM+JuXWEQT4WJmE3LaMXF0PuMFWnzPJKdXYXhwUvJnU98WN1N+cEN2ZFuQ9LTk
 N4v9IFvlMlOxgpnN+xWnZkmGjfOCS0nx07T+rLHdZsu7N3pMkFGADd8kRhInuAAGBZ7qd1B1FR1
 mpRqGmJlbKOuh7pI0nPL6POqVNMMAo7auX6tuGcoexWntkYLEiVGPEIUZM69LAQMtNSyTGBhdrX
 6Cc2ieoWm+trenG7NtpEecNvG/6yRxFFIfJFgo3fdzvLTCjfUgscO4GaNxIJnnPprjzYiVJEa9P
 ueLAhYvcG
X-Received: by 2002:a17:907:961a:b0:c31:91f9:60b7 with SMTP id
 a640c23a62f3a-c4ca7a69731mr1143739966b.34.1793714397625; 
 Tue, 03 Nov 2026 05:59:57 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4cebf3e6easm86948266b.57.2026.11.03.05.59.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 05:59:56 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Nov 2026 14:59:53 +0100
Message-Id: <20261103135953.1452569-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/imlib2: bump to version 1.12.7
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changes since 1.12.5 include input validation fixes in several loaders
(APNG, ICO, ID3, j2k, y4m), a limit on decompressed temporary output,
16-bit PNM support and bicubic scaling via the bundled uscaler, which
is enabled by default and needs no extra dependency:

https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.6/
https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.7/

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/imlib2/imlib2.hash | 10 +++++-----
 package/imlib2/imlib2.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/imlib2/imlib2.hash b/package/imlib2/imlib2.hash
index 6c316b5d0b..6623098e64 100644
--- a/package/imlib2/imlib2.hash
+++ b/package/imlib2/imlib2.hash
@@ -1,9 +1,9 @@
-# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.5/
-md5  c81c9f91d92ecbd87cf652f867ec5d74  imlib2-1.12.5.tar.xz
-sha1  055778fca4639962290426c37d909c1a6a4c8e1c  imlib2-1.12.5.tar.xz
+# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.7/
+md5  b19079314bdb3948b464203f81383060  imlib2-1.12.7.tar.xz
+sha1  dbe0d336c02644875e0c64bc67bf87fa85ec1d55  imlib2-1.12.7.tar.xz
 
-# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.5/imlib2-1.12.5.sha256
-sha256  fa2315f28379b430a6e6605b4284b07be06a3ef422d4f5e1c9bb24714c4cf6dd  imlib2-1.12.5.tar.xz
+# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.7/imlib2-1.12.7.sha256
+sha256  d71ee5351cc1914fb01968123d0dcf276740e5af5662943ac47ae60cafa4d13b  imlib2-1.12.7.tar.xz
 
 # Locally computed
 sha256  fb70339dd33a77b6213c7ae067fccf93d04af44ff3f937c61f8863f7970e73f6  COPYING
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index c650981501..5ca4322d71 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMLIB2_VERSION = 1.12.5
+IMLIB2_VERSION = 1.12.7
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.xz
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
 IMLIB2_LICENSE = Imlib2
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
