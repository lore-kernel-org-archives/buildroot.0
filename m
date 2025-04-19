Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EC3C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2FCD818A2;
	Sat, 19 Apr 2025 14:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1FAmVrFatn1a; Sat, 19 Apr 2025 14:34:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFD9B818B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFD9B818B5;
	Sat, 19 Apr 2025 14:34:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C393022F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2E76405B5
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vyeLF-I0GMRr for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:34:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB9B54059F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB9B54059F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB9B54059F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:34:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0FA943B2D;
 Sat, 19 Apr 2025 14:34:18 +0000 (UTC)
Date: Sat, 19 Apr 2025 16:34:17 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Kris Bahnsen <kris@embeddedTS.com>
Message-ID: <20250419163417.6a103c75@windsurf>
In-Reply-To: <20250417171339.3718898-1-giulio.benetti@benettiengineering.com>
References: <20250417171339.3718898-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddtfffhvdegueeludeugfelheeifeeuueejjeevhfetueejteejtedvudffhfffnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepsghuihhlu
 ghrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehkrhhishesvghmsggvugguvgguvffurdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745073258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ukB9wkepPGDmO40lz7wQ0my1+4xFpy29q8fsEIRt+A=;
 b=W6OfDU28f26Pg+QSOlCPDTw+mLJq88o/zYtd00/2MQuaDbQHWxYVDnImomJMQFCs/uLjOD
 pfBzQNfQMkTyScnF3unHnNetjrl55dw08Y3heljV1VvXnvn66gklswMPPU3Oc+pFoAZPIf
 /UK9+AhEiu28Yu6hgFVZ8d3UuROcrmDBLssCrTTPU+0pr5J0yeF8DWnxbH0A+9w/qAaxmj
 s1VhvvXXFJT/QJApx+b0B8+XVXvwm0SL1fH7LnKm6YeNN/5prshOtCZsgS3gDzSa1FtIVb
 t8fUrE8FBw6zvqpodyo06mdAYZXRbsYUTlQf9uyllPcZj+QW2vSL6n4dCxm03A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W6OfDU28
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure with
 Linux 6.10
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

On Thu, 17 Apr 2025 19:13:39 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add local patches pending upstream to fix 3 different API changes
> throughout Linux 6.7, 6.8, 6.10.
> 
> Fixes:
> https://autobuild.buildroot.org/results/e001f70dab4c9cebdbde0443f4f8bb6b42ae5561/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../0008-Fix-build-with-Linux-6.7.patch       | 46 ++++++++++++++++
>  .../0009-Fix-build-with-Linux-6.8.patch       | 34 ++++++++++++
>  .../0010-Fix-build-with-Linux-6.10.patch      | 55 +++++++++++++++++++
>  3 files changed, 135 insertions(+)
>  create mode 100644 package/wilc-driver/0008-Fix-build-with-Linux-6.7.patch
>  create mode 100644 package/wilc-driver/0009-Fix-build-with-Linux-6.8.patch
>  create mode 100644 package/wilc-driver/0010-Fix-build-with-Linux-6.10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
