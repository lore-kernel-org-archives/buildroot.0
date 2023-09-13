Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0DCCA5537
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 16:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63C5682061;
	Wed, 13 Sep 2023 16:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63C5682061
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fZWdyop6abdV; Wed, 13 Sep 2023 16:08:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A36EC8204E;
	Wed, 13 Sep 2023 16:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A36EC8204E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 04E041BF2AB
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E59C41D88
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E59C41D88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2JhwSdiV_u5Y for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 16:08:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 616B741DC0
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 16:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 616B741DC0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4208DE0008;
 Wed, 13 Sep 2023 16:08:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgSPn-0060gu-8S; Wed, 13 Sep 2023 18:08:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230825101535.661486-1-peter@korsgaard.com>
 <20230825191851.41b3b155@windsurf> <87pm3b7z9e.fsf@48ers.dk>
Date: Wed, 13 Sep 2023 18:08:31 +0200
In-Reply-To: <87pm3b7z9e.fsf@48ers.dk> (Peter Korsgaard's message of "Fri, 25
 Aug 2023 20:28:13 +0200")
Message-ID: <87r0n212f4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/mosquitto: bump to version 2.0.17
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
 >> On Fri, 25 Aug 2023 12:15:35 +0200
 >> Peter Korsgaard <peter@korsgaard.com> wrote:

 >>> Bugfix release, fixing a number of regressions in 2.0.16
 >>> 
 >>> From the changelog
 >>> (https://github.com/eclipse/mosquitto/blob/master/ChangeLog.txt)
 >>> 
 >>> 2.0.17 - 2023-08-22
 >>> ===================
 >>> 
 >>> Broker:
 >>> - Fix `max_queued_messages 0` stopping clients from receiving messages.
 >>> Closes #2879.
 >>> - Fix `max_inflight_messages` not being set correctly. Closes #2876.
 >>> 
 >>> Apps:
 >>> - Fix `mosquitto_passwd -U` backup file creation. Closes #2873.
 >>> 
 >>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >>> ---
 >>> package/mosquitto/mosquitto.hash | 4 ++--
 >>> package/mosquitto/mosquitto.mk   | 2 +-
 >>> 2 files changed, 3 insertions(+), 3 deletions(-)

 >> Applied to next, thanks.

 > Sorry if that wasn't clear, but given that it fixes regressions in
 > 2.0.16 (which is in master), I think it makes sense to apply it to
 > master as well.

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
