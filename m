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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B84C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 18:48:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FEA4610A0
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 18:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FEA4610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFEB9831B0;
	Sun,  1 Aug 2021 18:48:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PbV3U5QPkzpa; Sun,  1 Aug 2021 18:48:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F0A5831A5;
	Sun,  1 Aug 2021 18:48:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 136DE1BF399
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 18:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0335D831AC
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 18:47:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cUS6s09KCfIR for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 18:47:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B41288319F
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 18:47:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D0AFF5FFAA;
 Sun,  1 Aug 2021 20:47:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627843668;
 bh=pwkbw2Tah6NMElKgxcMfXfvKzy9jRaFzRT6m3TMFig4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eyvt60aHrtX+OCsW74JJwDGqf5Y4FgTN1AAYuZelNAmCJ8j2yjMhZcwAbsQ2a6HLo
 4YJSz9GOMxSulkBjw21iqbJLFry5sGzSG3tQYUDzY1FbrG/NtKOvfKnrdc/TQZ0xtx
 LbLJvFQtG6xCSSuCiZgARtxM0vii5B+zLmFPY9LjdcVDxQtJ1dP6Vf50ElO49TKe8N
 HWrqfLaCr6weiA658GlhMVGsQpYLSEP5y2Tt9vXH0tQYy254nzanZMt2D5LAmEzuTV
 ReGUZLsEeuDh5ajYntx/6bKdjtpocSG6f7qb6t/WAHkXHGsE7S+86q3CEBbZilRz+i
 SKL6WK0aZZQCg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 20:47:41 +0200
Date: Sun, 1 Aug 2021 20:47:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801184741.GG3189549@scaer>
References: <20210801121336.3054884-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801121336.3054884-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libloki: fix build with gcc 11
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
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-01 14:13 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with gcc 11:
> 
> In file included from ../include/loki/SmartPtr.h:33,
>                  from SmartPtr.cpp:20:
> ../include/loki/SmallObj.h: At global scope:
> ../include/loki/SmallObj.h:462:57: error: ISO C++17 does not allow dynamic exception specifications
>   462 |         static void * operator new ( std::size_t size ) throw ( std::bad_alloc )
>       |
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/768727160beaca5df3ef18be29cfbaa3ced67ad5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libloki/libloki.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libloki/libloki.mk b/package/libloki/libloki.mk
> index 7564239f6a..07a9372df9 100644
> --- a/package/libloki/libloki.mk
> +++ b/package/libloki/libloki.mk
> @@ -23,6 +23,7 @@ endif
>  
>  define LIBLOKI_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
>  		-C $(@D) $(LIBLOKI_BUILD_TARGETS)
>  endef
>  
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
