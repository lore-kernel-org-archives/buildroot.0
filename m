Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54107C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 07:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDB2E83A93;
	Thu, 14 Dec 2023 07:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDB2E83A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCEM67lpiomZ; Thu, 14 Dec 2023 07:41:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3668F83BD5;
	Thu, 14 Dec 2023 07:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3668F83BD5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D893F1BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 07:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A74EE42036
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 07:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A74EE42036
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Avv-Wk0qFs1R for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 07:41:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45E4F42029
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 07:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45E4F42029
Received: by mail.gandi.net (Postfix) with ESMTPSA id E50E740006;
 Thu, 14 Dec 2023 07:41:17 +0000 (UTC)
Date: Thu, 14 Dec 2023 08:41:16 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20231214084116.48e04ecf@windsurf>
In-Reply-To: <5EB6E748-BA27-414C-9AB0-434429B724BF@amd.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
 <20231213232854.5242117f@windsurf>
 <5EB6E748-BA27-414C-9AB0-434429B724BF@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702539678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNclw0BCmQK322TN8LSa60wViXnXfuUQQziuxYFGWz0=;
 b=G7Mvv3pFpDNkFbqYqrFGElbrzP3sR5RxLlfd28JeLEIcStysW8BzkLBQ8HwYzSiyh/Woh7
 nK8Wds+YDWv/aKaP3tq/OImWi7+lK0u09Wjt7CsueSp8Ui9/NrHY6p+4+B7YOejuATH1mv
 wGBlLnDh5XoaREhLk6wSiJM+8UFDe4+15GWaGxZauCVEf3iIwWHIh6KKMPKFH4W2DaG9Fl
 6rqyv7/Yq8L+WbHQcYI/SrV1AxwhLYQCs+uMjDrJOgwRYkVxlIiR0jBEEsB4YFcnEr0nbZ
 zBKbDaEkMcA9Xv7WSE1K2w6zLsbMdc3ETNVoN6hTzsADLgPkcFYNFviMWBDaLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G7Mvv3pF
Subject: Re: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
 package
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 14 Dec 2023 05:29:47 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Thank you for your research.  I had not looked into how to fix
> newlib, so that it installs to the correct place to begin with.
> 
> From my side, I think patching newlib is clearly better because we
> can try to upstream the patch to newlib.  Once upstream, no patch or
> fix up hack will be needed anymore when we bump to a newer newlib
> version.
> 
> I will test this patch with your branch as well to verify that we can
> remove my fix up post installation hack.  If this patch works, I
> propose going with the patch.

Well, the thing is that there is probably a reason why upstream does
not install headers/libs in the standard location and decides to go
with this custom tooldir thing. So I'm really not sure changing this
will be upstreamable. Or perhaps by making it configurable, so that it
can be overridden using a ./configure option?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
