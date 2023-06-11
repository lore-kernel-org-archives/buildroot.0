Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CB7C77B7A
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 05:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B276D41890;
	Sun, 11 Jun 2023 05:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B276D41890
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X3ezzJC7otDe; Sun, 11 Jun 2023 05:46:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0AE74185A;
	Sun, 11 Jun 2023 05:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0AE74185A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9C7E1BF2E5
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 05:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B14644185A
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 05:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B14644185A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFDN4r6fogFC for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 05:46:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2D1941834
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2D1941834
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 05:46:19 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id B8E24440789;
 Sun, 11 Jun 2023 08:45:48 +0300 (IDT)
References: <20230610181914.541374-1-james.hilliard1@gmail.com>
User-agent: mu4e 1.9.21; emacs 28.2
To: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 11 Jun 2023 08:42:13 +0300
In-reply-to: <20230610181914.541374-1-james.hilliard1@gmail.com>
Message-ID: <87wn0atuu1.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1686462348;
 bh=kEY4vQX4T/geg8Q4vlt6ZP7BJnFx4xi4paI1HBNvzgI=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=FpH04Z+ZSQAb5EZlgMCjMLPTm1ya0Gn9ceFTuaYMkx+AsiMG2RbGdiVrAHanzz0xY
 eiMnxyKDpSoLarWHmqpZU3APeLSsJzncY2HcnMsMXbjinmLlmquUfT9n48k98Ngxs5
 6O7n7oe6tARbAr627Kx0fDk7Ny8vQOaEdugmA8OWPxcyfjEx5dHDA0jNeSFh0KY3MW
 SjZ83eCgmlnr2DL/1rFgEAISr1wS1gqGeC1nyQ1h0vH9Xb1CGoL4UdUzqz4FCvrvR2
 AF6WAw08Hl+KIRjM1bvkuYnUMSBraxHRMY+ZjZqQTmZ/09WHUSgcdKqZE9UQiVWtLT
 cB+MJkJMNdhkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=FpH04Z+Z
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: use bundled headers
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

Hi James,

On Sat, Jun 10 2023, James Hilliard wrote:

> Details: https://github.com/strace/strace/issues/253
>
> Fixes:
>  - http://autobuild.buildroot.net/results/867/8675aeca53653d9d792182be61a28ea550dc530d

Thanks for following up on this.

Github issue #253 you linked to mentions --enable-bundled as a
workaround. Shouldn't we backport upstream commit 8f691206e4aa76
instead?

  https://github.com/strace/strace/commit/8f691206e4aa769cc99e264f1c15ae6956789f91

But then again maybe we do want to hardcode --enable-bundled for
consistency?

baruch

>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/strace/strace.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/strace/strace.mk b/package/strace/strace.mk
> index 6514bfe354..9f6b333318 100644
> --- a/package/strace/strace.mk
> +++ b/package/strace/strace.mk
> @@ -10,7 +10,7 @@ STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSI
>  STRACE_LICENSE = LGPL-2.1+
>  STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
>  STRACE_CPE_ID_VENDOR = strace_project
> -STRACE_CONF_OPTS = --enable-mpers=no
> +STRACE_CONF_OPTS = --enable-bundled=yes --enable-mpers=no
>  
>  ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
>  STRACE_DEPENDENCIES += libunwind


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
