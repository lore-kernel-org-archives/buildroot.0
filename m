Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5EAC54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 13:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CC8941690;
	Sat, 23 Mar 2024 13:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxUaMGfpeN6R; Sat, 23 Mar 2024 13:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EDDC416C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EDDC416C8;
	Sat, 23 Mar 2024 13:55:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF7351BF584
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB735416C8
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4D8EaFqKkIi for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 13:55:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 76EC341690
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76EC341690
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76EC341690
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:55:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E71A1C0002;
 Sat, 23 Mar 2024 13:55:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ro1qK-007UwI-2q;
 Sat, 23 Mar 2024 14:55:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240213131327.2823205-1-buildroot@bubu1.eu>
Date: Sat, 23 Mar 2024 14:55:28 +0100
In-Reply-To: <20240213131327.2823205-1-buildroot@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Tue, 13 Feb 2024 14:13:26 +0100")
Message-ID: <87wmptuk6n.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/nodejs: bump to version v20.11.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Daniel Price <daniel.price@gmail.com>, Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > LICENSE hash changed due to two things:
 > * c-ares vendored dependency license got updated [1]. This is unused by
 >   buildroot though anyway
 > * base64 vendored library license updated copyright years and sorted
 >   contributor names [2], [3]

 > [1] https://github.com/c-ares/c-ares/pull/556
 > [2] https://github.com/aklomp/base64/commit/2e8ad2aec2065f258dc1aec9402aedd3604cfbcd
 > [3] https://github.com/aklomp/base64/commit/d7bca2bb2928de6c4fe496e6defe8b3affa35d1b

 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Sorry, marking as superseeded as I have in the mean time bumped to
20.11.1 by commit 02ecb096ad874a1f.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
