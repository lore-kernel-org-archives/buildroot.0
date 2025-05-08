Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA8FC3ABC0
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 18:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D44C581F9F;
	Thu,  8 May 2025 18:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTILxmSz_z0T; Thu,  8 May 2025 18:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09ECD81F49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09ECD81F49;
	Thu,  8 May 2025 18:03:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E39B615A
 for <buildroot@buildroot.org>; Thu,  8 May 2025 18:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9E6441465
 for <buildroot@buildroot.org>; Thu,  8 May 2025 18:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H47j9_9sN73k for <buildroot@buildroot.org>;
 Thu,  8 May 2025 18:03:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7D364127A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7D364127A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7D364127A
 for <buildroot@buildroot.org>; Thu,  8 May 2025 18:02:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C94543A57;
 Thu,  8 May 2025 18:02:55 +0000 (UTC)
Date: Thu, 8 May 2025 20:02:53 +0200
To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20250508200253.183a9660@windsurf>
In-Reply-To: <8734dfzqc2.fsf@tarshish>
References: <20250507201105.1505495-1-thomas.petazzoni@bootlin.com>
 <8734dfzqc2.fsf@tarshish>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledtgeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudelmeelvddtsgemgeejtddtmegrvdhfieemugekugekmeehtggvtgemsgehvgegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemledvtdgsmeegjedttdemrgdvfheimegukegukeemhegtvggtmegshegvgedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsrghruhgthhesthhkohhsrdgtohdrihhlpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746727376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yiQboROfpbjnYZHWG43iU9T66JHSskjGp2Sla2LtQ8o=;
 b=Aydbm/na5DI6121NJ6kOOLEhIJhCELB7L91Le/N15BhPD/4Sl1zXNCNUPaJpPzyGl0ZpTY
 ZOJQMvuoJIIVK3mXC69vVqaFtGFCE1Nrfr9bL3cUScVtg/uweTqAAvC6yCzlybHqpgEphb
 QGbzoTyFV7YnEeJhedTSledSMgTs3C65IdK2pTJolZL8R7p/kDtza3azn5geOTZM0gJIe9
 uvgfVTr3DxhXzYYosw3QpEiZ+WdSHJ+3fK5O/6MvcD5KzK3AxHhWj6RxHaVNa0wGXrIXHo
 rkBGr3n4ooLcvELrfygAO3YwsI7ZJkHvNvbtTZgEVVcWpMuZDBfIP+KPXHXGDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Aydbm/na
Subject: Re: [Buildroot] [PATCH] support/dependencies/dependencies.sh: awk
 is needed by Buildroot
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

Hello Baruch,

On Thu, 08 May 2025 07:19:57 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> [...]
> > diff --git a/docs/manual/prerequisite.adoc b/docs/manual/prerequisite.adoc
> > index 5d3aa297a9..9ccc30cca0 100644
> > --- a/docs/manual/prerequisite.adoc
> > +++ b/docs/manual/prerequisite.adoc
> > @@ -38,6 +38,7 @@ between distributions).
> >  ** +file+ (must be in +/usr/bin/file+)
> >  ** +bc+
> >  ** +findutils+
> > +**  awk  
> 
> Any reason to make text formatting for this item different than all
> other listed packages?

Obviously no reason, but here is my excuse: my Emacs apparently has
some AsciiDoc mode, so instead of showing +findutils+, it was showing
findutils without + signs around, but in a blue color. So I didn't
really realize I should use +awk+. Yes, I should have reviewed the diff :-)

Thanks a lot for spotting, I have sent a v2.

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
