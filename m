Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2A4C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DE6280CD0;
	Mon, 21 Apr 2025 21:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IK6wY96YWtqX; Mon, 21 Apr 2025 21:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B51080CF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B51080CF2;
	Mon, 21 Apr 2025 21:32:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 185581C0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E4E240BBD
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhZx6IEOV_XQ for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:32:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 251AD40B87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 251AD40B87
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 251AD40B87
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:32:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B56B941C84;
 Mon, 21 Apr 2025 21:32:00 +0000 (UTC)
Date: Mon, 21 Apr 2025 23:31:59 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20250421233159.792b17e7@windsurf>
In-Reply-To: <CACXRmJioVq7PUwBkCPNj0k-47hrJ_vtgVYtzp+_84ZgimDe9CA@mail.gmail.com>
References: <Z-QAExADR8rp0Afq@waldemar-brodkorb.de>
 <20250402082625.599501-1-thomas@devoogdt.com>
 <Z-0auN0f7ln-1IJH@waldemar-brodkorb.de>
 <CACXRmJhEJ9RnLpiAjfp+mSZD-okUg8+-hY6zJ-i9Qt_zbNFYOg@mail.gmail.com>
 <Z-2IR5Zbzs7zwT5x@waldemar-brodkorb.de>
 <CACXRmJioVq7PUwBkCPNj0k-47hrJ_vtgVYtzp+_84ZgimDe9CA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeduleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshesuggvvhhoohhgughtrdgtohhmpdhrtghpthhtohepfigsgiesohhpvghnrggukhdrohhrghdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhil
 hgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdguvghvohhoghguthessggrrhgtohdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745271121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qyA1omrySWhBRmoO7ieQ1+Pnirta38N7tcAePaAatuc=;
 b=QL5oJurc/VaXNkTsj1lb6oXmL6nkkMy7W2jY4GxKG6uI1ga8olFv91g3jBNIs7m8qdZONX
 jN1ImU1ACGFWeAcDWGPUwInEmDDDSfJPC9kCrIZ5JsSTIwhSaSVE47jH5zvJ8oce2oQ4hs
 kHHGKiDLI4snsePMVdZHX+6DCzQuvc6XQTe3LhhNU747Ab2DTx8q3ktNZgJ0osAeMxUQhJ
 cuW80azJNOvzjm1XMT9U/iqomX+gksDcPPZoKdPXUr3M1UdfuouM64SAhKFpUCOdBl3v7U
 gdygWPtWxuDOgVURblQtMnPJP0r3AMpGXUnAcwYKCbz6vondUbE0ZMBrn/8xCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QL5oJurc
Subject: Re: [Buildroot] [PATCH v2] package/util-linux: bump to 2.41
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 2 Apr 2025 22:27:39 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> So two things to fix.

So, I'm going to mark this patch as Changes Requested. Do you intend to
work on solving those remaining build issues?

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
