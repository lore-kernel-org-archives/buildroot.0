Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC55C3ABDD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 16:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58A0A82BA7;
	Sat, 17 May 2025 16:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwx5PrZnKLX5; Sat, 17 May 2025 16:18:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1320E81255
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1320E81255;
	Sat, 17 May 2025 16:18:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29A34204
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26AA540FB8
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-cW82sqjzpS for <buildroot@buildroot.org>;
 Sat, 17 May 2025 16:18:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9305240350
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9305240350
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9305240350
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:18:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55936439B4;
 Sat, 17 May 2025 16:18:16 +0000 (UTC)
Date: Sat, 17 May 2025 18:18:15 +0200
To: nvd <nvd@nist.gov>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20250517181815.02ce0393@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeitdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuueeivdfhteekudeiuddugeffjeeuleffhfegtdettdfglefftdekgedufeetleenucffohhmrghinhepughovhgvtghothdrohhrghdpghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehnvhgusehnihhsthdrghhovhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747498696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wGglp/gTgy745244aA53reh+ERmAYLDMJeTZmv3xnIs=;
 b=CS0HUor5UhvMN7g1RlL9mYG1/9Y6dU6pBQSaDdEXR2c/kK/oR5oghcOTEmoZhmid0Foz3T
 8+c61Ps7fARFCKsQzl4tEJ/vyDlhjWwsTzLnDiU4E7VpFG4N95XMot465oyh6VxggrZaMv
 aZx+uD1oMzUsNw8mVq99Z53D8doraPcOOtiV9WpNBslegVtPaF3fPR9LzbmE0k+Rh92NNn
 c8cZywolLjQ50g/wtS18STe3O3Ck52fpWiuTs1WTt8GwexiiDW/uyyqwtZFfJDBlJRlCGt
 THZ0qFiwNpuydwh3wxV5UAYqWPxanQzS03dhVIgRBmxbBFfGyEl8ZseNXAnHbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CS0HUor5
Subject: [Buildroot] CVE-2022-30550 version range fix
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

Hello,

CVE-2022-30550 is documented in your database as affecting versions of
dovecot up to 2.3.20.

However, according to
https://dovecot.org/pipermail/dovecot-news/2022-July/000477.html, the
fix for this issue is:

  https://github.com/dovecot/core/compare/7bad6a24%5E..a1022072.patch

And this commit is only in Dovecot 2.4.0, which means that versions
2.3.21, 2.3.21.1 are affected.

Here is some additional evidence based on the Git repository of Dovecot:

$ git log --format=oneline 2.3.21  | grep "auth: Fix handling passdbs with identical driver/args but"
$

So 2.3.21 doesn't have the fix.

$ git log --format=oneline 2.3.21.1  | grep "auth: Fix handling passdbs with identical driver/args but"
$

So 2.3.21.1 doesn't have the fix.

$ git log --format=oneline 2.4.0  | grep "auth: Fix handling passdbs with identical driver/args but"
7bad6a24160e34bce8f10e73dbbf9e5fbbcd1904 auth: Fix handling passdbs with identical driver/args but different mechanisms/username_filter

Which means that 2.4.0 has the fix.

Therefore, your entry for CVE-2022-30550 should be fixed to indicate
that versions up to (excluding) 2.4.0 are affected.

Thanks for your great work on maintaining this database! It would be
create to have a public issue tracker to report issues.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
