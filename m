Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CE2C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CAEA40922;
	Tue, 23 Aug 2022 19:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CAEA40922
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tBDMcEimFeBe; Tue, 23 Aug 2022 19:41:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 225F94092D;
	Tue, 23 Aug 2022 19:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 225F94092D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E69A1BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19C1B40323
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19C1B40323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0LX2jW0BFw8 for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:41:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFD1D4011C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFD1D4011C
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:41:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9360924000A;
 Tue, 23 Aug 2022 19:41:02 +0000 (UTC)
Date: Tue, 23 Aug 2022 21:41:01 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220823214101.40eba0d9@windsurf>
In-Reply-To: <20220822084047.2846789-1-james.hilliard1@gmail.com>
References: <20220822084047.2846789-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661283663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=att269ZAa469EPxCDYinyUz6VI3vdcQrciRIPeG8kMM=;
 b=HLttMscd2EtTf99izMBJ0ZJBoC0IJaaK0oiljNIhDMOHmEY2DBAhfZgnqB1aW95Ko6GADx
 Sodqd0p1+FQXO8zmqsurH92n8SYXItY9Iuepu+z78Wujv3qWFIxAlCFp552/HEWqLaBmWh
 XA4O8IhixoS85xb9bNcS47jxyUdPAtVeSNpIwoQGRoMn52M0WBFfMYHzr68X0Z5CQbLzuj
 q2UU2aoqSycKTR4ncesQp/dcYl4cSL7FAVA324ImP0GknZAHxbBz9ufJJlFulITmfLP+6v
 jtYraPE0GsFRvSiClDaedtFk1lm7UfXGb9DpFQtvx5ILT6Dk2P6cckcyrZGhuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HLttMscd
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pycares: bump to version
 4.2.2
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

On Mon, 22 Aug 2022 02:40:47 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pycares/python-pycares.hash | 4 ++--
>  package/python-pycares/python-pycares.mk   | 4 ++--
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
