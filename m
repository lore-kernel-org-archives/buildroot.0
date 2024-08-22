Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744B7C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E5F160E14;
	Thu, 22 Aug 2024 18:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Us16z_AMFvxb; Thu, 22 Aug 2024 18:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DF9A60E18
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DF9A60E18;
	Thu, 22 Aug 2024 18:51:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6DD711BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A5D140CC7
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXT-_StYcDUR for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:51:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A5CE740CBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5CE740CBB
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5CE740CBB
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:51:23 +0000 (UTC)
Received: from localhost (unknown [10.0.8.4])
 by mail.tkos.co.il (Postfix) with ESMTP id D3E1D440F90;
 Thu, 22 Aug 2024 21:49:31 +0300 (IDT)
To: Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20240822182050.65230-5-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 22 Aug 2024 20:20:42 +0200")
References: <20240822182050.65230-1-bernd@kuhls.net>
 <20240822182050.65230-5-bernd@kuhls.net>
Date: Thu, 22 Aug 2024 21:51:17 +0300
Message-ID: <874j7ctmqi.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1724352571;
 bh=nCTc5Ou9uFWJu9ls4qjsmFBbD9lPkSNoZ4qcFnQNW8o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SPixobXvJGU5DxXhSc0+u9xFBREsfuMdKeNy6sJQwLd+FiwXtqHBWJBJDAiV/5qf2
 nXy1A1ZDON9yrwyPUujhnxJxz5uCDt4Zy33RelDK0glgcOEY+kwlgd8whcS85D0tIO
 4Tw8TSglz0HNnFdmqu0hHeoStBl76qS2nAlpv6jwsL3RLoV0yyytT7NHEx0WXpGsXl
 3DZbL912PZflHsg2SG67AWFQ7cX4UJmFbjwj3dkmstO6g9lVjz8vwoqyFCg529I0P5
 WhvGbXrLP7pbWvs5GjXOkxZNWV5jQMN3bIH80Wwq9L0OL+OY43qtajpOFEzMWTXflZ
 gCfqo7pHNnrqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=SPixobXv
Subject: Re: [Buildroot] [PATCH/next 05/13] package/libcurl: bump to version
 8.9.1
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Marcin Bis <marcin@bis.org.pl>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Louis-Paul Cordier <lpdev@cordier.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On Thu, Aug 22 2024, Bernd Kuhls wrote:
> Changelog: https://curl.se/changes.html#8_9_1

Thanks for the patch.

This release also fixes CVE-2024-7264.

https://curl.se/docs/CVE-2024-7264.html

baruch

>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index fa325efd7d..1d01935501 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-8.9.0.tar.xz.asc
> +# https://curl.se/download/curl-8.9.1.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  ff09b2791ca56d25fd5c3f3a4927dce7c8a9dc4182200c487ca889fba1fdd412  curl-8.9.0.tar.xz
> +sha256  f292f6cc051d5bbabf725ef85d432dfeacc8711dd717ea97612ae590643801e5  curl-8.9.1.tar.xz
>  sha256  adb1fc06547fd136244179809f7b7c2d2ae6c4534f160aa513af9b6a12866a32  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 966885aeda..3661cbf5bd 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 8.9.0
> +LIBCURL_VERSION = 8.9.1
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
