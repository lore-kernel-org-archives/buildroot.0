Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C70C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 17:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84B0B81CE3;
	Sun, 24 Dec 2023 17:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84B0B81CE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMMQRhHG-zF9; Sun, 24 Dec 2023 17:54:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCC0381D73;
	Sun, 24 Dec 2023 17:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCC0381D73
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C69AF1BF398
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90FA740481
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90FA740481
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LlG5HLEZ0sfV for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 17:54:05 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1151C40018
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 17:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1151C40018
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78591E0004;
 Sun, 24 Dec 2023 17:54:01 +0000 (UTC)
Date: Sun, 24 Dec 2023 18:54:00 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231224185400.20a5427d@windsurf>
In-Reply-To: <20231224081512.19928-2-bernd@kuhls.net>
References: <20231224081512.19928-1-bernd@kuhls.net>
 <20231224081512.19928-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703440441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wODF78YpUKL5AlfnGw8XxJiYcVxjA1Quun8e13v+Mt4=;
 b=NOs/yEZE62kSUFuyoSInIBbTlTe2C5EM4CNm7kcBjA5i0KIyz9BE1oND4zKPrO7SL7Vo2d
 14W+s3zYjQ66YGI65dVv0PBPlYAJgfYwBiUobrDOoFXLB2JGr/hSNY30GVB+PZBZM7D0Vx
 gRPtVQp7S9xIt7fIvt+SlC9/PuqSK6dmD7fIDynF9ND1H50c2Iv8am1Y/yIS/NwLZ8Z/iE
 ZkvrwvFd41AYNNn6NZLXHw0F0GZnrR7qdS+N5aKsZksZkCBKTw3Popnu3/NCmyMztn34zV
 YPUT1OJ+pLULkjdngZVCoUN8ZzbhMqqkGHEMeTXF++azIPQKQr3GLiXXhnAXhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NOs/yEZE
Subject: Re: [Buildroot] [PATCH 2/3] package/apache: fix build with
 libxml2-2.12
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Dec 2023 09:15:11 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...emove-dependency-on-xmlstring-header.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/apache/0004-mod_xml2enc-remove-dependency-on-xmlstring-header.patch

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
