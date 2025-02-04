Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3336C02197
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 08:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D8C141233;
	Tue,  4 Feb 2025 08:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7KjWv4vmZPa; Tue,  4 Feb 2025 08:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90D6840DBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90D6840DBB;
	Tue,  4 Feb 2025 08:56:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C7A612A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DB4F60B04
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rcmjg6t-s8pa for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 08:56:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EEE560B44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EEE560B44
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EEE560B44
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:56:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA6B5442BE;
 Tue,  4 Feb 2025 08:56:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tfEjJ-00FEWL-28;
 Tue, 04 Feb 2025 09:56:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Clement Ramirez
 <clement@clementramirez.fr>
References: <20250203142748.1135655-1-thomas.petazzoni@bootlin.com>
 <20250203142748.1135655-5-thomas.petazzoni@bootlin.com>
Date: Tue, 04 Feb 2025 09:56:25 +0100
In-Reply-To: <20250203142748.1135655-5-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Mon, 3 Feb 2025 15:27:43 +0100")
Message-ID: <87zfj2ozpi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeekieetgeejleekgeehfeejgeekgeekjeduheffvddvveetieeuleeufedtveeggeenucffohhmrghinhepsghushihsghogidrnhgvthenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghlvghmvghnthestghlvghmvghnthhrrghmihhrvgiirdhfrh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 4/4] package/busybox bump version to 1.37.0
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

 > From: Clement Ramirez <clement@clementramirez.fr>
 > Patch 0005-seedrng-fix-for-glibc-2.24-not-providing-getrandom.patch is
 > dropped as it is upstream as of
 > https://git.busybox.net/busybox/commit/?id=200a9669fbf6f06894e4243cccc9fc11a1a6073a

 > Patch 0006-seedrng-fix-for-glibc-2.24-not-providing-random-head.patch
 > is dropped as it is upstream as of
 > https://git.busybox.net/busybox/commit/?id=cb57abb46f06f4ede8d9ccbdaac67377fdf416cf

 > Patch 0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch
 > is dropped as it is upstream as of
 > https://git.busybox.net/busybox/commit/?id=93e0898c663a533082b5f3c2e7dcce93ec47076d

 > Patch 0011-awk-fix-use-after-realloc-CVE-2021-42380-closes-1560.patch
 > is dropped as it is upstream as of
 > https://git.busybox.net/busybox/commit/?id=5dcc443dba039b305a510c01883e9f34e42656ae

 > Patch 0012-awk-fix-use-after-free-CVE-2023-42363.patch is dropped as
 > it is upstream as of
 > https://git.busybox.net/busybox/commit/?id=fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa

 > Patch 0013-awk-fix-precedence-of-relative-to.patch is dropped as it is
 > upstream as of
 > https://git.busybox.net/busybox/commit/?id=0256e00a9d077588bd3a39f5a1ef7e2eaa2911e4

 > Patch 0014-awk-fix-ternary-operator-and-precedence-of.patch is dropped
 > as it is upstream as of
 > https://git.busybox.net/busybox/commit/?id=38335df9e9f45378c3407defd38b5b610578bdda

 > Remaining patches are renumbered/refreshed.

 > Patch 0010-libbb-sha-add-missing-sha-NI-guard.patch is added, taken
 > from the mailing list, to fix a build issue.

 > Patch 0011-syslogd-fix-wrong-OPT_locallog-flag-detection.patch, taken
 > from the mailing list, is added to fix a runtime issue with syslogd
 > which was pointed out by Bernd Kulhs.

 > Signed-off-by: Clement Ramirez <clement@clementramirez.fr>
 > [Thomas: update with more patches being dropped, renumber patches,
 > backport some patches needed to fix known build and runtime issues]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
