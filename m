Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5164DECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 07:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8DAE8134A;
	Tue,  6 Sep 2022 07:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8DAE8134A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PxKRS5D2fG2y; Tue,  6 Sep 2022 07:38:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1094E81301;
	Tue,  6 Sep 2022 07:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1094E81301
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB50C1BF30F
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 07:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8493940B94
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 07:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8493940B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jHLrtdMNsvul for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 07:38:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90DE240B90
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90DE240B90
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 07:38:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AD0CFB00579;
 Tue,  6 Sep 2022 09:38:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 09:38:11 +0200
Date: Tue, 6 Sep 2022 09:38:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220906073811.GO1490660@scaer>
References: <20220904203235.7300-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904203235.7300-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662449893;
 bh=1xksoE+ftw+WiXymOjm0Zx2TfkeO0hkP/UUCyPKcRIQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=McSVuf2gAZoBmnv1znjda0OaelI/lZs9MGvJ7It6lqPtMEKwDkXbdnCT9m5jUB8zi
 BRfvanc+0JRmty1NsTaRAYK9IJK3TgxK86CGV+r2OtBgsjTfvzvP6/trKir5RtowRZ
 lS3+vPAdo3bURlLPeEs4NvAdZt1Sz7LInygps+JYdx9pZWyqDpZzBcOWEFojgqr8BB
 zIdR/DqRRjMk1CNZCFKKraNtqweGrEgIywx2n5nWRtTCKuUePMqMlLU/xFHweHDAif
 rs/oWrY9qGo5FzGM9myEIxXG6vKYgITzyo/IYSH05eddEVDixdYezaVHnFmUtYyw7I
 z9pk/amAGlGGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=McSVuf2g
Subject: Re: [Buildroot] [PATCH/next 1/1] package/yaml-cpp: bump to version
 0.7.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-09-04 22:32 +0200, Fabrice Fontaine spake thusly:
> Handling YAML_BUILD_SHARED_LIBS is not needed since
> https://github.com/jbeder/yaml-cpp/commit/52a1378e48e15d42a0b755af7146394c6eff998c
> 
> https://github.com/jbeder/yaml-cpp/releases/tag/yaml-cpp-0.7.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/yaml-cpp/yaml-cpp.hash | 2 +-
>  package/yaml-cpp/yaml-cpp.mk   | 8 +-------
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/package/yaml-cpp/yaml-cpp.hash b/package/yaml-cpp/yaml-cpp.hash
> index 2f7a6fc639..9ad9041439 100644
> --- a/package/yaml-cpp/yaml-cpp.hash
> +++ b/package/yaml-cpp/yaml-cpp.hash
> @@ -1,3 +1,3 @@
>  # locally computed
> -sha256  77ea1b90b3718aa0c324207cb29418f5bced2354c2e483a9523d98c3460af1ed  yaml-cpp-0.6.3.tar.gz
> +sha256  43e6a9fcb146ad871515f0d0873947e5d497a1c9c60c58cb102a97b47208b7c3  yaml-cpp-0.7.0.tar.gz
>  sha256  aa6fcc27be034e41e21dd832f9175bfe694a48491d9e14ff0fa278e19ad14f1b  LICENSE
> diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
> index 895072ec45..d65298ffb9 100644
> --- a/package/yaml-cpp/yaml-cpp.mk
> +++ b/package/yaml-cpp/yaml-cpp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -YAML_CPP_VERSION = 0.6.3
> +YAML_CPP_VERSION = 0.7.0
>  YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,yaml-cpp-$(YAML_CPP_VERSION))
>  YAML_CPP_INSTALL_STAGING = YES
>  YAML_CPP_LICENSE = MIT
> @@ -16,10 +16,4 @@ YAML_CPP_CONF_OPTS += \
>  	-DYAML_CPP_BUILD_TESTS=OFF \
>  	-DYAML_CPP_BUILD_TOOLS=OFF
>  
> -ifeq ($(BR2_STATIC_LIBS),y)
> -YAML_CPP_CONF_OPTS += -DYAML_BUILD_SHARED_LIBS=OFF
> -else
> -YAML_CPP_CONF_OPTS += -DYAML_BUILD_SHARED_LIBS=ON
> -endif
> -
>  $(eval $(cmake-package))
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
