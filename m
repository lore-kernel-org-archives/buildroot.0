Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F85C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 13:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B51F82288;
	Sat,  4 Nov 2023 13:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B51F82288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id guBhUQpRyoVw; Sat,  4 Nov 2023 13:55:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84A3782280;
	Sat,  4 Nov 2023 13:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84A3782280
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 785F21BF30C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4020F60F31
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4020F60F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1A8bgoAiWuoq for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 13:55:30 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2510B60E03
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 13:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2510B60E03
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6031960007;
 Sat,  4 Nov 2023 13:55:28 +0000 (UTC)
Date: Sat, 4 Nov 2023 14:55:27 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104145527.1ff6fc02@windsurf>
In-Reply-To: <20231104095448.641992-1-fontaine.fabrice@gmail.com>
References: <20231104095448.641992-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699106128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+elP+yq1Yce1xl0f3rBrsjaaW5HFpfFgECsG7s7QOU=;
 b=LVPcHhlwnKUl3iKOKhc9mTDoRWdGsfkPBKPxQautmuyDOZI0IRCSE6v8w9H2omcwbXYmV1
 8t9b5qC+A5U0IW6hvKyU/fQOJ12Zw0PafeHoGHNlVuSjXOrvyhmYj41iybxVEaJH9D4fWk
 2GpyQzxwrvguJSwodN7zKpnpYElgp9sF0aw2d5vLrXF2Jxm4V2xWECqx5CnwjmDAOAem9K
 HKCA6VNQDMNassf4SU5IWxvxGj+Ldq/ohI6s9sQdhU8FETG82jnDGP7ELjC2rMzRsLD/WN
 qRUzMot2o2ItrMJfpLcBHcMbHN7JOL0FsFWC2b/3GSfwC5nFmjQB3ds8cQgC6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LVPcHhlw
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: fix redis
 handling
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: David GOUARIN <dgouarin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sat,  4 Nov 2023 10:54:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> redis handling is wrong since the addition of the package in commit
> 736c4c1655d93652a9a7e79235bbe726b3d46176. Indeed, freeradius-server
> needs hiredis, not redis
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../freeradius-server/freeradius-server.mk    | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
> index af3320eb44..1931c970e8 100644
> --- a/package/freeradius-server/freeradius-server.mk
> +++ b/package/freeradius-server/freeradius-server.mk
> @@ -71,6 +71,19 @@ FREERADIUS_SERVER_CONF_OPTS += \
>  	--without-rlm_ippool
>  endif
>  
> +ifeq ($(BR2_PACKAGE_HIREDIS),y)
> +FREERADIUS_SERVER_CONF_OPTS += \
> +	--with-rlm_cache_redis \

Are you sure about this option? I don't see it existing.

> -ifeq ($(BR2_PACKAGE_REDIS),y)
> -FREERADIUS_SERVER_CONF_OPTS += --with-rlm_redis --with-rlm_rediswho

And it wasn't used here.

Could you clarify this?

Is this a mixup with your other patch bumping freeradius-server?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
