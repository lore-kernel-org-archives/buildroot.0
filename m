Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45464C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E477841908;
	Tue, 25 Jul 2023 21:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E477841908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojlT9vxLL6vc; Tue, 25 Jul 2023 21:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FD8D41931;
	Tue, 25 Jul 2023 21:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FD8D41931
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C72671BF4E5
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0B7540291
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0B7540291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hf0wFE-C9vpw for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:01:32 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C8DB4014B
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 21:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C8DB4014B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id CCED9780340;
 Tue, 25 Jul 2023 23:01:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 23:01:27 +0200
Date: Tue, 25 Jul 2023 23:01:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230725210127.GR3544423@scaer>
References: <20230725145349.1013615-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725145349.1013615-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690318890;
 bh=UPSzn+WxKS5vlqGwtvKxsCpBVuV74w02hxjULlezaEU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dmHs9sqlp2LcG/t5nuKpsv3ME6WbSH3oDo6c4mIUnjez6wCrkknkU8EwVggFpCUBF
 hr/X9jxF0KorQQDsdqEAZ0Ekkq/CTJ0PCcDVoj9CnWhCGqOeNEpQ/0iR0e4dYwjoo8
 +4RecqJHtYLPBgvTjbY/y+Eent/DIqhV3yJmhnkcaM2MUvEFfnimNJEc3OYE+lGM4z
 uWoffRV80GzI9l5JscWhKs2xjbZUhaFjBd0YkHP3FyRMBoyBUUbcm1ijwoQOrEa23P
 oCl3+uTGAxq9m920aoKIuJNcDoNx9ni2Ijqtds2FvVc780mtyRVmiIgLkI6ZT1k+lP
 lc6XBIlqv5GAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dmHs9sql
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland: bump to version 1.22.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-07-25 08:53 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wayland/wayland.hash | 6 +++---
>  package/wayland/wayland.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
> index 1c7fe705e1..5da527e318 100644
> --- a/package/wayland/wayland.hash
> +++ b/package/wayland/wayland.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2022-June/042268.html
> -sha256  6dc64d7fc16837a693a51cfdb2e568db538bfdc9f457d4656285bb9594ef11ac  wayland-1.21.0.tar.xz
> -sha512  5575216d30fdf5c63caa6bcad071e15f2a4f3acb12df776806073f65db37a50b5b5b3cc7957c5497636f4ac01893e2eaab26e453ded44b287acde01762f5fdc3  wayland-1.21.0.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2023-April/042647.html
> +sha256  1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842  wayland-1.22.0.tar.xz
> +sha512  fb1974efc8433e97254eb83fe28974198f2b4d8246418eb3d34ce657055461e0c97bc06dd52e5066ae91bbe05bac611dc49a0937ba226ac6388d5a47241efb12  wayland-1.22.0.tar.xz
>  
>  # Locally calculated
>  sha256  6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
> diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
> index 0a6e5e9ec7..1a764d5580 100644
> --- a/package/wayland/wayland.mk
> +++ b/package/wayland/wayland.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WAYLAND_VERSION = 1.21.0
> +WAYLAND_VERSION = 1.22.0
>  WAYLAND_SITE = https://gitlab.freedesktop.org/wayland/wayland/-/releases/$(WAYLAND_VERSION)/downloads
>  WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
>  WAYLAND_LICENSE = MIT
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
