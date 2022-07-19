Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E805DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 16:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AC9740986;
	Tue, 19 Jul 2022 16:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AC9740986
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KONnC-UcHg0N; Tue, 19 Jul 2022 16:28:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ED734092E;
	Tue, 19 Jul 2022 16:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ED734092E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E3DC1BF417
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84B8B40126
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84B8B40126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TISCMqFidSGL for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 16:28:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96886401A2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96886401A2
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 16:28:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5d47:1bcb:9db:ce0f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0C05C13FA46;
 Tue, 19 Jul 2022 18:28:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 19 Jul 2022 18:28:09 +0200
Date: Tue, 19 Jul 2022 18:28:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Dagonneau <v@vda.io>
Message-ID: <20220719162809.GM2249625@scaer>
References: <20220718185634.526883-1-v@vda.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220718185634.526883-1-v@vda.io>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658248093;
 bh=mVRS+7QLkgK2eN35RBECsk7YBanIkjqqNwLXp4nbWxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JgXauM5pCumEkDFqINZz+TGBfkU9OJ8/A3FJiC1SpVIFoQKxqqF4A3sCsBWJnn0s7
 JmTX2n3NzYq0KLxO4mQmyKWtP6escXzpqSimWbighXLl22IA+4U7qAzVB0IT1rrkJV
 afXumXDtz6D67fgokeyGnRTEybBr3tgmy3FZkXRS+yhkmrPWcVvGpjUS8xfurUNCmk
 sruCQWTQKyDr0O369ju/JWgDzB1Z8oNx02Yxr0omNiSK8pWtNFNd4c42FLVTbV4mqz
 t6pnGZkL61pDkjDnHfu9FcMFLAI1xSB+gHz0BoEEIbc2feYQlxE2+WUg7Pr9WqIUdQ
 QP4bvsSg9rIxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JgXauM5p
Subject: Re: [Buildroot] [PATCH] package/systemd: build fix for systemd v251
 and up
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
Cc: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vincent, All,

(your mail did not make it to the list, so maybe you're not (yet?)
subscribed?)

On 2022-07-18 14:56 -0400, Vincent Dagonneau spake thusly:
> Commit 52adf0e91ef00d21a2e83f7669d0823667ce6b6c included in systemd v251
> removes the efi-cc option. Passing it during building results in the
> build failing.
> 
> I understand that this fix only applies to systemd v250 however I am
> using buildroot with a systemd built out of master and I found that fix.
> I hope it is going to be helpful in the future when buildroot transition
> to v251.

Norbert has very recently posted a bump for v251.3 [0], and I did a
review of it. So we should have it soone I hope!

[0] https://patchwork.ozlabs.org/project/buildroot/patch/20220719130449.334694-1-nolange79@gmail.com/

> I am a happy user of buildroot and I'd be more than happy to contribute
> some more around systemd in the future.

Cool! :-)

> Signed-off-by: Vincent Dagonneau <v@vda.io>
> ---
>  package/systemd/systemd.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 46a4e8de2c..f1b421fb80 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -546,7 +546,6 @@ SYSTEMD_DEPENDENCIES += gnu-efi
>  SYSTEMD_CONF_OPTS += \
>  	-Defi=true \
>  	-Dgnu-efi=true \
> -	-Defi-cc=$(TARGET_CC) \

Since this is required for v250 that we currently have, we can't apply
this change for now; it will have to be part of the bump.

Thanks!

Regards,
Yann E. MORIN.

>  	-Defi-ld=bfd \
>  	-Defi-libdir=$(STAGING_DIR)/usr/lib \
>  	-Defi-includedir=$(STAGING_DIR)/usr/include/efi
> -- 
> 2.36.1
> 

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
