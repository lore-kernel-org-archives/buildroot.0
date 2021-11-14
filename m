Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C17FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 21:25:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB9FF61056
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 21:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB9FF61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F2DB606BE;
	Sun, 14 Nov 2021 21:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 355WFR6aKjWZ; Sun, 14 Nov 2021 21:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E779C606B6;
	Sun, 14 Nov 2021 21:25:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C782A1BF34D
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 21:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4B33606B6
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 21:25:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3IiGHDq5766p for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 21:25:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1C7B60684
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 21:25:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:588e:4f72:56a8:ef3a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7A33E780326;
 Sun, 14 Nov 2021 22:25:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636925140;
 bh=WyNdeXpAUIpM/SmrsbxCWIqRuqS+3yP4Wq8nZsIw6iw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SkdO2oR7mmbQNrtnKk1dFaSFtEPu0sizvi/F/qbX06unGKPWeY85F/RVt3TelgEYy
 ZTAJH4zhvWUEbt8wjJ++lJLvopsEUN9v9QVFTiftul2G2TjAdNODsptNb9YcquSazG
 WS3/eSYVYIjsmcEzQyIgxdfNQY+i2FkW45DZgxRxHZNDgsxmdJmUzuLllPOiqFJicx
 CdAqN45JUM6hXzuvdFN6m/h4Bg/kcIRKfa/LT5UyqE5F2W/vxbATbKgVFNobDHsHK+
 Eyi3ps+5BxYm9JlNemAPOse9zIORs9T/qM/hHxGkMh7OILkAUIBtFIOsoLB9u43GQr
 7djT4B7Qys/jw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Nov 2021 22:25:36 +0100
Date: Sun, 14 Nov 2021 22:25:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: unixmania@gmail.com
Message-ID: <20211114212536.GA247986@scaer>
References: <20211114210316.1403514-1-unixmania@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211114210316.1403514-1-unixmania@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/mksh: use plain HTTP in download
 and license links
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

Carlos, All,

On 2021-11-14 18:03 -0300, unixmania@gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> The server does not support TLS v1.2, causing dowloads to fall back to
> sources.buildroot.net. Mail sent to the project owner bounces, so it
> looks like this issue will not be solved anytime soon. Switch to HTTP
> and rely on the hashes to verify the integrity and authenticity of the
> download.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

Applied to master, after adding a reference to your recent commit for
the homepage, thanks!

Regards,
Yann E. MORIN.

> ---
>  package/mksh/mksh.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mksh/mksh.mk b/package/mksh/mksh.mk
> index 386b1bd016..c4818e8692 100644
> --- a/package/mksh/mksh.mk
> +++ b/package/mksh/mksh.mk
> @@ -6,8 +6,8 @@
>  
>  MKSH_VERSION = 59c
>  MKSH_SOURCE = mksh-R$(MKSH_VERSION).tgz
> -MKSH_SITE = https://www.mirbsd.org/MirOS/dist/mir/mksh
> -# For MirOS License see https://www.mirbsd.org/TaC-mksh.txt
> +MKSH_SITE = http://www.mirbsd.org/MirOS/dist/mir/mksh
> +# For MirOS License see http://www.mirbsd.org/TaC-mksh.txt
>  MKSH_LICENSE = MirOS, ISC
>  MKSH_LICENSE_FILES = mksh.1
>  
> -- 
> 2.27.0
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
