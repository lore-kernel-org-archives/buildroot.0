Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC02C636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 16:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 363D34054B;
	Sun, 12 Feb 2023 16:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 363D34054B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UskNN4ehMCjl; Sun, 12 Feb 2023 16:49:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54C31404E9;
	Sun, 12 Feb 2023 16:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54C31404E9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A35541BF357
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 16:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89D1C60E48
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 16:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89D1C60E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCZn82f6EsEi for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 16:49:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68EDF600CB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68EDF600CB
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 16:49:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 372565FFA8;
 Sun, 12 Feb 2023 17:49:04 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Feb 2023 17:49:03 +0100
Date: Sun, 12 Feb 2023 17:49:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230212164903.GO2796@scaer>
References: <20230212130336.373391-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230212130336.373391-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676220546;
 bh=b1lukgY0LDLmw2+Lzb+agnCIB3jLQm3uGDu3hGuvx8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MsE3exi++8tCrrLdaahEQDDQTh1yf6yyIaHYZS+ngvA87PXVmyOr+v2i1evtonq6t
 v1k4JNYr0NNNRz+b1GXZJxyqu76wlSk2eoU30gvmIMDje/fhZAMdmPCZTzGS50mMjz
 AoKpH0kCcUw+f1zMzB/Dr6qCwO7CvwfMvuA6tYzRAhIU9G2Qxv5yToj5/g37mM1Bis
 YdI3LyMYnnqP3bSJ7oTVohxe+AZPcvLZQmv0E7Ff2D05PReCgGP08PGlSl70nUAud7
 HRSiw796pmP/ZaiDt5GR7sL2CynAVr4nkTEmWTyDAGHkUEeLH3xm24ItIQCzdRbCFV
 YSAkHxlkpmLGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MsE3exi+
Subject: Re: [Buildroot] [PATCH 1/1] package/olsr: fix build with gpsd >=
 3.25
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

Fabrice, All,

On 2023-02-12 14:03 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure with gpsd >= 3.25 raised since commit
> 3c7fece853f3def9a425eccc384b9dacb1010051:
[--SNIP--]
> +Signed-off-by: Rui Chen <rui@chenrui.dev>
> +[Retrieved from: https://github.com/OLSR/olsrd/pull/119]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + lib/pud/src/gpsdclient.h | 8 --------
> + 1 file changed, 8 deletions(-)
> +
> +diff --git a/lib/pud/src/gpsdclient.h b/lib/pud/src/gpsdclient.h
> +index 061056b12..a51dd2211 100644
> +--- a/lib/pud/src/gpsdclient.h
> ++++ b/lib/pud/src/gpsdclient.h
> +@@ -60,14 +60,6 @@ struct GpsdConnectionState {
> +     struct devconfig_t dev[MAXUSERDEVS];
> + };
> + 
> +-/* describe a data source */
> +-struct fixsource_t {
> +-    char spec[PATH_MAX]; /* working space, will be modified */
> +-    char *server; /* pointer into spec field */
> +-    char *port; /* pointer into spec field */
> +-    char *device; /* pointer into spec field */
> +-};

Given that this breaks the build with older gpsd versions, I suspect
this is not goign to be accepted by upstream.

I've sent another proposal to fix that issue in a backward compatible
manner:

    https://github.com/OLSR/olsrd/pull/120

Let's see a bit what upstream decides.

Regards,
Yann E. MORIN.

> + /**
> +  * The gpsd daemon spec
> +  */
> -- 
> 2.39.0
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
