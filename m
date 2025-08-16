Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13ECBCA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D821183F2D;
	Sat, 16 Aug 2025 20:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocPJmSlxxUD7; Sat, 16 Aug 2025 20:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E96C83F2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E96C83F2B;
	Sat, 16 Aug 2025 20:08:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B290B196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 990F183F29
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83IkgSVnwxML for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:08:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B3B483F26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B3B483F26
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B3B483F26
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:08:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0B49443F8;
 Sat, 16 Aug 2025 20:08:20 +0000 (UTC)
Date: Sat, 16 Aug 2025 22:08:19 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Vadim Kochan <vadim4j@gmail.com>
Message-ID: <20250816220819.04ff5efe@windsurf>
In-Reply-To: <20250812215815.7252-1-fl@n621.de>
References: <20250812215815.7252-1-fl@n621.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedutdffhfdvgeeuleduuefgleehieefueeujeejvefhteeujeetjeetvddufffhffenucffohhmrghinhepsghuihhlughrohhothdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepfhhlsehniedvuddruggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehvrgguihhmgehjsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755374900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVqbggXD3I8RrLW2NKUE+0VcPpZyTQxYbpp2r8mL+d4=;
 b=WemeCFHal/ob5oqoNvf0fknWZmTa20w2g7LVFyUrPMO6554kVN4go80/ZrgAg25rhI6AfA
 dPlkJv9OZPIpHxAMTtm4JqZiYLTVIkKUF6wR4srzn3iua3jKzB5SWoN+czQtl8cCsRZLcS
 uwgEXCVWbJVwuk38DZDcL7lbNOMPzQ7xyY18u+LzyMXjzAB8BbWokKiMoI8bdLM62tLYYA
 k0o+qGK2Tq6PUYQadEDthfZNMTYoRDy7PfQAuUD9oqDo7sIiAP9uuJrLXoTEIBhpSlghpM
 aeLocdhFoyC4nMjyVFOus02tC0iV9uhkSq2r7KG38ALBuxQTnjDYTXi/quqKww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WemeCFHa
Subject: Re: [Buildroot] [PATCH 1/1] package/tinyssh: fix build issues with
 GCC 14
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

On Tue, 12 Aug 2025 23:57:37 +0200
Florian Larysch <fl@n621.de> wrote:

> tinyssh 20240101 fails to build on GCC 14 because of a missing include
> for a forward declaration. Import the upstream patch that fixes it.
> 
> Fixes: https://autobuild.buildroot.org/results/e45/e4563317371c90669f6417ee3d1c48a41cb59cb2/
> Signed-off-by: Florian Larysch <fl@n621.de>
> ---
> There have been a number of newer releases since 20240101 that also
> include this fix, but there also have been some build system changes as
> well as a license change. For this reason and for porting this to stable
> it makes sense to fix this issue separately first.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
