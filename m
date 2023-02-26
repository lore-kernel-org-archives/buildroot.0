Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66916C64ED6
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 06:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3CFE60E42;
	Sun, 26 Feb 2023 06:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3CFE60E42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yt6AI92edVfG; Sun, 26 Feb 2023 06:09:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF11760D65;
	Sun, 26 Feb 2023 06:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF11760D65
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C60E11BF5AD
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 06:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC8C460BD9
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 06:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC8C460BD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ElF5dp73_4li for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 06:08:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0879C60E34
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0879C60E34
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 06:08:38 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id BEE5B440699;
 Sun, 26 Feb 2023 08:04:10 +0200 (IST)
References: <20230225112838.4061103-1-casey@xogium.me>
 <20230225132927.4067626-1-casey@xogium.me>
User-agent: mu4e 1.9.21; emacs 28.2
To: Casey Reeves <casey@xogium.me>
Date: Sun, 26 Feb 2023 08:07:34 +0200
In-reply-to: <20230225132927.4067626-1-casey@xogium.me>
Message-ID: <87mt51ez6l.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1677391450;
 bh=6VKRfPH34pJ9irRvIgnMjZKscAGyUxc2LB3Om3VEKRQ=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=OsI1ZDx0BT4lvvoNSkGMwNw3pMeoBlo69+/Tm4qVe7L1/OMIGAy4bXOBeuZR5RRKv
 6pYbBEiFhKssFplh5XCkxRHGpyniHJvdMR3Xv9HjS540T4fWG0zRgWBz/sqOo1zEVk
 efPg8HVxwJOZlxNvQsUGGsnQz7oZfmsr620DrTBj3c3O0aOXX6D9YWgKHaeHZnht7M
 oJojtL0bpQq/2Cxx4KusOtzO2ylIMVLoqxIPiW8dRDq9K5lygoOjGg+WS8tef6YfBG
 we6eTkWxGhImr1Aihy4ob6mGb23hOCwYZqZxHQyrys6m323b763XPYBQ0qjQbNC/zL
 gY9L4xBQverLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=OsI1ZDx0
Subject: Re: [Buildroot] [PATCH v2] package/lzop: bump to version 1.04
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Casey,

On Sat, Feb 25 2023, Casey Reeves wrote:
> diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
> index 55157c4d48..056d724a7b 100644
> --- a/package/lzop/lzop.mk
> +++ b/package/lzop/lzop.mk
> @@ -4,13 +4,22 @@
>  #
>  ################################################################################
>  
> -LZOP_VERSION = 1.03
> +LZOP_VERSION = 1.04
>  LZOP_SITE = http://www.lzop.org/download
>  LZOP_LICENSE = GPL-2.0+
>  LZOP_LICENSE_FILES = COPYING
>  LZOP_DEPENDENCIES = lzo
>  HOST_LZOP_DEPENDENCIES = host-lzo
>  
> +LZOP_LIBTOOL_PATCH=NO
> +#LZOP_POST_PATCH_HOOKS += LZOP_LIBTOOL_FIXUP

This commit looks redundant.

baruch

> +
> +define LZOP_LIBTOOL_FIXUP
> +	patch -i support/libtool/buildroot-libtool-v2.4.4.patch $(@D)/autoconf/ltmain.sh
> +endef
> +
> +LZOP_POST_PATCH_HOOKS += LZOP_LIBTOOL_FIXUP
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
