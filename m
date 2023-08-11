Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFA7C001B0
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 22:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78B8541E83;
	Fri, 11 Aug 2023 22:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78B8541E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SWBw8w1M2HXT; Fri, 11 Aug 2023 22:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81F4F41E81;
	Fri, 11 Aug 2023 22:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81F4F41E81
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EDE51BF5F6
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 22:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4142541E81
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 22:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4142541E81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O0wOFOELfUSj for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 22:23:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90D8141E80
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 22:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90D8141E80
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C328FF802;
 Fri, 11 Aug 2023 22:23:45 +0000 (UTC)
Date: Sat, 12 Aug 2023 00:23:45 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230812002345.660aea04@windsurf>
In-Reply-To: <20230811212220.52d4ffb9@gmx.net>
References: <20230211163422.25944-1-ps.report@gmx.net>
 <20230811000738.0c613b1e@windsurf>
 <20230811212220.52d4ffb9@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691792626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r0WpYjgLhj83GCTop9IzMHLxjJFUZwskP1qYzlQHHFg=;
 b=iHcz/xBKoGQ8WxYsOCITyhXttbojVSnTocB2FwxAv56OBEzk3ZuP4wGiEoep7WmlvFIx2K
 6jkYgYDhn24NcxImYduXkRLEPYrsdTR+FKPJlK7JOQauubWyadQjxTifMeZg52SFPLvKxk
 V5NYvoaX54Z6vwyPxLME6N+RdmKs2PsxqzzvQy+64Xl48NSigM8Iw1HVZSAY7T34fPtxjI
 TZoCy5H57gxSFE85KWY58qa8nlJRKYjpxSVYhAadEPHbZzuOMM41ZYKVftEUKvrWBJ/4wK
 m3tslh8HkSvfWC706AV6DhzNG303cwA25zFXab1R6SOi6dF4wtlGCDnfAyKzwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iHcz/xBK
Subject: Re: [Buildroot] [PATCH v1] package/fft_eval: new package
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

On Fri, 11 Aug 2023 21:22:20 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> > I've use "make install" instead of doing the manual installation here.  
> 
> Looks nicer..., but now the variable FFT_EVAL_TARGETS is unused?

Dammit, indeed. One of us needs to send a follow-up patch :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
