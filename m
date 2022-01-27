Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CD2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 19:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D8BD41680;
	Thu, 27 Jan 2022 19:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MgL9TpVpEobh; Thu, 27 Jan 2022 19:28:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4FF9415FD;
	Thu, 27 Jan 2022 19:28:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46E3C1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 421F1403E0
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:28:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wUI_3dt4eZm8 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 19:28:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E372403D6
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 19:28:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cc8e:5bc6:13d0:52a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0184C200342;
 Thu, 27 Jan 2022 20:28:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643311706;
 bh=uAhneVtwM3GUr9QHNaZddb1Kqrzq06rl6Piqlfu2SgI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XOv7bHKm7TpaOJCg7l2NxhpRDRBstV/Hzrmgfmw9HyiZBfdjO2jl0WUYTrvTSTEN7
 b/GwjNppPhJoYgxIZY4Ozg9AIENCQYWp6AQC9TvfwzjSrbtmxuxsFGoa8wJH5NttsM
 aXN3wa42BoxlQP2SeFyfC9I1KOBKJ3j71IgJ8y+RMx9AdpuEK3SOdwr4Nz0pE3towJ
 zxOJ3o/QEL0M2s8dDq9jeoXc3OlzBPYujI8iBev8BXmud6vdiDDhhVLJSV8MG1mSho
 y6yLph2rzpN/zQjuU1D5vnGHdXTVkl7Z5zJDWkIrpY9uozmfkt3X5r8zy0d+7Dxl9Y
 QHIelvBcvEY6Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 27 Jan 2022 20:28:22 +0100
Date: Thu, 27 Jan 2022 20:28:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220127192822.GO457876@scaer>
References: <20220127180456.2338773-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127180456.2338773-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/jasper: use JAS_ENABLE_DOC
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
Cc: Michael Vetter <jubalh@iodoru.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-27 19:04 +0100, Fabrice Fontaine spake thusly:
> Replace CMAKE_DISABLE_FIND_PACKAGE_{DOXYGEN,LATEX} by JAS_ENABLE_DOC
> which is available (and working as expected) since version 2.0.20 and
> https://github.com/jasper-software/jasper/commit/cddb7b199a1c78f3ec0b2c6b8af705588437af4b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I've slightly reworded the commit title, and applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/jasper/jasper.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
> index 6ef1afcac7..59c5b3d66a 100644
> --- a/package/jasper/jasper.mk
> +++ b/package/jasper/jasper.mk
> @@ -11,9 +11,7 @@ JASPER_LICENSE = JasPer-2.0
>  JASPER_LICENSE_FILES = LICENSE
>  JASPER_CPE_ID_VENDOR = jasper_project
>  JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
> -JASPER_CONF_OPTS = \
> -	-DCMAKE_DISABLE_FIND_PACKAGE_DOXYGEN=TRUE \
> -	-DCMAKE_DISABLE_FIND_PACKAGE_LATEX=TRUE
> +JASPER_CONF_OPTS = -DJAS_ENABLE_DOC=OFF
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
>  JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
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
