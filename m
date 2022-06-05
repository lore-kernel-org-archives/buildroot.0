Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E42C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 21:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6B4940D7C;
	Sun,  5 Jun 2022 21:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHqgj7ZUff2n; Sun,  5 Jun 2022 21:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D254540D7A;
	Sun,  5 Jun 2022 21:29:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62E881BF290
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50E2D40D7C
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebjysVA1IenU for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 21:29:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06B3440104
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 21:29:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C93A2240002;
 Sun,  5 Jun 2022 21:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654464575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7zxWoXkrdkrq0HjxZ9kodlRJdudL0HJ+RISL0WrKrQ=;
 b=QaUZGiZRYkTAkCrDtNrioGD1jNQ4zS+LbySBYl9L6LAi1Ck0qo/vyHqhDIAHGQUXEfpUOB
 r/QsU6cnFq5go/u4jRpPvYsJpinR7b/hBlYcOnI1ip3CrkfNh1gw/zfdBYW8jiEWYJSXTm
 8otwG9hXyP1dxmJsDt7et5Do+vuqEYFKJa48eybJcYaE88VPaHtzk6/nt/TMGPKU1HtRBF
 z6wsnPBKPzVq32WjkFQ/dvHU5RJfYZmoMaGT9ULmlQLMvhzlTLbJHWHNA2qvR1DVzgZMgE
 s9M/YfRQ82Kwp0Ov+OM4CJZPTfI8D/XpSwyGuhfKv5iYfEqc6dO1jJ+Um4A/Qw==
Date: Sun, 5 Jun 2022 23:29:33 +0200
To: Grzegorz Blach <grzegorz@blach.pl>
Message-ID: <20220605232933.6bc7fa2d@windsurf>
In-Reply-To: <20220531185444.226429-1-grzegorz@blach.pl>
References: <20220531185444.226429-1-grzegorz@blach.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/5] package/python-falcon: Bump to version
 3.1.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 31 May 2022 20:54:44 +0200
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  package/python-falcon/python-falcon.hash | 4 ++--
>  package/python-falcon/python-falcon.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
