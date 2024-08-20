Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2D5C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 17:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94013401DF;
	Tue, 20 Aug 2024 17:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UX6zs3T8jYyM; Tue, 20 Aug 2024 17:20:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3305A408DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3305A408DC;
	Tue, 20 Aug 2024 17:20:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF2431BF37C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBDDB80D62
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fE0IITSgiByP for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 17:20:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8993E80C74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8993E80C74
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8993E80C74
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 17:20:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EE84240006;
 Tue, 20 Aug 2024 17:20:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sgSWw-00HDSC-1s;
 Tue, 20 Aug 2024 19:20:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1710027863.git.yann.morin.1998@free.fr>
 <7c4ef882367896d7d522301f04c742bc26df47aa.1710027863.git.yann.morin.1998@free.fr>
Date: Tue, 20 Aug 2024 19:20:26 +0200
In-Reply-To: <7c4ef882367896d7d522301f04c742bc26df47aa.1710027863.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 10 Mar 2024 00:44:29 +0100")
Message-ID: <87jzgbf6w5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 5/5] support/download/check-hash: accept
 hash files without terminating \n
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
Cc: masonwardle@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Lots of people are using broken text editors that 1. do not naturally
 > terminate text files with a final \n as is customary in UNIX text files,
 > and 2. do not respect our .editorconfig settings, which explicitly
 > require adding that final newline. See this nice summary of what a text
 > file is (with references to applicable standards):

 >     https://stackoverflow.com/questions/12916352/shell-script-read-missing-last-line/12916758#12916758

 > So, it is not surprising that read does not read the last "line" of a
 > file, when said "line" does not end with a newline, because it is thus
 > not really a line.

 > Even though we do mandate actual text files, let's be a little bit lax
 > in this respect, because people may write packages, and their hash
 > files, in a br2-external tree, and they may not have our .editorconfig
 > in the directory heierarchy (e.g. if buildroot is a submodule of their
 > br2-external tree, or whatever).

 > mapfile does not suffer from this limitation, though, and correctly
 > reads all lines from a file, even the final line-that-is-not-a-line.

 > mapfile was introduced in bash 4.0, released on 2009-01-20, more than
 > 15 years ago. Debian squeeze, released in 2011 already had bash 4.1.
 > Those are really ancient. So, it means we can indeed expect bash
 > version 4.0 or later; which means mapfile is available.

 > "It should be fine!"

 > Fixes: #15976

 > Reported-by: masonwardle@gmail.com
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
