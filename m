Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F4AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 06:32:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A14061268
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 06:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A14061268
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1789C84357;
	Sat, 25 Sep 2021 06:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LDGK1MQZmH3Y; Sat, 25 Sep 2021 06:32:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56C4884134;
	Sat, 25 Sep 2021 06:32:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFA7C1BF30F
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 06:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB36A84134
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 06:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IFYYh9sGxvcU for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 06:32:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 284E98412A
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 06:32:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e5cb:5ead:8e76:4901])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1A12F78034D;
 Sat, 25 Sep 2021 08:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632551536;
 bh=18xnwZCfpXUA1lW962MbM95I24zwp6uF8k1jJ0xldwI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IAbWyCc18qCsSaL/+gYhUC9d37s5aYfHpl8aIORg527iDhtM3kEJIwnLS8506Gnz5
 RsfapebmNL2OuRCUYYTQH8/L7uHEJCLE0OV0CocMmkrhw0F1LziHmmweUr9GbZ1WAN
 6S/rk5ieueypYh/2O/a7VgxY9eiFW1YW9oOv2xuF5fcW9VXHC7xHekeKmYTyl2tXxh
 ZEnnvRIaNUlc8ksac/5oeD8aW5E31T/CTw6eUcxjMEcx7RS7Cr4su46TslI/yoj4XX
 d1Vc6yy9pJUU1JFajVq64xKZJIdkPX82WAoApTZCQqFsKIRuDeqLf7V/0IhdGYRlKk
 TVTe6f+gwNGVA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Sep 2021 08:32:09 +0200
Date: Sat, 25 Sep 2021 08:32:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210925063209.GJ3176@scaer>
References: <20210924213946.2888625-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210924213946.2888625-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/lvm2: make a standard install
 for host
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-09-24 23:39 +0200, Fabrice Fontaine spake thusly:
> Make a standard install (i.e. with pvcreate) for host as it is needed
> for libvirt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lvm2/lvm2.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
> index 3a94aebfd4..d918b5f5b6 100644
> --- a/package/lvm2/lvm2.mk
> +++ b/package/lvm2/lvm2.mk
> @@ -72,8 +72,7 @@ HOST_LVM2_CONF_OPTS = \
>  	--disable-fsadm \
>  	--disable-readline \
>  	--disable-selinux
> -HOST_LVM2_MAKE_OPTS = device-mapper
> -HOST_LVM2_INSTALL_OPTS = install_device-mapper
> +HOST_LVM2_INSTALL_OPTS = DESTDIR=$(HOST_DIR) install

DESTDIR must not be used for host variants.

Indeed, they are already configured with --prefix=$(HOST_DIR) :
    https://git.buildroot.org/buildroot/tree/package/pkg-autotools.mk#n223

And DESTDIR is for out-of-tree installation, but for host packages we do
not install out-of-tree as their prefix is already correct.
    https://www.gnu.org/software/automake/manual/automake.html#DESTDIR

If the install fails because of things installed in /etc and such, then
appropriate --sysconfdir=$(HOST_DIR)/etc et al. should be specified
instead. Or maybe we only need 'make install-exec' ?

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
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
