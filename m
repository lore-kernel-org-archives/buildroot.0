Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BF2C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3DDD418A9;
	Mon,  5 Feb 2024 14:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3DDD418A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KkLH4BS2AFNe; Mon,  5 Feb 2024 14:58:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4105E4187D;
	Mon,  5 Feb 2024 14:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4105E4187D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A2E51BF2F0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 437B260F0C
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 437B260F0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NiyZmktkcpma for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:58:09 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BFCA60E6B
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BFCA60E6B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B3BAE0003;
 Mon,  5 Feb 2024 14:58:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rX0QB-00CLP3-0L;
 Mon, 05 Feb 2024 15:58:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>, James Hilliard
 <james.hilliard1@gmail.com>
References: <20240111072922.3082638-1-james.hilliard1@gmail.com>
 <87sf27upph.fsf@48ers.dk>
 <42594955-dcd4-4161-9a84-879f096d49f7@bubu1.eu>
Date: Mon, 05 Feb 2024 15:58:07 +0100
In-Reply-To: <42594955-dcd4-4161-9a84-879f096d49f7@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Mon, 5 Feb 2024 14:34:05 +0100")
Message-ID: <87il33rm9s.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-starlette: bump to
 version 0.34.0
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Hi Peter,
 > On 05.02.24 12:15, Peter Korsgaard wrote:
 >>>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
 >> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 >> Committed, thanks.
 >> 

 > We currently have fastapi 0.105.0 in buildroot which depends on
 > starlette < 0.28.0.

 > There's a pending patch by James that bumps it to 0.108.0, which
 > unfortunately is also not compatible with starlette 0.34.0 [1] :-/

 > In fact there's no fastapi release that is compatible with starlette
 > 0.34.0 (newer fastapi releases require even newer starlette
 > versions...)

Argh :(

 > I guess I'll send a series that bumps *both* again to compatible versions?

Yes please!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
