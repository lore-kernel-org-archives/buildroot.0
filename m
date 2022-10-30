Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A60ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF472403AA;
	Sun, 30 Oct 2022 16:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF472403AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WW6FQ2HSepsB; Sun, 30 Oct 2022 16:25:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7F5840198;
	Sun, 30 Oct 2022 16:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7F5840198
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23DC81BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2F38812A1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2F38812A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T0GebYm7Cpyh for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:25:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E6528126C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E6528126C
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:25:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1679D13F87F;
 Sun, 30 Oct 2022 17:25:39 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 17:25:39 +0100
Date: Sun, 30 Oct 2022 17:25:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Pedro Aguilar <paguilar@paguilar.org>
Message-ID: <20221030162539.GN1058960@scaer>
References: <20221030155032.197144-1-paguilar@paguilar.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030155032.197144-1-paguilar@paguilar.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667147142;
 bh=yYLYonuXER4xJ352qsYbtXg85lHxhXHds+cTH50HpXM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AqlgXz09a1eZesn0BFjY+BDvX4E7qHogzIZDTVGyf9UDdgSu/tHSm3E81f5P0koCI
 SL1uwOzWDalJx/p0KT4jHh57P6vAL+c28AVXBh1dZVJ3pvqzI20jSkThqo4yp2WGoZ
 Q70FRXyaLyU9zE3wHkMCvp3o03n44ZywRoxcW1NHzkvM01APySaK6xXzau09wmXMX8
 rZrxQQmM4oGwmttQMrZqek4qJpdxpkTXVCCUFsIIDdbzOv7wZrPlscFGKWX30KHZO0
 IvTGE4HvczHSJEGETbaDL/oLj93P5CC+pu3SrtonX53A9TJEFdd+kenG5QPu/oZAXY
 N9u1bGwIgKkYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AqlgXz09
Subject: Re: [Buildroot] [PATCH 1/1] package/bdwgc: bump to version 8.2.2
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

Pedro, All,

On 2022-10-30 16:50 +0100, Pedro Aguilar spake thusly:
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> ---
>  package/bdwgc/bdwgc.hash | 2 +-
>  package/bdwgc/bdwgc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
> index 4276939083..ca094549c9 100644
> --- a/package/bdwgc/bdwgc.hash
> +++ b/package/bdwgc/bdwgc.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  3b4914abc9fa76593596773e4da671d7ed4d5390e3d46fbf2e5f155e121bea11  gc-8.0.6.tar.gz
> +sha256  f30107bcb062e0920a790ffffa56d9512348546859364c23a14be264b38836a0  gc-8.2.2.tar.gz
>  sha256  0aab7a56a92ed878c4a5464cf282d65f38bcdee64fe9cf213e26254bddb3f340  README.QUICK
> diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
> index cefa975998..e776fb7458 100644
> --- a/package/bdwgc/bdwgc.mk
> +++ b/package/bdwgc/bdwgc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BDWGC_VERSION = 8.0.6
> +BDWGC_VERSION = 8.2.2

    $ make bdwgc-legal-info
    >>> bdwgc 8.2.2 Collecting legal info
    ERROR: README.QUICK has wrong sha256 hash:
    ERROR: expected: 0aab7a56a92ed878c4a5464cf282d65f38bcdee64fe9cf213e26254bddb3f340
    ERROR: got     : a9b077aeb4e9e1aaf9742119d8023ef26f52f445cdc3f60d390bf59e1647f54a
    ERROR: Incomplete download, or man-in-the-middle (MITM) attack
    make[1]: *** [package/bdwgc/bdwgc.mk:40: bdwgc-legal-info] Error 1

Can you check what changed in the licensing terms, fix the hash file, and
(briefly) explain that change as a comment in the commit log, please?

Regards,
Yann E. MORIN.

>  BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
>  BDWGC_SITE = https://github.com/ivmai/bdwgc/releases/download/v$(BDWGC_VERSION)
>  BDWGC_INSTALL_STAGING = YES
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
