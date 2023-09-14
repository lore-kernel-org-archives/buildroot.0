Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4608BEEAA71
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 20:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE65760A5B;
	Thu, 14 Sep 2023 20:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE65760A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X0w5GrGNEukl; Thu, 14 Sep 2023 20:43:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 338CC60760;
	Thu, 14 Sep 2023 20:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 338CC60760
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7388D1BF3E3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BE0641888
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BE0641888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0dSyfQuIxeBI for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 20:43:45 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCD5F4151A
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 20:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCD5F4151A
Received: by mail.gandi.net (Postfix) with ESMTPSA id B940F20005;
 Thu, 14 Sep 2023 20:43:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgtBd-008gU6-PO; Thu, 14 Sep 2023 22:43:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Stefan Agner <stefan@agner.ch>
References: <8ea671337eeee89169fec537dc0f4eca9e2a51ca.1694636470.git.stefan@agner.ch>
 <8734zgwpkb.fsf@48ers.dk> <84c4978a7989662a720f5e0f9e0cca24@agner.ch>
Date: Thu, 14 Sep 2023 22:43:41 +0200
In-Reply-To: <84c4978a7989662a720f5e0f9e0cca24@agner.ch> (Stefan Agner's
 message of "Thu, 14 Sep 2023 21:44:37 +0200")
Message-ID: <87cyykv62q.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit branch/2023.02.x] package/go: bump to
 v1.19.13
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
Cc: dominique.tronche@eviden.com, christian@aperture.us,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Stefan" == Stefan Agner <stefan@agner.ch> writes:

 > On 2023-09-14 20:57, Peter Korsgaard wrote:
 >>>>>>> "Stefan" == Stefan Agner <stefan@agner.ch> writes:
 >> 
 >> > go1.19.13 (released 2023-09-06) includes a couple of bug fixes. In
 >> > particular it fixes a bug introduced in with the update o v1.19.11
 >> > which broke http using a unix socket addressing.
 >> 
 >> > Signed-off-by: Stefan Agner <stefan@agner.ch>
 >> 
 >> Committed to 2023.02.x and 2023.05.x, thanks.
 >> 
 >> I take it that this means we can again drop the recent docker-cli /
 >> docker-engine fixes to workaround the HTTP header issue?

 > By "recent docker-cli / docker-engine fixes" you mean the bump to
 > v24.0.x? Then yes, those can be dropped.

No, the backports of the workaround for the new go behaviour, E.G.:

https://gitlab.com/buildroot.org/buildroot/-/commit/d0ab8a869dbc5724a758f9777cafc1e12a343786
https://gitlab.com/buildroot.org/buildroot/-/commit/ff72ac444311f45028381207df65d6538a7b12c8

 > Or in other words, the version of Docker CLI/Engine present in 2023.02.4
 > works fine with the new Go version.

OK, I will revert the two above commits then again.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
