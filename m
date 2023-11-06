Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5039C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74840421F1;
	Mon,  6 Nov 2023 22:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74840421F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzuh4rTr3-uz; Mon,  6 Nov 2023 22:30:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC5044093B;
	Mon,  6 Nov 2023 22:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC5044093B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC09C1BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92077414BD
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92077414BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plbO1y5M20NO for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:57 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F93841183
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F93841183
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75F5460002;
 Mon,  6 Nov 2023 22:25:55 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:23:38 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232338.43543e1e@windsurf>
In-Reply-To: <20231105073115.2882141-1-james.hilliard1@gmail.com>
References: <20231105073115.2882141-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GlTQNdEzRg/Dz3ksQiz7ztDq7yKZ9yMDOoSIeb5MmB0=;
 b=BEPHbkCC6hA5WikH6eraS/eB0US+xXzCG0lsloSMcX4ZbueQpm+S1FRYySIrAehTf++VhX
 WWyDzrn8B+VYFQcBHbtMCgqO36oQilvotRhTPnYXFr3CJ9No2Ty1BPx/SVwbYuUAEaYSzm
 BHs461zu+iw+PZcqx39+mhNGSTQyVyACPhhUZ5+ycH7GlcZDRHTMqY7QH+cZmNAOF//nUN
 0Y0BwINn/0aKY5W+gaDocoAfOg7JVVXBmKDET53S44rJli9/UMa2mcFIZ3xSX+8RQT0oIn
 K+ggFPxzBy3jUq5i3D0DLK7yvmxWV0xczW7nmBRS18DHLv0YxFCmUAy1Kje53A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BEPHbkCC
Subject: Re: [Buildroot] [PATCH 1/1] package/python-hatch-fancy-pypi-readme:
 bump to version 23.1.0
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

On Sun,  5 Nov 2023 01:31:15 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-hatch-fancy-pypi-readme.hash                       | 4 ++--
>  .../python-hatch-fancy-pypi-readme.mk                         | 4 ++--
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
