Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1A1C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 12:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF8BC409EF;
	Tue, 22 Apr 2025 12:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5yuW5Q4E0WFu; Tue, 22 Apr 2025 12:53:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EA51409A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EA51409A3;
	Tue, 22 Apr 2025 12:53:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47EE068
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 12:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3980D80C9D
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 12:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jhs66EV9bD0E for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 12:53:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26AE780EC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26AE780EC6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26AE780EC6
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 12:53:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC90C43989;
 Tue, 22 Apr 2025 12:53:25 +0000 (UTC)
Date: Tue, 22 Apr 2025 14:53:24 +0200
To: Thomas Perale <thomas.perale@mind.be>
Message-ID: <20250422145324.01ae9635@windsurf>
In-Reply-To: <bab05300-a70d-4f03-bb15-57bef52edac7@mind.be>
References: <20250415195547.199428-1-thomas.perale@mind.be>
 <87tt6o3oxx.fsf@dell.be.48ers.dk>
 <065809af-e4b6-4bd8-9f53-49d39fab38af@rnout.be>
 <4b029329-2258-428d-80c9-315dbd6335be@essensium.com>
 <20250416215812.6a8ae1a5@windsurf>
 <b864a02f-c98a-48f5-863a-a7bd800809f6@mind.be>
 <20250416224034.3eb04598@windsurf>
 <221f0412-b320-4ade-8936-9ae8d941ebf7@mind.be>
 <20250418123959.3307e037@windsurf>
 <bab05300-a70d-4f03-bb15-57bef52edac7@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejiedvfffhuedtjeffgeejgffffeetlefghfeivdehvddvuddvleffleethfffnecuffhomhgrihhnpeguvghpvghnuggvnhgthihtrhgrtghkrdhorhhgpdhsohhnrghthihpvgdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepthhhohhmrghsrdhpvghrrghlvgesmhhinhgurdgsvgdprhgtphhtthhopehth
 hhomhgrshdrphgvrhgrlhgvsegvshhsvghnshhiuhhmrdgtohhmpdhrtghpthhtoheprghrnhhouhhtsehrnhhouhhtrdgsvgdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegthhhrihhsthhirghnsegrphgvrhhtuhhrvgdruhhs
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745326406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJKx2liZ9mbQoYY7Kd7KfpxLh8dTRqNfvFyiRniH+DM=;
 b=Oc7LojiM9qsewu4KHuv315qm7AKLF78WJaxNIGgRKaR0vaRctcUUm+0k3kQ4jsxykpJ074
 G8TcccZVGtoJ1PChWW2YGZx8tTYtvDSq10ttIQalT8fvElIOEd/+u/xAkAZXpl+yDxX6/S
 zsGTAij8vPxRXTwQyA4TToN5odWkd4LAXW0BBf3sjhgmoR9ql6yDw5smoeICD3+ZWiKvwu
 NmT0YXcN6d4L+4c/kbB3m/m1Ia6xUWJcuQLJyUm5TWA+clUxGvNxe4aWWHS+t8Am2qw8LP
 p8LKLgFBYCuXG29tJXxOMv+5PD9l99+7iwyPwAlN4YGtJ+awrqEh2bnJBN6xtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Oc7LojiM
Subject: Re: [Buildroot] [PATCH 0/7] Add PURL support
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
Cc: Thomas Perale via buildroot <buildroot@buildroot.org>,
 Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Mon, 21 Apr 2025 22:19:19 +0200
Thomas Perale <thomas.perale@mind.be> wrote:

> > So I'm still not sure to understand your "DependencyTrack uses NVD
> > annotation unfortunately". Could you clarify?  
> 
> The tool is called DependencyTrack (https://dependencytrack.org/), sorry 
> if the name was misleading.

OK.

> It uses the annotation downloaded from NVD to internally do the
> matching with the CPE ID.

Sorry, but I'm not able to parse that. Could you explain?

> Adding PURL definition the SBOM allows DependencyTrack to rely on 
> https://ossindex.sonatype.org/ to match CVE to packages.

OK.

> My series is more about improving the SBOM contents with information 
> that can be consumed by other software rather than improving
> 'pkg-stats' right now. But, it could be used as a fallback for
> packages without a CPE ID manually assigned.

And so DependencyTrack doesn't use CPEs at all? Or uses either CPEs or
PURLs, depending on the CVE?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
