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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF21C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:09:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A465B610A7
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A465B610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F6AE415E8;
	Sun,  1 Aug 2021 12:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gmcKa2k5MmLh; Sun,  1 Aug 2021 12:09:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DADC4415E5;
	Sun,  1 Aug 2021 12:09:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12CA11BF2EF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0358383C80
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RBwRgDCpXe0m for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:08:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C28A083C7A
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:08:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A463C5FFB4;
 Sun,  1 Aug 2021 14:07:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627819683;
 bh=2fFyuV+SuTPKg113KDKvk47pVYDZSYhX5UMKf7wB3H0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sYDZKikAJ1TkMhK1a3hTjwQEd0SW+VBZJDfL+AwIOsjaxdGxCRqEtAPJQgf8EU78n
 OO9T5Ozyc4LfLh9nomrQuiINLCDUQ+0KZmIEkuevWOCdkeg8gojvGVVbbN0eLgilT2
 liblrzDSX4TFd9MTCQAu+6cCfFQHcJsMlfUvhe/H/8W+wutkem0E+UtBSGlF/xFKMW
 MZZ6iOZh9Zm237ByCvMLXpl9dlJxKqJQmXC0ybZ89j3m/BtqBj+6U9yARjAPW7mCIO
 aDnxcFe0xzIX5FHnFwALeLa6hGjZrTT+vMtLKwYwOaZOqFGB3wry7Knvwg5r15QmUA
 t2c1qsNGuaTdg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 14:07:57 +0200
Date: Sun, 1 Aug 2021 14:07:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801120757.GT3189549@scaer>
References: <20210801114200.2762991-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801114200.2762991-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/rpcbind: add SELinux module
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-01 13:42 +0200, Fabrice Fontaine spake thusly:
> Support for rpcbind is added by the services/rpcbind module in the
> SELinux refpolicy.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rpcbind/rpcbind.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
> index 725075f962..2eee116755 100644
> --- a/package/rpcbind/rpcbind.mk
> +++ b/package/rpcbind/rpcbind.mk
> @@ -10,6 +10,7 @@ RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
>  RPCBIND_LICENSE = BSD-3-Clause
>  RPCBIND_LICENSE_FILES = COPYING
>  RPCBIND_CPE_ID_VENDOR = rpcbind_project
> +RPCBIND_SELINUX_MODULES = rpcbind
>  
>  RPCBIND_CONF_ENV += \
>  	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
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
