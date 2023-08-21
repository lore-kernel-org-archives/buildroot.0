Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F772EE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 13:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12BB4410AF;
	Mon, 21 Aug 2023 13:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12BB4410AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i1cNYsjui9n7; Mon, 21 Aug 2023 13:51:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3048D410C0;
	Mon, 21 Aug 2023 13:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3048D410C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF36A1BF2F2
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89BA7410A1
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89BA7410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B0FFHjUI3K9k for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 13:51:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45D5141061
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 13:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45D5141061
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8EED20004;
 Mon, 21 Aug 2023 13:51:26 +0000 (UTC)
Date: Mon, 21 Aug 2023 15:51:25 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230821155125.5a22a7ca@windsurf>
In-Reply-To: <20230817191455.106828-1-bernd@kuhls.net>
References: <20230817191455.106828-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692625887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uw9JFNPz0Aa7v0kz1w8yG8L3ouSZJecYhqcRWaCN5ec=;
 b=lAku+Qq7WCmjRUgTpEXE+twSZF63quoOJ6FFPzoXRhXnahZPkf5jjOYBYDzkr0Sda3nyrf
 2KrjOMBJyrVwvptzKxHM8cW7Tvw3GjUNTjBoTB11LlsduMFHHWyYu+jX4oSz8w7dfKybez
 DZ7a33QNKXn18paFdmn0un3wpibVOmsMlfG5uWlkGX4j6jmfeBHe77nAF/gmjU46IjpZo3
 3RAsBlha1Q7iWulsme3Sr7m4pObKpiq+/WXAb6WxZUQeJZY9Tjyqi51FnlaCxZSTB25KbY
 CGUFlotBfnLwd6viZUOcxv8vm/cSTwOGsFHngasgu5DBu9qFuNVkiKupwn7Z2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lAku+Qq7
Subject: Re: [Buildroot] [PATCH/next 1/1] package/fmt: bump version to 10.1.0
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
Cc: Semyon Kolganov <semenak94@mail.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 17 Aug 2023 21:14:55 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://github.com/fmtlib/fmt/blob/master/ChangeLog.rst
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/fmt/fmt.hash | 2 +-
>  package/fmt/fmt.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
