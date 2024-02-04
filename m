Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3E2C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 14:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4481641765;
	Sun,  4 Feb 2024 14:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4481641765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ntu1NSowr-ji; Sun,  4 Feb 2024 14:52:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76D2741758;
	Sun,  4 Feb 2024 14:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76D2741758
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05DC01BF36F
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 14:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D340F607A4
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 14:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D340F607A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gF1b16mnP-YU for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 14:52:37 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D98F6079E
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 14:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D98F6079E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3773CE0004;
 Sun,  4 Feb 2024 14:52:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWdrE-00A0Oi-2q;
 Sun, 04 Feb 2024 15:52:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe <titouanchristophe@gmail.com>
References: <20240118193717.915022-1-titouanchristophe@gmail.com>
 <877ck3hvez.fsf@48ers.dk>
Date: Sun, 04 Feb 2024 15:52:32 +0100
In-Reply-To: <877ck3hvez.fsf@48ers.dk> (Peter Korsgaard's message of "Sun, 21
 Jan 2024 10:45:24 +0100")
Message-ID: <87wmrkp9hr.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: security bump to v7.2.4
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
Cc: Daniel Price <daniel.price@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Titouan" == Titouan Christophe <titouanchristophe@gmail.com> writes:
 >> See release notes (https://github.com/redis/redis/blob/7.2.4/00-RELEASENOTES):
 >> ================================================================================
 >> Redis 7.2.4    Released Tue 09 Jan 2024 10:45:52 IST
 >> ================================================================================

 >> Upgrade urgency SECURITY: See security fixes below.

 >> Security fixes
 >> ==============
 >> * (CVE-2023-41056) In some cases, Redis may incorrectly handle resizing of memory
 >> buffers which can result in incorrect accounting of buffer sizes and lead to
 >> heap overflow and potential remote code execution.

 >> Bug fixes
 >> =========

 >> * Fix crashes of cluster commands clusters with mixed versions of 7.0 and 7.2 (#12805, #12832)
 >> * Fix slot ownership not being properly handled when deleting a slot from a node (#12564)
 >> * Fix atomicity issues with the RedisModuleEvent_Key module API event (#12733)

 >> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>

 > Committed, thanks.

Committed to 2023.11.x, thanks.

For 2023.02.x I have instead bumped to 7.0.15.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
