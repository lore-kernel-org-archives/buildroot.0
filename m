Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4440DC021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 17:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7961831B0;
	Wed, 26 Feb 2025 17:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNYHype3qnTu; Wed, 26 Feb 2025 17:48:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FFE6831BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FFE6831BD;
	Wed, 26 Feb 2025 17:48:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E4C994F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 17:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31A17831BD
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 17:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id in9pbmz8Ur1D for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 17:48:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04E86831B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04E86831B0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04E86831B0
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 17:48:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98EE84445B;
 Wed, 26 Feb 2025 17:48:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tnLWH-007pho-2x;
 Wed, 26 Feb 2025 18:48:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Kory Maincent via buildroot <buildroot@buildroot.org>
Cc: Kory Maincent <kory.maincent@bootlin.com>,  Romain Naour
 <romain.naour@smile.fr>,  thomas.petazzoni@bootlin.com
References: <20250221-fixes_octavo-v2-0-0bb2012512eb@bootlin.com>
 <20250221-fixes_octavo-v2-3-0bb2012512eb@bootlin.com>
Date: Wed, 26 Feb 2025 18:48:29 +0100
In-Reply-To: <20250221-fixes_octavo-v2-3-0bb2012512eb@bootlin.com> (Kory
 Maincent via buildroot's message of "Fri, 21 Feb 2025 10:30:26 +0100")
Message-ID: <87v7swppg2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekhedvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeelffdthfeikeffveegudefgeffkeduleetudfhteeukeetieehfeekgeffgfelvdenucffohhmrghinhepvghlihhnuhigrdhorhhgnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 3/3] configs/octavo: Switch to Bootlin
 stable toolchain
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

>>>>> "Kory" == Kory Maincent via buildroot <buildroot@buildroot.org> writes:

 > Update the Octavo configurations to use the Bootlin glibc stable prebuilt
 > external toolchain, as recommended in the Buildroot meeting report from
 > ELCE 2024: https://elinux.org/Buildroot:DeveloperDaysELCE2024

 > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Committed, thanks.

check-package complains that these defconfigs do not have download
hashes for their kernel/bootloader parts and do not enforce hash checks:

Applying: configs/octavo: Switch to Bootlin stable toolchain
configs/octavo_osd32mp1_brk_defconfig:0: missing BR2_DOWNLOAD_FORCE_CHECK_HASHES
configs/octavo_osd32mp1_red_defconfig:0: missing BR2_DOWNLOAD_FORCE_CHECK_HASHES

Care to send a patch to fix that?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
