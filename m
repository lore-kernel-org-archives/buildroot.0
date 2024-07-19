Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AF4C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 07:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D0C14022B;
	Fri, 19 Jul 2024 07:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pUb-LsBp8txA; Fri, 19 Jul 2024 07:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2282040413
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2282040413;
	Fri, 19 Jul 2024 07:27:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5ACB71BF575
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 07:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4448081FBA
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 07:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53vEgf-TDDay for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 07:27:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2502A81FB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2502A81FB7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2502A81FB7
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 07:27:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C61520004;
 Fri, 19 Jul 2024 07:27:44 +0000 (UTC)
Date: Fri, 19 Jul 2024 09:27:43 +0200
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Message-ID: <20240719092743.3933eba5@windsurf>
In-Reply-To: <84d8e2b1a0be113655ef7b8fff876a141128b42c.camel@wdc.com>
References: <20240402035140.71770-2-wilfred.mallawa@wdc.com>
 <20240712235449.766c2931@windsurf>
 <84d8e2b1a0be113655ef7b8fff876a141128b42c.camel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721374065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzXddQATDMGWoOG22UjCfSVQXLMqXkCO5+xBzSsLuKQ=;
 b=fjXJ5TtBgZlszkHE4J5tt1gADqm4y1PEMYLldWjcafDT5N3aQQwAb0HGHoivbkKXYEt0nf
 Nf0V0Bvz52G5WK5ASJqsnq+k0nBhWhEdpvceH7k34ElRuzfkrAccr8IP1U7KHhLL9NoGpn
 NcglhvzagGwjx36/DhlRXKygazyIaqEgEnwB/rPGPA3bYuYf2NV8rbBNUQuWW4NJmHZ3Qv
 xr4q40ff5CvehR13+sF+1+u5Gdh9S/6S52Uau3NqEXVlD2alBjigiZVTfZyHaeqqBGyVy3
 lXlpfbefPeW+i3gd0yukMa4c6mhNNQRVllbLccl4Bg6Uu3rGG+KShi/YLil1Gw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fjXJ5TtB
Subject: Re: [Buildroot] [PATCH v2 1/1] package/spdm-utils: new package
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Wilfred,

On Fri, 19 Jul 2024 07:04:44 +0000
Wilfred Mallawa <wilfred.mallawa@wdc.com> wrote:

> `spdm-utils` uses the `bindgen` crate, that required clang. Which I
> believe is likely where this is coming from. I added it as a dependency
> in V3. Which should fix this issue, however, I was not able to locally
> reproduce it. Unsure why, I tried doing a minimal build with the config
> you suggested... it still worked (odd!). Perhaps it was somehow being
> pulled in as a dependency to another package. Let me know your thoughts
> on the V3 changes.

Possibly because you have clang installed on your host system. In order
to isolate yourself for such issues, use the ./utils/docker-run helper
to do your build in a minimal Docker container:

$ make clean
$ ./utils/docker-run make menuconfig
...
$ ./utils/docker-run make

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
