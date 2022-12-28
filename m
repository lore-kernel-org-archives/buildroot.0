Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E359C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 10:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9793F81002;
	Wed, 28 Dec 2022 10:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9793F81002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PQxtKBAIxaEw; Wed, 28 Dec 2022 10:05:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C95BC812FB;
	Wed, 28 Dec 2022 10:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C95BC812FB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD3F21BF380
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 10:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9786380F50
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 10:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9786380F50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ea1Mozj25aaZ for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 10:05:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52E7B8131A
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52E7B8131A
 for <buildroot@busybox.net>; Wed, 28 Dec 2022 10:05:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0D3B1C0008;
 Wed, 28 Dec 2022 10:05:07 +0000 (UTC)
Date: Wed, 28 Dec 2022 11:05:07 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221228110507.5b3dcda0@windsurf>
In-Reply-To: <20221221104607.3430116-1-francois.perrad@gadz.org>
References: <20221221104607.3430116-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672221908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oBlsLHkPRQe3GAG34rWGrkJ0RnJrkPwQb/7asA6OYIw=;
 b=e7xc2St2znYfnNElYLYJsEtSzObPxUSBfO2NcKRAliPJZDe5qundla0NRxD/XVDxr8xd6A
 +VTzwJsr/qa/LL7wKuQyGKsQmiCAJ7UdxyeMi1V+rlc/ULuvtWaGabu5VZ8W4iLyEsnA0Y
 FDC10/2j/qMe2NcyTSDfRxGbXc7jrkxStum7cv8lg7SgNa14WLvG8k8rZv9iqHYDg2m4gT
 y61hgj6sw1ckQQ8/65HYgb81UevZ6rTYpBWZM1sSOnZyI8EnW00WjSHJ/H5ETvU9Y6qMOL
 PTr+4YhMNwIe47CdLa8lWyMTwxUad+W3YtUDoxlut3iP1oaPQExO6qZoau0iMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e7xc2St2
Subject: Re: [Buildroot] [PATCH] package/lua-cqueues: disable with libressl
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

On Wed, 21 Dec 2022 11:46:07 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Building with libressl fails,
> see http://autobuild.buildroot.net/results/032/032d6c9bf84b0d4e50d3c27f37b71c0564c52312/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-cqueues/Config.in | 1 +
>  1 file changed, 1 insertion(+)

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
