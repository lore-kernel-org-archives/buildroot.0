Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8BBC87FCB
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 07:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4193C61B7C;
	Fri,  1 Aug 2025 07:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LxrdtSgyrF3; Fri,  1 Aug 2025 07:46:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ABBF61B89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ABBF61B89;
	Fri,  1 Aug 2025 07:46:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A14D160
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 07:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 604314103A
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 07:46:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GgeGqIv5IQT for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 07:46:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.236;
 helo=relay16.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 22E494034D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22E494034D
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22E494034D
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 07:46:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DC0A4388B;
 Fri,  1 Aug 2025 07:46:13 +0000 (UTC)
Date: Fri, 1 Aug 2025 09:46:12 +0200
To: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
Cc: buildroot@buildroot.org, "Julien Olivain" <ju.o@free.fr>
Message-ID: <20250801094612.2c64fd28@windsurf>
In-Reply-To: <d2ee394a-1efe-492b-b89b-c81c4d1f92f5@app.fastmail.com>
References: <20250710-loongarch-fabi-v2-0-72fcf95c8b65@flygoat.com>
 <20250730223753.2f400524@windsurf>
 <d2ee394a-1efe-492b-b89b-c81c4d1f92f5@app.fastmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdefudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehju
 hdrohesfhhrvggvrdhfrh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754034375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+b4Ks68nkGWs5r+oK+zZNi2PhWQ1Pc8uKJPo2W/Cq4M=;
 b=gH8xjJbdmdFO4BBuEZW9TU4tp8ImHz6CLywDuXXoZhrTUvkjKLUTm48JO5ed5oV6nB1qVG
 jN0OvdXRfhCMY4gb3GiojfbkWtjloIBtTo/BpucdeVcBPsPyvt8jlANPh38KWTJ5nZ8dwz
 a/mH136LtqHCIi5z8wQKZoWNAanzTCP+wLTBzlDYzpNpEOg9H/tkLefZjGxrED/4WNzaIy
 aITApRR8ylBYCtXEiB9jJIOp1i2nVRjv7aCCCIiDrCf+FMwczfTmRD7VbvudHXrUEpJUTY
 DMJxUhatqFka5mSzTsZvtq/Yt8RXZgxfhMFPVuk/nWJwkcOUbYLZj9185mvIXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gH8xjJbd
Subject: Re: [Buildroot] [PATCH v2 0/3] arch/loongarch: Fix a couple of
 toolchain options
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

On Fri, 01 Aug 2025 12:13:48 +0800
"Jiaxun Yang" <jiaxun.yang@flygoat.com> wrote:

> Sure, sorry those emails slipped across my email filter.
> 
> I'm actually looking into fix LP64S and LP64D ABI in GCC and other
> libraries but trapped by various failures. If I'm unable to get them
> fixed we may need to drop them in Buildroot.

Thanks for your feedback. If there are known broken features causing
those failures, I would prefer that we remove/disable them now, and
re-enable them later once they are fixed. There are currently way too
many failures on loongarch64.

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
