Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F89606A31B
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nt0szOaH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1999B81B60;
	Wed, 21 Oct 2026 20:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxkPTKmJwOqw; Wed, 21 Oct 2026 20:40:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3187B819D2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792615259;
	b=cZExahNb7cXHH/wVdyKPFlVdx+ZzPZFve5dsGPfFM1jFfbRMsvPKPKZ2Mmgv2wPuVYwi
	 HIaJPZWK+ZR9IH6WnKSNtizkoTiqsmsgDmS12fdUuzwaOTPTsKBnj6Ir6/+v8PEsmcMl8
	 sL+9M4JVZOM5TBQD8Cf6/6qtRUUjk52veAx5xGZ1UVSDOYS2R0R1+6yxwVDfw2qb9YBO3
	 3SpjvPoAARYmWip2HqFKzqQAoAut1uZ/TvAVdkUelvh06vG6G12udln7hFBBW+FJ0QsnC
	 nTsNDqePnMjQMtUz8oqfxJrvg0/y0JK/CoSIZswGOOBNzD2Pydf0vnjGrIg8nZUDcwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792615259;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZlIcKh3mQnZ4hHECF01jyC2TRfum+E+qhtrQOBstGzE=;
	b=REPhrGU+3wn581KMsQtQUbQhTKxXW1RfSNgxArb/9K4zBForZXGL4AZtGup1yzALqVB8
	 9o3/mvqrryThquQ1vKcsgm5xXxphO1h2IYf0s9VWOYbXxvqxz9hIeR13bwfSkdktej/2y
	 ymM2Ty8JStsXKdIqLDTnaZOW5Lxh8SD+kiG/FMfUrghs4wVXNPWp5U5wQLysifqK/H98f
	 fOo/ps1smqReP2PP6CxqFyawBKp5I3n/bzI2PJRCiO2qWMMBFms7BxR/ejSI5nQMD4p+j
	 7JYo3OOm9F8P3Z8M/CrWWJTldzVJSx/brTsGCRx0Md4UWnMdP83TZ04eeiIDsi+9fjw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792615259;
	bh=ZlIcKh3mQnZ4hHECF01jyC2TRfum+E+qhtrQOBstGzE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nt0szOaHtULx1nKpiCMTA99VU1MFLYl6pHDl35EhvT0u1FqWPGWhOCPoA7uJQ9bTG
	 uIzBq91ioB9Itf51ZhOsovG3mS6KZUz6cr/NlFri7/hIKHa5ggRjIau5X4xmeyLngm
	 q3QCih75RQ2/BG2Jptbi85czuhTwR2Y1/BeTAtMUbXsnzFWBH+ObDWCB8aEROjWMbe
	 KihRVpXeV4H03zF+IOqjzI4uA92wCCPTZ/E8e5ZUJObmSHoHx2p3M5ZItfGChzRWP9
	 ZlclDbq5owShURyxOQ5CkE1ak9Y1sw/INUqSYlNIwMSVMWM2p7NQ6ooQOeegt5U5aA
	 bs7ZQAQoMRXDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3187B819D2;
	Wed, 21 Oct 2026 20:40:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EDE63C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40BF44018E
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4le60VDNIObB for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:40:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 95ADE40042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792615256;
 b=PrxZhaGwj6WGnyRhm7Wu+ExsCJX4VkhiAzIkLk4kYTrwz3VgqFW83NdnlhZHX0jsqg5i
 eVsbrEJL2pEby3NflqYfM7AKnhRSUrBRuqccHzPehTSKtUUt9Eru/oWnqWkTrStzTcOt9
 GR3DtaNFrCInD5axirmT6evRVLWENyJ5R1Gy23OvsLZ55Q943GUdgsrJVIus/TKHOrzYt
 U5YnNUnC5Fi/S+7/HVzQHrAd5cWAX4ck46w8Hgbmv/rwBVN1ehMt4kw2EkYJC0En0vhJL
 13T5VCEJN5ID4MIVdAdkYG6KQZKtWx1/kM2d8I0kGUN27oLnCNJ7EcmWYazwNlcU5wA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792615256;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BeoGd7NbLC9zE98SYl21LK3fNuo++wyyKasMKa2NGSY=;
 b=GMHvs1mG1i1ZGaxwDdpJMpERT5IkW6AZHXUmmWTo508VBwSbfIQesnwPC/hffiYK4893
 w+mqOdsv4SB6c5s4rHtXxjpcLN/zT2tZ+gQZPxtDxBarM0Xkw0fUHukLj4ynE++NeM8mN
 GVvI/sVKqeW4UXXj0dpK1UcjCeUkcal7VAjDFHZiJEzR8wvdkRuh0ZCM39Fu2vIt6Gu5p
 OyzOhIb15+L5sPSG6s3J79dqEthnq7hqzOPySbt/L2vl6oArvNuoCNT/595E2f7fd7XZ9
 PnkexNE+p/dYS+RaMPNU1iPpjwDTaxhz7nL0L2DVAGt/ZunZq0dsnw9bsjP31P6janQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95ADE40042
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:40:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF71299B2E; Wed, 21 Oct 2026 20:39:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 22:37:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd3861c9610d93577cc7ed236cb819ec6ede41fe
X-Git-Newrev: de806f0700dc67b2025cbf704d27eeffcbb7b69c
X-Patchwork-Hint: ignore
Message-Id: <20261021203932.DF71299B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3: bump to version 3.4.16
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/de806f0700dc67b2025cbf704d27eeffcbb7b69c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Stable bugfix release:
https://github.com/libsdl-org/SDL/releases/tag/release-3.4.16

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl3/sdl3.hash | 4 ++--
 package/sdl3/sdl3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl3/sdl3.hash b/package/sdl3/sdl3.hash
index 7340628dc7..e7a5eb38c3 100644
--- a/package/sdl3/sdl3.hash
+++ b/package/sdl3/sdl3.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking
-# https://www.libsdl.org/release/SDL3-3.4.12.tar.gz.sig
-sha256  f07b958a9ac5020fb7a44cadb957f658b2149c3c8abb4f63145fac9303249db7  SDL3-3.4.12.tar.gz
+# https://www.libsdl.org/release/SDL3-3.4.16.tar.gz.sig
+sha256  7322236cd12090c3eb40b9728be4d49c76f66ad17d04369584d4ecad5cf77c68  SDL3-3.4.16.tar.gz
 # Locally calculated
 sha256  1c040b8271b37e5076359f8fd54240e371114112924d2df81ef87c7d6a1dfdfd  LICENSE.txt
diff --git a/package/sdl3/sdl3.mk b/package/sdl3/sdl3.mk
index ecbcbf4bc2..8c2cb8f629 100644
--- a/package/sdl3/sdl3.mk
+++ b/package/sdl3/sdl3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL3_VERSION = 3.4.12
+SDL3_VERSION = 3.4.16
 SDL3_SOURCE = SDL3-$(SDL3_VERSION).tar.gz
 SDL3_SITE = http://www.libsdl.org/release
 SDL3_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
