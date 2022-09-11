Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A104ECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 18:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41ED284602;
	Sun, 11 Sep 2022 18:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41ED284602
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fsBW75TN-XGa; Sun, 11 Sep 2022 18:27:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2C65845FC;
	Sun, 11 Sep 2022 18:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2C65845FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B99A11BF3EB
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95245400C6
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95245400C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G-7Vtl2lQX1T for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 18:26:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C7C541888
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C7C541888
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 18:26:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:41d6:744a:8631:c709])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6FDA113F854;
 Sun, 11 Sep 2022 20:26:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Sep 2022 20:26:29 +0200
Date: Sun, 11 Sep 2022 20:26:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220911182629.GF898622@scaer>
References: <20220910223234.37792-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220910223234.37792-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662920792;
 bh=m/b5BUz/+DACjhBUpI50yWJpyQdmALr+fB/a+7usNw8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yx2BuhpLUnl4yznf9ChBeYZhUS5Q4AP6hgcCf4+/0p8ArYRiflY9PpifGtZTfrSQs
 tKcq1h+dOsY/2m8SczlhOzuwDjkFSWj0iLdt5+7g1LG8HUuaxyJG3Qm6ueVKIoExUk
 47/ax/7Ij8GQFC0x80ucA/iSM6Mv3lVoOnrjyNwXxwSCsqUNDgcEHISox5an6vqPt+
 5vBWDyIhAg2wqTLzVp4gBHxw0snSVtfnijw1hTwB0kwISaVrIAm2tOyLHz3azvrnhn
 MlZZ/qSaTl0E01JS1dgrVD6H2jSYFi9aDaYY0ImnAeA3k/A7e3WMBCCwm3/orkb/rN
 LkvguIf+509zg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yx2BuhpL
Subject: Re: [Buildroot] [PATCH 1/1] package/jpeg-turbo: bump to version
 2.1.4
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

Fabrice, All,

On 2022-09-11 00:32 +0200, Fabrice Fontaine spake thusly:
> https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/2.1.4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/jpeg-turbo/jpeg-turbo.hash | 8 ++++----
>  package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
> index a892fd3eaa..6e1278b48a 100644
> --- a/package/jpeg-turbo/jpeg-turbo.hash
> +++ b/package/jpeg-turbo/jpeg-turbo.hash
> @@ -1,7 +1,7 @@
> -# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.3/
> -sha1  6dec48193bb27e1c07abae8230031ce9ecb1cfec  libjpeg-turbo-2.1.3.tar.gz
> -md5  85244dedeaf06f636a9e7ddea6d236d8  libjpeg-turbo-2.1.3.tar.gz
> +# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.4/
> +sha1  5a355c08caa326cef7c2a61e062edfe8dd02ac07  libjpeg-turbo-2.1.4.tar.gz
> +md5  3241b54016c445e5d8f0ebb0ad9294ed  libjpeg-turbo-2.1.4.tar.gz
>  # Locally computed
> -sha256  467b310903832b033fe56cd37720d1b73a6a3bd0171dbf6ff0b620385f4f76d0  libjpeg-turbo-2.1.3.tar.gz
> +sha256  d3ed26a1131a13686dfca4935e520eb7c90ae76fbc45d98bb50a8dc86230342b  libjpeg-turbo-2.1.4.tar.gz
>  sha256  ee1eaf194d5924b6360af8a6ba6a4e1554037091f7505943300cdeec65f1aebb  LICENSE.md
>  sha256  4b7b9f8c03bb8d60270dfd12684e70ab21e4abfd27e73905cd1a7c4cae6f5cdb  README.ijg
> diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
> index 475eb5fa84..e5bc8e7cf2 100644
> --- a/package/jpeg-turbo/jpeg-turbo.mk
> +++ b/package/jpeg-turbo/jpeg-turbo.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -JPEG_TURBO_VERSION = 2.1.3
> +JPEG_TURBO_VERSION = 2.1.4
>  JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
>  JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
>  JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
