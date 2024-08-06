Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24799C52D71
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 15:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83AC3400C7;
	Tue,  6 Aug 2024 15:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rp40xXO5jiK5; Tue,  6 Aug 2024 15:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4757F40533
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4757F40533;
	Tue,  6 Aug 2024 15:59:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F6951BF288
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85D4640533
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZ53A1-LLJpq for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 15:59:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A7B18400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7B18400C7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7B18400C7
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 15:59:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 779DBFF802;
 Tue,  6 Aug 2024 15:59:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sbMaf-00HDIP-2s;
 Tue, 06 Aug 2024 17:59:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240328110058.2037303-1-buildroot@bubu1.eu>
Date: Tue, 06 Aug 2024 17:59:13 +0200
In-Reply-To: <20240328110058.2037303-1-buildroot@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Thu, 28 Mar 2024 12:00:58 +0100")
Message-ID: <87le19r6b2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/nodejs: bump to 20.12.0
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

 > Release Notes: https://nodejs.org/en/blog/release/v20.12.0
 > LICENSE hash changed due to changes in vendored components:

 > * copyright year updates [1][2]
 > * version name update [3]
 > * change from "Unicode, Inc. License - Data Files and Software"
 >   to the "Unicode License v3" [4]. This is in the icu vendored
 >   dependency which is unused in buildroot.
 > * new build tooling script [5] under BSD style license

 > [1] https://github.com/nodejs/node/commit/347e1dd06a5f927d9fd64ce72d776c56d5101910
 > [2] https://github.com/nodejs/node/commit/b88170d602791fa62fc45ac80ca9953bc1bdd25b
 > [3] https://github.com/nodejs/node/commit/c8233912e9fd7464898b549d6762130722bf0bf4
 > [4] https://github.com/nodejs/node/commit/625fd69b76b5a8f59152f803b31941c8986d924b
 > [5] https://github.com/nodejs/node/commit/b5bc597871ca701bab750c46d31ed626decd7f89

 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
