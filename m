Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C361C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 11:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0A26401EC;
	Sat,  4 Dec 2021 11:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WEQYs1FZKxTZ; Sat,  4 Dec 2021 11:23:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFA3F405CF;
	Sat,  4 Dec 2021 11:23:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB7E51BF35A
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 11:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B89DD405CF
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 11:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSBgcHSiksjo for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 11:23:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F326401EC
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 11:23:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:44c6:1f1c:4326:e15f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 176215FF20;
 Sat,  4 Dec 2021 12:23:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638616996;
 bh=D027e0PX/3Sn5S53zyJBlGyaJYaWgH2Qj/KCT9eA5xo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qvCqNZVpwuhzccmgXKWrfsG55KNHTcWbE8wYturBd/iw9WTooGvId31fFYQSEf9YU
 3SXtqiyafHMO0rAhYQaglakwvE9L9TOm+bc1dRyinbmzG3vN7s+S+5V5M8+4prXa4o
 dFL/OYHckzRWKBLS/VKQXqAB4/DtK6cydkCmSnsVgGovm4x/XCMcW33eN1SOl5cygn
 2KBCsRz+vvihFi/sM3Q5Fm+KIbE9dpniKDzXlc0S0x/FYg//mOze581jngCnqirAjT
 rI/HQpZToXQS5B1ihBGq55wJDR4ABV3m3gurAxwHoxQpvIBrpmU5QqQbLIkDbnehk2
 VbP6zBTnwIusA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Dec 2021 12:23:11 +0100
Date: Sat, 4 Dec 2021 12:23:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20211204112311.GG50662@scaer>
References: <20211114232525.691816-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211114232525.691816-1-ricardo.martincoski@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/atop: ignore already fixed
 CVE-2011-3618
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

Ricardo, All,

On 2021-11-14 20:25 -0300, Ricardo Martincoski spake thusly:
> https://security-tracker.debian.org/tracker/CVE-2011-3618
> 
> The patch used by debian
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=622794
> has equivalent code merged in upstream:
> 
> rawlog.c, changed in 2012, release v2.1
> https://github.com/Atoptool/atop/commit/7c17a309ef97a59a8ee1f5a593f48eeac9d46bc8
> 
> acctproc.c, changed in 2016, release v2.3.0
> https://github.com/Atoptool/atop/commit/2820b1144ce403c7917cd2e09b05e78d2c9dbc07
> 
> So ignore the wrong CVE report.

Instead, shouldn't the CVE be updated to state that it does not affect
version >= 2.3.0 ?

Regards,
Yann E. MORIN.

> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>  package/atop/atop.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/atop/atop.mk b/package/atop/atop.mk
> index 88f292b6b3..8369f639c3 100644
> --- a/package/atop/atop.mk
> +++ b/package/atop/atop.mk
> @@ -11,6 +11,11 @@ ATOP_LICENSE_FILES = COPYING
>  ATOP_CPE_ID_VENDOR = atop_project
>  ATOP_DEPENDENCIES = ncurses zlib
>  
> +# Equivalent code for the debian patch was merged in upstream in commits
> +# 7c17a309ef97a59a8ee1f5a593f48eeac9d46bc8 (v2.1) and
> +# 2820b1144ce403c7917cd2e09b05e78d2c9dbc07 (v2.3.0).
> +ATOP_IGNORE_CVES += CVE-2011-3618
> +
>  ATOP_CFLAGS = $(TARGET_CFLAGS)
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
> -- 
> 2.25.1
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
