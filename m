Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB4FC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 19:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83A4561386;
	Fri, 16 May 2025 19:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwB8darGJFBw; Fri, 16 May 2025 19:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADB4261373
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADB4261373;
	Fri, 16 May 2025 19:06:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AB1C1F5
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FCCB4188A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_GFaa_uzOWo for <buildroot@buildroot.org>;
 Fri, 16 May 2025 19:06:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56A3E41814
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56A3E41814
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56A3E41814
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:06:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9FF143AD7;
 Fri, 16 May 2025 19:06:26 +0000 (UTC)
Date: Fri, 16 May 2025 21:06:25 +0200
To: Guillaume Chaye <guillaume.chaye@zeetim.com>
Cc: buildroot@buildroot.org, Christopher McCrory <chrismcc@gmail.com>
Message-ID: <20250516210625.00ec043d@windsurf>
In-Reply-To: <20250325134609.610846-1-guillaume.chaye@zeetim.com>
References: <20250325134609.610846-1-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehguhhilhhlrghumhgvrdgthhgrhigvseiivggvthhimhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhto
 heptghhrhhishhmtggtsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747422386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/GbatTKwiKq1XJiUJaevbUHxD7G1xRv2xDFTI8O5LXI=;
 b=oUON3QXvp3AGnqs3bwVTC5d6cC74xFryA9WH4VteMu8yC2rw32pwaiqE1qrqu8aE3SPXH4
 TMk3g7LG38tmQLY2e3ricKYEwRV9Fu+cDjVgdPrJMaepzCruIp0f59owQJwKPnbLwDz05c
 A4jnv3kGMAYKbdBydAkWr5AmXgJ/x09KzyBAFjDCYrH7NhpefhyPQjn1f/7R8RGSyNpiIS
 Qt7613sTUNIqNHFdz13f4vzCJpOW0VOeZ3tdQj+p/C8AZXKxW6LeRa7YK3pqa1rEOfuNg4
 wgmqp0dnFrWWaQnutpLBknhx8LvOWo3u5/HPZzRZPWdA5P4DGahcRjY5Q1nELA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oUON3QXv
Subject: Re: [Buildroot] [PATCH 1/2] package/perl-file-slurp: add host
 package.
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

Hello Guillaume,

Some minor comments for this patch (which I could have fixed locally,
but I have plenty of comments on PATCH 2, so the series will anyway
need a new iteration).

First of all, please make sure version your series, and correctly. You
send v1, v2, v3 (two times), v4, then v6 (no v5) and then here you're
back with no version.

Small detail: don't add a full stop ("point final" in French) at the
end of the commit title.

On Tue, 25 Mar 2025 09:46:08 -0400
Guillaume Chaye <guillaume.chaye@zeetim.com> wrote:

> Some project like efitools requires host version of this package to build properly.

Please wrap your commit message to ~80 columns.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
