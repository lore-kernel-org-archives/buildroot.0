Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22993C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 07:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A216141887;
	Sun, 17 Jul 2022 07:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A216141887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ikN9nNyfST6P; Sun, 17 Jul 2022 07:21:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DC2341888;
	Sun, 17 Jul 2022 07:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DC2341888
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93EC11BF2CA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E60760F2F
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E60760F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uW_N4I2ZhdUY for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 07:21:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75EAA60F22
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75EAA60F22
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 07:21:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BAF7D780504;
 Sun, 17 Jul 2022 09:21:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 09:21:26 +0200
Date: Sun, 17 Jul 2022 09:21:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717072126.GY2543@scaer>
References: <20220714213431.58082-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220714213431.58082-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658042488;
 bh=ZibE+jEEEWAujuo7sMYJmNviG31DdvMar0Xl5QmAY4c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AfFv+Z7n9N5yhgaJe/2MOyjCYYq4tdShcOCAWzPTRgH/PvsCWQtAwGjOkVDv1ZkOE
 rrE8tVds/3bj7jA1kCC8+LHd8gWd7cIXm1TZpm9CggDuMpcUgdgf4FfkOUVv2G9GTb
 ZQeBY8VBKRum2bkbUBzGuJ2mW4RelfFPzIE7BM/S2BVCOMRDTAdc+GyPn5O+7THtk8
 LXpFPGkfyRGpD+UAS1medisTi61zgiJLYCLBSDeIg2ZoB7JB1mh1B6jW4/6NlcIE/d
 2CTXzhmY2Y/tdkkwi7e+xTBH5teofjasYl01Ud2fQq0vrdTfIRguHXdugKkgnVJ2O3
 iOutW9CcC1FDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AfFv+Z7n
Subject: Re: [Buildroot] [PATCH 1/1] package/libbytesize: bump to version 2.7
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

On 2022-07-14 23:34 +0200, Fabrice Fontaine spake thusly:
> https://github.com/storaged-project/libbytesize/releases/tag/2.7
> https://github.com/storaged-project/libbytesize/blob/2.7/NEWS.rst
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libbytesize/libbytesize.hash | 2 +-
>  package/libbytesize/libbytesize.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libbytesize/libbytesize.hash b/package/libbytesize/libbytesize.hash
> index 2dfa97dd6a..7dd572842d 100644
> --- a/package/libbytesize/libbytesize.hash
> +++ b/package/libbytesize/libbytesize.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  efaa2b35b2bb3b52bf7b4ff5d0ed2c5c61360a5196053808d615dd0aa2cf0741  libbytesize-2.6.tar.gz
> +sha256  8bae8287af6ef5624c320f70defdcd84ddc0c2057d3b59a5871897f27697811e  libbytesize-2.7.tar.gz
>  sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
> diff --git a/package/libbytesize/libbytesize.mk b/package/libbytesize/libbytesize.mk
> index 2ef08211c5..a95ee08357 100644
> --- a/package/libbytesize/libbytesize.mk
> +++ b/package/libbytesize/libbytesize.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBBYTESIZE_VERSION = 2.6
> +LIBBYTESIZE_VERSION = 2.7
>  LIBBYTESIZE_SITE = https://github.com/storaged-project/libbytesize/releases/download/$(LIBBYTESIZE_VERSION)
>  LIBBYTESIZE_LICENSE = LGPL-2.1+
>  LIBBYTESIZE_LICENSE_FILES = LICENSE
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
