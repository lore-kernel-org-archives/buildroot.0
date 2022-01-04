Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC9CC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 19:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8CA54093B;
	Tue,  4 Jan 2022 19:59:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZ-r-o4eUDPn; Tue,  4 Jan 2022 19:59:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 303C0405B6;
	Tue,  4 Jan 2022 19:59:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 009B71BF27A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 19:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEEA6405B6
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 19:59:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcXWPepxLr7W for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 19:59:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CB234033A
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 19:59:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:dd8f:11a1:7592:f85e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id BD4922003D6;
 Tue,  4 Jan 2022 20:59:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641326379;
 bh=pqp2IZMN46BkJxvXck0+O34fbVbQy5+otlNpiBenaQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uhGXvZzISApvRnf+Y8EqC7jYMefcTVUod0BQ7NDtspNWPo7OINo4KPoXHFk7G1Un+
 f4ETQ1JOqNcYGDZ2nJbfFG4M5UD7+nkomjODMU2GrPcX3dPyEGRKinDH/7jvIDmdrT
 PUOLZ+KVZYXLKFDzyozJlYHMie6hH3yRqLsOLqw6cmAhbqNxIt9St2cic/5OEM55cA
 RJY/cWK9ExuY1re5DM8xB72AoFB44denpdJC9R0oXwh2VhvRWQqiGeyRVr06w3PnEI
 FF+paPGQ4EO3cfAJWDf3/BFbVEnEs54GMlZx22sOkiyDq1HdvpP6QBvsH2lmZQzYQc
 V6VFFB37kdmlA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Jan 2022 20:59:34 +0100
Date: Tue, 4 Jan 2022 20:59:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220104195934.GA614810@scaer>
References: <20220104182508.3375382-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104182508.3375382-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/mutt: bump to version 2.1.5
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

On 2022-01-04 19:25 +0100, Fabrice Fontaine spake thusly:
> Mutt 2.1.5 was released on December 30, 2021. This is a bug-fix release,
> fixing two SMTP authentication issues, a crash bug on NetBSD, and a
> couple other issues.
> 
> https://gitlab.com/muttmua/mutt/-/blob/mutt-2-1-5-rel/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mutt/mutt.hash | 2 +-
>  package/mutt/mutt.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
> index dceae57b65..d439b23aa3 100644
> --- a/package/mutt/mutt.hash
> +++ b/package/mutt/mutt.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  3361b682ea23df88961fa9835196698aefd2ebf0aba494599b29d1c4b1b4db79  mutt-2.1.4.tar.gz
> +sha256  92a309e47e363a97d62425bcb71adceae5ab5c4c413dbcac37fa98ed70c12be0  mutt-2.1.5.tar.gz
>  sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
> diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
> index 44d7864eb6..7e9046fe8a 100644
> --- a/package/mutt/mutt.mk
> +++ b/package/mutt/mutt.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MUTT_VERSION = 2.1.4
> +MUTT_VERSION = 2.1.5
>  MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
>  MUTT_LICENSE = GPL-2.0+
>  MUTT_LICENSE_FILES = GPL
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
