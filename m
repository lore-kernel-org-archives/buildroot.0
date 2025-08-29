Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3DDC8303F
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 08:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22C9D81466;
	Fri, 29 Aug 2025 08:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXONlds6VdSQ; Fri, 29 Aug 2025 08:09:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42CD6812D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42CD6812D8;
	Fri, 29 Aug 2025 08:09:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DC276C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B2184037E
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OXoliwG-Qh2 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 08:09:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16BC440335
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16BC440335
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16BC440335
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:09:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C763B431F2;
 Fri, 29 Aug 2025 08:09:16 +0000 (UTC)
Date: Fri, 29 Aug 2025 10:09:15 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250829100915.768e8207@booty>
In-Reply-To: <20250813173037.3052024-2-neal.frager@amd.com>
References: <20250813173037.3052024-1-neal.frager@amd.com>
 <20250813173037.3052024-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeeffeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhto
 hepmhgrrhhtihhnrdgthhgrsghothesghhmrghilhdrtghomhdprhgtphhtthhopehjuhhjuhestghothgushdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrrhhnohhuthesrhhnohhuthdrsggvpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1756454957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QVRIkn3P8twxkyCWiuT57ov4tJZXXtQOnUA4K0/9gXY=;
 b=QnhPqRKiYBZRi9CmF0NLcWUwh4aFmiFMCcFinCHawH3j26QbqHiQDl+eZyaGAfzilXunVv
 8Z0ee2U8FmYzlLdkapdelflCL4ChjrallGed+VP5ys6ernJ9+6zY3WhtgmBY0iP1MxE2df
 G0LkzrPjS7PPta9Y4u3SQ5BrPL0a6b0Hc3hs08MdxTsHp74wkqjEKGZOC/xPRtZyn+1zc8
 b6IJaxVZsDaDq4TZtOaUMwH5JH9dztbJSFPvqg9sCy7BbNLJvAnV1RuHsrHiTnAjXjvTYr
 SiDJHPxbtGOeK7u10IEGq2bIhCgiAhXSOElNZhkJqZwmZvr2MC+rCwMWQvQP4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QnhPqRKi
Subject: Re: [Buildroot] [PATCH v3 2/2] boot/uboot: add cpu dependency to
 BR2_TARGET_UBOOT_ZYNQ
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
Cc: martin.chabot@gmail.com, buildroot@buildroot.org, brandon.maier@collins.com,
 ju.o@free.fr, juju@cotds.org, thomas.petazzoni@bootlin.com,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Wed, 13 Aug 2025 18:30:37 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds a BR2_cortex_a9 cpu dependency to BR2_TARGET_UBOOT_ZYNQ.

The commit message should describe why, not what. What the patch does
is clearly visible in the diff. Why it does it need to to be clarified
in the commit message, e.g.:

  Zynq SoCs are all based on Cortex-A9, thus showing this option for
  other cores is useless.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
