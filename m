Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA4EC02197
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66F5660883;
	Tue,  4 Feb 2025 14:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qk_b4T0xYpAg; Tue,  4 Feb 2025 14:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CC6560631
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CC6560631;
	Tue,  4 Feb 2025 14:59:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 746A9185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EABE409E8
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1QKpirHiObR for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:59:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 55524408F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55524408F2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55524408F2
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:59:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4955E440E0;
 Tue,  4 Feb 2025 14:59:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tfKOO-00HE3T-2S;
 Tue, 04 Feb 2025 15:59:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Clement Ramirez
 <clement@clementramirez.fr>
References: <20250203142748.1135655-1-thomas.petazzoni@bootlin.com>
 <20250203142748.1135655-3-thomas.petazzoni@bootlin.com>
Date: Tue, 04 Feb 2025 15:59:12 +0100
In-Reply-To: <20250203142748.1135655-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Mon, 3 Feb 2025 15:27:41 +0100")
Message-ID: <87tt99kb7j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeetgfelveffveehtdevgeefjeeiudduledtffehgefgleekteektedutdfhleeiueenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghlvghmvghnthestghlvghmvghnthhrrghmihhrvgiirdhfrh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/4] package/busybox: fix pending CVEs
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > This commit adds patches, which were all backported from upstream, or
 > submitted upstream, and that fix various CVEs. To facilitate the
 > backporting work, we took the backports from openembedded-core.

 > CVE-2021-42380: this one is not marked by NVD as affecting 1.36.1, but
 > its fix was merged after 1.36.1, so it seems like the NVD data is
 > incorrect. Therefore, no need for a BUSYBOX_IGNORE_CVES entry. Patch
 > is upstream, backport taken from openembedded-core.

 > CVE-2023-42363, CVE-2023-42364, CVE-2023-42365: patches are upstream,
 > backports taken from openembedded-core.

 > CVE-2023-42366: patch has been submitted upstream but not merged,
 > patch taken from openembedded-core.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
