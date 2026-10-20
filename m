Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58460606A31B
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 13:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=s7pv6SjC;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim header.b=OiVQnchp
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 222EE60833;
	Tue, 20 Oct 2026 13:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fl_8B5_1-io; Tue, 20 Oct 2026 13:42:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2916D607ED
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792503746;
	b=ewgTf+chhebGZXCZlIoRQuGboH9lyElJzipv/mFEXUIQ/09hniyTJNN5y+cJPTCbFE/J
	 pSSf0iM5WfLYAUbwweLio4tI3bTeiHudgTcwwOyngxIiJrj5xYaaroUpHqqvCXiKuE/7q
	 5qD9ZvIjCoLgb0FC8pzvYfAqDFzVS8mWBzv7znMD0j3Pc+rZ9y/jKu29sJMetoKZUk5jm
	 Rk/G77uN91o94P1KUbvdjda8XYYmvZMtM5X4PpUSbBEsrNJ6vh/LIfpqpJnqsYnDY2X+E
	 BAgiMVnxa3N12qqaiEORAzyuJoWvSDmrWEhN+A3c2DIY8shUi7aq2GuvFT+h2QfHLtg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792503746;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xN3RL0ZXY9cK/iPDT92nUG6yiJ88BwDrZEgehCUsg30=;
	b=VBcMRFo7cHH0OhyqzxQrsT3HNiM64Mr677C/v13wPGlJAkGXvovT/BYRRxdY2vX6nbUC
	 /5EU3Rb86DzjIdyPYzoF5SsXu12OzORrHIXUAxls+t9/CfTuwX3Mc1Knnz/CZwT8WXY0K
	 2ovOCtAfbv8XqRh0XAzh8JITmiSJcIiGM7sRtAs3TtV/dM/vKBCh5q9Hsy5Yyxwg6mu3k
	 MeDpEL8OtoVmJxiEW0O0MxfX5ORpIj0KmnSib2gNkX1ZksZEC83PObvUC8OHaSilsQJo2
	 1BguBwzr9TwbayMXe4ZH7CdMaGuR3zhedJ5N13Ll3mHZzkd4WuBxxVLR5LY0Th4/lNQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792503746;
	bh=xN3RL0ZXY9cK/iPDT92nUG6yiJ88BwDrZEgehCUsg30=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s7pv6SjCg71ZbQmDZ97tX25VOlw01tqQbKHxiy8rSjaPQe7e5eZxqj24iEM4sQRlb
	 kggTqlOklTEXAP24BA+OGVS684IsWQhDX0nTDEIZYoFdHbDPCgWwa/+uJRQLEEAFC6
	 mYuRPU59INmBJGePGqm0Flu5+mGLfJHuJl1+fW/eZT9N9DyJRozoUUv+SsfNzc/odB
	 RiBaaiS/sMHZo6sHQ2lVCDv/qQOX9iv64jcmtu7N3FEipJCaaLWm+DBZ8gJ3AaXRTM
	 vXB7qUndgXivHaNTKhVBYoBFDPGlGbr29CFGmDVpmKvTVGEQAdYSwa+QT7rMZlvQqJ
	 FpsEBaLq7IGZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2916D607ED;
	Tue, 20 Oct 2026 13:42:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40784255
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 324A0406E6
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvItoOfy6-hF for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 13:42:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D5FD9406CE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=136.243.2.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792503744;
 b=tL+5FApNNCIVs5aRAN3bA9JhBUkuh7p+jRJQjNhirL3IhQqR1CDyPgGuRaACPJ/Ovguu
 tQ4hSQKiwMLfxXRoO41v4QwXt1xya5eVhhzwEeeTTfDWpt5VMf0AN7MA6sljyjYkt0XVe
 mB/SPp/4lJr/zE9bGmvbbwMdMCzef3+GH4h0Cblg8nlTaIxCzKoZXZ5lWbPaUR3WjkpT/
 unSyY6mrOYqQyYvJLiUNtUsuan+uYVYyDx+gNb86o/6+Ku30OvsqnC/zCoLQn2w30GYyF
 CMthvhIW4fyRkRKv8IczpcMMXK9SGROOS7p9jowiO+sQytTlDsdB1aWWnPkFyeCO1Fg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792503744;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=KLsXzZYy5NOAzyRsd2zHyjoQkxN/Kb1GHi52e+21EFY=;
 b=dZtp9t8ReiCaLnSrswwSfnXwoUcu/lzdiHN3EtjNqimgbjC2FVPUz1uG3lQRlhsgwYOs
 Kmau7PkYVP5FiUPDpRh6KEtRRllgfsy6L692SrPdWFIAu/3AUbcH2eujJunoflgQ75sLf
 us8QiTr03Wllx+ONyqBD+EcCLZLvP3vy8PdScbNqhIAJLLgKxPfd6R2wY9CZ1vy43vo/W
 zo9EQdPEffuXeOjhrr6786p8qexZGfIhNclx2bnoj974gTQWbJxmHNRaOgM1KBhFMI+50
 2TnkYG/2AUih+rFfN6sfutGbE2QrISyiv/WfefUq07aryyac/glwQr6cfDBf5G7M70g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=n621.de;
 dkim=pass header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim
 header.b=OiVQnchp; 
 arc=none smtp.remote-ip=136.243.2.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=n621.de
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=OiVQnchp
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5FD9406CE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:42:23 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 774F5E00237;
 Tue, 20 Oct 2026 15:42:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n621.de; s=dkim;
 t=1792503739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KLsXzZYy5NOAzyRsd2zHyjoQkxN/Kb1GHi52e+21EFY=;
 b=OiVQnchp5b8iRdtF5YeRStdpPjrDdD8Oo74cnZAxpM+Y8tyvb0Q1jWLqua54K55vrmMW/N
 oh5NF/4FACul/is6hFCKP4j1R2DkuRcghYIKWuAHz3NEcHTGc3CcAW9iHT5hv3dUN9hflL
 KG4MOfZ1yFXNl/DKYHjwisY2auaFal0=
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
	Florian Larysch <fl@n621.de>
Date: Tue, 20 Oct 2026 15:42:18 +0200
Message-ID: <20261020134219.20635-1-fl@n621.de>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 1/1] package/go: security bump to
 version 1.26.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://go.dev/doc/devel/release#go1.26.10
https://groups.google.com/g/golang-announce/c/66pojueaQek/m/tmWX2Pq9AgAJ

Fixes CVE-2026-111943.

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 1c43cabf7b..108b943615 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  a0721c54c688901448d77ad9b3ec7ea7c474730755ff891382e92ecb93ff2cb1  go1.26.6.src.tar.gz
-sha256  f09a71029fc5cd2940fbe36b0eb1fb2d8f3407cd6adb6b7b4de3eaf04007f8c4  go1.26.6.linux-386.tar.gz
-sha256  708effb774be8237570d0add163225abbdfaf4fca28b2611df167beba4feef89  go1.26.6.linux-amd64.tar.gz
-sha256  d0507e9e9d7fe012aae570108cbd76c15de879e17130ab8cb90d4d7445cb1f2e  go1.26.6.linux-arm64.tar.gz
-sha256  e1379a2fe77bd30fa29833074388247e7c65416e09279f746f20de2d5cf4dfea  go1.26.6.linux-armv6l.tar.gz
-sha256  232b65543a42eda95df6a63f76235c1795bb535eba5c74e509faec71bc648388  go1.26.6.linux-ppc64le.tar.gz
-sha256  958757933d38172dd544085d253c8738cf09793d24c8bc0422e5e1e1fffa4fde  go1.26.6.linux-s390x.tar.gz
+sha256  fd63e883ba2f2bfca93c1646b31ebef63e2b1e4d2b317c9789d976a68d81f36f  go1.26.10.src.tar.gz
+sha256  fa05f9c9d71d08da81ae34f1b6baf8aacb05374b9a6fb223e92f7b29afc81148  go1.26.10.linux-386.tar.gz
+sha256  ccfe7ae822d2c2f41f4fe7c956199967a4dac22d0ee0d2b2bfdb440aab3b20c5  go1.26.10.linux-amd64.tar.gz
+sha256  3f4227ce7b206a513e794f1393adb473a07b46e94d18bd15d1c684bbb7319797  go1.26.10.linux-arm64.tar.gz
+sha256  7d89fd32259eb0ff647381e8c3465dc32ccfc7f71cb7b9bcd95604c3481f5109  go1.26.10.linux-armv6l.tar.gz
+sha256  4492031a19657de3bd7e4c48dce9d9e5aa7b668300f7c2c98e620b9ac0ee84ee  go1.26.10.linux-ppc64le.tar.gz
+sha256  ae724ea910de9ea2528ce6558b8493725c7a06b8d14ed88d0a51144b5138533e  go1.26.10.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index df1023c19b..97a18c4a3f 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -7,7 +7,7 @@
 # When bumping this to 1.27 (or beyond), remove the workaround for
 # upstream issue https://github.com/golang/go/issues/77436, below
 # (i.e. revert the commit adding these lines).
-GO_VERSION = 1.26.6
+GO_VERSION = 1.26.10
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
