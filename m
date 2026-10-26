Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207EA606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 05:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=q3T0hBQ4;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=SHwvGILL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9ADC40589;
	Mon, 26 Oct 2026 05:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D7kyHOgEoyuV; Mon, 26 Oct 2026 05:52:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0BF104058C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792993921;
	b=oyEHVKS4T7dO60GmmRuABH6LRi5NMdtqzJbv3xQn7dbv5gKR9pijO3k4lFdBgFzB+ar2
	 iZnkAyaZ1hs9SU8ilTHj++gDJshzLVPIWlj3LeHbDsyqXsl2UF1ZOxJczYHuNiaQsgdqP
	 rgGOtfoD0Nz35G45YnBLnaAa/ra9N/4DbBDsOj2ceNIfUErtphbX8SStm3aZIHYiXsmH0
	 uOlTG2AY5Nibx4UaJYE6+KzCgc9TrdYa3qEzRyBG7EK/pBaOCd6vF8hlKLhjYPldG3dAo
	 MwiCyInlcyrhZg+OHkkEAsubDkkVvPkFjzuEfY/1p+zHyEYdZkuGdZFEyAQhVG6L8vA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792993921;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fMRd5u29xK/MP8pqr0qhrHQfYS5Ik1nTwBur6pvRbuc=;
	b=o90N9beUy8DVqtowE64DHoMHSYcFuh4ScYpSJPLE2hzs5kYegiRcRpBk9oq8X1KQDx5V
	 8hLNkFWw/C2RDOPnDLMkxQdrRcu8QG4xJD1H8Hy37Ci5XpteyPdYuI2Yn18I8nDmStmR6
	 7tp/JckIVnLorBlZZNjMRsHw3mKxGDNl4NK7isOh9u/51U/yZIyMTtxN6LDHGeJlhNKgY
	 f2R8a7sVA77y7muY7Pg+XcU2/mtDgDVYWfJnwCMZ3nkSuzqjZdYf/1Je+wCF26JTIvRsP
	 rs/XNakSA1DoOwJK2au4kdc4gYxFGCdjhQC6WfIpiH2bZ6pNNpmTnfuPJYlicK/abMA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=none header.from=openadk.org;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792993921;
	bh=fMRd5u29xK/MP8pqr0qhrHQfYS5Ik1nTwBur6pvRbuc=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q3T0hBQ4xbkLfElf5onA829bgWA27NfDzKhuB2IFYG/MUOS914XqIu92ERpki5i3V
	 pJQ5NqNFLx16LUTHlxSIvnVE07IaGRhyV7VGN4H9TLpqpQUmQRuCFawCdftz2OoG80
	 Uws5ErfseEaNjZI++Oms43HYLu0R6EsMYhMswCsG+MdUboQmRxC9ez+lx1cUUiECBO
	 o/gE4y1unpG86W1M0XxZVBlksSD9wpq8OC+vZF5hrI0mvHd/rEGdF6WSm906lvjE6Z
	 xEXcYw3CXJqt+ju+9I1dKsamS9zVxbZTgop9xboDV7fdCXNRo6mLeL/zWZG21D7QKh
	 s1bmRlb2bi0uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BF104058C;
	Mon, 26 Oct 2026 05:52:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D6E44D1
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 05:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83E804058C
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 05:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJAfSU6UoIss for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 05:51:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3596640589
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792993918;
 b=AwPIZez5EKtD8DMLLYBBu8pCuHOr8Y6damMlHU72IAAzfc0va9xdCzSUKAVV3yyRHmCc
 jBcG+vCelC25xlMtmBtdRn4Jg+182CKzW9266VLMMqrPDA+FrGP5rmYyaPXq5z9DB2NHR
 iwOTdj9in38xlL6f6R3VhXzbqJ7yVEgMIWIAUDu6UbORYvqoR0KPWsQgcZirtPNxWNU54
 wK4qqAN2x9kjCLTFY+7kQh0RT+NFV7UFytA69CjYzc0fUdB4R7OJ1rBOTgppkGaxwfdgN
 BZgfBu7kD6PzVQtgndWHk2ReyF/0XVjAfUaPhKcppST0L4yyEKQnmL01v0WNIXWXvnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792993918;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=Hi6C9lYet7WzuktoRq88toNtzNJd1u+YmNNJWg1/H18=;
 b=bwbDEVqFIUbkW8wHDBZoEldlYbfGwzu33mfHFHdX7uJiZy4rbfj8C0lz3+22D7mQ1ECX
 KrrlQtcksTfyfYHuVYs07ADF8s3J/qjsQolYkbS/S5m6yscfym97vRpRJvOaleQToLUUK
 NyvvWsSjX4vrbW5xS+6zx+n3+f7YNykvAGQywRtFI7TwzYSdEMuye+/gNJWFnX5pZUJAz
 T4N7F9nuOoB82HX8p3TSFO9bhXpsEKsXazd99gOtkQPOp2wG0G9kZN+/94KsmwvA4uvcy
 Hhre4Z6nslP3PXWVrKJXtFUOPf530LhlhOmKD1tezWV/0bYmWrJI26+V+hYOYv8qDQg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=openadk.org;
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3596640589
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 05:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1792993915; bh=ds1B/IiP10csXOEGYqHLu+3qahPM1KUARq8qzVb5EC8=;
 h=Date:From:To:Subject:From;
 b=SHwvGILL/AvPWuihI2D1KLPmXaCO9jTJHqI55O5mDNKv9SmnwNUYEeF0dcToPFTKZ
 0FDCYbzVMN0S1V+gSUWTTCjW/gJjs1nZjPxKpOMU8mp5LcIJomwb3IMoh2wMN7Umps
 UWFYEm47XuS0uP3nFhy50vZ9NxYnJN3KaAZpTgTBH+BePOUFGnVZiheB0wA5uWL2qF
 G98JTh6I2ldvsQS6MTBgz+jm9T9g2h9TmfGHBWvCbgFPXVPt0fx+UzT+WjXOgV7O89
 g2hQ3O1qL3Bl6lFW9mmk0veduOXnhGK+G2h5VOpoGfjfgnmXH3Hcp3Es2cSBkI1e1b
 44PpOoiWCQHTg==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 8586A31E0B39; Mon, 26 Oct 2026 06:51:55 +0100 (CET)
Date: Mon, 26 Oct 2026 06:51:55 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <at7qe0JsJabHWlDV@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/chawan: bump to 0.5.1
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For a Changelog see:
https://chawan.net/news/chawan-0-5-1.html
https://chawan.net/news/chawan-0-5-0.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/chawan/chawan.hash | 2 +-
 package/chawan/chawan.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/chawan/chawan.hash b/package/chawan/chawan.hash
index 95f996d10a..020a42ed2d 100644
--- a/package/chawan/chawan.hash
+++ b/package/chawan/chawan.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e0a06e1504e10a51c6009751d79b798c98d8274e559fe195d4b4b7ddadf91bb8  v0.4.4.tar.gz
+sha256  67a54f10acd2dcda6c62bca825ccaf228f94d04ba9dc85c9369930c58d12ec21  v0.5.1.tar.gz
 sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/chawan/chawan.mk b/package/chawan/chawan.mk
index bef4816af8..609ad42b21 100644
--- a/package/chawan/chawan.mk
+++ b/package/chawan/chawan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHAWAN_VERSION = 0.4.4
+CHAWAN_VERSION = 0.5.1
 CHAWAN_SITE = https://git.sr.ht/~bptato/chawan/archive
 CHAWAN_SOURCE = v$(CHAWAN_VERSION).tar.gz
 CHAWAN_LICENSE = Unlicense
@@ -32,6 +32,9 @@ CHAWAN_MAKE_OPTS = \
 	--gcc.linkerexe:$(TARGET_CROSS)gcc" \
 	PREFIX="/usr"
 
+# fixes a runtime issue: init.jsb is missing otherwise
+CHAWAN_MAKE_OPTS += embed_startup=0
+
 define CHAWAN_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(CHAWAN_MAKE_OPTS) -C $(@D) all
 endef
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
