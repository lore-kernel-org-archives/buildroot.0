Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C38C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 10:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0105960753;
	Mon,  3 Feb 2025 10:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhk4bUp3izlJ; Mon,  3 Feb 2025 10:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1516F60AFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1516F60AFE;
	Mon,  3 Feb 2025 10:09:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5BBD1A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 10:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8525581FE0
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 10:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9ZuvVFWPltP for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 10:09:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8415881ED3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8415881ED3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8415881ED3
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 10:09:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33BC2204A8;
 Mon,  3 Feb 2025 10:09:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tetOK-00AvJH-20;
 Mon, 03 Feb 2025 11:09:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Tobias Waldekranz <tobias@waldekranz.com>
Cc: buildroot@buildroot.org
References: <20250126225438.856283-1-tobias@waldekranz.com>
Date: Mon, 03 Feb 2025 11:09:20 +0100
In-Reply-To: <20250126225438.856283-1-tobias@waldekranz.com> (Tobias
 Waldekranz's message of "Sun, 26 Jan 2025 23:53:52 +0100")
Message-ID: <877c67uypb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeetgfelveffveehtdevgeefjeeiudduledtffehgefgleekteektedutdfhleeiueenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehtohgsihgrshesfigrlhguvghkrhgrnhiirdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] support/scripts/fix-rpath: Reduce overhead
 of parallelization
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

>>>>> "Tobias" == Tobias Waldekranz <tobias@waldekranz.com> writes:

 > Rather than fork+exec:ing a whole bash process for every file of
 > interest, split up the work into ${PARALLEL_JOBS} separate file lists,
 > and then fork off a single worker per list.

 > Since workers now run in a fork, we also don't have to re-parse the
 > arguments on every call to patch_file().

 > In the worker, we also add a low-overhead check for the ELF magic,
 > which allows us to skip all non-ELFs without having to fork off
 > additional processes. In the event that we encounter an invalid ELF,
 > that is still taken care of by the existing exitcode-test in
 > patch_file().

 > On a 4-core/8-thread box, this cuts down the time it takes to fix the
 > RPATHS in the host directory from around 25s to 1.5s.

Nice!

 > Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>

I fixed the minor shellcheck issues about read -r and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
