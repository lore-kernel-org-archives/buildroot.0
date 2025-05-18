Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0DCC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2281560E69;
	Sun, 18 May 2025 14:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lWni4bHJi154; Sun, 18 May 2025 14:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5379460E78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5379460E78;
	Sun, 18 May 2025 14:47:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1812A204
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22048403F3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9aLNSJhIHgfs for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:47:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B7DBA403FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7DBA403FC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7DBA403FC
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF6DF431EB;
 Sun, 18 May 2025 14:47:09 +0000 (UTC)
Date: Sun, 18 May 2025 16:47:09 +0200
To: Tom Wambold <tom5760@gmail.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Message-ID: <20250518164709.72083fe6@windsurf>
In-Reply-To: <20250518141452.4f6ea693@windsurf>
References: <20250314154252.10248-1-tom5760@gmail.com>
 <20250331153438.4103-1-tom5760@gmail.com>
 <20250518141452.4f6ea693@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudekjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehtohhmheejiedtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegthhhrihhsthhir
 ghnsegrphgvrhhtuhhrvgdruhhspdhrtghpthhtohepthhhohhmrghsrdhpvghrrghlvgesmhhinhgurdgsvg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747579630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SjFl7Be/pyUc911NDppr+xh/6k6Hdi2PpzoHe3mYlPs=;
 b=ltHNDwzcXmOz7F7WLatc+MAaMCrnO089lNsdoty9X89xDWhdRj/dWwxBHMIm5RfaaNc1Di
 1wfU9pQuYGVKqG2bqHgEITu6bseWDvLdbUgKc0Iuh617Yi4emeRdJJXTiVtd/xD9xjkDDD
 dhOCyE9EKplw8U0jEVa7s8m22uEQDZkwD7E8umhPFWp33R19GeYkypiN/PnmDOVZ5HkRwo
 ZlYIzuAdAjJrsgtVYyDoK3z4fr7LXcGhAYAgEtKIKfqKI3mJZrakiNGSTrHoCk7k/55DNY
 fNVvy0aKW+r3ymILdA99z7vIHfnE2GxFU799H6wIMROC2epFxR+zLbQ/8DEbYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ltHNDwzc
Subject: Re: [Buildroot] [PATCH v2] package/go: go-bin host-go provider
 implies target support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 18 May 2025 14:14:52 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> This basically extends the thing to say: "In order to build Go packages
> for the target, we need:
> 
> 1. A compiler that runs on our host: either bootstrapped, or pre-compiled (go-bin)
> 
> 2. A target architecture that's supported
> "
> 
> Tom, Christian, what do you think?

FYI, I tried my proposal, and it does work: I was able to build a Go
package (tinifier) for the ARM architecture, on an ARM64 host (on which
bootstrapping Go is not possible).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
