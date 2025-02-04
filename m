Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2B0C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 13:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4629D60FA3;
	Tue,  4 Feb 2025 13:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjNQZnKsGrru; Tue,  4 Feb 2025 13:29:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E12760FA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E12760FA4;
	Tue,  4 Feb 2025 13:29:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABBBA185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FE1F4114C
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ushMcbH47YUm for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 13:29:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E2BD41144
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E2BD41144
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E2BD41144
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:29:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B93A344398;
 Tue,  4 Feb 2025 13:28:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tfIz5-00Fq3k-0Q;
 Tue, 04 Feb 2025 14:28:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
Cc: <buildroot@buildroot.org>,  <luca.ceresoli@bootlin.com>,
 <thomas.petazzoni@bootlin.com>,  <michal.simek@amd.com>,  <ju.o@free.fr>,
 <brandon.maier@collins.com>,  <romain.naour@smile.fr>,
 <ibai.erkiaga-elorza@amd.com>
References: <20250125224930.3639111-1-neal.frager@amd.com>
 <20250125224930.3639111-3-neal.frager@amd.com>
Date: Tue, 04 Feb 2025 14:28:59 +0100
In-Reply-To: <20250125224930.3639111-3-neal.frager@amd.com> (Neal Frager's
 message of "Sat, 25 Jan 2025 22:49:27 +0000")
Message-ID: <87wme5n8is.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeffuedvvddtteevgeeggefhkefhgfegtddtgfeileekudejleelgeekffelhfevgfenucffohhmrghinhepuggvnhigrdguvgenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsrhgrnhguohhnrdhmrghiv
 ghrsegtohhllhhinhhsrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrhdprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v6 3/6] board/zynqmp/patches: add zynqmp
 binman patches
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > This patch adds the zynqmp binman patches that are already committed to the
 > u-boot next branch.

 > Upstream:
 > https://source.denx.de/u-boot/u-boot/-/commit/10de9b5a6a5b53a37600894115685f00d3bbfc2d
 > Upstream:
 > https://source.denx.de/u-boot/u-boot/-/commit/290385f374fba69f9c4f473c8bd25d64935a4c82
 > Upstream:
 > https://source.denx.de/u-boot/u-boot/-/commit/d92fdb60677b3990919a4216d3452418db215224
 > Upstream:
 > https://source.denx.de/u-boot/u-boot/-/commit/afbc1fa5f18a2eebf1cf06f62574016edc093f50
 > Upstream:
 > https://source.denx.de/u-boot/u-boot/-/commit/2eb8cd5bd4936a5eb2e77729855d946f6720921c
 > Upstream:
 > https://source.denx.de/u-boot/u-boot/-/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca

 > [Tested on Kria KV260 starter kit]
 > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
 > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
 > Signed-off-by: Neal Frager <neal.frager@amd.com>

I extended the description a bit to make it clear what version "next"
refers to (post-2025.01, E.G. v2025.04) and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
