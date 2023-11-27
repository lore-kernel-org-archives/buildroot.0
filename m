Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7CBC4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 18:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A73B9817B1;
	Mon, 27 Nov 2023 18:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A73B9817B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JSoJcVEmhEtZ; Mon, 27 Nov 2023 18:23:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD31E817AF;
	Mon, 27 Nov 2023 18:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD31E817AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81A221BF348
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 673864063B
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 673864063B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z9HOlTRxu5ud for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 18:22:35 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 097C240612
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 18:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 097C240612
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:7618:50d5:c153:9a40])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 56810B005AC;
 Mon, 27 Nov 2023 19:22:31 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Nov 2023 19:22:31 +0100
Date: Mon, 27 Nov 2023 19:22:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alexander Egorenkov <egorenar-dev@posteo.net>
Message-ID: <20231127182231.GZ3177259@scaer>
References: <20231127115959.25625-1-egorenar-dev@posteo.net>
 <20231127115959.25625-2-egorenar-dev@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127115959.25625-2-egorenar-dev@posteo.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701109353;
 bh=Lj48cD+u9OHVLfuljjLWMb6O+WVat0eKYKXxwC7Z6AU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JwW3WPCV3mNrkqBayePkB9xoh9PD+1vuRYMg7nkozBIl1Rkn+LreqUO7K8hVbmI2o
 mGiSAFdxTh5mXFA1Uye9DNlquNnXmHREahjl0SN1m2j2eVBBYyThNe24c9s5hRzP6X
 BEAKGD/6VahUJY4lAbHXXT951Sfx6w+NvyFZSzjxSMZ3ZjYFqYBxSU5tHk4wk51hMI
 KVlqCxrIYJstcgzBwEac3NrQXSMKXFZ1a0vVsKqr00eaAM4clUuaUYiEjm9VF6QALG
 5OQWBs/7yl39ES3YKvUqq3QhJSlhIn6czrUZyT3UT/6ZvgugFu1naSnPf/Lw7iFdbD
 V412reKWF3W0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JwW3WPCV
Subject: Re: [Buildroot] [PATCH 1/1] package/multipath-tools: bump to
 version 0.9.7
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

Alexander, All,

On 2023-11-27 11:59 +0000, Alexander Egorenkov spake thusly:
> Change log:
> - https://github.com/opensvc/multipath-tools/pull/77
> 
> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/multipath-tools/multipath-tools.hash | 2 +-
>  package/multipath-tools/multipath-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
> index 06aa5ccc809a..0f51c3884645 100644
> --- a/package/multipath-tools/multipath-tools.hash
> +++ b/package/multipath-tools/multipath-tools.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  401c6f6e8dc5d3feaaee76280716aee718579ac024ce4f2fae77c798dc7a0f9f  multipath-tools-0.9.6.tar.gz
> +sha256  8f0a7ddc01137d0f90ac3ef5700131dfbd6cf3bbbccdcfa317e8379efa328d59  multipath-tools-0.9.7.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
>  sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
> diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
> index 7071e1fd1b33..e62e85e14daa 100644
> --- a/package/multipath-tools/multipath-tools.mk
> +++ b/package/multipath-tools/multipath-tools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MULTIPATH_TOOLS_VERSION = 0.9.6
> +MULTIPATH_TOOLS_VERSION = 0.9.7
>  MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
>  
>  MULTIPATH_TOOLS_LICENSE = \
> -- 
> 2.42.0
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
