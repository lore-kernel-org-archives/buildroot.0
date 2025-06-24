Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5068C77B7C
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 13:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6611612A1;
	Tue, 24 Jun 2025 13:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1msZ2bk-ChM; Tue, 24 Jun 2025 13:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBD5060C28
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBD5060C28;
	Tue, 24 Jun 2025 13:49:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E52B43F
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 13:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3015C83ACD
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 13:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZWdpPApkM_f for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 13:49:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C6DE3836C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6DE3836C5
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6DE3836C5
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 13:49:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB85343978;
 Tue, 24 Jun 2025 13:49:21 +0000 (UTC)
Date: Tue, 24 Jun 2025 15:49:20 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Message-ID: <20250624154920.66233d46@windsurf>
In-Reply-To: <ff205425-ef38-4e02-beff-46394b51801d@gmx.de>
References: <20250623215546.1850256-1-thomas.petazzoni@bootlin.com>
 <ff205425-ef38-4e02-beff-46394b51801d@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvtddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejvdejvdfgffevteeiffdugeeiveeliefgffetfeehhfethfeuleefkeejgfefvdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehfihhonhgrrdhklhhuthgvsehgmhigrdguvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1750772961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YoaH5JR8gbjaj27Ag+QkZOT92LQzZIJj9LTfvZMKLFk=;
 b=QPfWHniBsgBErX6whKnO953mJlrOTUosSjAMAKmhVSW8VpcVuABFf1VJUeGcgBd8Z079mu
 oSTSBt/J8fu3Dx1RV1CsyhzbkILijXxi2FcJohheJFf+Hutzkg3VJAAeS+2Ny7qbNFpnT4
 kbx6QXiMEhgO70gZ+KoELAxKSHkLZyYiXlyh7EN+gu/9x4/UMseAhavLAPrQxczbtngtR7
 MbCL8QW7X06668SlatMbA0dKo3umqXJcS4TtEsqF0M2h8uvBuWCnLkZG3fEdB5gMvlElLN
 fqibNxYM5pdBG/42fZb0s3GWN++9CKBG5ph69iv2bf2L6y2mXmbPLblUOQa3dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QPfWHniB
Subject: Re: [Buildroot] [PATCH] package/squashfs: bump to version 4.7
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

On Tue, 24 Jun 2025 14:10:18 +0200
Fiona Klute <fiona.klute@gmx.de> wrote:

> Am 23.06.25 um 23:55 schrieb Thomas Petazzoni via buildroot:
> > See https://github.com/plougher/squashfs-tools/releases/tag/4.7 for
> > details:
> > 
> > 1. Mksquashfs now reads files in parallel from the input directories
> > 2. Rewritten and improved help system (Mksquashfs/Unsquashfs)
> > 3. New options for building reproducible filesystems (Mksquash/Sqfstar)
> > 4. Elimination of "fragment block stall" and -(not-)reproducible options
> > 5. Other improvements for Mksquashfs/Sqfstar
> > 6. Other improvements for Unsquashfs/Sqfscat
> > 7. New environment variable SQFS_CMDLINE (Mksquashfs/Unsquashfs)
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
> 
> Building fails with musl due to missing includes, upstream already has 
> patches for that (both need to be applied):
> 
> https://github.com/plougher/squashfs-tools/commit/b6e9f4b62cc3e762ceeddc0fc099f7d65f7b7361
> https://github.com/plougher/squashfs-tools/commit/05a895b3f996d1ac157d95b04980f5f047e7dbf7

Thanks for reporting this!

> I also noticed a bug that blocks excluding files >1407 KiB when building 
> a squashfs image, which broke building a certain (intentionally broken) 
> test image for me: https://github.com/plougher/squashfs-tools/issues/316
> It's easy enough to work around by filtering the tar archive though, so 
> I'm not sure if it needs to hold up the update.

That seems pretty annoying. Let's wait for this to be fixed as well.
Hopefully, they'll make a 4.7.1 release with the fixes.

Thanks again for the very useful feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
