Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486A4C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C87B481406;
	Mon,  7 Nov 2022 22:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C87B481406
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SqerTrm5Apf1; Mon,  7 Nov 2022 22:06:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06EC3813C4;
	Mon,  7 Nov 2022 22:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06EC3813C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06D941BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C283760BE7
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C283760BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0n7YuxOOSOJh for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:05:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ED6560B78
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0ED6560B78
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:05:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0F9AC1BF208;
 Mon,  7 Nov 2022 22:05:52 +0000 (UTC)
Date: Mon, 7 Nov 2022 23:05:52 +0100
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20221107230552.04be0058@windsurf>
In-Reply-To: <20221107100527.2772772-1-br015@umbiko.net>
References: <20221107100527.2772772-1-br015@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667858753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ECTxsHMVVLH3IPMqe0dI19al6DZU7ygYACY5jF6Ozds=;
 b=RVb1YRH5MsdQRPTsvo6nQI90a37T5vWmQnLfc573JsyMee5G94tqFvREC679kY7+Hh+nMH
 AH5PYi65Hzvk0Hf0WyWCl9t0zSHP/uSJDi5qpDQwpSkXdhIBJzuWBiSlKzXJcH99wKrPTU
 TPHg0t8kUZnchBO4iVOcNX51F8/XYA6XskBIesui/ZtJ/yboJhxTRSFKsnHD/Y/JPqWajL
 TVHgfJFIiHVhOhzBYeJB7CUn5X2EcS9TMpx2dfnQ8fQv0txZHjSNoZfDZT2McM1xLUxrBu
 C4OjvqkyhsLVdSVNzmEXp7EsYT+H2dWx8IjdQQunPmWh/e50f5nkUl4guRgWbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RVb1YRH5
Subject: Re: [Buildroot] [PATCH] package/boost: backport development branch
 changes to fix MIPS64 build failure
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  7 Nov 2022 11:05:27 +0100
Andreas Ziegler <br015@umbiko.net> wrote:

> Backport from Boost/intrusive development branch. Fixes issue introduced with 
> version 1.80.
> 
> Issue: https://github.com/boostorg/intrusive/issues/79
> Fixes: http://autobuild.buildroot.net/results/6cb/6cbc0672f3c5046405793d8cdc8f961d2ffb1d3e
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
>  .../0001-Improve-modfunc-performance.patch    | 550 ++++++++++++++++++
>  1 file changed, 550 insertions(+)
>  create mode 100644 package/boost/0001-Improve-modfunc-performance.patch

I've added a link to the upstream commit within the patch itself, and
applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
