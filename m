Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C47FC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 08:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03B48404D1;
	Sun, 11 Dec 2022 08:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03B48404D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bqlfQtbf5tbb; Sun, 11 Dec 2022 08:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 256AC404CF;
	Sun, 11 Dec 2022 08:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 256AC404CF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70F141BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C2B860A91
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C2B860A91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YdbR8Tb1PJiI for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:21:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AE3F607F6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AE3F607F6
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:21:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9fcf:911b:99f4:8b0a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 480C55FF9E;
 Sun, 11 Dec 2022 09:21:24 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Dec 2022 09:21:24 +0100
Date: Sun, 11 Dec 2022 09:21:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221211082123.GI1044805@scaer>
References: <20221210214647.40198-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221210214647.40198-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670746888;
 bh=4y7/0PWDjHRaF5iLQq3gMJO97+hc3oDiheDa/jhi+sM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SWZfl8QBflBQTTlKl/JyMBi5Uxlqo4aUdJn2P67cdIUdcqy/rZbw1K+I5aoRhKNJf
 fKlmGWgjoRb0/GYmm/eEWRZryYpu+X3GxNbce9G3RNErDIm++VCYmsI5ClC7tlDhP0
 CwJcQc4H6ZSj8KpRJFvfsgkS0FzQTG9pAuwrA489Loz11n0jSHmwDLUyIk7+WyIK56
 9VQHtm2DwZIGRBp3MVWaXQkRJAPZ4c6pyzSfi42azp6PLptSw5ekEOy88whBszgYC2
 KTlgm7V2RYYyTLtN5QHzMJhdeFxX0sK1KXz9Ht18DtAN35ULihKnK0UcKGMRhO1qqz
 dsP9qcdpRHVnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SWZfl8QB
Subject: Re: [Buildroot] [PATCH 1/1] package/smcroute: bump to version 2.5.6
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All

On 2022-12-10 22:46 +0100, Fabrice Fontaine spake thusly:
> https://github.com/troglobit/smcroute/releases/tag/2.5.6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, with the news blurb provided by Joachim, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/smcroute/smcroute.hash | 4 ++--
>  package/smcroute/smcroute.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
> index 642a1f62fe..b472dfbc04 100644
> --- a/package/smcroute/smcroute.hash
> +++ b/package/smcroute/smcroute.hash
> @@ -1,5 +1,5 @@
> -# Upstream .sha256 from GitHub
> -sha256  2569cd97fa2047df14203a7144be53a1b32928cb460421a302bbcce381b42bc3  smcroute-2.5.5.tar.gz
> +# Hash from https://github.com/troglobit/smcroute/releases/download/2.5.6/smcroute-2.5.6.tar.gz.sha256
> +sha256  0be38f617e322daafaa941c02423239f5c117b940cf0f45bacadb6733c4b3916  smcroute-2.5.6.tar.gz
>  
>  # Locally generated
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
> index e6114c9a8c..0c4f88ab1b 100644
> --- a/package/smcroute/smcroute.mk
> +++ b/package/smcroute/smcroute.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SMCROUTE_VERSION = 2.5.5
> +SMCROUTE_VERSION = 2.5.6
>  SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
>  SMCROUTE_LICENSE = GPL-2.0+
>  SMCROUTE_LICENSE_FILES = COPYING
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
