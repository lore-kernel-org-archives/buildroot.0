Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18504C0218F
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 08:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB0D2411F8;
	Tue,  4 Feb 2025 08:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pyMCgD_-a5s; Tue,  4 Feb 2025 08:13:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 913BC41245
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 913BC41245;
	Tue,  4 Feb 2025 08:13:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32A9D12A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61B99413CC
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id na1Znzkg1X1O for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 08:13:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EC03A413D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC03A413D2
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC03A413D2
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:13:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53C67443DE;
 Tue,  4 Feb 2025 08:12:59 +0000 (UTC)
Date: Tue, 4 Feb 2025 09:12:58 +0100
To: j12i <j+buildroot-list@maschinengott.de>
Cc: buildroot@buildroot.org
Message-ID: <20250204091258.0e05dc7d@windsurf>
In-Reply-To: <20241122223158.5315-1-j+buildroot-list@maschinengott.de>
References: <20241122223158.5315-1-j+buildroot-list@maschinengott.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehjodgsuhhilhgurhhoohhtqdhlihhsthesmhgrshgthhhinhgvnhhgohhtthdruggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738656779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lk6IUMNtUDCCNwSAVtIyGDHemDVq0ReJkhvpA8E2CLE=;
 b=m1BtzZkhWFg599lrUjKjocx10hxMznZX2VPkg5EPK5MdvkRVFnRHAtxLZAFpwbhXXsKJcJ
 6y3OBX2suec5evZ2QpUsZ5SoPh5VQI539eVx4LUKJ2dMszMm+J6Tfvi3NTgBXLJfLQ+Ma+
 xvb7IbcVk56yqDH9u3dcyTYWSrSFCIY65JesgH4JDS1Cub1Hs8OjzkraQjOauS17LzeTSa
 WrmnOR4DE/xOX8awDV337H9Cp5jn+ClAkbzuGcM+Kdmp7tIjUHKhHP9vSzJJOIb/lEOIwY
 VGoll67ddCXV1cbdrQ3LtwzyQjqV+LF3tkuCDEIIDE/4OBhgi8G2IH4dltEdyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m1BtzZkh
Subject: Re: [Buildroot] [PATCH] Documentation patch with some small things
 that threw me off as a newcomer to the project.
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

On Fri, 22 Nov 2024 23:31:58 +0100
j12i <j+buildroot-list@maschinengott.de> wrote:

> From: j12i <j+buildroot@maschinengott.de>
> 
> This is my first contribution to this project and at the same time my first time using git send-email. Please tell me if I'm doing it wrong, but don't get angry at me.
> 
> This results from a conversation I had on IRC today with xogium.
> 
> The change in docs/manual/getting.adoc is in reference to the following section in docs/manual/contribute.adoc:
> 
> > Refer to Chapter 3, Getting Buildroot for more information on obtaining a Buildroot git tree.  

Thanks a lot for your patch! Your proposed changes look sensible and
relevant. They may require a few tweaks when being applied, but overall
most likely they make sense.

However, in order for your patch to be applicable, we need:

- It to be sent with your real name

- It to have your Signed-off-by line

Could you check this and send a new iteration?

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
