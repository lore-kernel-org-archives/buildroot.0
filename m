Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCCF606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Zwh8km3p
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23A4281255;
	Thu, 22 Oct 2026 21:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQ6_bUJ5Jc1I; Thu, 22 Oct 2026 21:01:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 335348122A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792702869;
	b=qckrhw1cpRIcC/HC/Dw5undHo5M7MBJsqd+PnNG09E/pL9X0djhTYsW90X9WqYKmJ5n8
	 0qJzl6TVZXGW+FklLg20R9WacYKNLzdScXFMrm8qmYPTgSWc+j/WeaVI0HmYrp/BX5V79
	 +vjpbfWNJRG4Amdv+hyPoFDCiMQ6VQlmX5FPoB7FC5tHpVrfD4CcINDSy4yc05gtIl3XL
	 FLyBYqKBJpNqb3oLKxxAcSEHGMfdfWiMI3bT0VcHpORrUTbDU9EOaxIJyEtsqNcOsLX5J
	 I5FEPg1yxOFYCxga48HlkOFc9mgFuWQbT5ZtwZQog0i7c2VXt2SeNVh3sYAfi3wAe9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792702869;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=x5b76ExveMS3m8C3sWqGHdF3pvf4g7rmq2o7n4ZJpt0=;
	b=nu94wjvwt7re1UshFLLPMB7cIk1fTePjAj7jn3H3xgLqsvpXEHyPaIuTsSUR/r4AulT3
	 F7MiMQFLoBj7xsMQ371BqhCBO7E5SQCJI8fTynuJsgg02b1Dtf0WOt1MSmAcAz+SEL6BO
	 pNjHiHcYQrkEoFZ5jWS0A+h7kwrccTKQPQ20Rt6M0Vqu/WcCGMb68GrF0FODOuSO94J7b
	 KjYeKl0WMROauztJRdQtWiLYXLuq1mw51gXO3iN0zD8Z4UMqeO5/26OujZGDJC+TRzTqy
	 KArHIyQU9F4qprtOfWTNSvWIMVxwegYcHdF7QVzkFTKxXg9CUAhGUhYkUwbBh44+nLA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792702869;
	bh=x5b76ExveMS3m8C3sWqGHdF3pvf4g7rmq2o7n4ZJpt0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zwh8km3phnnzzbyHakMsvBav26aOpckQfdecPfdJAnHpjA5aS4guH1yWyjtcWwi9C
	 jtt0XKX9etGrSrJW90UMEmBuk3lN3TxMePP3QthfvbV/qjJHyaqiIuXiys5IdUj+oh
	 ZKevgvUyJ0WggKPp0rviWs/Nwr3fJGQdHtjaXY39TKxFGJiA1cgOwnm3Qgr4qmOsZY
	 nlr1qpgjAWctlzfw9hruH5iidScj09Mv7r68uOBptDHimMMjUn0z30vXfv+KKEek7g
	 SePS9uknAjqXWMxRB/BJ9PPUSx/o6HOcvfVX8UKuFI62X7tu1UrMoM7/MgcgyhmcsF
	 4mUGoKotU6qhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 335348122A;
	Thu, 22 Oct 2026 21:01:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 35541499
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 273DA6080C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fckR0ke__X2j for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:01:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 715946066C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792702867;
 b=D25Q9tM/vPGCLBGa8Cd2bhICO/k777tC6Q0W3KzUkDDeBD5mAhSXR1BEUeeQwE1EvIj4
 6eb6krhecheCmaDd2Ssgiv5HeFjiSBbhHQOLPsw1MrlW4SrFsGrvM1EMaSdZazWiQ+mZs
 32vYatF7MhciGy9x1Ioc7Jliri3C0HoLuPXOvN7Yf92K9F1gnovDvuHPxdKY9P5pMJsJH
 9DHU6OZN34MyS9E6K8DdB+lxJE5PLxQSrQJzTWBG90uJD+9g9NRgAivNsSIst54qbe0ff
 v6Af8woU967pjiB+pPGzFBLnKobuDO2Bk2s8u/BHqANkmuUE6xA+tIKv6a/xh7kIhLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792702867;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=UTGnfVNCIoeIWXctFZL38w9RFAA3lH7ouDo514voHjE=;
 b=eX3qYBWQvyKIFfRQdW9l8Wudz1At2pNpJ1voB1JF637RSp2trPGqDV9JeGpE3krVKFMH
 ww33A4yVJtyAOvfpRO82H5x4IzWP1t7bBaaq60/9/FsMNQQt61TD299IqOZ+bEaGQuyRX
 bVRTiBPG00rBLOkrlqogP7P9Yf7hgH5bvfoMOOotku/ToOVfuEMJn5ujX+sOzhY3O7Ukz
 CKAtBWfy1YaRaaLFkrvpVtdYH4md2vU+I+S1sHvAGDrOgFh1Vat6iqbL5D20aRu5j6E9D
 92Ucu1S77xZ4lFZujnZk/PeJoBu+eqIefp1Wl7tJ6Y8imfF0pihD8w8LKBFyPqDvmVw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 715946066C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:01:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E4A79BA20; Thu, 22 Oct 2026 20:59:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 22:59:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d51abccf376d6273acb681e7d561f24e98b60ea1
X-Git-Newrev: 4e6dc3eed0ec1fda79960fe15708b80f8fee18b5
X-Patchwork-Hint: ignore
Message-Id: <20261022205943.2E4A79BA20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libunistring: bump to version 1.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4e6dc3eed0ec1fda79960fe15708b80f8fee18b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://savannah.gnu.org/projects/libunistring/

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libunistring/libunistring.hash | 4 ++--
 package/libunistring/libunistring.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
index ef2f3da341..7fd66628ff 100644
--- a/package/libunistring/libunistring.hash
+++ b/package/libunistring/libunistring.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libunistring/libunistring-1.4.2.tar.xz.sig
-sha256  5b46e74377ed7409c5b75e7a96f95377b095623b689d8522620927964a41499c  libunistring-1.4.2.tar.xz
+# https://ftp.gnu.org/gnu/libunistring/libunistring-1.5.tar.xz.sig
+sha256  fe89007a8a414ae4790b816b86859e877d3ab135db3c37f06541ff7e85ac344b  libunistring-1.5.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index 57333a35bf..00d44d5015 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNISTRING_VERSION = 1.4.2
+LIBUNISTRING_VERSION = 1.5
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
