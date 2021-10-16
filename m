Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFD1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:24:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7151760FF2
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7151760FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0093B40227;
	Sat, 16 Oct 2021 07:24:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jxcGR3vOflgU; Sat, 16 Oct 2021 07:24:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01C80400BE;
	Sat, 16 Oct 2021 07:24:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A71341BF369
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3A8440453
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:24:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hsQk9tZEabKi for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 07:24:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DCB540328
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 07:24:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D77C77802D7;
 Sat, 16 Oct 2021 09:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634369057;
 bh=7YabGC5ZVQ8MrtukV4UUm3hYe65nDr10Rg2ex2YekpU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vo7gSakW5hqsVGYl8rgYjDjiHJzHmAZ8SLDCwpBr4lNkDZ5d3s3n87WivWeojCGq7
 rALSRmf6vqLz9l7w0fewpFmPJNbzfyBDf5snMGcnkBIopgMCrTqkqa/D/jgGcK1I5+
 UlSoMyhcaEMyBixWwkGMiIW5/JCg1wBk8pbZNrihlg2qGjjESzGntfk5XGs7EoEL7a
 1AU+1DRMb4IxnhLefoS4mE1STSQvJawX1YFrhnxxpuYG3TxjlT+C6bBDj7T0h9mi1A
 zouSmgKnKJmskfRo97vtO4B4/tAhgAmYX1bYUVnEKBpjPKNFm/Os5b+zBfD5bNN5iI
 ZAE/KR9P7LytQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 09:24:10 +0200
Date: Sat, 16 Oct 2021 09:24:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211016072410.GA4165837@scaer>
References: <20211015183113.1149243-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015183113.1149243-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: raspberrypi depends
 on arm or aarch64
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-10-15 20:31 +0200, Fabrice Fontaine spake thusly:
> Add a dependency on arm or aarch64 for
> BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI to avoid the following build
> failure with one powerpc64 toolchain since commit
> c09f126f570355b8ec134724b453300a4811339c
> as suggested by upstream in
> https://lists.libcamera.org/pipermail/libcamera-devel/2021-October/025796.html:
> 
> In file included from ../include/libcamera/base/log.h:10,
>                  from ../src/ipa/raspberrypi/raspberrypi.cpp:18:
> ../src/ipa/raspberrypi/raspberrypi.cpp:64:53:   in 'constexpr' expansion of 'std::chrono::operator/<long double, std::ratio<1>, double>(std::literals::chrono_literals::operator""s(1.0e+0l), 3.0e+1)'
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/powerpc64-buildroot-linux-gnu/include/c++/9.3.0/chrono:502:32: error: '(1.0e+0l / 3.0e+1)' is not a constant expression
>   502 |  return __cd(__cd(__d).count() / __s);
> ../src/ipa/raspberrypi/raspberrypi.cpp:73:56:   in 'constexpr' expansion of 'std::chrono::operator/<long double, std::ratio<1>, double>(std::literals::chrono_literals::operator""s(1.0e+0l), 6.0e+1)'
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/powerpc64-buildroot-linux-gnu/include/c++/9.3.0/chrono:502:32: error: '(1.0e+0l / 6.0e+1)' is not a constant expression
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/49caebe7ef7e3d63de49e78d5d6839dd0aedf10c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, after adding simialr depepndencies to IPU3 and
RKISP1, as suggested by Kieran. Thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcamera/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index 92c17df849..c510e34924 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -40,6 +40,7 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3
>  
>  config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
>  	bool "raspberrypi pipeline"
> +	depends on BR2_arm || BR2_aarch64
>  	depends on BR2_USE_WCHAR # boost (already enforced for gnutls)
>  	select BR2_PACKAGE_BOOST
>  	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
> -- 
> 2.33.0
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
