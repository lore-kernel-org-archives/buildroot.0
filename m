Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB9AC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 601B941EFD;
	Tue,  6 Feb 2024 10:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 601B941EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lZHAuuf96M-t; Tue,  6 Feb 2024 10:38:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DA6241E95;
	Tue,  6 Feb 2024 10:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DA6241E95
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE56D1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95644403CA
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95644403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DsDNnxL5o7Xh for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:35:04 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51A7B400FE
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51A7B400FE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 811BA6000F;
 Tue,  6 Feb 2024 10:35:02 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:35:02 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206113502.0a0332e5@windsurf>
In-Reply-To: <20240109072834.4036277-1-james.hilliard1@gmail.com>
References: <20240109072834.4036277-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707215702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJuVG/+82fXjqIzJvnfs6MpbaiBvLdYFG4MSfTEqkrc=;
 b=dI3lDqu/iComSU2OkrEiGxDdBy2uQnI7B+qlNuZBAm+wcJI/WQJuuN1r1Y8suMYtIDUIKb
 NIMyNye4y+WCjC50ALBQ2BqX6ystbcOzldtnJ8v2O2+o+BAHFq9TNQp6Dr/zSgSY4VN6Ky
 E9a+fPQfKmL1EZ4VzSfgf7mPSw78Os20n1VQkfIy2wNv2FQLS0dDvnPTSjx80GUocEggwJ
 2C2Y7tWzex9WT4W0d0iu7sQaPf4epCDnTohSF+gT7pqg5m40OPtWwP0+gE/9SuVOt0RGN1
 8NwmK/FEiwYUGXF7RD+QCa9dHbgYtD5ash35XhPz1iugZz8mbWWG84MHo0UwiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dI3lDqu/
Subject: Re: [Buildroot] [PATCH 1/1] package/python-falcon: bump to version
 3.1.3
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 00:28:34 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-falcon/python-falcon.hash | 4 ++--
>  package/python-falcon/python-falcon.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
