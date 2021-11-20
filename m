Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46459C433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 20:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF2BA6076F;
	Sat, 20 Nov 2021 20:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ThNEkTQf1stc; Sat, 20 Nov 2021 20:03:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2804A605F9;
	Sat, 20 Nov 2021 20:03:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59D1A1BF3ED
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 20:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56FA2605F9
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 20:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7EktHOSsI8tW for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 20:03:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07B08605E1
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 20:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637438622;
 bh=G5ef0A1x70PwYNb47hcyZncMF64mK+sWNbZAZfjfctg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=gFGa5legR4//YvSj3jwtFp1VxH9Ijz7B3qTrIHtKsWS5v5lfBkt0i5g59+Wq/BLyU
 X5s1rF61J0votI2O7vxMFwgsASmkROL8g33Y15dD6TZ7+iQk/Cj/sCfandpF45lHBb
 jkuLH4YKIMFJcKyRMEF6GjCd2lwHNqIOAC6b6roc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.105]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkHMP-1mLpg43g4X-00kiEU; Sat, 20
 Nov 2021 21:03:41 +0100
Date: Sat, 20 Nov 2021 21:03:40 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211120210340.087ed09c@gmx.net>
In-Reply-To: <20211120094834.1840554-1-bernd.kuhls@t-online.de>
References: <20211120094834.1840554-1-bernd.kuhls@t-online.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:MCwiVpF8YYvj0ChQfJD+E7TzXC3VDfLrGqh4v28TpEwy6YfSH1M
 icfRNdcyZh+ytOCHpNsfAjdCcOidcYrbcI8MkZWsNMYTw13XtcGEbjbWqPui6cdhStMgfEz
 szxXX4s2x4HbCugSNZ0Wj0eKOv5CuGXuM6jxGO0yiggUBWYw4emLqtWkjhI+6aZuiNQzq3m
 ndzTFlTUErZ+mNwwqGK8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:czUMb1HNKzA=:rZISGrJK/5CmfVrxHEsJHu
 5xYyOGW+ggbFo1RRgF5YY+dBxKd0GMPZJX2Njd46XA3CktNv9lGpL8yQmKkuwmDa2NxYHvxwP
 L9rn/L8JKP48+IPdQl09EQip1IOPLarMS0LVD9YiOl5d+wQqkuhXuKGZtYCSx+GPpFrtgQi0P
 bjodyBZ2B56dSd00d240T1c4p73BajajyDWtdMyOkaI0GRSQN2r9Hacu+Zs5M/9tJmzqf4JDN
 tpWumbrMelQuPijEzTTVo18ADz0brAqxhWejXj6U5/8MKyIij4LSLZDYc5lopjPvKCmb9Wh7d
 Sl9gBLY6pcDkgPcERFH6UcID1gqjlkkcRJqWGnM98J8EkBVpRv1Qxg/pRy01Rm34UaabIDLwU
 dWFRYl3N+X3hK9wYc8vkO/ePGGBeIP5VMl5kvW1qoPXrcnKKSOkl0jartPpyh+t9lFw6Vb/YB
 L6fbvn5nj0QVnbXwmQlrBME9464l3IGEfEH/m/SqT7YVfkqd0uga6JgQvvoF4u0LsmAI0ztOL
 XUnXrY80O4Lk9Xe1BAGbyEWZEYXaPeK2IBls1GzCqdJivKOBTvAH5WgYxU58yq0OZQ8CGCONl
 OxPJHDmfF5HsOaXwsKYnGXkBp9n9qpGGTMXbmWCqONV8yPEQdJ59qlueBJdYyFRLVSHiSucSA
 EVsncUT4lRyAsrFadzGeiOaLQBkTm3QzmCe6fUDv2uBGxElIDqvGF1vOuHVZkdN/O+C/LMcKJ
 ZybPXe8ioUZXfdWzfSieU2rdEjk/axUINXWW3SlgH6cfDtotlBQ7RuMQvOJ9dW4DPQ+ijZsmw
 9xSWhEOOf+04ew/wEA7b91+ruk9rfglzTrJQq7w0zNK26ZH19Ked86Fy/0XenCeE45esIkfU/
 yCaqOZC61cR0bi7lTQlqKMZKJOTw9Akw8GSB21fX9q9H8OJcVaIU6tE143Kb9wVkbYb6D3the
 3IIcwYApfe1AAJxnOyRrLpqCUCtCjhSz0UDZrN7pUFYLg61GE9ZhWhOsy2YWrgeomQOETp5dK
 clPpQQWrURI5We4zQW52nd0hlEn1EzudWSJYTlYas0vM1uV2unl/2q3Y+6JXjUFxvZjLrJeRg
 bKhi+JKCZboz/w=
Subject: Re: [Buildroot] [PATCH/next 1/1] package/jpeg-turbo: bump version
 to 2.1.2
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
Cc: Murat Demirten <mdemirten@yh.com.tr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sat, 20 Nov 2021 10:48:34 +0100, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelogs:
> https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/2.1.0
> https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/2.1.1
> https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/2.1.2
>
> Updated license hashes due to upstream commits:
> https://github.com/libjpeg-turbo/libjpeg-turbo/commits/main/LICENSE.md
> https://github.com/libjpeg-turbo/libjpeg-turbo/commits/main/README.ijg

Which ones of the long list?

Regards,
Peter

>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/jpeg-turbo/jpeg-turbo.hash | 12 ++++++------
>  package/jpeg-turbo/jpeg-turbo.mk   |  2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
> index 1a22b1d6ff..de82199659 100644
> --- a/package/jpeg-turbo/jpeg-turbo.hash
> +++ b/package/jpeg-turbo/jpeg-turbo.hash
> @@ -1,7 +1,7 @@
> -# From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.6/
> -sha1  5406c7676d7df89fb4da791ad5af51202910fb25  libjpeg-turbo-2.0.6.tar.gz
> -md5  4cada3f0bdc93d826fa31bf9e4469ef6  libjpeg-turbo-2.0.6.tar.gz
> +# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.2/
> +sha1  65c51c543b1fbba6db9ff5bee474ccb0b52a929f  libjpeg-turbo-2.1.2.tar.gz
> +md5  e181bd78884dd5392a869209bfa41d4a  libjpeg-turbo-2.1.2.tar.gz
>  # Locally computed
> -sha256  d74b92ac33b0e3657123ddcf6728788c90dc84dcb6a52013d758af3c4af481bb  libjpeg-turbo-2.0.6.tar.gz
> -sha256  0b7a24c3906d26dfbe24e96e9415549b387c3227140dc6b7ab2fb924254e37a1  LICENSE.md
> -sha256  01ccef626ec864773c681d4a4056f72af9052d619e0609df0d369117f8b3efdf  README.ijg
> +sha256  09b96cb8cbff9ea556a9c2d173485fd19488844d55276ed4f42240e1e2073ce5  libjpeg-turbo-2.1.2.tar.gz
> +sha256  7d8683a7f048e715e08b4cada8b7f0d9a6ab8afad88ed09c1143ef764ecbc0f2  LICENSE.md
> +sha256  4b7b9f8c03bb8d60270dfd12684e70ab21e4abfd27e73905cd1a7c4cae6f5cdb  README.ijg
> diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
> index 5c977dc029..ddae019839 100644
> --- a/package/jpeg-turbo/jpeg-turbo.mk
> +++ b/package/jpeg-turbo/jpeg-turbo.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -JPEG_TURBO_VERSION = 2.0.6
> +JPEG_TURBO_VERSION = 2.1.2
>  JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
>  JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
>  JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
