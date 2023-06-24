Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F627EB64DC
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 20:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DBAC403F8;
	Sat, 24 Jun 2023 20:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DBAC403F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id somrJQ4O-kQl; Sat, 24 Jun 2023 20:53:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B784040B5D;
	Sat, 24 Jun 2023 20:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B784040B5D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 672161BF3D8
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 20:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4073560B0F
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 20:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4073560B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4OLdUNQaHFul for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 20:53:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D310760806
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D310760806
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 20:53:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:36ab:e848:bc86:4439])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B6829B00576;
 Sat, 24 Jun 2023 22:53:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 22:53:05 +0200
Date: Sat, 24 Jun 2023 22:53:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230624205305.GC24952@scaer>
References: <20230622165522.16397-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230622165522.16397-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687639988;
 bh=rskZDU/G7AZMiEl02DuS1bB9UF/iUWk93fE3FLz2U5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PvMepFrqp0T8n4DmfCp5bBSdHJT6wU68F55ZMWJVJRPMZj3rLsaqIFDndy+XEveVj
 itj6ZZ/e4TyJCWPPZHvDk7eGxIucekE+ZnrMz0jzFRZPraRfDJzC0ufOZU83mhe0+M
 MDpVJuQpDkLjLGbzQ8XRndzOi8W5HkBdvfqPORWq5DuR4hnBFX90A1VC56vEruDkBB
 2RAeIkiWaJJ8cUk7L6bRbB8mE2yKoEpAunh2que8NfP9OnOZBHtGzwGna4MXhHpuiA
 JcO6Rl4jHn1KuFSYFoFLz91ueeybmnMKO+dyAWfDyKj2MbvVK4m4nJRaWgyBk/XOtU
 ukXaVzW7tqSdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PvMepFrq
Subject: Re: [Buildroot] [PATCH v1 1/2] package/libubox: bump version to
 75a3b87
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-06-22 18:55 +0200, Peter Seiderer spake thusly:
> Changelog:
> 
>   - be3dc7223a6d uloop: avoid integer overflow in tv_diff
>   - 123e976f3d01 uloop: restore return type of uloop_timeout_remaining
>   - 334415738150 uloop: add uloop_timeout_remaining64
>   - c87d3e1fb67d lua/uloop: use uloop_timeout_remaining64
>   - c86a894ec63d uloop: deprecate uloop_timeout_remaining
>   - cce5e351278b vlist: define vlist_for_each_element_safe
>   - f2d6752901f2 blob: clear buf->head when freeing a buffer
>   - 45210ce14136 list.h: add container_of_safe macro
>   - cfa372ff8aed blobmsg: implicitly reserve space for 0-terminator in string buf alloc
>   - d2223ef9da71 blobmsg: work around false positive gcc -Warray-bounds warnings
>   - ea56013409d5 jshn.sh: add json_add_fields function for adding multiple fields at once
>   - b09b316aeaf6 blobmsg: add blobmsg_parse_attr function
>   - eac92a4d5d82 blobmsg: add blobmsg_parse_array_attr
>   - ef5e8e38bd38 usock: fix poll return code check
>   - 6fc29d1c4292 jshn.sh: Add pretty-printing to json_dump
>   - 5893cf78da40 blobmsg: Don't do at run-time what can be done at compile-time
>   - 362951a2d96e uloop: fix uloop_run_timeout
>   - 75a3b870cace uloop: add support for integrating with a different event loop
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libubox/libubox.hash | 2 +-
>  package/libubox/libubox.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
> index 2775427485..48b6432f5d 100644
> --- a/package/libubox/libubox.hash
> +++ b/package/libubox/libubox.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  54f65299439dab4be8f203588bcefd9b60052ae87d12c6d012f6278a2a111b4e  libubox-d716ac4bc4236031d4c3cc1ed362b502e20e3787-br1.tar.gz
> +sha256  b06311e7d857583303e9256f58787857944572012fbfd4a5d83e92e0e684f654  libubox-75a3b870cace1171faf57bd55e5a9a2f1564f757-br1.tar.gz
> diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
> index 90ba57a883..d6da078c7b 100644
> --- a/package/libubox/libubox.mk
> +++ b/package/libubox/libubox.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBUBOX_VERSION = d716ac4bc4236031d4c3cc1ed362b502e20e3787
> +LIBUBOX_VERSION = 75a3b870cace1171faf57bd55e5a9a2f1564f757
>  LIBUBOX_SITE = https://git.openwrt.org/project/libubox.git
>  LIBUBOX_SITE_METHOD = git
>  LIBUBOX_LICENSE = ISC, BSD-3-Clause
> -- 
> 2.41.0
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
