Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E77C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 13:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD7AE6126F;
	Mon, 25 Jul 2022 13:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD7AE6126F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hv4jw0Zm2pBB; Mon, 25 Jul 2022 13:28:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4D766125C;
	Mon, 25 Jul 2022 13:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4D766125C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 078251BF3EE
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 13:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D598583EB6
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 13:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D598583EB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nUQuko5Sx_jw for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 13:28:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA39D83E18
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA39D83E18
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 13:28:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9102:8e95:18fd:a25a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3F24619F58A;
 Mon, 25 Jul 2022 15:27:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 25 Jul 2022 15:27:57 +0200
Date: Mon, 25 Jul 2022 15:27:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220725132757.GE3168@scaer>
References: <20220109084732.2567404-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220109084732.2567404-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658755680;
 bh=PAIVHxCr5X6GdpVYl8eCA7KqbG943ioHkfuxk4jklQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uQ2b+HHBHdsQ5k42cAjId8T/ipqKvusr06pGsGD5+a8Tb3E6KEcgRafr3F+Lcj+0i
 ZNPZFvEclTrQeHpQ5WjqyZbbTvyOt+STllplrBPYBUCRsB6UFw3ZiS4FEkGEIvjUoE
 IQhFmT9DCOfFGcyH7PggZ/+k35Zb8TmvHjGkJ3vj+fhxVy4yaLZEzjsFPzXklLyuU/
 EUMC96+QcPaJWev9jI6HaYUpQ2cuqyq6wJUoP5cqoeuviY3UZ3DjtjgNwyN26zjNO9
 K5/aLzNj+sH07OGXzwUOq0HZ+v1nU9vwdtQVXZ4hcK0KshgDFH+exkvz/rfhuK8dud
 cu0QFL8o6kepQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uQ2b+HHB
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cargo.mk: enable -Z
 target-applies-to-host via env
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

James, All,

Resurecting this old patch that was applied, but I have a question about
it, see below...

On 2022-01-09 01:47 -0700, James Hilliard spake thusly:
> This should be more reliable and fix the host == target bug when
> doing indirect invocations using the cargo env.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/pkg-cargo.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index 47ae86bfae..b6cb65c4f0 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -27,6 +27,7 @@
>  PKG_CARGO_ENV = \
>  	CARGO_HOME=$(HOST_DIR)/share/cargo \
>  	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
> +	CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
>  	CARGO_TARGET_APPLIES_TO_HOST="false"
>  
>  ################################################################################
> @@ -88,7 +89,6 @@ define $(2)_BUILD_CMDS
>  			$$(if $$(BR2_ENABLE_DEBUG),--debug,--release) \
>  			--manifest-path Cargo.toml \
>  			--locked \
> -			-Z target-applies-to-host \

Did you forget to remove it from the _INSTALL_TARGET_CMDS?

Regards,
Yann E. MORIN.

>  			$$($(2)_CARGO_BUILD_OPTS)
>  endef
>  else # ifeq ($(4),target)
> -- 
> 2.25.1
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
