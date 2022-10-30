Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48911ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC8018124B;
	Sun, 30 Oct 2022 20:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC8018124B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGB-mwhuwTmX; Sun, 30 Oct 2022 20:27:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1496C80FB9;
	Sun, 30 Oct 2022 20:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1496C80FB9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D97F01BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3E8B4025A
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3E8B4025A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkNi5QONGO3a for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:27:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71A19400D2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71A19400D2
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:27:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DDE13B0051E;
 Sun, 30 Oct 2022 21:27:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 21:27:18 +0100
Date: Sun, 30 Oct 2022 21:27:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221030202718.GG1058960@scaer>
References: <20221019215348.3262192-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221019215348.3262192-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667161644;
 bh=3FWM+0CDFkEToJUEL+3raSMefMT+vK20+eo+8XmD00c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LalZoaVqG7MUC5cPuomO16C3exnsWwP2Kw0HAoNKxmSiJYVIMtwGlpgJxUNLy3Zmz
 n1tZs6RrRkDL6gSi+F2+C8EdPA8xqWr8epqMi5LAw+H6xJNvfhPYGi8+KMW8vZIaWr
 au5V0mKelU0HUYYSYYom0bdl//eBePR/LxNjL2dDWKAE/szfmxw2qSkrVb8JwCNYIq
 VPfxBPscXYoAX3fBdcv+0/mKxXnJqvHG9g/O8wDQa5OM143L0aBPcyoUypEJ/wLbIV
 OK4im9hbCmxUhq0jbz13qlm6sk3My9z1Yp03hdteBIgYxEREHf7ASvDLOonqqkJRgb
 ZwIRYBmC2+XZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LalZoaVq
Subject: Re: [Buildroot] [PATCH 1/7] package/python-pluggy: enable host
 package build
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-10-19 15:53 -0600, James Hilliard spake thusly:
> This will be needed for the upcoming host-python-hatchling.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Whole series applied to master, thanks.

I really wonder how many pep517 buildsystems there will be, and how many
packages we'll have to introduce... Fantastic...

Regards,
Yann E. MORIN.

> ---
>  package/python-pluggy/python-pluggy.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-pluggy/python-pluggy.mk b/package/python-pluggy/python-pluggy.mk
> index 59382518ed..6dc6f970ea 100644
> --- a/package/python-pluggy/python-pluggy.mk
> +++ b/package/python-pluggy/python-pluggy.mk
> @@ -11,5 +11,7 @@ PYTHON_PLUGGY_SETUP_TYPE = setuptools
>  PYTHON_PLUGGY_LICENSE = MIT
>  PYTHON_PLUGGY_LICENSE_FILES = LICENSE
>  PYTHON_PLUGGY_DEPENDENCIES = host-python-setuptools-scm
> +HOST_PYTHON_PLUGGY_DEPENDENCIES = host-python-setuptools-scm
>  
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> -- 
> 2.34.1
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
