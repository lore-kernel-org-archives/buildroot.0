Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC309C3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 20:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B360612CD;
	Wed,  7 May 2025 20:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_WNcK6jJUtm; Wed,  7 May 2025 20:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3ABF61305
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3ABF61305;
	Wed,  7 May 2025 20:28:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C6D7439
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DDB340E15
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QDfJqfdHGF8 for <buildroot@buildroot.org>;
 Wed,  7 May 2025 20:28:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9001640E19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9001640E19
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9001640E19
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:28:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C444143989;
 Wed,  7 May 2025 20:28:30 +0000 (UTC)
Date: Wed, 7 May 2025 22:28:29 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
Message-ID: <20250507222829.2fee8926@windsurf>
In-Reply-To: <20250507185930.6cosxy42ale5wqw2@n621.de>
References: <20250507185311.7581-1-fl@n621.de>
 <20250507185930.6cosxy42ale5wqw2@n621.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhieduteeufeegueduveefieegfefgjefgkeejkefhveelhefggffftedtfefhieenucffohhmrghinhepohiilhgrsghsrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudelmeelvddtsgemgeejtddtmegrvdhfieemugekugekmeehtggvtgemsgehvgegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemledvtdgsmeegjedttdemrgdvfheimegukegukeemhegtvggtmegshegvgedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehflhesnheivddurdguvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746649711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UDQox9uMvEWux9QwvH5bpYF0fOKWV7VQ7FR9WA6l4ds=;
 b=FbB0NNyDMmClWn+j4mzSEi3ZX4V24hn7i8sED1ustb/WI0V7BCYiScNnD/qkFF4dGCuwNM
 9R7UPUXn729D8cmvpinjcrRAKWguklpkvaMR8cxO+UchOFVjKZ6ioMWEyBr74kJgb01Yxz
 eopW96vtbldFxQ5xnjUimoMN5z91nXsMz/pjJYcIM+w5o1aORlYCs87X4vsh+sRuxK0Kis
 7pf3X9+YijIFpYGIPqH70vN61zdtCMf2lY0CuGQNKgfL8Fh41NkOYhD0M8TSTfyD07Fd7I
 YvJLRTYObrKUJgK/kdWG6KdQpAPMh2+78gblbJ6A8pmmuY/mlJvNYWGbRB53Dg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FbB0NNyD
Subject: Re: [Buildroot] [PATCH 1/1] package/bash: fix build with host GCC 15
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

Hello Florian,

On Wed, 7 May 2025 20:59:30 +0200
Florian Larysch <fl@n621.de> wrote:

> Note that this is also going to cause issues for the target build once
> toolchains start picking up GCC 15, but since this also requires
> touching the toolchain infrastructure to make Buildroot aware of GCC 15
> and I'm not too familiar with that I wanted to keep the patch for the
> acute issue separate.

I already posted patches to add GCC 15.x support in Buildroot:

	https://patchwork.ozlabs.org/project/buildroot/list/?series=454269

however, we haven't merged this series for now precisely because we
know there are a LOT of packages that are failing to build with GCC
15.x. We expect to merge the GCC 15.x support after Buildroot 2025.05
has been released.

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
