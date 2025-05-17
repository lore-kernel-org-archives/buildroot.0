Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7533C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 06:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 755F76129A;
	Sat, 17 May 2025 06:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5sJh7X-zT2Y; Sat, 17 May 2025 06:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A70C360A89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A70C360A89;
	Sat, 17 May 2025 06:42:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28A04223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 06:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E3CB81E39
 for <buildroot@buildroot.org>; Sat, 17 May 2025 06:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QW_5SdFSZFja for <buildroot@buildroot.org>;
 Sat, 17 May 2025 06:42:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EDE8381E00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDE8381E00
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDE8381E00
 for <buildroot@buildroot.org>; Sat, 17 May 2025 06:42:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4276443A3F;
 Sat, 17 May 2025 06:42:23 +0000 (UTC)
Date: Sat, 17 May 2025 08:42:22 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Christian Hitz <christian@klarinett.li>, Zoltan
 Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>, Jesse
 Van Gavere <jesseevg@gmail.com>
Message-ID: <20250517084222.7b3a32f3@windsurf>
In-Reply-To: <CA+R_deo8cJVqYuPNiQdnXXbGuaY9o11rMYp1CsaRqVdfRSM_AQ@mail.gmail.com>
References: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
 <20250515103632.2631227-9-roykollensvendsen@gmail.com>
 <20250516225158.706cccf5@windsurf>
 <CA+R_deo8cJVqYuPNiQdnXXbGuaY9o11rMYp1CsaRqVdfRSM_AQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudegleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehrohihkhholhhlvghnshhvvghnughsvghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtt
 hhopegthhhrihhsthhirghnsehklhgrrhhinhgvthhtrdhlihdprhgtphhtthhopeiighihrghrmhgrthhiseiighihrghrmhgrthhirdguvgdprhgtphhtthhopegsrgigihgthhgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgvshhsvggvvhhgsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747464143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1s6qpV1OZFFrhdTG+GIjq9gOHCbnBeueFtWRFNgz7uc=;
 b=AZyVvi8bQ0SGF42mXx+O8h7I+mh5cjbHfAFpVJqx3EbJEuJ8rIoLS790DNxGPuPQZsO3dm
 PR/MvjBrlxkSg3EG5LA5esPTM9rWJnE5ofb1JswFSQSNSVHdr9vXXwvYSpomYNyhT0f+UH
 Upq2RLA6c5DxwEmc8RgIHIaxX3GJlM0NwcR5z364ikKiDDs+z9MJmHqRguOP0Rbw+8+kyZ
 DTN0ap0Qzts2Uj2YAAOIft/DjyxzqoMa/9F14VmFwlnYcSMuiEZX9WNW2Vy1RDvBgLpCr1
 hWyQvgfGuCWG565ygxEJDAwAn0rAHGEoKvg/2+yKfqcqQT9rQt2wByPK2z5hTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AZyVvi8b
Subject: Re: [Buildroot] [PATCH 09/10] package/qt6/qt6tools: build only host
 linguist tools
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

Hello Roy,

On Sat, 17 May 2025 07:18:19 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> fre. 16.
> > What does this mean?
> >  
> The last sentence ended up there unintentionally during a rebase.

OK, that's what I thought :-)

> I think it is best to drop patch 10/10 for now. I can reintroduce that
> change when I need it.
> 
> By the way, is 9/10 too large? Should we split the commit? Maybe it is
> better to gradually fix the concrete build failures than "starting
> from scratch?"

What are the concrete build failures being fixed? What are the
"on-going" issues that you are referring to. Keep in mind that we are
maintaining a LTS branch, to which we backport fixes so we really want
to understand when things broke, and therefore whether the fixes should
be backported.

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
