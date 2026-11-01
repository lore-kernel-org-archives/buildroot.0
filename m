Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7CC606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WjBt1lkG
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32CA14050D;
	Sun,  1 Nov 2026 16:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBR4ejsi0pZh; Sun,  1 Nov 2026 16:30:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C1478405AD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793550634;
	b=K051BymGe+Dje+a2Vy0BcVe+zJC3GY+6LDu95Zs+aqqCSOJ2amLder4flw3fmot8TGuH
	 n+byo7ZOXSmlEExYVfZLRSkJh6Dya6GxglXF9yjd7VXrcbSUxtMT/M7SAgNg6KO2awa37
	 BkEq3vnL9/ynpAWYuPMjmycEGz74a9NQUhVC6xTOTf30mRfzszdlj0NaFowuY9MHEzdNQ
	 shLEe4Qu3fElJOWAdsZelNPrLGAm7NM09FxKxQXlOyHssTKiavziJ4KX/UcmuSNMUYJq0
	 lHNnhkUBT4yO3Pxmk6xG8UjNIzRjW/1opqX8rw/LIsQdnKdfE/y4563PDQPKeODRdvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793550634;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=I6VnzoAf1gRXeQZDfnAFyt0g6URrZEoJ+SiYCUQMD2w=;
	b=WXQtZ2LddB+3HcZRLPARXGNUhKU2jnm2ww6UpPoTQ7UKTkoBbnVuHcpp952eQnUFs/lV
	 NrOtFWHvH2yb6eS1XRVwrpVWsD/yOrWfxjal3TRHX+4LABmOEluNTsyI6fD+wMu5NZ0+9
	 eMLO/mKFlTIhyze0lueOat/z6eBw4bjagn6zJwUd5IWlOYELJs42NpdbWxsqjx92vxIS2
	 apGIc1YDZCO3eELrEpLxRZMWbBxQIJ+iFBS8gSfT5h+RleCcz4bIZobyXpQ2xeGOp3ZDL
	 xV01hFgew/t49H6CpV48itupMRDz/7k0Qn6JplwIN1CWHWdsWbkcKqUiKprAs35amuw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793550634;
	bh=I6VnzoAf1gRXeQZDfnAFyt0g6URrZEoJ+SiYCUQMD2w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WjBt1lkGWbyeqwG2qRPxtxPHdbSt0EKdd3zFHpiSrP1Ln5kmHlQ60yjzapKMqfnp1
	 2oxv3JjUjO5bCb9BJ8op9vyWyqEwlWhhUjrRpIprmKMBm7I26FTJCk6ZOQtBRu17TH
	 KIo09TSPIJbLUIaJEqwsAsOsoCjfwE0VwWvbYLSNzfPmHr7pd+IONYHLL97NNhPhMC
	 AVWTmiuIN86fI5xKk+V4BXLHt2bFTZcJu9sk/RwKVcjTeO5v+2rxLCOfFVV0vAECt6
	 zVWK/eWCyLl+ebDVpJTQB5Zmqo9132663G/M91r3tusclMZbk85m4QSq3e+ZqBo8zh
	 WRoQZgLbFXR9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1478405AD;
	Sun,  1 Nov 2026 16:30:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D30E93A7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D06C860619
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VgMu-LyZQ40H for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:30:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 35643605E4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793550631;
 b=StIbpBt1e3hba69eS2B87Db+y6NNxyw1Ko1mwD0G6DPBHZni6Gy6d6Wm2hjr7V3dIsDS
 vZClVYmT5hkFvyZ5GVNjkVdpIgJeMHKjhsOZrqMfeqZctpajoka7ivH6KlXSzP0AOuZdr
 ayIiBFJ1Eyq/7iKZd8wtE+b0t4p+uerdu2ahph2zuIiYJ3PmjJ43SigBwcc6egli08CDi
 Y1eH4NqFkBZ6HUG1KtS9jIDq0M8H7Vu+7mNqhnHNN7Up6UjYKHepes59eOK8DheW86L0D
 ufxCYxCItbulphUC8MVaCb2w7XbJ9DhBz0u32HduF5T1zzFMO964Afm3k5I/A9ExEQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793550631;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=cGx4uJdqGfqHJMIRvA99DVm/4M97vWi8USbAzu7ft48=;
 b=mGyJrKvCePRqxjkf7NxiIlMl81BYPLUNjH7Rivpvrdx+JwY4QP1+70mb5EeJkdhCXUk7
 b8cehmauycP/tw3nxI7yPI9PMJJWVbQHXjQsXWU9/XnPMoalb7tDyuIbMUaREAx9HpMN+
 hPLiKWlM4DvqpKwp+AV0eA4+SuEggqO2vHS+ysrMr/KdLhsyEwzJPpRwq8vw9H4xX0+YG
 cDuRvqex12YKa1bLCPsrgbYINnHF1O8/ORTEpabIHHd8/pS8h07qJ/WXA7/94hVyNPdVr
 fCwaB8kPS3XEFc+JQpe6zqfv4clDtxsy/r0h47oLxCMWgwqVrkrrrJmJGr38RsC8Dhw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NOd77jBp; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35643605E4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:30:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D6C26C49F76
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:31:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 027AC60750;
 Sun,  1 Nov 2026 16:30:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 111691032912A; Sun,  1 Nov 2026 17:30:26 +0100 (CET)
Date: Sun, 1 Nov 2026 17:30:26 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <audouIxxR5_vsJNX@windsurf>
References: <20261101082513.1583784-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261101082513.1583784-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/dovecot: fix build with LibreSSL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Bernd,

On Sun, Nov 01, 2026 at 09:25:13AM +0100, Bernd Kuhls wrote:

Thanks for the patches, but I don't understand them together.

> diff --git a/package/dovecot/0002-lib-dcrypt-exclude-test_sign_verify_ed448-from-Libre.patch b/package/dovecot/0002-lib-dcrypt-exclude-test_sign_verify_ed448-from-Libre.patch
> new file mode 100644
> index 0000000000..3ae624d56a
> --- /dev/null
> +++ b/package/dovecot/0002-lib-dcrypt-exclude-test_sign_verify_ed448-from-Libre.patch
> @@ -0,0 +1,46 @@
> +From 2615be988c3958104e2c86323564acc05f13e616 Mon Sep 17 00:00:00 2001
> +From: Charlie Li <git@vishwin.info>
> +Date: Fri, 23 Oct 2026 22:34:34 -0400
> +Subject: [PATCH] lib-dcrypt: exclude test_sign_verify_ed448 from LibreSSL
> +
> +Upstream: https://github.com/dovecot/core/pull/340
> +
> +[Bernd: rebased for 2.4.5]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/lib-dcrypt/test-crypto.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/lib-dcrypt/test-crypto.c b/src/lib-dcrypt/test-crypto.c
> +index 558c9c9724..6ed164c0f0 100644
> +--- a/src/lib-dcrypt/test-crypto.c
> ++++ b/src/lib-dcrypt/test-crypto.c
> +@@ -2007,6 +2007,7 @@ static void test_static_verify_ed448(void)
> + 	test_end();
> + }
> + 
> ++#ifndef LIBRESSL_VERSION_NUMBER
> + static void test_sign_verify_ed448(void)
> + {
> + 	const char *error = NULL;
> +@@ -2033,6 +2034,7 @@ static void test_sign_verify_ed448(void)
> + 
> + 	test_end();
> + }
> ++#endif
> + 
> + static void test_xd_keypair(struct dcrypt_keypair *pair)
> + {
> +@@ -2339,7 +2340,9 @@ int main(void)
> + 		test_static_verify_ecdsa_x962,
> + #ifdef HAVE_X25519
> + 		test_sign_verify_ed25519,
> ++#ifndef LIBRESSL_VERSION_NUMBER
> + 		test_sign_verify_ed448,
> ++#endif

So this patch changes test_sign_verify_ed448() so that the function is
not implemented nor used when LIBRESSL_VERSION_NUMBER is defined.

> +diff --git a/src/lib-dcrypt/test-crypto.c b/src/lib-dcrypt/test-crypto.c
> +index 6ed164c0f0..20371cefc5 100644
> +--- a/src/lib-dcrypt/test-crypto.c
> ++++ b/src/lib-dcrypt/test-crypto.c
> +@@ -2007,7 +2007,7 @@ static void test_static_verify_ed448(void)
> + 	test_end();
> + }
> + 
> +-#ifndef LIBRESSL_VERSION_NUMBER
> ++#ifdef SN_ED448

But then here this gets changed so that the function is now defined
when SN_ED448 is available... but why isn't this also changed in
test_xd_keypair() ?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
