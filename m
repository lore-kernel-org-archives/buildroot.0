Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F9EC3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 12:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E93704051E;
	Mon, 12 Aug 2024 12:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTiLRUKPy-Z3; Mon, 12 Aug 2024 12:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C72340584
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C72340584;
	Mon, 12 Aug 2024 12:39:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 587361BF301
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 12:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 454D040584
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 12:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fd0kMctPyIIU for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 12:39:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.89.1.16;
 helo=013.lax.mailroute.net; envelope-from=wdouglass@carnegierobotics.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DF7114051E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF7114051E
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF7114051E
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 12:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 013.lax.mailroute.net (Postfix) with ESMTP id 4WjDc22Q1Yz7tWM;
 Mon, 12 Aug 2024 12:39:30 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10026) with LMTP
 id W4vMubaPgtwU; Mon, 12 Aug 2024 12:39:28 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 013.lax.mailroute.net (Postfix) with ESMTPS id 4WjDbz41h1z7tWK;
 Mon, 12 Aug 2024 12:39:27 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Mon, 12 Aug 2024 08:39:26 -0400
Received: from CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4]) by
 CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4%7]) with mapi id
 15.02.0858.015; Mon, 12 Aug 2024 08:39:26 -0400
To: Max Filippov <jcmvbkbc@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/2] Revert "package/chicken: move literals into text
 section for xtensa architecture"
Thread-Index: AQHa64GH0FQ3+1747020UiHbWcpwt7Ij1V6A
Date: Mon, 12 Aug 2024 12:39:26 +0000
Message-ID: <e9b57e78-0ecc-449c-97bc-16ccb1ddab6d@carnegierobotics.com>
References: <20240811000029.1956409-1-jcmvbkbc@gmail.com>
 <20240811000029.1956409-2-jcmvbkbc@gmail.com>
In-Reply-To: <20240811000029.1956409-2-jcmvbkbc@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-originating-ip: [10.1.80.121]
Content-ID: <76410803EECCDB49887CA355A3CB6B4E@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1723466368; x=1726058369;
 bh=IHSCB+uYeY0LeOdIWgPvmVaZbjczfTdU25nH8FIrV10=; b=C19b085z0Rtj
 ff5l8t2+NO3u/GOr9KlCyCT+z1J4z/E7NiI9vIeQMddv63rFrJwCvVpu77azgVJL
 Rfh+UB6+42M5qQ1TJ+NhWFbPP4AyYbffKdIg10w7JcWbsaVzq/PRNeUhOs4TE8gE
 79Z8sLRNZwHZsYBmjW6p8i8zEWj7CHV2s2NSXQbfPo7CPYvwgsTpeRq5py51ifnk
 5XsPHWx5R7js/JseEzMvExMTO4S/k3gNsgUYApNADrB1Xd5lMsxseN8txFE/ooRL
 zDHMB2Afdyb29wZhaA8z9K/LEt2RglqBn481zloa6TSEmvG2jTYkUIzd7nDzPwMc
 gXFBX4O1GQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=carnegierobotics.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=C19b085z
Subject: Re: [Buildroot] [PATCH 1/2] Revert "package/chicken: move literals
 into text section for xtensa architecture"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Woody Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woody Douglass <wdouglass@carnegierobotics.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/10/24 20:00, Max Filippov wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender.
>
>
> This reverts commit 86e51fd5fe2810bbf833b48c4914dcd2de01bdbe.
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>   .../0001-xtensa-text-section-literals.patch   | 30 -------------------
>   package/chicken/chicken.mk                    | 14 ++-------
>   2 files changed, 2 insertions(+), 42 deletions(-)
>   delete mode 100644 package/chicken/0001-xtensa-text-section-literals.patch
>
> diff --git a/package/chicken/0001-xtensa-text-section-literals.patch b/package/chicken/0001-xtensa-text-section-literals.patch
> deleted file mode 100644
> index b93aaf9e218d..000000000000
> --- a/package/chicken/0001-xtensa-text-section-literals.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From e8d177f4d4e1c6bc41787ea1621e323ff4ad493e Mon Sep 17 00:00:00 2001
> -From: Woodrow Douglass <wdouglass@carnegierobotics.com>
> -Date: Mon, 22 Jul 2024 08:50:37 -0400
> -Subject: [PATCH] Move literals into text section for xtensa architecture
> -
> -Upstream: https://bugs.call-cc.org/ticket/1840
> -Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
> ----
> - Makefile.linux | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/Makefile.linux b/Makefile.linux
> -index b628cda4..e97c2b94 100644
> ---- a/Makefile.linux
> -+++ b/Makefile.linux
> -@@ -52,6 +52,11 @@ USES_SONAME = yes
> -
> - # architectures
> -
> -+ifeq ($(ARCH),xtensa)
> -+C_COMPILER_OPTIONS += -mtext-section-literals
> -+LINKER_OPTIONS += -mtext-section-literals
> -+endif
> -+
> - ifeq ($(ARCH),x32)
> - C_COMPILER_OPTIONS += -mx32
> - LINKER_OPTIONS += -mx32
> ---
> -2.39.2
> -
> diff --git a/package/chicken/chicken.mk b/package/chicken/chicken.mk
> index 0520280134ab..2667f7823d8a 100644
> --- a/package/chicken/chicken.mk
> +++ b/package/chicken/chicken.mk
> @@ -11,19 +11,9 @@ CHICKEN_LICENSE_FILES = LICENSE
>   CHICKEN_CPE_ID_VENDOR = call-cc
>   CHICKEN_INSTALL_STAGING = YES
>
> -# Chicken only uses the "arch" variable for some special-case compile
> -# arguments If it's empty, it tries to detect the arch host Filter out
> -# values that have an effect, or pass "unused" here
> -ifeq ($(NORMALIZED_ARCH),x86_64)
> -CHICKEN_ARCH = x86-64

changing the spelling to `x86-64` here is a good idea i think, because 
chicken does add some flags. Other then that, i agree that the 
C_COMPILER_OPTIMIZATION_OPTIONS approach is better here


> -else ifeq ($(NORMALIZED_ARCH),xtensa)
> -CHICKEN_ARCH = xtensa
> -else
> -CHICKEN_ARCH = unused
> -endif
> -
> +# If ARCH is not set, it attempts to autodiscover. But it is anyway not used.
>   CHICKEN_MAKE_OPTS = \
> -       ARCH="$(CHICKEN_ARCH)" \
> +       ARCH=unused \
>          C_COMPILER="$(TARGET_CC)" \
>          CXX_COMPILER="$(TARGET_CXX)" \
>          PREFIX=/usr \
> --
> 2.39.2
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
