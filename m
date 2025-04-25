Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C93C369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 09:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C75B2406AE;
	Fri, 25 Apr 2025 09:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIrCopoWNzs9; Fri, 25 Apr 2025 09:17:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E370406C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E370406C3;
	Fri, 25 Apr 2025 09:17:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C44DC1
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 09:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 596EB406AE
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 09:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CvOSoqQziZH for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 09:17:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A57E406AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A57E406AD
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A57E406AD
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 09:17:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 423B2433D6;
 Fri, 25 Apr 2025 09:17:00 +0000 (UTC)
Date: Fri, 25 Apr 2025 11:16:59 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20250425111659.79226dc2@windsurf>
In-Reply-To: <87ldro64wx.fsf@dell.be.48ers.dk>
References: <20250423203112.3C82586270@busybox.osuosl.org>
 <87ldro64wx.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheduleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745572620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h1Bh0fW9Wkbyj1lR3OclDYatuGutENtU/czFdk35ZeE=;
 b=Vsve0v9Qg6x5zg3bW8HkCHw1fqf4h7YGw9/YxEiDzjPKch+oqPpLSL5F4YDvv3MU/rFxcR
 ZFXDF6Ervz8wkcyoTkk+tgPe2Ss2yVadxy/Un84uNeEB0JdR7Htpxg0IDHPAsQuUISdkLz
 PuvK6OZXrjWkQ8hOL8JzEikDmhXiMHV7M98lz8zDiU0ZdPO1TDnp0s4p3S8T5iLMx5f4dD
 2W5dQG/UMMgewSSVt4wRl5JT6Di/lY8YHAwP7usq9GGqI6oCA2QTyEosiJD5UuocIKr9xO
 ATJMToYIoE9dyIAqwUX2/ycGKSTIbUlu6ApOToyFDrTXafaCCDT+sZHJqrnv4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Vsve0v9Q
Subject: Re: [Buildroot] [git commit] package/sane-airscan: new package
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

On Fri, 25 Apr 2025 10:06:54 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > +N:	Guillaume Chaye
>  > +F:	package/sane-airscan/  
> 
> Email address is missing. I've fixed that now.

Thanks for having paid attention (and fixing), and sorry for the
mistake here.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
