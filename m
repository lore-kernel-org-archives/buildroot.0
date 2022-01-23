Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FDEC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D529740350;
	Sun, 23 Jan 2022 19:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZD7qLfr7B9Fy; Sun, 23 Jan 2022 19:54:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E171B4026B;
	Sun, 23 Jan 2022 19:54:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6696D1BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5536A4026B
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:54:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A5XMiwW-y3ka for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:54:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81A4940253
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:54:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a491:f028:92d2:337e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AD73F5FF33;
 Sun, 23 Jan 2022 20:54:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642967667;
 bh=Gm6uhkrVCYswwEafTOjpgboTWxi0PgBbgJNN7NtBXz8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=arUTtN7VEm1dUxH0T4cvyYI3KVfaYUU9ohFRD6QLVs0L2dmlUImEJSY5iAqZMkujj
 cDsSjmHjXBjQD8i/vFJolT7C6gs1Mv1ab/Znfm51e2W+I8inY1RNbeftJSEhkY+Qs6
 LAoXQ3M1KNQerEd7ehy9N6/8yVOrGZcHPkXxEitjyuPxG0WwEf1TskkFN7zMpr/mRN
 tohZetYxbz3J+Skbw9Yeq1XwQaBknNunDKwkXuAIoGZcNoHwEtwXy3S4+SPSjJ8Vqi
 Zkz0vIKxbWAu4XVt9/Q9dyyohW/OmkQ4uczi9ujOOJp2HfCS175UfKmRNf7dpMRtnG
 KUlBZS4mekOiA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jan 2022 20:54:25 +0100
Date: Sun, 23 Jan 2022 20:54:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220123195425.GE2502@scaer>
References: <20220123111126.573758-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220123111126.573758-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/nmon: bump to version 16n
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

On 2022-01-23 12:11 +0100, Fabrice Fontaine spake thusly:
> Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nmon/nmon.hash | 6 +++---
>  package/nmon/nmon.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/nmon/nmon.hash b/package/nmon/nmon.hash
> index fd3f09c63a..1d7226a4fe 100644
> --- a/package/nmon/nmon.hash
> +++ b/package/nmon/nmon.hash
> @@ -1,5 +1,5 @@
>  # From https://sourceforge.net/projects/nmon/files/
> -md5 df67f07ea4006c6204acff586beada81  lmon16m.c
> -sha1 68cd02be19036a287fe352823db93223e73a9411  lmon16m.c
> +md5  a8172601fdc05f3bc58455cbd3f4475e  lmon16n.c
> +sha1  024a3b56179838f0e04bf1706cc9ba56595301a8  lmon16n.c
>  # Locally computed
> -sha256 2bed4d45fdfdf1d1387ec91e139c04975d5f838e3e0d53c0fe2d803a707e5fc1  lmon16m.c
> +sha256  c0012cc2d925dee940c37ceae297abac64ba5a5c30e575e7418b04028613f5f2  lmon16n.c
> diff --git a/package/nmon/nmon.mk b/package/nmon/nmon.mk
> index 8b39748cce..01371a8c74 100644
> --- a/package/nmon/nmon.mk
> +++ b/package/nmon/nmon.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NMON_VERSION = 16m
> +NMON_VERSION = 16n
>  NMON_SITE = https://sourceforge.net/projects/nmon/files
>  NMON_SOURCE = lmon$(NMON_VERSION).c
>  NMON_LICENSE = GPL-3.0+
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
