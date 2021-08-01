Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C827AC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 18:48:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86BE5610A0
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 18:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86BE5610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51E5C6073D;
	Sun,  1 Aug 2021 18:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2OdgvOsknex; Sun,  1 Aug 2021 18:48:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B843606E5;
	Sun,  1 Aug 2021 18:48:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A88231BF399
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 18:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95490403A9
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 18:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R0GSGnbuetjh for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 18:48:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD110403A2
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 18:48:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C43D25FFA9;
 Sun,  1 Aug 2021 20:47:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627843682;
 bh=A+46aYjqHct/lMOv/z+kivrajndUPseRNQekqnenAvA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rRnEI+K0yWyLmPh27v2+tvEf5HQcYVvR2wPGf+aVBxKOR+EpSg9W96VxmP2b6nm4E
 fpoHOP0pjbQQPqOpgBilUCHxpPrCNo7LNoTf3gRgNcUkG51Qx+9hW4TP9V5UdeF1Yu
 s41daYcaPZuWlX6YLN+Srg2Drjachd1PcI5kw3IKRqXLkNPLj6mq9tybIK3PecDKHc
 qED8lZ1oxZsWiKLgxlDd7LUPxcJVP8gw6zXvDV8uliYD2EidOHKJv+YL8Rx1u6eOz2
 HIMf2qM7dXGpXNgeId3uZFxDE4YbM3NK1EZXcFRS1znGTLnNuicwSB6HEsTQiQ+Uu7
 8MMKrbeV1yELQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 20:47:56 +0200
Date: Sun, 1 Aug 2021 20:47:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801184756.GH3189549@scaer>
References: <20210801121936.3060829-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801121936.3060829-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libfreeimage: fix build with
 gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?utf-8?B?UsOpbWkgUsOpcm9sbGU=?= <remi.rerolle@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-01 14:19 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with gcc 11:
> 
> In file included from Source/FreeImage/../OpenEXR/IlmImf/ImfHeader.h:51,
>                  from Source/FreeImage/../OpenEXR/IlmImf/ImfOutputFile.h:46,
>                  from Source/FreeImage/PluginEXR.cpp:33:
> Source/OpenEXR/Imath/ImathVec.h:228:41: error: ISO C++17 does not allow dynamic exception specifications
>   228 |     const Vec2 &        normalizeExc () throw (IEX_NAMESPACE::MathExc);
>       |                                         ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/953cd07402fe2f99f2361a3b4a7b086a88e0d72d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libfreeimage/libfreeimage.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
> index 91299084a1..4775f92109 100644
> --- a/package/libfreeimage/libfreeimage.mk
> +++ b/package/libfreeimage/libfreeimage.mk
> @@ -20,7 +20,8 @@ define LIBFREEIMAGE_EXTRACT_CMDS
>  endef
>  
>  define LIBFREEIMAGE_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> +		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" $(MAKE) -C $(@D)
>  endef
>  
>  define LIBFREEIMAGE_INSTALL_STAGING_CMDS
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
