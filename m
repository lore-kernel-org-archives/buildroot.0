Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9BEC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 08:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02C1640747;
	Thu,  2 May 2024 08:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERwFCURv7pb6; Thu,  2 May 2024 08:29:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA7354080A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA7354080A;
	Thu,  2 May 2024 08:29:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 645041BF47A
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E8C260E2C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIWSGsaAXm1R for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 08:29:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 830BF60D78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 830BF60D78
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 830BF60D78
 for <buildroot@buildroot.org>; Thu,  2 May 2024 08:29:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E30A24000E;
 Thu,  2 May 2024 08:29:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s2Roc-00AN2h-2B;
 Thu, 02 May 2024 10:29:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
References: <Zgv9bm3jnAu0_nZo@antipodes> <877chdqk74.fsf@48ers.dk>
Date: Thu, 02 May 2024 10:29:18 +0200
In-Reply-To: <877chdqk74.fsf@48ers.dk> (Peter Korsgaard's message of "Thu, 04
 Apr 2024 16:25:03 +0200")
Message-ID: <87y18s7h29.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] Fwd: [PATCH] DEVELOPERS: remove Thomas De
 Schampheleire
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Thomas" == Thomas De Schampheleire <thomas.de_schampheleire@nokia.com> writes:
 >> Hi Peter,
 >> I sent this patch to the mailing list, but since I am no longer subscribed, it's
 >> probably stuck in the moderation queue.

 > Odd, I don't see it in mailman.

 >> Could I bother you to apply this patch or let my mail pass through the queue?

 > Sure, committed.

 > Sorry to see you go, thanks for all your work!

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
