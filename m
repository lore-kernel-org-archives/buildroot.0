Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B583C4167D
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A57AE420F3;
	Mon,  6 Nov 2023 21:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A57AE420F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LhUO6rXeXiVK; Mon,  6 Nov 2023 21:59:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E334C420E7;
	Mon,  6 Nov 2023 21:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E334C420E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 719C81BF215
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3892582219
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3892582219
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RYlyJHXTyu8V for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:59:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D3298216F
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:59:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D3298216F
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9614E0003;
 Mon,  6 Nov 2023 21:59:32 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:59:31 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106225931.79e2db27@windsurf>
In-Reply-To: <20231105002852.2708915-1-james.hilliard1@gmail.com>
References: <20231105002852.2708915-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699307973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pY44wSo0tWJi2+JYqrhH5QbMqPH3VaofaF6BM6zgohA=;
 b=LlZmsOodL3wo12T4eSmjlU61HQcDNS7Adq92vTielZnERVzAbPk58eYOVs2lzdiHjGu/UV
 VWp+VrRmAaYTmSkTOVwLqVt4MG5Uy5lNFJw284f1uA0NQZe9wjKWUBzuKGElUw3Mwm3HDi
 a+azx2KrYT3Gp8Da/oWr5hUumKjjb9wYpBVLPRL9gN1CZGY2w+umT+GsilCxpze5wxIa9R
 zJc6BL4J9Zw/aLm0uaghheX+ZEQ2eGCNOU9R/9jaG/zojEqlweUjbXYexBiZhVcv/WY5U8
 qfYg7PJzWCJ5aVkttbapQfIOoiwxJYYCuHlu0vqpSpiAbhfTEGhlPNvZ8b5QoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LlZmsOod
Subject: Re: [Buildroot] [PATCH 1/2] package/python-types-python-dateutil:
 new package
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

On Sat,  4 Nov 2023 18:28:51 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                                   |  1 +
>  package/python-types-python-dateutil/Config.in      |  6 ++++++
>  .../python-types-python-dateutil.hash               |  3 +++
>  .../python-types-python-dateutil.mk                 | 13 +++++++++++++
>  4 files changed, 23 insertions(+)
>  create mode 100644 package/python-types-python-dateutil/Config.in
>  create mode 100644 package/python-types-python-dateutil/python-types-python-dateutil.hash
>  create mode 100644 package/python-types-python-dateutil/python-types-python-dateutil.mk

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
