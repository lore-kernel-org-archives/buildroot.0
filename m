Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9FEC369AB
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 10:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 139CD41E3B;
	Fri, 18 Apr 2025 10:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPimfNWzRiLV; Fri, 18 Apr 2025 10:40:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D3A741E74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D3A741E74;
	Fri, 18 Apr 2025 10:40:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6313E228
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 10:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48C4F617B4
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 10:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fw52x4PUkPgt for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 10:40:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41680607FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41680607FE
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41680607FE
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 10:40:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C954643280;
 Fri, 18 Apr 2025 10:40:00 +0000 (UTC)
Date: Fri, 18 Apr 2025 12:39:59 +0200
To: Thomas Perale <thomas.perale@mind.be>
Message-ID: <20250418123959.3307e037@windsurf>
In-Reply-To: <221f0412-b320-4ade-8936-9ae8d941ebf7@mind.be>
References: <20250415195547.199428-1-thomas.perale@mind.be>
 <87tt6o3oxx.fsf@dell.be.48ers.dk>
 <065809af-e4b6-4bd8-9f53-49d39fab38af@rnout.be>
 <4b029329-2258-428d-80c9-315dbd6335be@essensium.com>
 <20250416215812.6a8ae1a5@windsurf>
 <b864a02f-c98a-48f5-863a-a7bd800809f6@mind.be>
 <20250416224034.3eb04598@windsurf>
 <221f0412-b320-4ade-8936-9ae8d941ebf7@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeduleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeujedtheegtddvgfekkefggedugfeihfefvdeulefghfdtvdelgeevhefggfeknecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdhgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepledvrddufeegrddvtdekrddufeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddufeegrddvtdekrddufeegpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepthhhohhmrghsrdhpvghrrghlvgesmhhinhgurdgsvgdprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsegvshhsvghnshhiuhhmrdgtohhmpdhrtghpthhtoheprghrnhhouhhtsehrnhhouhhtrdgsvgdprhgtphhtthhop
 ehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegthhhrihhsthhirghnsegrphgvrhhtuhhrvgdruhhs
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744972801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rirNFAZe7+9uEZeUW4gRTorLoC8fALgp+jRkkxviXnc=;
 b=jqsAACzK9kcbsmHrq2i56pXVrnf5Mfx8jmt+NS1O1ONNSxGXnOYruGQ16woHjUPgMErKFL
 p+2t/SpsAX1MM+abc7IqYxSjiHxrCqeqRU3WDkSf9uxlk1E7xtObuy7RzWjGhcQ4J/gzv5
 MCF6an7OWPC9ezjldwesFQc9QbP+m97eDu/9AtCyXqqlqfehrob1vyZryPGOasLlzvZpeR
 X/ydEaI4o2nA5v5OvzwM1FmNnAA0nrON1jpKbpIkwdRCnQD+iRMftDUMiNHm1KKopvhTVK
 7w5hEvkbhCowjggcdFt6b+Z/sxJ37YPVj+ZVf80TtFBpzmuqtc0zntaiqZSFBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jqsAACzK
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

Hello,

On Wed, 16 Apr 2025 22:49:15 +0200
Thomas Perale <thomas.perale@mind.be> wrote:

> Just to say that with the PURL added to the Django package I got 
> notified for the CVE.

But with what tool? Right now our "reference" tool to track CVEs in
Buildroot is support/scripts/pkg-stats, which renders:

  http://autobuild.buildroot.net/stats/master.html

And which uses the CVE database from
https://github.com/fkie-cad/nvd-json-data-feeds/.

So I'm still not sure to understand your "DependencyTrack uses NVD
annotation unfortunately". Could you clarify?

Right now, packages have a CPE ID, which we use to match
against https://github.com/fkie-cad/nvd-json-data-feeds/ as part
of the pkg-stats tool. If we want to add more identifiers in packages,
it has to be clear with which CVE database this works, and how this is
going to interact with pkg-stats (and if it doesn't interact, why).

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
