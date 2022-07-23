Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6CAC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 288D261AE7;
	Sat, 23 Jul 2022 16:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 288D261AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bl93VoA5JyRl; Sat, 23 Jul 2022 16:21:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B9AD61AE3;
	Sat, 23 Jul 2022 16:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B9AD61AE3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 804081BF271
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B2A484BD1
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B2A484BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CkL_Ar6tCWRf for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:21:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 804DB8490B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 804DB8490B
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:21:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [86.206.242.79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 57BBF780502;
 Sat, 23 Jul 2022 18:21:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Jul 2022 18:21:49 +0200
Date: Sat, 23 Jul 2022 18:21:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jesse Taube <mr.bossman075@gmail.com>
Message-ID: <20220723162149.GF2641@scaer>
References: <20220723160837.272337-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220723160837.272337-1-Mr.Bossman075@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658593311;
 bh=Au5KHHIL9JqdsGySK61jjd12Wq+nS1KWLBY3sgncT4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OT71igC/ocGjksurYaWkJRGfi0nhsIEgSnxcz5jGcBPSpNjQVFBkeSGlX96SdXJjJ
 qtgStJ9L8omy27ESEq0CxEpukZJR3qcRKaNlV51RnCa/R6JwGBEJm0jJ8K4IO+MSYr
 WxTqVspJV7fqoBHJH295Yh9oz8/jv2Is1lQCFdObnQ6buakECqCvVqRNwyIS6lUOdH
 CgMfQzCNVDmD7Jc1bTmicHsUBGWfSVUGuX7n3YLqxoPb5WeWZndlKJFqlqsFGA/FvF
 3XgvXVjtHlWmihJN3dmzKsyGTVrWy5yLzzfX8wR915zm+yemnLLJpKeTDw4RrqQvKi
 Zf9z9FA3v0HgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OT71igC/
Subject: Re: [Buildroot] [PATCH v1] utils/readme.txt: Fix typo
 "get-developers"
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

Jesse, All,

On 2022-07-23 12:08 -0400, Jesse Taube spake thusly:
> Fix typo on line 23 `get-developpers` to `get-developers`
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  utils/readme.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/readme.txt b/utils/readme.txt
> index 3064ecec32..3e8833c4ea 100644
> --- a/utils/readme.txt
> +++ b/utils/readme.txt
> @@ -20,7 +20,7 @@ genrandconfig
>      (http://autobuild.buildroot.org). It selects a random toolchain from
>      support/config-fragments/autobuild and randomly selects packages to build.
>  
> -get-developpers
> +get-developers
>      a script to return the list of people interested in a specific part
>      of Buildroot, so they can be Cc:ed on a mail. Accepts a patch as
>      input, a package name or and architecture name.
> -- 
> 2.36.1
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
