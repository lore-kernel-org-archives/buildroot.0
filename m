Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C851C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 07:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 284F481270;
	Mon, 25 Mar 2024 07:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUQtrHdcZOqc; Mon, 25 Mar 2024 07:33:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47AEF81240
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47AEF81240;
	Mon, 25 Mar 2024 07:33:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D4D911BF3A3
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF7CC40517
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L21XZt078ZbS for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 07:33:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 986AA404E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 986AA404E8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 986AA404E8
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 07:33:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 452DF1C0005
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 07:33:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1roepr-008Qo3-21
 for buildroot@buildroot.org; Mon, 25 Mar 2024 08:33:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20240323134947.3C24A825E3@busybox.osuosl.org>
Date: Mon, 25 Mar 2024 08:33:35 +0100
In-Reply-To: <20240323134947.3C24A825E3@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sat, 23 Mar 2024 14:25:38 +0100")
Message-ID: <875xxahik0.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/axel: needs gcc >= 4.9
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=c09830644466022de14a350d569e06041b394c53
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fix the following build failure raised since bump to version 2.17.12 in
 > commit 50ba0b0a40187b695740a2fce2d2f3ed7cbf58c5 and
 > https://github.com/axel-download-accelerator/axel/commit/517d3ea036c2837b779a15b410331cd0df4fb066:

 > src/random.c:1:23: fatal error: stdatomic.h: No such file or directory
 >  #include <stdatomic.h>
 >                        ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ca62edddd42252bf21caa8243f8aaba38992fc68

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
