Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54B3C0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 21:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67082412BD;
	Tue, 28 Jan 2025 21:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoIGT-zcVfXs; Tue, 28 Jan 2025 21:09:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20976412C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20976412C5;
	Tue, 28 Jan 2025 21:09:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B560120
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 21:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A24DE60FA8
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 21:09:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAiQRVmcvvOd for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 21:09:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8AB1D607C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AB1D607C2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AB1D607C2
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 21:09:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1966B42E76;
 Tue, 28 Jan 2025 21:09:20 +0000 (UTC)
Date: Tue, 28 Jan 2025 22:09:20 +0100
To: Markus Mayer via buildroot <buildroot@buildroot.org>
Cc: Markus Mayer <mmayer@broadcom.com>
Message-ID: <20250128220920.535ecc14@windsurf>
In-Reply-To: <20250127215356.3175741-1-mmayer@broadcom.com>
References: <20250127215356.3175741-1-mmayer@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudelmeekleegsgemheehtddtmedvudgtvgemsggvheeimegrsgefvdemtggrrggvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkeelgegsmeehhedttdemvddutggvmegsvgehieemrggsfedvmegtrggrvgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepmhhmrgihvghrsegsrhhorggutghomhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738098561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oKx5K6NQbkh3lGEsxtYw2iNdP23yGUqWhC30ITuwIkg=;
 b=Qwc8TunZQ5X9O6eDKbigWgaGcH6F9v9Kr86OiuHNUTb9LGI8e3zb1OVDO818sDGas+RQSB
 c6YSS1OUCWa3F9eumD5jdSuVgkNOFyg2f22u0TmcehM1nIaelO2qi29UsF1eiGvkc6prEL
 fISEbxj+I/HQ4oAqIRAvt2tLjvDNyTA/uXR5DYRoSUX4kRx84upMDNMBBWc8mjET6topsk
 FkC1pXb3jtJt+u98UHbj4NGLANOg8xE8/R1j9/GJwF3Ava/Kml4CY4dtsvrfdRQJfjmLW3
 GU9O+piCYbkpJ2OSqipGto6YxNoZ93R+lV8GPSISu5DRbCeMnsjFdbw0ZJYq+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qwc8TunZ
Subject: Re: [Buildroot] [PATCH] support/scripts/apply-patches.sh: introduce
 envvar BR_PATCH_ARGS
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

Hello Markus,

On Mon, 27 Jan 2025 13:53:54 -0800
Markus Mayer via buildroot <buildroot@buildroot.org> wrote:

> Introduce the environment variable BR_PATCH_ARGS as a means for the
> caller to pass additional arguments to the patch(1) command. These
> arguments can be new arguments not originally used -- or they can
> override one of the default arguments.
> 
> In addition, provide a mechanism to add patch parameters on a
> per-package basis using the <PACKAGENAME>_PATCH_ARGS makefile variable,
> for example "PROCPS_NG_PATCH_ARGS". This allows individual packages to
> specify extra arguments or override defaults while not affecting any
> other part of the build environment.

Thanks for the proposed patch. Do you have some details on the actual
(not theoretical) use-case(s) ?

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
