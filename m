Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85750C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 14:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 064D96082B;
	Mon,  3 Feb 2025 14:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwS_uBb26mmI; Mon,  3 Feb 2025 14:51:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1876060852
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1876060852;
	Mon,  3 Feb 2025 14:51:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C45512A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E39F86082B
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-uUHohdo8B7 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 14:51:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0298C606EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0298C606EA
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0298C606EA
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:51:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87685442EF;
 Mon,  3 Feb 2025 14:51:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1texnK-00BMgM-2e;
 Mon, 03 Feb 2025 15:51:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250113200224.64363-1-ju.o@free.fr>
Date: Mon, 03 Feb 2025 15:51:26 +0100
In-Reply-To: <20250113200224.64363-1-ju.o@free.fr> (Julien Olivain's message
 of "Mon, 13 Jan 2025 21:02:24 +0100")
Message-ID: <87pljzrsi9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepueeijefhjeefgefgheehjedvleettedvkeevleetheeggeeihedugefhhffhgeelnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] fs/ext2: fixes for ext2r0 with
 host-e2fsprogs >= 1.47.2
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Since Buildroot commit [1] "package/e2fsprogs: bump version to
 > 1.47.2", running the runtime test tests.fs.test_ext.TestExt2 with the
 > command:

 >     utils/docker-run support/testing/run-tests \
 >         -d dl -o output_folder \
 >         tests.fs.test_ext.TestExt2
 >     tail output_folder/TestExt2-build.log

 > Fails with error in the log:

 >     mkfs.ext2: the -r option has been removed.

 >     If you really need compatibility with pre-1995 Linux systems, use the
 >     command-line option "-E revision=0".

 > Upstream commit [2] "tune2fs: replace the -r option with -E
 > revision=<fs-rev>" removed this option.

 > This commit fixes the issue by using the new form with -E. Also,
 > BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS has a default value to "-O
 > ^64bit". Passing a "-O ..." option now generates an error when a
 > ext2r0 filesystem is created (because this revision does not support
 > ext2 filesystem feature options). This commit sets this default value
 > only if BR2_TARGET_ROOTFS_EXT2_2r0 is not set.

 > Fixes: [3]

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/db459859fa3c8fb7a2c0c8b8616637644d9c12bf
 > [2] https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=3fffe9dd6be5a5ed77755cf23c267b4afd1e7651
 > [3] https://gitlab.com/buildroot.org/buildroot/-/jobs/8830670170

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

Maybe we should consider dropping r0 support?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
