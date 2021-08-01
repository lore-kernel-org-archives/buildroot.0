Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AE9C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 14:10:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF716610A2
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 14:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF716610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EB68833B7;
	Sun,  1 Aug 2021 14:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dtuh45hxBRx0; Sun,  1 Aug 2021 14:10:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9394834F2;
	Sun,  1 Aug 2021 14:10:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88D5B1BF31A
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 14:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 982CB8305A
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 14:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Znkb2gx6MbNF for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 14:10:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 572A983342
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 14:10:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 98B175FFA2;
 Sun,  1 Aug 2021 16:10:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627827023;
 bh=9107vqJv3u61+pfwvv1VGslCCdWdDEqFgH8IrUg0oPY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rZxI613GEKUE8FEubYMpk2YpcQSOYOhbDYvFohODKi60CrcS/5TYr0I+0FOXTJvVM
 gGtyhaHCLBp9Sx2PMawT5nCDw8n2Ek7vqVjekOX1YSjTwb2zdB63c9PLKcGujuYrcJ
 wXsKdZeTkDyFABWA49SEbFws8CowE/91dFVVraVVlCIAKazT7GerDk1rR8p9FT+FV4
 TgcTrtvfoXx5AJut/QdQObfhnORQO3Zg24S71RVMcyytEJACaF8c71SXvrpd2aXMHs
 QrTAS69BFcAbTHbgVRSMhbctDXi81YPTROjjupVDB7Bn6Fj4zNzjVBR5xxw6DwUJyR
 s8bBo/HsOBX7w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 16:10:17 +0200
Date: Sun, 1 Aug 2021 16:10:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801141017.GC3189549@scaer>
References: <20210801133324.3658611-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801133324.3658611-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/s390-tools: add libxml2
 optional dependency
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
Cc: Alexander Egorenkov <egorenar@linux.ibm.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-01 15:33 +0200, Fabrice Fontaine spake thusly:
> libxml2 is an optional dependency which is enabled by default since
> version 2.17.0 and
> https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e
> 
> Also set PATH to avoid the following build failures related to
> curl-config and xml2-config:

So, thjis is two different things:
  - a fix for finding curl-config
  - an optional dependency to libxml2

As such, this should be two patches.

> /bin/sh: 1: curl-config: not found
> Error: libcurl is not built with the OpenSSL backend
> make[2]: *** [Makefile:54: check-dep-libekmfweb] Error 1

I don;t like it much that we add staging in the path, I find it very
dangerous... I know we are doing that in quite a few other places, but
I don't think that should be an excuse not to fix this curl-config
properly.

The correct way, I believe, to dfix that, is to replace hard-coded calls
to curl-config with something like, in shell scripts:

    ${CURL_CONFIG:-curl-config} --cflags

while in Makefile, it would probably look like:

    CURL_CONFIG ?= curl-config
    FOO_CFLAGS = `$(CURL_CONFIG) --cflags`

And so on... Ditto for xml2-config, of course...

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.org/results/cfb46d7547c22f0a23aca2286dc5a1d2c20aadfc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/s390-tools/s390-tools.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
> index b5843fe0d6..3d3f24c181 100644
> --- a/package/s390-tools/s390-tools.mk
> +++ b/package/s390-tools/s390-tools.mk
> @@ -15,6 +15,7 @@ S390_TOOLS_MAKE_OPTS = \
>  	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
>  	LINK="$(TARGET_CC)" \
>  	LINKXX="$(TARGET_CXX)" \
> +	PATH="$(STAGING_DIR)/usr/bin:$(BR_PATH)" \
>  	WARNINGS=
>  
>  ifeq ($(BR2_PACKAGE_LIBCURL),y)
> @@ -56,6 +57,13 @@ else
>  S390_TOOLS_MAKE_OPTS += HAVE_GLIB2=0
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> +S390_TOOLS_DEPENDENCIES += libxml2
> +S390_TOOLS_MAKE_OPTS += HAVE_LIBXML2=1
> +else
> +S390_TOOLS_MAKE_OPTS += HAVE_LIBXML2=0
> +endif
> +
>  ifeq ($(BR2_PACKAGE_NCURSES),y)
>  S390_TOOLS_DEPENDENCIES += ncurses
>  S390_TOOLS_MAKE_OPTS += HAVE_NCURSES=1
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
