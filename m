Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DD4C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 492F740474;
	Mon, 18 Dec 2023 08:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 492F740474
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UW3iKgaVDRhP; Mon, 18 Dec 2023 08:16:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49466404E9;
	Mon, 18 Dec 2023 08:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49466404E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50ABC1BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36DE181B23
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36DE181B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jIIhs4BuJNWT for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:16:07 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C55081AF4
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C55081AF4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01129240006;
 Mon, 18 Dec 2023 08:16:03 +0000 (UTC)
Date: Mon, 18 Dec 2023 09:16:03 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231218091603.02ed9ccb@windsurf>
In-Reply-To: <20231204211300.12560-1-bernd@kuhls.net>
References: <20231204211300.12560-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702887364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wv/Aw5mi61MYU7XjkEMQyLhqlM1lupR4LeBVh4bcNLg=;
 b=dK3hm9A97JTjIpOIXCiEAGJzL1eVJ4U9ADWYySGXfbTD4B6n8MLM3sHshQfGDp67oPXA+N
 lGRrpipL9d2OnvCiTqaXSY20P7R/iApyECH/WPDunafoRaMmr8GqPb91QptBNDX9j3ZCp3
 CkEvOuAs/hl6XveyCaq4GwCBA3dss41R5SCVvOOolgm7Wb7wmASbQA0rosrK38iYy/S7Hu
 hrmDuPZGEEtrLMUmYZksLhdf58WGqEoHNXuvkdRLcW1v8v/SE6jWDHbWjKFTiADXREFuqI
 jBigtFfATaGCZ1bWWwfhj394MqK9j7uLJFhWZlqo8U6twldifosIMEEI9Uv4Cw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dK3hm9A9
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: bump version to 1.17.5
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

On Mon,  4 Dec 2023 22:13:00 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://github.com/strukturag/libheif/releases
> 
> Added configure support for new codec plugins introduced in version
> 1.17.0: https://github.com/strukturag/libheif/releases/tag/v1.17.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libheif/libheif.hash |  2 +-
>  package/libheif/libheif.mk   | 30 +++++++++++++++++++++++++++++-
>  2 files changed, 30 insertions(+), 2 deletions(-)

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
