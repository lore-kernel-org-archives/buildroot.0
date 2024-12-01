Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AEAD49789
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 19:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 867534EC95;
	Sun,  1 Dec 2024 19:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iK-8r8DbziW6; Sun,  1 Dec 2024 19:41:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55DFF4EC9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55DFF4EC9A;
	Sun,  1 Dec 2024 19:41:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C13D6C
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 19:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80D1C402F2
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 19:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhn4kST0Q16V for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 19:41:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3629640197
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3629640197
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3629640197
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 19:41:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6854AC0004;
 Sun,  1 Dec 2024 19:41:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tHpoc-002cOe-1d;
 Sun, 01 Dec 2024 20:41:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>, jarkko@kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 bastien.curutchet@bootlin.com,  Sen Hastings <sen@hastings.org>,  Norbert
 Lange <nolange79@gmail.com>,  "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20241130092534.819113-1-thomas.petazzoni@bootlin.com>
Date: Sun, 01 Dec 2024 20:41:10 +0100
In-Reply-To: <20241130092534.819113-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sat, 30 Nov 2024 10:25:33
 +0100")
Message-ID: <87ser7kx7t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2024.02.x] package/systemd: fix bcachefs
 magic patch
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

 > Commit 29409c9d345a2536f6b72c605cda0d13f306200f ("package/systemd: fix
 > build with recent kernels") added a patch from upstream that adds the
 > BCACHEFS_SUPER_MAGIC definition if not provided by the kernel headers.

 > However, this commit from upstream was bogus: in the case
 > BCACHEFS_SUPER_MAGIC was defined, it does an assert_cc() to verify
 > that the value matches what we expect, but this assert_cc() statement
 > lacks the final semi-colon, causing build breakage on host systems
 > that do have BCACHEFS_SUPER_MAGIC defined in their kernel headers,
 > with a weird error occuring in another header file... because only the
 > next statement after assert_cc() was considered as having a syntax
 > error.

 > Fixes:

 >   http://autobuild.buildroot.net/results/9f99a97df2efd5e4ae4ad5cc5882607f0c8766bc/

 > This issue only exists in 2024.02.x at this point, because in master
 > we have moved to systemd 256.x, which has dropped entirely this piece
 > of code related to defining BCACHEFS_SUPER_MAGIC (and we wonder how
 > systemd can then build with slightly older kernel headers, as
 > BCACHEFS_SUPER_MAGIC is only in the public kernel headers since Linux
 > 6.10).

Hmm, odd indeed..

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x, thanks.

I see there are newer 254.x bugfix releases since v254.13 (latest is
v254.21). Maybe it makes sense to update the version we use? I don't see
anything directly relevant for this though.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
