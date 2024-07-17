Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87C9C3DA60
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 18:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 557F5606A2;
	Wed, 17 Jul 2024 18:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9bkQrXTfdLw2; Wed, 17 Jul 2024 18:09:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48B6E6063F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48B6E6063F;
	Wed, 17 Jul 2024 18:09:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A08D31BF36A
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 18:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BC978139F
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 18:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erQw1edVkjFu for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 18:09:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A9BD81248
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A9BD81248
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A9BD81248
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 18:09:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC627C0006;
 Wed, 17 Jul 2024 18:09:27 +0000 (UTC)
Date: Wed, 17 Jul 2024 20:09:26 +0200
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Message-ID: <20240717200926.1a7db2a1@windsurf>
In-Reply-To: <1c6eafa2-3d8c-4716-bafb-df6a47aa8751@mind.be>
References: <CACXRmJhGiYC3tN9+0hPhMsvO-DzvqTMPOB1HufaBzYszoT5eTg@mail.gmail.com>
 <20240207193123.3400214-1-thomas@devoogdt.com>
 <1c6eafa2-3d8c-4716-bafb-df6a47aa8751@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721239768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9Rtn2pEWWK5jBnigEVk2nCi8lOxD9MezVJptueR94k=;
 b=nAXmZElOmby/gS00NOXhWtSA6sj5ZYakb1V0JK4QvXUP1EaEi2SbMjHEqO/ib7LzHxVJ+T
 QcjKjsf+qGK9Mmb5HFmaMtOOVAG4HStCOM5uV7zAdVrvVCj3yVQg0YfoVuLzRnFKfzURs9
 51IX3SqEmKae4NDZMpLPpZoIeTUnWDSY5TKCEw9tM+hlf9VQbpJZgzXWQythx7duS0V8jI
 itzbgMAcIDqRRgol3s2FNFVqyE3p5nRcF97xcczBi5tWcLjGMyBM1zKy5nG8KVGxoD+Sua
 lWlJbghQ+4UfmOwIX28YkyIA+uUU9TJvDG2dI0pHWjuF3OSW7jK2fp27HudZfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nAXmZElO
Subject: Re: [Buildroot] [PATCH v9 1/2] package/cairo: move to the meson
 build system
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
Cc: eric.le.bihan.dev@free.fr, Thomas Devoogdt <thomas@devoogdt.com>,
 fontaine.fabrice@gmail.com, aperez@igalia.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 15 Jul 2024 00:07:11 +0200
Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:

> > - Added two patches to fix cross compiling, upstream: [3]
> > 
> > [1]: https://gitlab.freedesktop.org/cairo/cairo/-/commit/596a82f2d185b101bd74645492821fe2f9e0daa0
> > [2]: https://gitlab.freedesktop.org/cairo/cairo/-/blame/1.17.4/meson.build#L277
> > [3]: https://gitlab.freedesktop.org/cairo/cairo/-/merge_requests/534
> > 
> > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>  
> 
>   Both applied to master, thanks.

This switch to Meson, or the bump to 1.18.0 is causing a huge amount of
build failures in our autobuilders:

  http://autobuild.buildroot.net/?reason=cairo-1.18.0

Would it be possible to have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
