Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6F2C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF3248328E;
	Fri, 16 May 2025 10:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUxBSsKse-2P; Fri, 16 May 2025 10:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04C9B832C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04C9B832C2;
	Fri, 16 May 2025 10:07:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2EAF185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7D7160838
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VEuJhB6bKc-1 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:07:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B51E660799
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B51E660799
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B51E660799
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:07:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5183439F3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:07:48 +0000 (UTC)
Date: Fri, 16 May 2025 12:07:48 +0200
To: buildroot@buildroot.org
Message-ID: <20250516120748.478a63a3@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvgeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvffukfhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveefjedufeekgeejffelffffkeeuvdeugeehveelfeeuledtheeilefgfefgveffnecuffhomhgrihhnpegvlhhinhhugidrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747390069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/bfWokxSh+IJS/gMCzhEw+zLYHlph1GsksL4J3eDGIk=;
 b=mlToK3BytcElJ8i69Cu30s0GtsfpWtcWAF4AoTi37DUqfVoy85gKTudgWPrsM61Z0ZrSqu
 n785zoTbskEgXjlkPTSLyUIWjpMObccKYmpykoyy9WGrV8KBNW6gGTvXwfDB0ecWR/A9z3
 pm/2IyPYjyHrOmHEmFUFVeqs3ylwdnIhbRr4MHajFGGzqExyol1J/07a1Za7aS+FMu/SkQ
 vYeiM1jgcS/zRO8glkYt2e7o3H8tcybyqswuKn19vd/AME39aZDKbPbB9AXH1hFlfcu+Nd
 Dn39Wj7yMTVzKQNQseALhKRY1oOlty6YwOsfkZQu3AdKHrMd9cGW3z/Xx3SeAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mlToK3By
Subject: [Buildroot] Buildroot Meeting after Open Source Summit Europe,
 Aug 28/29, Amsterdam
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

The next Open Source Summit Europe will take place on Aug 25-27 in
Amsterdam, and will as usual include the "Embedded Linux Conference
Europe". We definitely recommend anyone working on Embedded Linux to
consider attending this event!

Not only because ELC has great talks, but also because we are
organizing right after ELC a Buildroot Developers Meeting, on August
28-29.

If you're using Buildroot, working on Buildroot, contributing to
Buildroot, or interested in contributing, you should also consider
joining our meeting.

See:

  https://elinux.org/Buildroot:DeveloperDaysELCE2025

for some initial details.

Note that we are looking for a location in Amsterdam to host the
meeting. If you know a company, hackerspace, organization that would
have a space for those 2 days for ~10 developers that would be amazing!

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
