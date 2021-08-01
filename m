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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6214FC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:25:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13B1060FC1
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13B1060FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBD9983848;
	Sun,  1 Aug 2021 20:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nGJ1OECGHbGE; Sun,  1 Aug 2021 20:25:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36BDA837DA;
	Sun,  1 Aug 2021 20:25:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DB721BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D9D640382
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:25:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-Slf6AwV0wd for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 20:25:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABF2440377
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 20:25:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E78625FF95;
 Sun,  1 Aug 2021 22:25:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627849520;
 bh=+xLPWU0mKIsB1eDMXq/TXUh6uuCg5pJnsWGWfb8n1eI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q1rfk/HJlhL0OU2g40BIG+Pph/FffxQvBL8psBqzutlOT/jZLtNAJVT+ShHWshX7x
 QCOWEY+VAoRkN7Q4dJa3R3YNZlxvErZjPMyWIbnOm1KCywAnLzRlPTSBM3zHDT/tWe
 yegSFMFwxZEx16+QoM0rs7dgcUfs9wA5/dIXd4A/W2jKnfxAlAHvHd22xqiW2+DXWi
 83TwFfGrxILdcoDzfqtOyNrscYVa9u6ddpkVIid0nwPHfwcsR4TaFHkbUqRQvCuOGy
 qthmkvZnSPJUHhFhG/imSAMkT6Ca73JYdm2o4Tk6Gs//i2dFvEw06mrpEjsVOITprl
 xKRMoXtjJw9XQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 22:25:13 +0200
Date: Sun, 1 Aug 2021 22:25:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801202513.GL3189549@scaer>
References: <20210801195820.3928625-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801195820.3928625-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: add SELinux module
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-01 21:58 +0200, Fabrice Fontaine spake thusly:
> Support for samba4 is added by the services/samba module in the SELinux
> refpolicy.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/samba4/samba4.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index ffb582e14d..21daa034af 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -12,6 +12,7 @@ SAMBA4_LICENSE = GPL-3.0+
>  SAMBA4_LICENSE_FILES = COPYING
>  SAMBA4_CPE_ID_VENDOR = samba
>  SAMBA4_CPE_ID_PRODUCT = samba
> +SAMBA4_SELINUX_MODULES = samba
>  SAMBA4_DEPENDENCIES = \
>  	host-e2fsprogs host-flex host-heimdal host-nfs-utils \
>  	host-perl host-perl-parse-yapp host-python3 \
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
