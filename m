Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC29606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 20:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iVK1ZB6P;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=CEFpixQ3
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67B9A409C7;
	Thu, 22 Oct 2026 20:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7d3ruDAK1cDu; Thu, 22 Oct 2026 20:52:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EE17F4053C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792702332;
	b=rSPcWVNSrFap0XK72GtbzhHmsUS+cjo6AR1pDw0XOEEfv24lL0lUkPWlWCcWeEn4nLZ4
	 /5UR6wnqno3kz5RHsip5BGFP/FadSgW+vm2WkJ9fvJGLT2ehn4lQd+ar51R7jdzL52g7h
	 mtxr4zBH44EqLN33l7NEfonYsX4Fpeo7p0xvC6ss4Es5AzO0cFV6XJMGIUCrIGFf4I4h+
	 XZt1lIN4GlHjyBcsLScLq4cBjPdecwfx4HfUTK0PigPlMrDCa+imna8uaB2G09SnUZaQx
	 +FInEfGNsvfvLxfFacLxvxVJQ291ynJLi7uho56janqHyOE2IAc6h4VLALEQLiuhdnQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792702332;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pPNUDvOwly1ejSdhrK3JcPjRbBIL77WpjOBFGrONJOY=;
	b=WyRp3Micje4Ivcqt+PUfb2P3ZgroOuWRCRTyldK5QktzMhRmsNqmGmKp4ITwwO07okAq
	 395fxFG2Ht2lvVO/x4KfyX1pJ0CqXNGppyAOaNDzd7Hurs1zGiCxscGRaOtqZ53D7PSKr
	 8h5V00dw59g0gWZNbK7GVdJdr9dJCTFlcNv6NZ4h0XedBKZmGO/7Ca8zeL2XFU0L6jEll
	 4P3p1sWEgvSDzNs4vQd8Kidqt92KwCGKEmmeyRPWBciJT5ZtczTx6TXKO8Z50a5fwU4Vt
	 9gzjTJhRbh3VL0KoTMSxCydxq8y08Td76/gput3RvlT0qDsvbWM4aUYJ6eQio6yCk7Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792702332;
	bh=pPNUDvOwly1ejSdhrK3JcPjRbBIL77WpjOBFGrONJOY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=iVK1ZB6PLjmM0nTgjq+n0oSBDwUJByBpbH8dHR9kvAyX6tCcKgANwe9SyJFhWvZ+A
	 CYGYFyCDAHaJyn4cdMIKqUuyApzITQBCwt5JY79TiOKxfHZVro51SIpFziommyVuMs
	 KMHBsTo6A15ZQ6yD0hwkflvTXMrremHOcAaAT0+TWCQ1GRHyQ7XuVXnnVLEZbfuxmz
	 DtEIdNa+rESvlRJLUh777ueVtHXLZWC1F6rRQ9Bf1onGBfFfmMwVkWDY4ej22DtlB2
	 rqRdLXP23uC5CPda7n+Du1F65vcBZnvgNWlcf1LuzLpQZ23hfPDOwmJFtbLdIjwfLN
	 50x5DQEitYZ2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE17F4053C;
	Thu, 22 Oct 2026 20:52:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E7004BC
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 743B6811D8
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUPsiisgpLTi for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 20:52:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 27787811C1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792702329;
 b=s/zr6HgtTKJTucRsfnkcspqkplXpDcDsmQAQxp1qXD6+lcXykuEx1afqbdrcilubB7fF
 uWlBRFnA5OFuoXo5AHz9wcvohONbE42b+DNghPO3RsybE96pUUI25wQHQoCBlohWq071M
 +Tk2MyNRTaDu9DY0IckjoB5wvVLyJfwNOqTxi19S3cE377kuTrxxPVWc5I83QE+AEvIbF
 ztcbxEqUg7E/DL1mc6AVmWlrsZ37RIKxcEKLlwStYcf5+dkx9shUyL8BIzNYY/13AA2tD
 a4HPe72J2LJpXSxW/OsvCSuj3kyyk/TFJW9NXmqFYDKJHfvjJUQkA0aqRdAiK5HNlyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792702329;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=YPSIYtzLqRHZURp4gQdYADijlkc48tfe2f2yBeCMpDs=;
 b=hRbsy0Xpao9BC7bKYkmSlEaBuwrUZVEPrxu5cg3UUssZu6PRxeN1/KPjqwDx3g4SJbgi
 zKRQxOpNqbRPx1U84hGyR4Nke6LmjiW/GluoUMXVRCwCen7ZQ9n+55q23uguFQyQY1JvV
 n2sM62q3Qqr/YKWX4TgVNJkFn9FuwHL906URvKpuoG/HcjYVtxtbNFeCLeUuIyU25uzAr
 0QpF5ymUr0woU4lhk+xOQIXjikrJ/Rdqkd5Q8+0liQW+4yrU1WIp7sgNOPg3sn/jiUTy8
 m3TAvEpi4fkajeT6UBj+pneO1lazgUW7r23blQzPfMv34Tofwqe1xPxfkfMb2ln0H0Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CEFpixQ3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=CEFpixQ3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27787811C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792702326;
 bh=YPSIYtzLqRHZURp4gQdYADijlkc48tfe2f2yBeCMpDs=;
 h=From:To:Cc:Subject:Date:From;
 b=CEFpixQ3KGL6/xLxxboyosvR/+EiaNt+FsSuPp3m/MnhfpACFyIFSnUFA3lyDVt3n
 GYmnhiqA7v1NZR9Fay9kwSPgSiLqoByGDxhHznVxWHB6IG0W6wYE66U5LH31vImtFQ
 LhHmNcBANcWSFuDvXqOdT0G1LPpcGhF1esquU5dJ+7touiqmodzgC46wUIvKX5KLR+
 JuaIPrE1q9MPSSPrNwr8ZGLdNWB5j5OKjELkcODSoQVXsbm3mXUWZD0XoVKZ8KmfF/
 ppkE7jIP3T6KMZb3FeIq34iCiJv9c4Qu1RTPTJsinWb5qKPWvVfdiQP0w3afdXSaub
 JOfZWS6ZYxhzQ==
X-KAS-Sym: v3:f51bdf72230551df:RV2rMlYB4NYuZGUMydTEz3YcWpBRbzLbZ59Yev4HZ63b3
 +osv9gkDoT5rQOW/FaKJ1T+p3iPn7RT/tlJCAIbI1z1ATvY1lDYmpoD+imgGztb29uN4Cd8a8Xi
 9V6DfrM+aXfRPsZvZ3nNwzT+CVE1C0BPSBLEUo3Q/GqYJktbCbPrbZM1IJXelnJ04Y3mVm4s7sj
 UD8XRAb4MAC5Bk/4sAD/UH0Ayt6b1hj0ys6P5vGO4YY5c8er35sn6rLfzxjuXBQiRz32QbJSi7p
 SO8G/5V/BOtQAys/NmnQd1947rv2gvf0kcLC7iVXTaET7uHU7X0/e+fdNLB9fYZF+PzXWwKA==:
 dcw6LpqGxit1XwMlbdsAA82r7fwh83umcB8ToEq1jJg6peO4l2q0Bs63KBrHv0Nt9z3Y9hqxdU0
 mxG8PgPy1SXhuqWzpm4UzqrE7KBGpb3Jqxakoqz7b+np0BK+x5bH7silg9e53vngT7jlo/vngaD
 Psl0qZNZgiRNp8iDNrl/Zj3Sd6v1Gl6DPDOvCi901hNALThdihpGOr3pV0OHKm4iMLl2zbub8/c
 8RgVvzax1v7UScVtsc1j5uzBgkF+UlZoPFQ7rSBFmzt7aV35pg1HzaQ6MYDhdSU9qzZNHubmJJq
 F7Jn5gR2b8QRn6vvDwLGV1BT2mjZ16ieov7sfpD7pKh6syjUE0WhinBu1wSc0OWQ3rcW4Fm7Qk/
 aYxbNq9QRapGwiyk0/2zewVP7jzH4Z5hCNcq3iVcrdBnkxAvgTcf3dR/ma2R74WMJF4ObWxIin1
 edYrc8/FXMBpX5U1uox1rVck4zV8YUnrRuV2ZOFrYgFeDH0eKSc0L1gGtMn8Yi7zjmeE7VjK+8o
 1obCJY7cFmVYT8yM1L5DhtqA5ysYaO2Ji9fpxM7S2bhPTCB34Lt5IH08OBQkzqd69xWEB7yhfCn
 hdqsP36JldYA6/lMMJVgMQNrROEae1sxK1l7SbrSNhJnbKq5oZcQ65akaHpns4+yI+9M4+3nA46
 JDXq608OV9Q+hb2jSoQ/5PYcloScM81WxhSXtfOLvtV20DCChRu2ozGzhqA==
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 057F7A4C6519;
 Thu, 22 Oct 2026 22:52:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43810)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJzld-000000001Eq-13tE;
 Thu, 22 Oct 2026 20:52:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 22:52:05 +0200
Message-ID: <20261022205205.3030927-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/python3: security bump version to
 3.14.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://www.python.org/downloads/release/python-3149/
https://docs.python.org/release/3.14.9/whatsnew/changelog.html
https://discuss.python.org/t/python-3-15-1-3-14-9-and-3-13-17-are-out/109595

Fixes CVE 2026-12345.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index ae4a00c319..20abfb573f 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-3148/
-sha256  c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73  Python-3.14.8.tar.xz
+# From https://www.python.org/downloads/release/python-3149/
+sha256  e02d9ac21cebda6e46435369744a92c65cc7cd8669697694122cf97ffacd1e53  Python-3.14.9.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b86453f145..1916982dfe 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
