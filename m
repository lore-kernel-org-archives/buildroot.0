Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CB4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 15:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DA6F83E16;
	Thu, 28 Apr 2022 15:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QTcp1wnl7rVB; Thu, 28 Apr 2022 15:35:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BFD683487;
	Thu, 28 Apr 2022 15:35:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58CBF1BF39D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 15:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 552934098A
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 15:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id omYjXFgp2nLM for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 15:35:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD5E241496
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 15:35:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8d9a:c8d:7cf:ba48])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C0559780380;
 Thu, 28 Apr 2022 17:35:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651160105;
 bh=yBSb5P6CRGVVL3zIHgX/bgNVvGS9LBqSMj21e8g/J6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E6aG192BWvaoJfkd9yef2K+wQBJWKCHva/FPZshrzcA1s+X3G/Be3xStMVapAa4if
 Y0GeswTz47xNIUt1PlxicXejeeL9NxOPx5YJjjpysl0gU3khAdrCN1baWGO+Hz/km6
 uLpbWXlvDhtegF4wAMSmRrKDq0KGjqETR/RGYik57ZzWbqE1AwUS5NVzh1ks/SNmHo
 rLwL1wuF2LC63hB8t2xcDZJgVUMq8XqjGydkH4HkxuxZAcV9bi9wXG+0NrE5jOKYuR
 HKuLWOGtYB3k2BkwVmcj+rLwY6ZZA6DoQaHG+Iwrg3jYsd0mvwzY6l5gMT3YKeZzeC
 N1u6R/iT2ThmA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Apr 2022 17:35:00 +0200
Date: Thu, 28 Apr 2022 17:35:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20220428153500.GD3624965@scaer>
References: <20220425111148.87319-1-tianyuanhao3@163.com>
 <20220428113929.1018091-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428113929.1018091-1-tianyuanhao3@163.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/udev: move render and sgx to
 package/systemd
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
Cc: Carlos Santos <unixmania@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yuanhao, All,

On 2022-04-28 04:39 -0700, TIAN Yuanhao spake thusly:
> Moved groups render and sgx from UDEV_USERS to SYSTEMD_USERS as they
> currently only appear in systemd's udev rules.
> 
> In systemd, group render was introduced since commit 4e15a73, and group
> sgx was introduced since commit c9c4899.
> 
> In eudev, group render was introduced since commit bb070c1, but was
> removed since commit a8ffcd1 [1].
> 
> [1]: https://github.com/eudev-project/eudev/issues/160
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Carlos Santos <unixmania@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> Changes v2: UDEV_USERS_SYSTEMD to SYSTEMD_USERS
> ---
>  package/systemd/systemd.mk | 2 ++
>  package/udev/udev.mk       | 4 +---
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 58a1376b51..7a711319cf 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -603,6 +603,8 @@ endef
>  
>  define SYSTEMD_USERS
>  	# udev user groups
> +	- - render -1 * - - - DRI rendering nodes
> +	- - sgx -1 * - - - SGX device nodes
>  	# systemd user groups
>  	- - systemd-journal -1 * - - - Journal
>  	$(SYSTEMD_REMOTE_USER)
> diff --git a/package/udev/udev.mk b/package/udev/udev.mk
> index ce93d98431..d70d13ebb3 100644
> --- a/package/udev/udev.mk
> +++ b/package/udev/udev.mk
> @@ -4,12 +4,10 @@
>  #
>  ################################################################################
>  
> -# Required by default rules for input devices
> +# Required by default rules
>  define UDEV_USERS
>  	- - input -1 * - - - Input device group
> -	- - render -1 * - - - DRI rendering nodes
>  	- - kvm -1 * - - - kvm nodes
> -	- - sgx -1 * - - - SGX device nodes
>  endef
>  
>  $(eval $(virtual-package))
> -- 
> 2.35.1
> 

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
