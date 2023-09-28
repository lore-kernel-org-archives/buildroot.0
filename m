Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB63E743C2
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 20:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63F4261500;
	Thu, 28 Sep 2023 20:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63F4261500
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hb840Yk6KipA; Thu, 28 Sep 2023 20:44:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC24861092;
	Thu, 28 Sep 2023 20:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC24861092
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8AED1BF287
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 20:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C450F82F80
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 20:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C450F82F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oErxZ6CExeO6 for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 20:44:41 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11E3F82F3D
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 20:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11E3F82F3D
Received: from ymorin.is-a-geek.org (unknown [92.184.106.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8773C19F574;
 Thu, 28 Sep 2023 22:44:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Sep 2023 22:44:29 +0200
Date: Thu, 28 Sep 2023 22:44:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20230928204429.GB14593@scaer>
References: <20230928002728.2402-1-brandon.maier@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230928002728.2402-1-brandon.maier@collins.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695933877;
 bh=+wG+QzpNA1jpN8TdLwgaTChpR2myxH0nvaUR2TI+TJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QcvrKxVpxWOg16kxqavK1OeErgHDIbHQO/E4t6ijMEZPSnRnNRF/047g5BB8NDEqp
 HulOLFkNfdnijEtFXHEo/DKzf8+8mNAQxPD+WWxa5TyoVb60CSF2YiJUQMU68ddP6r
 ThIfqQja+Wm5byFpzloHh4H+JHT1Kjopl9WgtK77Hc1t8RDFeM5/ZJEC+vpsiBoxsQ
 SxNOhkDSmgaa+968ZOsgtssZ9Ep/YTDgCVIJHLEgWw6/oj+/3M6eyWCQYlIiKGTz4L
 0WMRSQSvkRD0MhkZsEYtrUPRKfEHFVItRsxBmY+YdHR7GCVLinFt2P88y0QLsmydN2
 ENF/H2mpgOWUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QcvrKxVp
Subject: Re: [Buildroot] [PATCH v2 1/2] unifdef: add missing license
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Brandon, All,

On 2023-09-28 00:27 +0000, Brandon Maier via buildroot spake thusly:
> The COPYING also contains a BSD-3-Clause license. The BSD-3-Clause
> applies to "manual page unifdef.1 and the portability support code in
> the FreeBSD subdirectory". The BSD-2-Clause applies to everything else.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> Reviewed-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - No changes
> ---
>  package/unifdef/unifdef.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/unifdef/unifdef.mk b/package/unifdef/unifdef.mk
> index 7d10595d1b..fd74455894 100644
> --- a/package/unifdef/unifdef.mk
> +++ b/package/unifdef/unifdef.mk
> @@ -6,7 +6,7 @@
>  
>  UNIFDEF_VERSION = 2.12
>  UNIFDEF_SITE = https://dotat.at/prog/unifdef
> -UNIFDEF_LICENSE = BSD-2-Clause
> +UNIFDEF_LICENSE = BSD-2-Clause, BSD-3-Clause
>  UNIFDEF_LICENSE_FILES = COPYING
>  
>  define HOST_UNIFDEF_BUILD_CMDS
> -- 
> 2.41.0
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
