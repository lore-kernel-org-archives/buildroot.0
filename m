Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF88C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8CFE408DF;
	Sun,  6 Aug 2023 14:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8CFE408DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDJPjv51RgJW; Sun,  6 Aug 2023 14:20:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8068E40085;
	Sun,  6 Aug 2023 14:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8068E40085
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 849391BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CDC04011C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CDC04011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eANQgQeH74nd for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:20:03 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 478674000B
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 478674000B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c94f:8093:8f39:b163])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6ECAD13F8BB;
 Sun,  6 Aug 2023 16:19:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Aug 2023 16:19:55 +0200
Date: Sun, 6 Aug 2023 16:19:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230806141955.GV421096@scaer>
References: <20230802111447.41714-1-thomas@devoogdt.com>
 <20230802111447.41714-4-thomas@devoogdt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802111447.41714-4-thomas@devoogdt.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691331601;
 bh=KcoYzE2I/KlZsX9aDiAMsM3hyCQhxlh4L6JDMJdyX3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=obG2wcA3F8JUwZIT3y6QCZuz18dTtBWuKBk4XfX1K9/7OJpLm++0mQxtyvkdINgFL
 48Lxzx8+JOSQ7efr4PenehWlWwn1+M1Kph+np06UUjmIO35shd3g5VCe8xyIxLzeEj
 ONGFulYrpMfnyXu2+rchCJ/mw8a/LGswPBRvnP+6yo6e20Ik5zaQhOuY0GuSIiWxoD
 9TybUntcKxr1LosC+KNxj6/bt4ljOj3w8r1eBzYWmsPcVJgHxrzNxjiiFjrBJbAodS
 EMCbNbYk+sLYY9FeUo3xXxqYAnNDzWtHtq7vJohkZfUI7s6ypRsPvrc2XjOXGzVJAV
 mcr3G+uDlVvMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=obG2wcA3
Subject: Re: [Buildroot] [PATCH v6 4/4] pkg-cmake: make ninja the default
 for all packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-08-02 13:14 +0200, Thomas Devoogdt spake thusly:
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> Use ninja as the default generator.

I have not applied that patch yet, because Thomas P. and I believed this
is a bit bold, even for next.

I've started a build with a bunch of cmake-based packages, and I'll see
if they break alot of not later in the evening. If there's breakage,
I'll report and you'll have to investigate! ;-p

> A fun fact is that we of course have to disable ninja when building ninja.

Yes, of course! :-)

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
> v5: add this optional commit
> v6: rebase
> ---
>  package/ninja/ninja.mk | 1 +
>  package/pkg-cmake.mk   | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
> index b7bc1a4f1c..85dd2e05aa 100644
> --- a/package/ninja/ninja.mk
> +++ b/package/ninja/ninja.mk
> @@ -9,6 +9,7 @@ NINJA_VERSION = $(NINJA_VERSION_MAJOR).g95dee.kitware.jobserver-1
>  NINJA_SITE = $(call github,Kitware,ninja,v$(NINJA_VERSION))
>  NINJA_LICENSE = Apache-2.0
>  NINJA_LICENSE_FILES = COPYING
> +NINJA_CMAKE_NINJA = NO
>  
>  define HOST_NINJA_INSTALL_CMDS
>  	$(INSTALL) -m 0755 -D $(@D)/ninja $(HOST_DIR)/bin/ninja
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 36ab88d3a1..dab87c81f4 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -52,7 +52,7 @@ endif
>  define inner-cmake-package
>  
>  $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
> -
> +$(3)_CMAKE_NINJA ?= YES
>  
>  ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
>  $(2)_BUILDDIR			= $$($(2)_SRCDIR)
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
