Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A957C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAD2D60ABA;
	Sun, 30 Oct 2022 16:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAD2D60ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ILbfC_ws9n71; Sun, 30 Oct 2022 16:30:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9EAA607FE;
	Sun, 30 Oct 2022 16:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9EAA607FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCAFF1BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5A4960A8C
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5A4960A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jRrH7_0nQwji for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:29:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8CE0607FE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8CE0607FE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:29:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E7BBF13F895;
 Sun, 30 Oct 2022 17:29:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 17:29:07 +0100
Date: Sun, 30 Oct 2022 17:29:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030162907.GR1058960@scaer>
References: <20221029092517.115919-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221029092517.115919-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667147351;
 bh=igdR034BacFLwe7rHyijq0cwsDnH4JXBxNz4/VFnnBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ox95NLYLu8M5ODT/OZswBLLcn8bQ+pMG8SI8DTielobRriPdcQFyOVDPhOBUB6Ek9
 /AAeeo+L793vY0gJdZ/LkEFOyVfndiy3qwrv4WBEGFDUW55bpt4KvGBhint9E1w370
 nCzeMLyrPT2G1jnlOxBiu90aSxNhU+xed3njxrQc+cquz6rrhtxVegxTD5zpOOrlH5
 abLpARChwuc35X+CtKsDbzOP4GXfhRN86nYF1+sh6zZnGgkiuFXf/6QBbwjih3hfcX
 ioGH87W64kzE8P7Smv91EqSWBElUnS5vCVNHNpm09HOfnDul3Sn9kriyw1ZnXbLmOO
 kir6OtnGt3TLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ox95NLYL
Subject: Re: [Buildroot] [PATCH 1/1] package/mxml: bump to version 3.3.1
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-10-29 11:25 +0200, Fabrice Fontaine spake thusly:
> Update hash of NOTICE (update in year:
> https://github.com/michaelrsweet/mxml/commit/d32818a16ceb352b8889f95ec7ff65575ad2e4f2)
> 
> https://github.com/michaelrsweet/mxml/releases/tag/v3.3.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mxml/mxml.hash | 4 ++--
>  package/mxml/mxml.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mxml/mxml.hash b/package/mxml/mxml.hash
> index 38056f4c3a..412977dff0 100644
> --- a/package/mxml/mxml.hash
> +++ b/package/mxml/mxml.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  7cf976366f9e8e4f8cff7d35a59bcf6201c769fce9e58015d64f4b6de1fe3dd8  mxml-3.3.tar.gz
> +sha256  0c663ed1fe393b5619f80101798202eea43534abd7c8aff389022fd8c1dacc32  mxml-3.3.1.tar.gz
>  sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> -sha256  ed63aec4c75b9c21a5156b40052138032269bd27fd6f4bc0c51389807cdc7db9  NOTICE
> +sha256  7dedb0043b0bbed7880bcc9724b3a3dae4d5ab2dce98a7904703109572b626e3  NOTICE
> diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
> index 88d35cb7ee..d224cf5308 100644
> --- a/package/mxml/mxml.mk
> +++ b/package/mxml/mxml.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MXML_VERSION = 3.3
> +MXML_VERSION = 3.3.1
>  MXML_SITE = https://github.com/michaelrsweet/mxml/releases/download/v$(MXML_VERSION)
>  MXML_LICENSE = Apache-2.0 with exceptions
>  MXML_LICENSE_FILES = LICENSE NOTICE
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
