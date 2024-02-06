Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E23C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCEE441573;
	Tue,  6 Feb 2024 16:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCEE441573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aHPAYbFBzVRm; Tue,  6 Feb 2024 16:03:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB38141590;
	Tue,  6 Feb 2024 16:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB38141590
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFF071BF2FE
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 876CE41590
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 876CE41590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dupAQBfLlNxz for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:03:08 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57DC741573
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57DC741573
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 57E7A13F861;
 Tue,  6 Feb 2024 17:03:03 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 17:03:03 +0100
Date: Tue, 6 Feb 2024 17:03:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <ZcJYN7TmMtnVvpbj@landeda>
References: <20240206105246.1220945-1-buildroot@bubu1.eu>
 <20240206105246.1220945-5-buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206105246.1220945-5-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707235386;
 bh=o+HpSig+2sewbEvPZUKWAbYZk6Qtmy8q3DiubkPjO0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o46JIe8X2/vTObaB1FZ/GCupnF3M5G4yBaYXN9vHtxnMMxCOTYOCaOpXov5Ayzpzc
 GDxjl/lZvbHq6q2IdR/JYmlOODs+hQdrBZJmcyu3jY8fi3ushA4tvSQAmacOrstLtf
 nQAnrOC5p1VSgXwqWJN9SNNW63dkPntXlhd2FB47xeblfS5tF/RaIdb2YfXHQzAmFD
 MUN0V/rDsvNfqs9Bx3AXcsRBgQ4IBPLppsorpJc9MRLmSdPCVzC6D41FJYyXYqblIS
 us0d9ranQ151ZPAbKV2cFcwfJaNwH4qiLxgVReyY5Bj1cuYIlc9uz0z3K5OXVASutJ
 IhObVDsipDhKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o46JIe8X
Subject: Re: [Buildroot] [PATCH 5/6] docs/manual/contribute.adoc: link to
 git-send-email.io
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All,

On 2024-02-06 11:52 +0100, Marcus Hoffmann via buildroot spake thusly:
> https://git-send-email.io/ is a page maintained by sourcehut which
> explains how to setup git send-email on many OS's for many popular email
> providers.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/manual/contribute.adoc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
> index 2b90d13b41..684e9f4809 100644
> --- a/docs/manual/contribute.adoc
> +++ b/docs/manual/contribute.adoc
> @@ -369,7 +369,7 @@ $ git send-email origin/master
>  ---------------------
>  
>  Note that +git+ should be configured to use your mail account.
> -To configure +git+, see +man git-send-email+ or google it.
> +To configure +git+, see +man git-send-email+ or https://git-send-email.io/.
>  
>  If you do not use +git send-email+, make sure posted *patches are not
>  line-wrapped*, otherwise they cannot easily be applied. In such a case,
> -- 
> 2.43.0
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
