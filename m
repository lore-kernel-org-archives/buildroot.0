Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CCBC433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:43:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B561F6109D
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B561F6109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9087C401B4;
	Wed, 10 Nov 2021 09:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LO-e-_WgXX93; Wed, 10 Nov 2021 09:43:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4CF6401BF;
	Wed, 10 Nov 2021 09:43:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A836D1BF345
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98C3840414
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZ1vahi9Z1Dc for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 09:42:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD66240413
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 09:42:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:90c4:eaed:10a6:22de])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0A3F05FFA9;
 Wed, 10 Nov 2021 10:42:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636537363;
 bh=Z+8Nx3+Xlh0ebiStgq/ApmHt/DslxYexN6R/lq68x6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g+Wp19k1I15O/vFBagXfGKxkscU9DsxuHVWzGOwGI9HHLlYGJ1P9EITr0ELADhvUA
 +2hFO2RrpFassiGojVuIs8GfiDnFv4hg0xzgjxesy8EiEvj8ueE0I0/0rKDSEZHhdd
 /wtOJIh+ox+jtUaVeRaa5EdhxKKKCwZ5ricnYj6CrPTyKgfzvwrNKm2VQ4lhWGJWT0
 4U3d2DIPVkAb8oSVJGoAFfDiGUfnDRcU/dK82jNO2Rqmfl8TV0bS6LSS43q0+TLj7L
 9FLuDkPk09WYaVq3sWzeJEjW+EqKAHO1j/bawjCnBOCpoDMhME2VVfzpQmTJo6XkoF
 Qgj4YAb63P4+g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Nov 2021 10:42:36 +0100
Date: Wed, 10 Nov 2021 10:42:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211110094236.GL2084998@scaer>
References: <20211109172207.457200-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109172207.457200-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-lib: don't override
 dependencies
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-09 18:22 +0100, Fabrice Fontaine spake thusly:
> Don't override ALSA_LIB_DEPENDENCIES in a conditional
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/alsa-lib/alsa-lib.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
> index 99c53f9408..3bdde217ce 100644
> --- a/package/alsa-lib/alsa-lib.mk
> +++ b/package/alsa-lib/alsa-lib.mk
> @@ -64,13 +64,13 @@ ALSA_LIB_CONF_OPTS += \
>  	--with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
>  	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
>  ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
> -ALSA_LIB_DEPENDENCIES = python
> +ALSA_LIB_DEPENDENCIES += python
>  else
>  ALSA_LIB_CONF_OPTS += \
>  	--with-pythonlibs=-lpython$(PYTHON3_VERSION_MAJOR) \
>  	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
>  ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
> -ALSA_LIB_DEPENDENCIES = python3
> +ALSA_LIB_DEPENDENCIES += python3
>  endif
>  else
>  ALSA_LIB_CONF_OPTS += --disable-python
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
