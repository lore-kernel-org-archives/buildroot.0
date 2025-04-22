Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E8AC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 21:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 725C140B6B;
	Tue, 22 Apr 2025 21:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VAqidhCMAgQ; Tue, 22 Apr 2025 21:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A7CA40BF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A7CA40BF6;
	Tue, 22 Apr 2025 21:48:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7EDD1BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E6544116C
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ylGQaOJJQ-Xi for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 21:48:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29830401A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29830401A2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29830401A2
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:48:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0775B1FCEB;
 Tue, 22 Apr 2025 21:48:35 +0000 (UTC)
Date: Tue, 22 Apr 2025 23:48:34 +0200
To: Vincent Jardin <vjardin@free.fr>
Cc: Vladimir Oltean <olteanv@gmail.com>, Ioana Ciornei
 <ciorneiioana@gmail.com>, Brandon Maier <Brandon.Maier@collins.com>, Julien
 Olivain <ju.o@free.fr>, buildroot@buildroot.org, Romain Naour
 <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <20250422234834.0f36b6a9@windsurf>
In-Reply-To: <lsefn7ciqjh4vcjresnslswex7o4y67hyewwv324gqkmhaw5tx@s43mnee24je2>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-19-olteanv@gmail.com>
 <7rnjce73dhujdnipfea5e2qg7z7g7moczlzbkzsrxzggse2rkb@lpmauc2r4qc6>
 <20250331103956.tdwjd3xl7jaihse7@skbuf>
 <lsefn7ciqjh4vcjresnslswex7o4y67hyewwv324gqkmhaw5tx@s43mnee24je2>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedvjedvgfffveetieffudegieevleeigfffteefhefhtefhueelfeekjefgfedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepvhhjrghrughinhesfhhrvggvrdhfrhdprhgtphhtthhopeholhhtvggrnhhvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghiohhrn
 hgvihhiohgrnhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuehrrghnughonhdrofgrihgvrhestgholhhlihhnshdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrhdprhgtphhtthhopehnvghmrggrkhhhihhlvghshhesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745358516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hwp4lMGLBiBA95x6LkLfEtZ2tc410z6ckjWYy/ExQlk=;
 b=i/bG6RMgEFaG/Txk1djFoBCiQUAFZXs5DE5dS2SArABNx8lK69ZF62QLh1UIPqWm9XgaG2
 6htwULv97zZRgPQaC2VJOT42xLPKIxMQtT85OK700kxr63unFpXay/PKJImctJvFtBRuls
 WXbbj6IabP6ft0Zo8idIKbSE8t1MLf3frgR1yJSwgLGQfRRWkHMC2cXcaXtuVesLA+OnmO
 ptbXmTTuuDixNRcQ2IMXSZcO3QlM3rI9x/erQjLsFYUFUtO+9p4YTA+IIjop0xaTte+PvO
 en6yOS15+kMisxxIHZAHufW5mvNyXbG9ap6Qr7vP8PYS0Z3xXJHjLVngjGR7JQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i/bG6RMg
Subject: Re: [Buildroot] [PATCH v2 18/18] board/lx2160ardb: new platform
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

Hello Vincent,

On Mon, 31 Mar 2025 23:11:41 +0200
Vincent Jardin <vjardin@free.fr> wrote:

> Of course, I do understand NXP willingness to control theirs, but here
> it is about Buildroot, not NXP's Flexbuild. I'd like to read the views
> of Buildroot's maintainers since I am a novice with Buildroot.

Of course, we do care about upstream, but we also want defconfigs that
are "useful", which sometimes means we have to use vendor trees. For
example all the configs/freescale_* configurations use the NXP vendor
trees. On the other hand, the configs/imx_* configurations, sometimes
for the same platforms, use upstream trees.

In another case, for STM32MP platforms, Buildroot has defconfigs that
use upstream trees, and a separate BR2_EXTERNAL
(https://github.com/bootlin/buildroot-external-st) has defconfigs that
use ST vendor trees, because some people want to use what's supported
by the vendor, to get vendor's support.

So I'm not shocked by Vlad's defconfig using NXP's vendor tree overall.

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
