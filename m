Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1667606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CsZzKd8m
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A78894083D;
	Thu, 22 Oct 2026 15:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RCMlY4ZwZ0U; Thu, 22 Oct 2026 15:39:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C359440675
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792683555;
	b=YEgGexsfIxAiUljssMdxS6N64UPfWgh+TzfokSfCg4CvqdNtoYwViAGPp1kYLR09A1Su
	 AXG4I8e992MXEND9zGL2lK7M8PE1DjWw2sWinNsXneGFvCQvVwt/HbXGvHawBq2qb6cTz
	 Is5wlmwS4oRPxeNZ5jr7otbfXuPhRRGmgJFcU7Gec6R4ztge+P4SmT+/lUU/F0KrNsand
	 IKyRYsecqWvV4XkJFfH4xK0scgfIRVe8N+nNutWhLO0YswpflnWZ65ZerRL1zGO0a0bbw
	 StKNatDNH6JsEVbKw4vtdCYT+vCQG1cl+nQ/GLbxJluP9ZVK4OjhWeo0L1mkZB4kkwQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792683555;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wxXL66uiCoDYZBxgfIkvMH9sxSgfjEi+BaIpq3oUANs=;
	b=FtusGaUUBMwR3IeRSA8zm4+YpfPJvb5EFbuV8ZGfsYvryxeZ9+A0uxZCJicFLIAUWGpx
	 8hLvX6l4xGXxeBdfW7u5/eoyD2VBIRm0lOZBvDQUwvR9QnSKCNJuU6yjYy+4mtNz4qEiP
	 HNP9OT8HxIgS+blF1UxVyhVLpoKUI+DzhS73vtziUK67EEQ1XkuYfm1zxszRlWf0Zz75X
	 YDscoX3adkn96OQET+2v8pND+aQA5Fiz87kO+QMe6heSpp9E+3JxP5qQxVBcdncDJC2cu
	 D3g+k2fCyNvffZVPOjVnYfMTJhML2seheIKEzB9dTnuerSSpFcWY3FmfZfWpZM0rlnQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792683555;
	bh=wxXL66uiCoDYZBxgfIkvMH9sxSgfjEi+BaIpq3oUANs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CsZzKd8mcrUmUeG8NZ0cvzQRC1a6vEMQQTZQArFQtRp1IjF6hkbjUDMVP5tWNu0k/
	 bgRrWIxm8pDMO1TaizoiOPKK6mYvSGTXx1PcRzhNMYrFvaW+CmcC9aGvUDaX8fDxWr
	 ZPKzyvnMpKml+Xludpcgl4tQx6/HACl1Ua/IfSEcYw+o6TSsqXyQPoSM4s2Hy9Rtmh
	 AS3AFTq068N9jweIWvyFuYFkwdF2T0ZZFDB5xupjpM9X/zUccO9BlUupoAD186K/dF
	 G9sqoSsqDp0ucFu3k+62qWrZTh8Dqw6cUY+T2ivcmoNRaVvvoKcNBNx7y3xuUuQY9a
	 EAGU+PWJ4zzjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C359440675;
	Thu, 22 Oct 2026 15:39:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E2F01AB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24F24811A3
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nts8q7KylyWL for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:39:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 35C0E811D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792683551;
 b=DTirE4a033PU3NKRIvwwqLm16MKZIAU3MErEN0KDVH1bwWJ5/hNlCpkHw55fOZCtX6mk
 6kwZYF7DoazBcq9E5yDCy4ekkV3GnPtv01GMPDxq4UYVXgIXudQl3YBzTOPu721hUyRZ6
 EXszmnMzsm9nj/nuPmBOOs3vyuB6QUanhP8Z+8mSesubBzN9PYIarQl0B+5JfRJmCueHk
 L6iG2xoXKjeUDV56JMdGH42jsXvErJWCFTzaQ3+XCnnW+OEAppMhM7Y56a2TULVlcVSLz
 i5865AJ+v5CEnNbcWju1Ktic7+i9h2ZQ3oUN6pJ6ZSqQFI7Iceb124054zGWrWSZIDg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792683551;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=n/d1cTK2ocZ+DAGz8+/pegdDKhzB/Htasu5Coga+9Nk=;
 b=Gy7DvUT4qCiefcwCVQTaiLMpid4oA1NLpsbe+fBF0HflQBzXckqBymfhEA3DQagZN1mh
 qkkj+yhD7H3h+SZ6Lg1/5kha5OP8wFqXwwikStkPtweVzCTKvH4p9ZER8EOH2A3H7G7/Y
 ltLH+owW0kJLPxRM2r2xjGBnQHnjfDdxrnb8Sal4yR4gbDvyczPLPCuO192jcm6VgiSEC
 JQFP4yfDiYtLGHDuGD+p/Bgr19kuhtxsS+1zHlzYaffSr6LZld460bbGJUdnyHwA1LNBx
 /7mgmk60ZX5rOQ0mJhcXyNPahcdTvQK+q1zCL9ut5FXo5LJGiRPSYWhaLK0OcjujGUw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35C0E811D0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:39:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22AB99B9D2; Thu, 22 Oct 2026 15:37:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 15:54:47 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3c4bc567c5fd932971fc62a2d72807edb7413cb8
X-Git-Newrev: 96a5f9c8632e234d2ad873fb82a4d8a2cd48b666
X-Patchwork-Hint: ignore
Message-Id: <20261022153747.22AB99B9D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-certifi:
 bump to version 2026.10.18
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/96a5f9c8632e234d2ad873fb82a4d8a2cd48b666
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 32627e5b61d0a303ed6499cf589d8e2548cac966)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index a0c24e66f3..c6e0206ea8 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  926857e560a3ae443ee35c2de270d75b  certifi-2026.7.22.tar.gz
-sha256  741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55  certifi-2026.7.22.tar.gz
+md5  915d53b5fceb004991800f62b552e0c0  certifi-2026.10.18.tar.gz
+sha256  b9995d97b64d0431a5af837d8ca8cd6238104d1f319f04bd93ea43124d6c861e  certifi-2026.10.18.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 17c6925ae7..5430596350 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2026.7.22
+PYTHON_CERTIFI_VERSION = 2026.10.18
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/7e/eb/a2aa1ac3ea30dd3f30ca57f40232138b6b0040719316ecb85daf61167771
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
