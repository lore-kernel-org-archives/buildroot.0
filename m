Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90B1C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 10:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26E3F416A3;
	Mon, 15 Aug 2022 10:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26E3F416A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 86Ec-oApmPvo; Mon, 15 Aug 2022 10:02:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC8644161C;
	Mon, 15 Aug 2022 10:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC8644161C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96ED61BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E60241581
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E60241581
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BnfR4DuPEKyp for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 10:01:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 205B8415DA
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 205B8415DA
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 10:01:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BA4181BF20A;
 Mon, 15 Aug 2022 10:01:44 +0000 (UTC)
Date: Mon, 15 Aug 2022 12:01:43 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815120143.03fdf52d@windsurf>
In-Reply-To: <20220815095022.297076-1-fontaine.fabrice@gmail.com>
References: <20220815095022.297076-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660557705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyTwaGvf8SoPvC+HSsPHj8+IyleTGEfi2VhFhVXFkaA=;
 b=TgmvW2H/NQ2jQuu9kb1t0p3vu/E0WjVwqyWMKpI3IQyE4xZ0sWV1dgMRgIG1E8ifARfHMw
 xLxdXqprGW5JPWhyKewEx9/voPUsbRswsEBWXqFrcoGgHbvHyYm/lZ2B4PiX0ZhW4K4kpe
 HktRU3BVL/FudUNISx9ZNd/TkHXDZGqmUUWF1mDZAbpCx3KIps0fei/jMQhyfQwa5UboT3
 XNOnWHhwx4W4LyMkcfByPLyNgeSM4+1wRerT5h/RoVJxNOVK15pTD60WAB1ff3YLlPGxMm
 685H7Mx0QzUBvt6tSIQd/IU2lO8mJs3XK+nSCRKGJQMSi/15B5kQiCa+EseGtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TgmvW2H/
Subject: Re: [Buildroot] [PATCH 1/1] package/makedumpfile: add mips64 support
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Aug 2022 11:50:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> mips64 is supported since bump to version 1.6.9 in commit
> cb648d12fa733788cd2ea8e0fa8b00bb95983c4e and
> https://github.com/makedumpfile/makedumpfile/commit/7f185d29aa1794a82a090c748aae2f7bf240fb49
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/makedumpfile/Config.in | 1 +
>  1 file changed, 1 insertion(+)

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
