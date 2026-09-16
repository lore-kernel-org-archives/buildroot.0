Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04404C982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7EE760668;
	Wed, 16 Sep 2026 19:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Ml4bOhlHbE0; Wed, 16 Sep 2026 19:50:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C0FAB6061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789588200;
	b=GaWIwhzhcByFSYDkaGmLxbhiL4h5zKUbq9DFttw7RxVojSc5L4LjQ25Z4XAFVsX9s5fH
	 9Em6KTSrkpt1WHnphIjeoRmgZ0tI9Ejk9JSe0CdzoRz0Y8SpKMTVwMPo9cHKHwrQwB0r7
	 2gC+k6s9NO7gtEsb71nRo6MNS626Os4W/cAU1PT/8JWE0tqEuc/9jTZY91t2BIZEUPC53
	 4GVN/OCYrVLHuLm+oriBpaKkKImuqmYGvkTsO5U5cK8sOVH104KV/TqaMdxWVfKijn7P7
	 9aHeyoiyZ2rtvKk3FSMgEGCAa38Hwo6nRFor3z840ahxC6T68KAbBYRuc9QD4q6WpkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789588200;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bo1mfxWTeKNxg1hvPF0oE1LfE0RPXxh8hhZ5sz5ncDQ=;
	b=JBPZi9QPYNHsCdpQ+xPzDZlgMkWSMyBaQ0aGGVSh2LvR3g/hGJzyBh2c3ww3D8gdofXw
	 f0yw7PoFQ02y802aFXzaEMICfUAbrtLmj/RJMeik9ilJRu+g5jHLcyhTRdW7vT1teAAJx
	 6JV//h9aBGCbYP+v9G0KFV9FzaXZd6ztVb22h0OlKcg9m5LP+S1PFuAPCmdChxNxhvaQ5
	 bwHyEy1Es+OnGDyf0507rbow8Q85htfs2Mx9OBszwaMC676WP9dwQzKgaAJyUBUXvD7wV
	 EGk0HHMgvPIPIN30Ss0suK9Jv5i4RJbamqwrnDuY6vNGvod0QPbyHkM5Iwk3cRCfhyA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789588200;
	bh=bo1mfxWTeKNxg1hvPF0oE1LfE0RPXxh8hhZ5sz5ncDQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IvlgieTysEkatvbOhlZfA/kL/A9NpHbvgEnUE9Q+9b89YC6XwT0iVPsiBrcPP0Ycr
	 5KN8yZaD4E/36SeDJoMtZlU5WhJBYCVZshEa+7cFqnus4U9/khQOLRQh0ZtNu921Aj
	 fr+VOxsjaK0jWmEuTeWOSjxqS4JNGF2xFXMjfXaz9jO4E690v+g0DEZfWCOuIVmu/Q
	 G6yNrev4sckHkkOznt1IUIs5rUdcjspzczjzVNAQXp783xM2772QUjtJXGoQmvvIh7
	 K4tzGwgRc/WK5qyQlRoHcalWmmdcvvABxq2uteDFCyhP/IDFo7vgTGcLSwbPlUKSTp
	 kR5eSCipPdENA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0FAB6061B;
	Wed, 16 Sep 2026 19:50:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A61012E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 987E8400B0
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFvQAkr6jz4k for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:49:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A8A3D4006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789588197;
 b=gR/5fhpyyuS4sfS7jvBosFXLT3z8y3yPj194aNOt3h6tEPsFCv5LnqkY7fohiwWE2Syh
 7niXf1iqVs3kt8JS/zkh2mlV0wtKh56Gm3Ug/6x0+hKukqiXyyxPt5GOiLCzFWj+LV6yq
 zw1T32nIYhtmRE0b54wSOuaQZEZR+/QmPeQPo7/62iP7v1BIT6fB+81rPnQ6lFuHYiOBp
 WWbGdVuz6x79vzk8QP/hw4PC45VJ3xn7PKiZQOOmVf66EtYRZaYYwcHESdr18MDxJlDQ6
 IMngYn6o4VYAbRepnBygGxfW3/ViQkkTGh+aZ24NWRBXtrgbEdc4Z6UJZ/5OlVx60lg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789588197;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=2VFcYYWF5HK5AQkptkD7Z8b6/tNHq7PeBI2jhpyWilc=;
 b=swRxBDEHuJPdEN2K7v0LPtoRHpEaWdWC7DxBbeaPz/+vQzzM6sevZeow87Hainld8P9T
 5hyNxDNz277s3MXgNTGybg2NyBSszbKLTDLm83VAIBmaBdcBx0D4MnOCkqOmcA9W/JyXp
 v4TpILqv4RWjnCYjbHcx+NORM3pmfrtdIvpjqLDzRI5vtKy5MFnSB702YvbI67OyWq9qX
 +wN8S2W9bNfvdNt425b6vlp1XsHeMJDKNzodGItMQqOLmEmxRd9CX/ophjUt1gCu2HjYo
 a+ZVvVrkIdDNtQ0IYH5FdqFnQsYwGxcsY2gNbd0TW2NSqh2XLPK2tvYHIJYl0a/iY1g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NnwklBzx; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8A3D4006B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:49:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 185BC1A08EE
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:49:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DEDAF60337;
 Wed, 16 Sep 2026 19:49:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2862E11C7B060; 
 Wed, 16 Sep 2026 21:49:51 +0200 (CEST)
Date: Wed, 16 Sep 2026 21:49:50 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Message-ID: <aqryuZvR7kbVeoKG@windsurf>
References: <20260908191348.1892945-1-bernd@kuhls.net>
 <20260908191348.1892945-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908191348.1892945-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/3] package/libest: needs OpenSSL engines
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Sep 08, 2026 at 09:13:47PM +0200, Bernd Kuhls wrote:
> Fixes build error:
> 
> In file included from client.c:14:
> client.c: In function 'JNI_OnLoad':
> ./../../src/est/est.h:834:10: error: implicit declaration of function 'ERR_load_crypto_strings'; did you mean 'ERR_load_CRYPTO_strings'? [-Wimplicit-function-declaration]
>   834 |     do { ERR_load_crypto_strings();      \
>       |          ^~~~~~~~~~~~~~~~~~~~~~~
> client.c:88:9: note: in expansion of macro 'est_apps_startup'
>    88 |         est_apps_startup();
>       |         ^~~~~~~~~~~~~~~~
> ./../../src/est/est.h:836:10: error: implicit declaration of function 'ENGINE_load_builtin_engines' [-Wimplicit-function-declaration]
>   836 |          ENGINE_load_builtin_engines();  \
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> client.c:88:9: note: in expansion of macro 'est_apps_startup'
>    88 |         est_apps_startup();
>       |         ^~~~~~~~~~~~~~~~
> client.c: In function 'JNI_OnUnload':
> ./../../src/est/est.h:860:40: error: implicit declaration of function 'ENGINE_cleanup'; did you mean 'EVP_PBE_cleanup'? [-Wimplicit-function-declaration]
>   860 |          OBJ_cleanup(); EVP_cleanup(); ENGINE_cleanup(); \
>       |                                        ^~~~~~~~~~~~~~
> client.c:101:9: note: in expansion of macro 'est_apps_shutdown'
>   101 |         est_apps_shutdown();
>       |         ^~~~~~~~~~~~~~~~~
> ./../../src/est/est.h:862:10: error: implicit declaration of function 'ERR_free_strings'; did you mean 'ERR_load_EC_strings'? [-Wimplicit-function-declaration]
>   862 |          ERR_free_strings(); } while (0)
>       |          ^~~~~~~~~~~~~~~~
> client.c:101:9: note: in expansion of macro 'est_apps_shutdown'
>   101 |         est_apps_shutdown();
>       |         ^~~~~~~~~~~~~~~~~
> client.c: In function 'est_client_raise_exception':
> client.c:122:17: error: implicit declaration of function 'ERR_print_errors_fp' [-Wimplicit-function-declaration]
>   122 |                 ERR_print_errors_fp(stderr);
>       |                 ^~~~~~~~~~~~~~~~~~~
> 
> seen with this defconfig
> 
> BR2_PACKAGE_OPENJDK=y
> BR2_PACKAGE_LIBEST=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I did not apply this patch because the commit message doesn't explain
since when the problem exists. Could you make sure to indicate which
Buildroot commit introduced the issue?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
