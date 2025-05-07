Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177CEC3ABC0
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 20:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8FB440BD5;
	Wed,  7 May 2025 20:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XpCwnDZS2DTL; Wed,  7 May 2025 20:27:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 028D540BC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 028D540BC1;
	Wed,  7 May 2025 20:27:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 368E6151
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2859182768
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfJHUEZYB16Y for <buildroot@buildroot.org>;
 Wed,  7 May 2025 20:27:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2393C821F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2393C821F8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2393C821F8
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:27:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 996B04316C
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:27:05 +0000 (UTC)
Date: Wed, 7 May 2025 22:27:04 +0200
To: buildroot@buildroot.org
Message-ID: <20250507222704.12cee5d5@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvffukfhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdduudekfeelieekudetfeeiueefgeevieefkefhteeugeegieegvdefkeelgeeunecuffhomhgrihhnpegvmhgsvgguuggvugdqrhgvtghiphgvshdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduleemledvtdgsmeegjedttdemrgdvfheimegukegukeemhegtvggtmegshegvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelvddtsgemgeejtddtmegrvdhfieemugekugekmeehtggvtgemsgehvgegpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746649625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1/6eRTrHVIM6FGmiBuXXw/TuevZGtB100fsklyq4abw=;
 b=SandNCN9UXIJE+4CQjmXfVLODuYs9QINSV/DNBXQUkY8wf7XTRN65Py0qwbG0fk6BoxSkS
 bcTWeJchLuAxST62BE3TwBVSPSwgJXkzCn4tfdzfwSpQH6lEAwRsqatUkBN3lwW4vF1V+4
 OaZpXQNYOWQ3FSWm79pMBz94lc0NrmkgmZfjq/GcGn+lWxLIXQ23tsn/n0X1NyMVtgaxKC
 G6h2v5AXgtWjsrj4NWytGrfr5qWELgroH6X7PW0PMxZMKd3dzcBGakmtnROOkzqe4qQuD+
 TzUmg73Fz5LJmPLM0jTL/5h8Ias0un/l6hHU9oGZ9efDJGKlZL57yyG5rx9qaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SandNCN9
Subject: [Buildroot] Buildroot at Embedded Recipes + hackathon on May
 16/17/18
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

Hello!

Several of the Buildroot maintainers/core-developers will be at the
Embedded Recipes in Nice on May 14/15:

  https://embedded-recipes.org/2025/

I'm aware of at least Arnout Vandecappelle, Peter Korsgaard, Julien
Olivain and myself joining.

Is there any other Buildroot community member attending Embedded
Recipes? If that's the case, then let's meet during the event!

Also, Arnout, Peter, Julien and myself will be having a private
hackathon in Nice right after Embedded Recipes, on May 16/17/18. Due to
the logistics in place, we cannot make this an open hackathon. However,
you can join the hackathon virtually through IRC. Over those 3 days, we
expect to make progress on reviewing and merging patches, so if you're
interested in pushing a topic forward, don't hesitate to participate by
being around on some of those days.

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
