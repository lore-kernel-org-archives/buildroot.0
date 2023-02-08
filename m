Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D234C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 08:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49B4A80AE0;
	Wed,  8 Feb 2023 08:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49B4A80AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MJ1S8S5hAPXX; Wed,  8 Feb 2023 08:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 414F281F72;
	Wed,  8 Feb 2023 08:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 414F281F72
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFD641BF5EA
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 08:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9988661059
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 08:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9988661059
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ud4jpgud5jEn for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 08:58:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5779A6101F
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5779A6101F
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 08:58:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 13BB924000F;
 Wed,  8 Feb 2023 08:58:18 +0000 (UTC)
Date: Wed, 8 Feb 2023 09:58:18 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230208095818.7917593e@windsurf>
In-Reply-To: <20230130174339.36794-5-bernd.kuhls@t-online.de>
References: <20230130174339.36794-1-bernd.kuhls@t-online.de>
 <20230130174339.36794-5-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675846699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z2XVi+CgCPBjTXWUNkedbe4ONKTimE5Lpr0XT6S+7Bw=;
 b=NpR8bGmyXLq+Eba/QYvLrYBR4pSpW08QBmlXai7ZOaLfVIhfR59W2Wd1oImzlF20cUTaXA
 cIIXkg/qKjj7BWbDpksWGk/Tqj1GEqDFUBL7r18wv0lY64vYWNJQqEZQ/CKOXBpT4ikTqI
 7Uvzsr+f/ocizPOyPGdI7QKithifXp8QS+FRYFxs6vdP/LspyVYZcWn+bkGYj+ffBrILlP
 CoG6QeNOxFE8yGGFztB4hdQlVE89X+sSWglJUqbdUJwcN2f4LlRJYAvUa74dv16YUNifU6
 OWz+WFn1vE9gqc/h3oPcwPh/cD0KjsCa3woHEMLrpBPzBO2+RJRqSHkueGmyIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NpR8bGmy
Subject: Re: [Buildroot] [PATCH 5/5] package/intel-mediasdk: bump version to
 23.1.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 Jan 2023 18:43:39 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/intel-mediasdk/intel-mediasdk.hash | 2 +-
>  package/intel-mediasdk/intel-mediasdk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Github has fixed their tarball generation logic so that the hashes are
now correct again, so I've applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
