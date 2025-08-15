Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59545CA0ED1
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 18:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 218A5610E9;
	Fri, 15 Aug 2025 18:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPzeP80PoQw0; Fri, 15 Aug 2025 18:42:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F746610EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F746610EF;
	Fri, 15 Aug 2025 18:42:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D643C223
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 18:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCC6C40E72
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 18:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzMhxY5EebOV for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 18:42:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7848E41203
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7848E41203
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7848E41203
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 18:42:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76B74442D5;
 Fri, 15 Aug 2025 18:42:35 +0000 (UTC)
Date: Fri, 15 Aug 2025 20:42:34 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Cc: Julien Olivain <ju.o@free.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>
Message-ID: <20250815204234.695f6fe0@windsurf>
In-Reply-To: <SA1PR12MB5615109970A6666176138370F034A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250815152737.588503-1-ju.o@free.fr>
 <20250815173050.1cc70ac9@windsurf>
 <SA1PR12MB5615DBECDFACC784ACC244BFF034A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <SA1PR12MB56156FBEE60B08B4CF6E47FEF034A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250815202925.42d1667c@windsurf>
 <SA1PR12MB5615109970A6666176138370F034A@SA1PR12MB5615.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeegjeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughro
 hhothdrohhrghdprhgtphhtthhopehisggrihdrvghrkhhirghgrgdqvghlohhriigrsegrmhgurdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755283355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lvWCP+rEpdbRgC7cedMs0i5Sq00cWwcd9LxJaUVu4ZM=;
 b=DyfSu8HM/nSeOZ8J9+XAYpGj8Z1VFc6ZZOA55P3OfqgyTWqCu69VyTzBtkjdEQiaGWaK9I
 R/7jHkaNwRBlr4bKrzeau6XQUgUBmhLpy0ejBB8lRvxvR14xRXujSTqeNcNfLjBGdZ36wt
 J5nel9U2iraAx+fAgDOpMRBbagefDBFPEaxMYx5apAWaSHPis/dq0LaVfaiBboy2v0mgmM
 9IKRv4ud/6QrOeskx1lUrYrX/3OnAanJiwrlprJbrQLGfAagwezS0RJygfqg/eu6LTB+c3
 dktVw7o0dINLvr9KYwyx62TJNx1vUWe4ZpvBspkpifqGKexZL0G13AjC0OajcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DyfSu8HM
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc-bare-metal: bump to version
 15.2.0 to fix build
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

On Fri, 15 Aug 2025 18:38:59 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> At the moment, gcc-bare-metal does not need any of the 3 gcc 15 patches.
> 
> We could just delete the patches symlink and cherry pick
> any gcc patches we might actually need in the future.
> 
> Then we would truly disconnect any dependencies between the
> gcc and gcc-bare-metal packages.

That would be fine by me, especially as they don't _need_ to be
connected. In other cases, we really need to have the same version,
like package/glibc and package/localedef, so it makes sense to share
hash file and stuff. But between gcc-{final,initial} and
gcc-bare-metal, there's really no relationship whatsoever.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
