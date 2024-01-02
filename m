Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0C8C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2586D40A66;
	Tue,  2 Jan 2024 22:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2586D40A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3lt_OKXq2JfX; Tue,  2 Jan 2024 22:21:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3151340A78;
	Tue,  2 Jan 2024 22:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3151340A78
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CFCF91BF276
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC2AA416D3
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC2AA416D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g557nGEy4lwn for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:20:22 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76B05416CC
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76B05416CC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78C5CC0003;
 Tue,  2 Jan 2024 22:20:19 +0000 (UTC)
Date: Tue, 2 Jan 2024 23:20:18 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102232018.7acb62ec@windsurf>
In-Reply-To: <20240102215746.2334141-1-fontaine.fabrice@gmail.com>
References: <20240102215746.2334141-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704234019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obyHGu53Ald34RTclaNaFFUwmKH5IhF9ZbQXsTZcMro=;
 b=oj9OV0GV0tcDTV/+k2vNDQriV7Ncj8hbHQEU6Dd+Tr7SdBH3uFEUDosd5klPX+AgvuE3Oe
 6DXsuB5gezxB94KWQ8gHJLP6xj2jbBDm8m7mcktBGtL5I2yz8mv7DL2VRdHvIEOW2b9/Nq
 L+hkFdiuRhbnvaZ7oQSS7v3WvdHpLc6cHLGhvxPfEHhBDA9qcI10Wt6Knx+hnM+br+iot1
 M8f6WS7HMe4Z1rPkMHaQMjNnoakTWl8R69/rYsCy2WxuSCNDDGTPWHYJhJdXYMADqPFt2H
 bPO/kxGt+H5EJW9coC30ZXheoEizCo5K6sgWKe3pSErUbueNCVvGNgcyJ6sdMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oj9OV0GV
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf: bump to version 2.1.9
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

On Tue,  2 Jan 2024 22:57:46 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update site to use https instead of http because of HSTS
> - Drop patch (already in version)
> 
> https://sourceforge.net/projects/iperf2/files/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  ...fix-single-threaded-compile-breakage.patch | 32 -------------------
>  package/iperf/iperf.hash                      |  4 +--
>  package/iperf/iperf.mk                        |  4 +--
>  4 files changed, 4 insertions(+), 37 deletions(-)
>  delete mode 100644 package/iperf/0001-fix-single-threaded-compile-breakage.patch

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
