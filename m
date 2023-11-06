Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AA8C4167D
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABF7B61249;
	Mon,  6 Nov 2023 19:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABF7B61249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7acCj0ebkF6J; Mon,  6 Nov 2023 19:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4E7C6126A;
	Mon,  6 Nov 2023 19:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4E7C6126A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C09E71BF3A1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B6F38216F
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B6F38216F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8zfouHSTUnwt for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:36:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57DAE8214B
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57DAE8214B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 704DAFF803;
 Mon,  6 Nov 2023 19:36:07 +0000 (UTC)
Date: Mon, 6 Nov 2023 20:36:06 +0100
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20231106203606.2427ac30@windsurf>
In-Reply-To: <20231106071131.1207382-1-marcus.folkesson@gmail.com>
References: <20231106071131.1207382-1-marcus.folkesson@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699299367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAoykn1KMWDivdyXNuD22i2Dyu01AZqmJS01TKyHVog=;
 b=XRt4MELHnKD6hN0pq+zf+KoVaS3/dYcLczqmPfczgw73C2f6bCYwG2UzzJ4v+VaK/Uu/P5
 IWZPc6kM3q0kRGJOlnj69t3A+Z0omAiccL+SxihxctpT6Sh4i+mDnb2QY0Bvk0qK2HXO2P
 s1dKnkOBFZZrsud2pvxzhBpgnOYbzcM63eJrjB2xJHUMcVqUHx7z/3RxGWSUB/rt4bvplK
 aefGRxrYpYMYuASags+qE4EXFFys2gK6tKGOetiSsyyoGrdfWzCklwV4KJy4GvGMfhCemc
 tVlFpUBGHJBk7dEkHNu6xb6htLQrMCBK9DdVsk64LWWK6TO+0ZbZVqk9hpkCEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XRt4MELH
Subject: Re: [Buildroot] [PATCH] package/libostree: bump to version 2023.7
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

On Mon,  6 Nov 2023 08:11:31 +0100
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libostree/libostree.hash | 2 +-
>  package/libostree/libostree.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
