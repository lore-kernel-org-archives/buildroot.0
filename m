Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809B5C04FFE
	for <buildroot@archiver.kernel.org>; Mon, 20 May 2024 09:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24093401A1;
	Mon, 20 May 2024 09:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEtn4_gI6rj9; Mon, 20 May 2024 09:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB639401B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB639401B5;
	Mon, 20 May 2024 09:23:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1841D1C4820
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 09:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 052B740AE5
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 09:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id We0RTzfA10Hq for <buildroot@lists.busybox.net>;
 Mon, 20 May 2024 09:23:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77FD2400F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77FD2400F2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77FD2400F2
 for <buildroot@buildroot.org>; Mon, 20 May 2024 09:23:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50F5D240006;
 Mon, 20 May 2024 09:23:37 +0000 (UTC)
Date: Mon, 20 May 2024 11:23:36 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240520112336.7431520d@windsurf>
In-Reply-To: <CABGWkvqz7-bnCJ6JBjp3rpbeSnDEZw55jNNHOmpbyGA772xDvA@mail.gmail.com>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240510215442.3475120a@windsurf>
 <CABGWkvqz7-bnCJ6JBjp3rpbeSnDEZw55jNNHOmpbyGA772xDvA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1716197018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dU8Kv7igI1fOiijpgtqpLUJOnYKHZFxqH6TueOjfx1s=;
 b=e0kWarKUpCMTktGhFuMid4iB2u4qXTiikOA6CHd1xKAfJVvoLJ1HvZy8czWOkm9c7r/zNF
 ThOFPkAvzeY81gOKFKqQeF80OjeoBG0ws9He0ZRA1MIXSOvauKqfJfE4yZ2XmmqLdPoeWF
 SgIjl3aWaVc0glyVLk7xtRV+N5Ehu16t3Q/6somXvyzjOQ04Hn6sobv2KNzMWJYbSdyjH8
 VeKzcxf9eod4LY8eMJv+V2HxLYH2hFxpqzoldyeqoBeG8w5lQBn/7OH/ZEr/itTDIS0TSJ
 uoCq55ODgZACfa6WSEXR5Y5oA1OXVWF4NCR8PhkJXR24NtNLfajDpSycdc7rbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e0kWarKU
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: quentin.schulz@theobroma-systems.com, Xuanhao Shi <X15000177@gmail.com>,
 Gero =?UTF-8?B?U2Nod8Okcmlja2U=?= <gero.schwaericke@grandcentrix.net>,
 buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, "Yann E.
 MORIN" <yann.morin.1998@free.fr>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

[ Your e-mail client configuration seems somewhat broken, your lines
  are badly wrapped ]

On Mon, 20 May 2024 10:05:34 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> > Now the question is how to do this. To me your proposal looks
> > reasonable, though some people had the feedback that bmap-tools will
> > not work in all cases (should we then gracefully handle this failure
> > case?).  
> 
> If I understand correctly, the first patch in the series seems
> reasonable to Gero as well.
> Therefore, both of you are in favor of merging this patch. The issue
> arises for Gero
> regarding the application of the second patch, which I added only as
> an example use case.
> I think merging the first patch would give the opportunity to use
> bmaptool and realize its
> usefulness. After all, the patch is backward compatible. Its use could
> then lead to subsequent
> improvements.
> 
> Regarding the second patch, I then ask you: Is it correct not to
> proceed with merging this
> patch for the reason mentioned by Gero (i.e., encrypted directory)? It
> seems to me that
> bmaptool is used in Yocto, so is it correct to say that you would have
> the same problem
> with Yocto? I hope, Gero, you do not misunderstand me.

Yes, the first patch is reasonable, but if we can't apply something
like the second patch, then it might mean that the approach taken in
the first patch isn't correct. Indeed, if we can't enable by default
the generation of bmap-capable images in defconfigs, it kind of limits
the usefulness of this bmap-tool integration.

I was hoping for the other BR maintainers to chime in with some opinion.

Do we have a way to detect that the bmap-tool generation will fail, and
in this case gracefully skip the bmap-tool logic?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
