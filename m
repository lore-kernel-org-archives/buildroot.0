Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3695C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 10:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7772F60D62;
	Mon, 15 Aug 2022 10:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7772F60D62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1yrAsJFFaHeQ; Mon, 15 Aug 2022 10:02:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9798B60625;
	Mon, 15 Aug 2022 10:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9798B60625
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 273761BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E938A817EB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E938A817EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TrO3zECrzbqF for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 10:02:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D111B81754
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D111B81754
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 10:02:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6A82A240006;
 Mon, 15 Aug 2022 10:02:30 +0000 (UTC)
Date: Mon, 15 Aug 2022 12:02:29 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220815120229.6a2b1f5e@windsurf>
In-Reply-To: <20220804024126.1103291-1-christian@paral.in>
References: <20220804024126.1103291-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660557750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OtMXvrdUXD4a0IBruasWmpqTrGZsqnr/uFMNv7GFcUQ=;
 b=lJZN8fUwTgLtmzc6mNwK+GVt241z/PLv5uzehXtzQCakaJlVOWN97aQiTHPco0YqxSth/e
 Uh1PgWNPN5Q7EcE8qXk6BtXyyJFSyJUUiyyFQwn0lW3EyHniK/qwDQnNGKA/3WtD3Ura5l
 m7INY/YHCsrI+EACnEx8CifLrVzLc5zBLFTI/0XZIscOd9X9GzxPgzQQKSNOfHLPWZFlsB
 Nk9SnTGaiwCrmzxB0Np+IQh8JssbSVjuBmA4OsG+6G1pFdxhJh4tXK+NNQiJv7mdo9VGOk
 MX2MuvC5vVDZNXRZU5oLxozz7QXqube1nyt49xVydt72josYEWM7HCkkUxusCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lJZN8fUw
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.19
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Aug 2022 19:41:26 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Go 1.19 is a major release with changes to the implementation of the toolchain,
> runtime, and libraries.
> 
> Dropped patch 0002-cmd-dist-use-gohostarch... as it was merged upstream.
> 
> https://go.dev/doc/go1.19
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  ...explicit-option-for-crosscompilation.patch |  4 +-
>  ...use-gohostarch-for-ssa-rewrite-check.patch | 95 -------------------
>  package/go/go.hash                            |  2 +-
>  package/go/go.mk                              |  2 +-
>  4 files changed, 4 insertions(+), 99 deletions(-)
>  delete mode 100644 package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
