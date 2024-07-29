Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E61BC3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 20:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 446A5607FF;
	Mon, 29 Jul 2024 20:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxFksvBY6Fga; Mon, 29 Jul 2024 20:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65C0E60860
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65C0E60860;
	Mon, 29 Jul 2024 20:10:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77F0B1BF427
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 20:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7256660860
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 20:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VZ29Lx4qo8R for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 20:10:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51C81607FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51C81607FF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51C81607FF
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 20:10:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59FFB40007;
 Mon, 29 Jul 2024 20:10:53 +0000 (UTC)
Date: Mon, 29 Jul 2024 22:10:51 +0200
To: Christian Stewart <christian@aperture.us>
Message-ID: <20240729221051.2e84f11f@windsurf>
In-Reply-To: <CA+h8R2rym0T+bcy3mUUSXKxwYtNH7KuTV0oUV-7PdCQdA6L5jQ@mail.gmail.com>
References: <20240727202340.1484781-1-james.hilliard1@gmail.com>
 <20240729203325.3560903e@windsurf>
 <CA+h8R2rym0T+bcy3mUUSXKxwYtNH7KuTV0oUV-7PdCQdA6L5jQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722283853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BLdipe7ueFBWoYv+y8H2V73GvpOt3Ytj621hmtSxFPU=;
 b=f2KfFSrbWLRVrgYtzid7C9D6wSIiT0VVwO1OdacVAXrE6YCQKnzueNycuYHfdl8tkxDLVV
 zgEuzhn/ZqgkmWoId/fceyKsdIyBkvTYVgscDLxSIxgemB/Rgvtrfj43flv/BNurvLZrv+
 XkEX2lv3x4TbWToRPMKD0tIA2OBghnSU5HfdjubO7AApxsQQLasYexxjeewX4c5CoSGGfU
 lTq5VyFQZfmMkc6YypKaWYkMWvihvlwWd5SZoDOhlmmjJQJ0KVKP3GO9QZFkEUImnnQFhG
 t4enikppAv+asIjZyqQy4lAeIQLdswPx05W+WNzTALJJi2YCdLxUrolUPwqLuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f2KfFSrb
Subject: Re: [Buildroot] [PATCH v3 1/1] package/tailscale: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 29 Jul 2024 12:26:46 -0700
Christian Stewart <christian@aperture.us> wrote:

> This was solved already on Tailscale master branch:
> 
> https://github.com/tailscale/tailscale/issues/12859#issuecomment-2239157563
> 
> It was fixed in this commit:
> 
> https://github.com/tailscale/tailscale/commit/0f57b9340b1449de811a9dacd098a769192c4344

Thanks for having looked into this!

> I don't see a release yet with this commit. We could either take the
> latest master commit hash for now or apply a patch with this commit.

I think applying a patch doesn't work because this error happens during
the vendoring step, which is part of the download step, and is
therefore *before* we apply any patches.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
