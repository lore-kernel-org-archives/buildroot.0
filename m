Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA08FC77B60
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 15:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F46C60D52;
	Sun, 23 Apr 2023 15:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F46C60D52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KaOY5-sZuAbt; Sun, 23 Apr 2023 15:26:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A47F460B38;
	Sun, 23 Apr 2023 15:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A47F460B38
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FBFC1BF855
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 15:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08E6A60B38
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 15:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08E6A60B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pjJQjkwOlgGA for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 15:26:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F18360745
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F18360745
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 15:26:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f69d:4ee8:8d2a:132a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4BBC9B00576;
 Sun, 23 Apr 2023 17:26:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Apr 2023 17:26:13 +0200
Date: Sun, 23 Apr 2023 17:26:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20230423152613.GK2696@scaer>
References: <20230313061323.173744-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230313061323.173744-1-fido_max@inbox.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682263576;
 bh=AHmJoBLNS8KqFBliH21KIA759iOV05rKgdzGxEW1Xyk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NdQclraTfsII+BUuZkYe8dNZ9S9c8tQ3q4NgJzzNEhjEzTBAWxI1EvWybhP/zjW+M
 dTBCWcpjdszIQueM1S4lkYU805l+1SwkwdSvxTy/Vc8azYqSMVR2TKimnqq3jpCVrT
 xpYO78Ogbj64dv4YVU0qJarS43I5cdDKRudblLwN/VfIa+bMdbsnWWsa/Qw/hiAQLl
 ESIQH277OQPmbTfkVBVv4Wb0FDnXVxW5sO6ScgyMebuuSnXFAeVzKKog+N/DTxbQif
 vyoRifaGEQzjVmq69Faf7DWK7hnBBLR44V498jrS+nxAAk3MEH6LYdBsq0nH3eR6zQ
 e7NP6G6sMFQ8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NdQclraT
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: ignore CVE-2017-8806
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Maxim, All,

On 2023-03-13 09:13 +0300, Maxim Kochetkov via buildroot spake thusly:
> CVE-2017-8806 is related to postgresql-common package.

I've reworded that sentence to explain that postgresql-common is a
package in Debian-like distros, not available in Buildroot.

> It is false positive for postgresql, so ignore it.

I also added a blurb that the similar CVE that did apply to postgresql
was fixed a while ago, to avoid vonfusion.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/postgresql/postgresql.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index a2aed9a2eb..e46622c0e7 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -19,6 +19,10 @@ POSTGRESQL_CONF_ENV = \
>  POSTGRESQL_CONF_OPTS = --disable-rpath
>  POSTGRESQL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  
> +# CVE-2017-8806 is related to postgresql-common package
> +# It is false positive for postgresql
> +POSTGRESQL_IGNORE_CVES += CVE-2017-8806
> +
>  # https://www.postgresql.org/docs/11/static/install-procedure.html:
>  # "If you want to invoke the build from another makefile rather than
>  # manually, you must unset MAKELEVEL or set it to zero"
> -- 
> 2.39.2
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
