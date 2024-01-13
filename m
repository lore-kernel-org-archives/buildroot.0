Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2AEC4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 14:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E26B140301;
	Sat, 13 Jan 2024 14:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E26B140301
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pxdS9M-Hnn1z; Sat, 13 Jan 2024 14:39:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C35B402C4;
	Sat, 13 Jan 2024 14:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C35B402C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0E8F1BF2AB
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 14:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B221B60AE4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 14:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B221B60AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DsFD7SLor5Sa for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 14:39:26 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98B26607A3
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 14:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98B26607A3
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0BDD1BF204;
 Sat, 13 Jan 2024 14:39:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOfAQ-00DBxA-0P;
 Sat, 13 Jan 2024 15:39:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@aperture.us>
References: <20240109225148.79257-1-christian@aperture.us>
 <a22fe3a7-3177-4f94-8e56-e284e32821dd@korsgaard.com>
Date: Sat, 13 Jan 2024 15:39:22 +0100
In-Reply-To: <a22fe3a7-3177-4f94-8e56-e284e32821dd@korsgaard.com> (Peter
 Korsgaard's message of "Wed, 10 Jan 2024 17:13:08 +0100")
Message-ID: <87le8tti05.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.20.6
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > On 09/01/2024 23.51, Christian Stewart wrote:
 >> go1.21.6 (released 2024-01-09) includes fixes to the compiler, the runtime, and
 >> the crypto/tls, maps, and runtime/pprof packages.
 >> https://go.dev/doc/devel/release#go1.21.6
 >> Signed-off-by: Christian Stewart <christian@aperture.us>

 > Committed to master after fixing $SUBJECT, thanks.

Committed to 2023.11.x, thanks. For 2023.02.x I have instead bumped to
1.20.13.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
