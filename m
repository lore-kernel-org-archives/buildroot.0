Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F111CDB483
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 14:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08F6D60B8C;
	Fri, 13 Oct 2023 14:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08F6D60B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzCBEtYMm7Bp; Fri, 13 Oct 2023 14:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6048760767;
	Fri, 13 Oct 2023 14:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6048760767
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 268AA1BF33A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0062582EDB
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0062582EDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QXm9qw0mm4ao for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 14:43:28 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A4A282E5F
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A4A282E5F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A415FF81A;
 Fri, 13 Oct 2023 14:43:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrJNm-007JmQ-NL; Fri, 13 Oct 2023 16:43:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20221016193014.3384022-1-james.hilliard1@gmail.com>
 <e21a20c2-9639-4608-4a4e-d9131e31318f@mind.be>
Date: Fri, 13 Oct 2023 16:43:18 +0200
In-Reply-To: <e21a20c2-9639-4608-4a4e-d9131e31318f@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Sun, 1 Oct 2023 18:09:48
 +0200")
Message-ID: <87jzrq4m7t.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/Makefile.in: set
 --shuffle=none for MAKE1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 16/10/2022 21:30, James Hilliard wrote:
 >> Make 4.4 introduces a shuffle mode which randomizes prerequisites
 >> in order to better flush out issues with parallel builds, as this
 >> mode randomizes prerequisites even when using -j1 builds we must
 >> also explicitely mark parallel incompatible builds by setting
 >> --shuffle=none which disables goals prerequisites randomization
 >> for the parallel incompatible package when running in shuffle mode.
 >> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

 >  Applied to master with a slightly extended commit message, thanks.

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
