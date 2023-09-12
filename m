Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE77EE3F29
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 21:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CA4182020;
	Tue, 12 Sep 2023 21:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CA4182020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FbX9Hn8Xi-WL; Tue, 12 Sep 2023 21:12:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B42D1818CD;
	Tue, 12 Sep 2023 21:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B42D1818CD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DC601BF421
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43FAA818CD
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43FAA818CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kqh6UW7yh1G5 for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 21:12:43 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19AD7817A9
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 21:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19AD7817A9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C2461C0003;
 Tue, 12 Sep 2023 21:12:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgAgZ-001tyE-4p; Tue, 12 Sep 2023 23:12:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20230820085920.DF56985D69@busybox.osuosl.org>
Date: Tue, 12 Sep 2023 23:12:39 +0200
In-Reply-To: <20230820085920.DF56985D69@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 20 Aug 2023 10:58:48 +0200")
Message-ID: <87jzsv5c54.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/mosquitto: security bump to
 version 2.0.16
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=9f1ca943d554afe855f7eca2a0199481cc2c0426
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes the following security issues:

 > - CVE-2023-28366: Fix memory leak in broker when clients send multiple QoS 2
 >   messages with the same message ID, but then never respond to the PUBREC
 >   commands.
 > - CVE-2023-0809: Fix excessive memory being allocated based on malicious
 >   initial packets that are not CONNECT packets.
 > - CVE-2023-3592: Fix memory leak when clients send v5 CONNECT packets with a
 >   will message that contains invalid property types.
 > - Broker will now reject Will messages that attempt to publish to $CONTROL/.
 > - Broker now validates usernames provided in a TLS certificate or TLS-PSK
 >   identity are valid UTF-8.
 > - Fix potential crash when loading invalid persistence file.
 > - Library will no longer allow single level wildcard certificates, e.g. *.com

 > For more details, see the changelog:
 > https://mosquitto.org/ChangeLog.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
