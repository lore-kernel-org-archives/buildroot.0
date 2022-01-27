Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CE2C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 19:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B82A6416F1;
	Thu, 27 Jan 2022 19:28:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oh-b6sKemB5j; Thu, 27 Jan 2022 19:28:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF97A416EC;
	Thu, 27 Jan 2022 19:28:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B83A31BF3C3
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5123415B3
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:28:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dy8aUK-RftFW for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 19:28:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4445416E4
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 19:28:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cc8e:5bc6:13d0:52a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 88C9F200390;
 Thu, 27 Jan 2022 20:28:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643311720;
 bh=6RXwhVQG/sezn38tNkqB8YfbjTYut8kc3agcSnjs79o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U0C/aUWZfZMuieF3dSnqeAk3SwuBMmXq27mDb8bN0OQkGWLYI1pkX150fVYPjhnEk
 VzIbbsI2GIxPgSkhqcr7/G9Bc8mocwmLmKddaPXCmRSaCOUJCAt+UQyvKNUKwwi6hB
 MshXXk3EX9spuet6b58H1Nk7R8XIBfBcOzIWKRIX1oT7YGnbPK9jsoRzMcAIyP4j+5
 Y84u58/ulwv7CyccMfxiqxaxlUSlS5u3XTrzrjuUrEqA5mmn7AJpYGS0akgihVLnnB
 WymjAYWcF6+YVAz8II4CWZXeHDcUf8hEjm08s1Uc/aFiMB5HRFJHLB6ge70S1CaZZR
 t0yfqAqRooEQA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 27 Jan 2022 20:28:37 +0100
Date: Thu, 27 Jan 2022 20:28:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220127192837.GP457876@scaer>
References: <20220127180456.2338773-1-fontaine.fabrice@gmail.com>
 <20220127180456.2338773-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127180456.2338773-2-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] package/jasper: bump to version 2.0.33
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
> https://github.com/jasper-software/jasper/blob/version-2.0.33/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/jasper/jasper.hash | 2 +-
>  package/jasper/jasper.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
> index 67653a8e88..410bcfc683 100644
> --- a/package/jasper/jasper.hash
> +++ b/package/jasper/jasper.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  6b4e5f682be0ab1a5acb0eeb6bf41d6ce17a658bb8e2dbda95de40100939cc88  jasper-2.0.28.tar.gz
> +sha256  28d28290cc2eaf70c8756d391ed8bcc8ab809a895b9a67ea6e89da23a611801a  jasper-2.0.33.tar.gz
>  sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
> diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
> index 59c5b3d66a..05168db763 100644
> --- a/package/jasper/jasper.mk
> +++ b/package/jasper/jasper.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -JASPER_VERSION = 2.0.28
> -JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
> +JASPER_VERSION = 2.0.33
> +JASPER_SITE = https://github.com/jasper-software/jasper/releases/download/version-$(JASPER_VERSION)
>  JASPER_INSTALL_STAGING = YES
>  JASPER_LICENSE = JasPer-2.0
>  JASPER_LICENSE_FILES = LICENSE
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
