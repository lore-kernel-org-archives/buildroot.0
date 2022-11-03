Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13041C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A153C81F87;
	Thu,  3 Nov 2022 19:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A153C81F87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UxPZLGzYgSq6; Thu,  3 Nov 2022 19:59:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E734381F7D;
	Thu,  3 Nov 2022 19:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E734381F7D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1059D1BF294
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E040781F81
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E040781F81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yTXquARTJb17 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:59:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A360081F0E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A360081F0E
 for <buildroot@busybox.net>; Thu,  3 Nov 2022 19:59:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0B406FF80E;
 Thu,  3 Nov 2022 19:59:10 +0000 (UTC)
Date: Thu, 3 Nov 2022 20:59:09 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221103205909.23de96c7@windsurf>
In-Reply-To: <20221102071957.1493594-1-francois.perrad@gadz.org>
References: <20221102071957.1493594-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667505551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qH5lBjwePd2DG27Rw/V4neXH12FRE7SNaVXtOFUFzPA=;
 b=G8sHvkePwDokCNTh0TC4gDVhfBfwexb4kYGqx1yoK/ji0ynupcaXdn1OyzmCYNJKVIhgpU
 pr7SwecjRQaR/6GiGjPsfKRowsZLUfLmFBiIBRDIl1vnvdyFPbtTgF10x7Itsjit8daG6R
 B4vfA9T+vtvwJRMFk1sfbrW6K4VR1ujrSNSU12svTR6chE/CLvylEiD/+7VNQ/FrgEEQ8h
 Yw9S7JiodOmz27bPwHMdUs6oAKtvi/QIOq+aeC+NFqTYEu0W+hxDLZ147kB7knnY/yCr3P
 +Q1eLQWjNw35aFkYfDIfy88hUR/UpyDF9D3vuIO3kXZaU77zLfIFIZpL5KuFKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G8sHvkeP
Subject: Re: [Buildroot] [PATCH] package/moarvm: bump to version 2022.07
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  2 Nov 2022 08:19:57 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/moarvm/moarvm.hash | 2 +-
>  package/moarvm/moarvm.mk   | 2 +-
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
