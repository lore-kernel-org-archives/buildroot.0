Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5A6C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B43C4097B;
	Mon,  6 Nov 2023 22:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B43C4097B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lzDKT3PdBIvi; Mon,  6 Nov 2023 22:31:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8980F421C1;
	Mon,  6 Nov 2023 22:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8980F421C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3BC61BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFE3A824D4
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFE3A824D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-vv8dq4icHT for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:58 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B69968234E
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B69968234E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FF5D60006;
 Mon,  6 Nov 2023 22:25:55 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:25:02 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232502.3826d139@windsurf>
In-Reply-To: <20231105044928.2821038-1-james.hilliard1@gmail.com>
References: <20231105044928.2821038-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8FOXg5t5jcRGKpellH7O5ltKIpT44Vbi7oa5xNoO5B8=;
 b=iNFFYlchfRWrtQRaB0JJd4Oa2tm1QCaiKapDLlWLDDNF3euK5iSq7vD0nJsYLknI2XYa5t
 nOrfb2TsFzqvCQT+qM7ovTbnst+Iy15AKuVQGI5R0x9lbBBxLmywiP9DOM0tZSgHvdT/0e
 YfuonD0fpFjGeeSY8ymDrlBOhIwZGv1SYBQk5jVe6YrxZ9nGOR5tzfPyhE0WFpmpqTN+xi
 XlxScnsyvJFzYsVTqdTqhglAnY+LWDDEZuTGsqWNLjcUAncyla/thGV8Cms/nJTYJo+zOs
 Od79Hic980hthW20Fbr+J/h2FYavdQf94Pl0eH+eodVMAFkxvEC/9zKtoAnvog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iNFFYlch
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dnspython: bump to
 version 2.4.2
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 22:49:28 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patch which is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...move-spurious-wheel-build-dependency.patch | 29 -------------------
>  .../python-dnspython/python-dnspython.hash    |  4 +--
>  package/python-dnspython/python-dnspython.mk  |  4 +--
>  3 files changed, 4 insertions(+), 33 deletions(-)
>  delete mode 100644 package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch

You had forgotten to drop the patch from .checkpackageignore, so I did
that when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
