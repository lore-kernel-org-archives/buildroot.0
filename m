Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D3CECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6906C404F5;
	Sat, 27 Aug 2022 07:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6906C404F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Du8-CCwnloW7; Sat, 27 Aug 2022 07:52:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 897B7404EB;
	Sat, 27 Aug 2022 07:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 897B7404EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB42A1BF853
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3DD1416C0
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3DD1416C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PU5C-Wb2zXDs for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:51:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ED8E415F8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0ED8E415F8
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:51:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 74DA419F742;
 Sat, 27 Aug 2022 09:51:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 09:51:24 +0200
Date: Sat, 27 Aug 2022 09:51:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220827075124.GF37358@scaer>
References: <20220827073816.59961-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220827073816.59961-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661586687;
 bh=PqLvPiBA+9/gbzc43VjY1aJTEermQGBih4fVmzyxazE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AojKWZnfvnOKJ0da/Ctp4v0fDlyHkNgxjZm+6fiZDdWRKE+T7Ybr2QYUHC95lPJwe
 K8Pz4zu1TLzEdNxnkxkQN3FCKud8/STHRdur9UhLzXSXAfaf43nS03jl/cVtYavhFO
 PYtSVY81f10q3ZcuGFFyxvQcsLwQERfb/Azq0ytA/2gWA6y045GKHO9mWJ7a7461s3
 ki0YSRiKRwOMEb00jmWc4akFg/IIlwRw5EQ2JpVButa7l/WwSQojfrTUmUdkxSzgnL
 JlpabYSHDDJN47i2jwXn2FLn5eqKu+30dKU8hJKN6hjI/6XyE8vOoIONUZFLPheUxv
 T7541Pl5c+u1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AojKWZnf
Subject: Re: [Buildroot] [PATCH 1/2] package/dbus-broker: add
 DBUS_BROKER_CPE_ID_VENDOR
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

Fabrice, All,

On 2022-08-27 09:38 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:dbus-broker_project:dbus-broker is a valid CPE identifier for
> this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adbus-broker_project%3Adbus-broker
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of two patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dbus-broker/dbus-broker.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
> index 22c5e8d8b7..85c3f75a3b 100644
> --- a/package/dbus-broker/dbus-broker.mk
> +++ b/package/dbus-broker/dbus-broker.mk
> @@ -23,6 +23,7 @@ DBUS_BROKER_LICENSE_FILES = \
>  	subprojects/c-stdaux/AUTHORS subprojects/c-stdaux/README.md \
>  	subprojects/c-utf8/AUTHORS subprojects/c-utf8/README.md
>  
> +DBUS_BROKER_CPE_ID_VENDOR = dbus-broker_project
>  DBUS_BROKER_DEPENDENCIES = expat systemd
>  DBUS_BROKER_CONF_OPTS = -Dlauncher=true
>  
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
