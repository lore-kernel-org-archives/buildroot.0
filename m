Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF062C433EF
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 23:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52E42402FC;
	Fri, 19 Nov 2021 23:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZiMKZzAJ2m1B; Fri, 19 Nov 2021 23:33:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83EE540231;
	Fri, 19 Nov 2021 23:33:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCC2B1BF239
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 23:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8AD740105
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 23:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VPpPXneUkw4c for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 23:33:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21EDA40018
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 23:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637364778;
 bh=ca4e/Rd3fpdhdoGgPYbs3Myg/w7NrOh2/XswcLJFNiI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=gY1Ahr0Gga+cE7tPuwuBIVrkMy9xJE+mGEx+wXiC2o6rk/E9J9J2BhIr9WM8Ua3I1
 IuaO8xGuAr29XM40Oj6nQhSVo4RNJL8aNlLX0qIHG8hHyliuSGyEtPRfR7ALiagi9J
 8/qfR8sntqo09zOKTpgTVw4Dd48mvyvxinDqqF+M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.116]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDkw-1mQDNS0nCi-00xaoT; Sat, 20
 Nov 2021 00:32:58 +0100
Date: Sat, 20 Nov 2021 00:32:56 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211120003256.61693b53@gmx.net>
In-Reply-To: <20211118210623.1598934-1-fontaine.fabrice@gmail.com>
References: <20211118210623.1598934-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:O9ga8t/z7216fiMjXw8m1MXfiPgXqwKXEu1crFE773uii4p6Dj+
 q4fwUwzYfFg9NeSqBa7y/z9Y5HRLmZSM0R5lS9JXFsej1moYFAORuXNAGDSOyAeZeMpwkKb
 Y0gUiTcIlYNRUHLm3U1OU2VHIWomt0nGgSvR9rN0F8+AmYY/KPbpExlioWbMsks/UjUQQlm
 ynFFDk7Lg2dvjpJejVvpg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:74Kd5K1WQYU=:Eb6HPCDAXPUIPprxmV5BFr
 2/2FJBEtw3QZ3mX84914Klav46JcjmgvxSIHa39cvj/C374tbbaMee72CxtQqyav2VXQ/fA0s
 py8NMnB/0NipnhJo48bzhrgbRgZPQOCLl1WTw+W0AOzlOaJ3gptULMD7Qdv61zwCzxvEotg/X
 DaOQA5mwIYuqFag4CF8jbN5pb0lDcekKRGJJwgLGaqYZuVTpdZvcSJZ8mqjx63enL7qTkpsCM
 3MIzYsEhzP0NeVEphZ0/kdlly4lj3hReMZ0Q/zwgDI1SBLvgbTtqkkZCeEVIjX2R0Hvb0l/0c
 5xtt6Rnq16/rW07nAm08m+qhYqq5Mf5QDlEDOZVb5e6OA3mXmEnh6OonUKze38h7fn7fgu4GQ
 199T3fsqPrEVv95jFtORvMLoVCKas8y3HGPQ7xD/YjHC1xtmgcY1EA1PFXSAdinoDbRqX//gL
 RL16Rbgrr/8IAfRPJlKgLqzBgUW4hWg8Lo/xWYSkG4YTaS92GYCDULkCM7sNQTZ6mX7KUDwjp
 Zis32EJxhsAcpfwgns8OIE79qYj2tRscvs+YBF0ZTv0GmyUMNjD2pRFRk1KFpS5jyK3Y57hAW
 wD7x03df3PMTTC48bQ/KU18lkiVQSNVbWzvYkKZQXHXd+nfPfgK8N0td/ssmhDoZWaGC/l9uw
 k+tyHa0TBjJmRNpB55vunjyxfUftmwImy6ht9i9KlPKEcTP/BU/WRRqillFVpuvqYzIIqh5oV
 eFXr+tr4ioYcS9+AoMc5dqCDBF4Dw3ZLcRPTCaYUhusW/xLKMl5VzRMATXEYUdnhuZ2hubqP2
 EmXrV9jBp4yTDHRiDpaDew2/Ztq+9vtjDsoLb3mM241S8vyTtDOW2RA/OgeCoPCPWBu+q7H0i
 J0WG8DpQ1lXYwOfRKqm3tKgMGKiMppuGZ3NCyCOrfy6bS4r+NqDPkMUeP/Uw1XvDc/9OIFg4u
 Xkb5A5oPv6PVaaeyVteG2CwC1EFSEyH16+iOBAUjM6NkEMioWI5afxPi3fzXtiuh4GEGf6mOz
 6nCDhCChRSRy+lgK/tZY4mi+bqa94S9IfdBAccPLHEacMpAR7L7wdupw9Ps0cT2oAdFpXF9ry
 gUpsJnJix6o4Rg=
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: run autoreconf
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Thu, 18 Nov 2021 22:06:23 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> For an unknown reason, the build fails since bump to version 1.4.60 in
> commit d62b7f54f00291a50274409fb5510527fd725ffe on:
>
> array.c:140:2: error: 'for' loop initial declarations are only allowed in C99 mode
>   for (uint32_t i = 0; i < sz; ++i) {
>   ^
>
> Running autoreconf fixes the build.

The difference is during the configure step:

- checking for .../host/bin/arm-none-linux-gnueabi-gcc option to accept ISO C89... none needed
+ checking for .../host/bin/arm-none-linux-gnueabi-gcc option to enable C11 features... -std=gnu11

And the use of the '-std=gnu11' flag for the compile steps..., any more
lightweight option to enable C11?

Regards,
Peter

>
> Fixes:
>  - http://autobuild.buildroot.org/results/0349d8fed35b0766796dd9ba3b8de6ff8bd68fe7
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lighttpd/lighttpd.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
> index 9c18a6038e..c39a5db20f 100644
> --- a/package/lighttpd/lighttpd.mk
> +++ b/package/lighttpd/lighttpd.mk
> @@ -12,6 +12,8 @@ LIGHTTPD_LICENSE = BSD-3-Clause
>  LIGHTTPD_LICENSE_FILES = COPYING
>  LIGHTTPD_CPE_ID_VENDOR = lighttpd
>  LIGHTTPD_DEPENDENCIES = host-pkgconf
> +# Issue in configure script provided in tarball
> +LIGHTTPD_AUTORECONF = YES
>  LIGHTTPD_CONF_OPTS = \
>  	--without-wolfssl \
>  	--libdir=/usr/lib/lighttpd \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
