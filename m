Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D077BC369D9
	for <buildroot@archiver.kernel.org>; Sat,  3 May 2025 12:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 756B680366;
	Sat,  3 May 2025 12:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjzyAOsuAljC; Sat,  3 May 2025 12:41:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AB8D804E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AB8D804E8;
	Sat,  3 May 2025 12:41:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F540118
 for <buildroot@buildroot.org>; Sat,  3 May 2025 12:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 515AD40C0E
 for <buildroot@buildroot.org>; Sat,  3 May 2025 12:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DTJyuRlt7DuQ for <buildroot@buildroot.org>;
 Sat,  3 May 2025 12:41:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 13D8440C01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13D8440C01
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13D8440C01
 for <buildroot@buildroot.org>; Sat,  3 May 2025 12:41:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 075101FCE9;
 Sat,  3 May 2025 12:41:32 +0000 (UTC)
Date: Sat, 3 May 2025 14:41:31 +0200
To: "Joseph Zikusooka (ZIK)" <josephzik@gmail.com>
Cc: buildroot@buildroot.org, "Joseph Zikusooka (ZIK)" <zik@jambula.net>
Message-ID: <20250503144131.0b1fa2df@booty>
In-Reply-To: <20250503114339.13240-1-zik@jambula.net>
References: <20250503114339.13240-1-zik@jambula.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeehfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffevgedvheelfeekffdujeeitdduueehvddugffgfeelteejteefvefhuefghfevnecuffhomhgrihhnpehgnhhurdhorhhgpdgsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjohhsvghphhiiihhksehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtt
 hhopeiiihhksehjrghmsghulhgrrdhnvght
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746276093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JAPjb88oj7yK4gxWAtcV9Hh2GHQsn4YnFgflCz/M6+A=;
 b=Smf2wtCB2hpmZNSxRf77HkG45lSdNlCCFoTFz8RmPrWxphiBn2KDeKVlnzTYiP1mHQMwNP
 V4bfVn5qWst+qo26wjKlEzt7zOj3m9rK6vi0nRMyrOKcZDS1iPLHF+OSK7xs03wqXfEJSi
 w6w5OLexnZqEaUVg4K5Ebo9bCNPpNETYjV20X9arw6kGhQbyy7RbNus5fYUrcDG4Fj2Nxy
 GN9XJqzedYYucaMgXNk/bKSQuFw2XkYk/WKMx40yi0b+ljgQHdSg2hQse7XzworUv/nuuN
 +oVC7nd34TxwxNNG09mhJKjkTOzvg378o4kb/Uye6Gy/8baDGn/KcltZoG9rnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Smf2wtCB
Subject: Re: [Buildroot] [PATCH v2] package/m4: fix build failure with gcc 15
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Joseph,

thanks for your patch!

On Sat,  3 May 2025 14:43:39 +0300
"Joseph Zikusooka (ZIK)" <josephzik@gmail.com> wrote:

> This is a temporary workaround to address build issues with host-m4 when using GCC 15, as encountered on
> the recently released Fedora 42. The issue stems from stricter compiler behavior introduced in recent
> versions of GCC.
> 
> A proper fix has already been committed upstream and will be included in the next release of GNU m4:
> https://git.savannah.gnu.org/cgit/m4.git/commit/?h=branch-1.4&id=a22c9802dd7e724eaefb21dc21d84ac2d3a49c89
> 
> Until that version is available in buildroot, this patch ensures continued compatibility and successful
> builds.
> 
> More context:
> https://lists.buildroot.org/pipermail/buildroot/2025-April/776922.html
> 
> Signed-off-by: Joseph Zikusooka (ZIK) <zik@jambula.net>

The patch diff is identical to v1, thus you could have copied the
Tested-by tags you got.

Anyway:

[Tested v1, but v2 has the same diff]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Also, adding a changelog after the '---' line is useful.

E.g.:

Changes in v2:
- reworded commit message (no diff changes)

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
