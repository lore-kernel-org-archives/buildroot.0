Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519A9C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 13:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2501426FA;
	Tue, 31 Oct 2023 13:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2501426FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Sn5qDI_ydip; Tue, 31 Oct 2023 13:18:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24640426EE;
	Tue, 31 Oct 2023 13:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24640426EE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 287741BF2F8
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 13:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01C2B61143
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 13:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01C2B61143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8owbpOp4YpQY for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 13:18:45 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECDE9610D5
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 13:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECDE9610D5
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2DF4C000A;
 Tue, 31 Oct 2023 13:18:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1qxnxN-0047zP-30;
 Tue, 31 Oct 2023 13:34:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Scott Fan <fancp2007@gmail.com>
References: <20231026181904.3218122-1-bernd@kuhls.net>
 <87o7gf1b6h.fsf@48ers.dk>
 <CAFkzVZacX8bhs_2qKcSKifXm7JkUSLpg5ZaVKfz7Zvq7FBbQLw@mail.gmail.com>
 <87jzr315sl.fsf@48ers.dk>
 <CAFkzVZbf3A4npP1DvXYkKo0dDTm_zxJMptdwR73J5EG3YpXH-w@mail.gmail.com>
Date: Tue, 31 Oct 2023 13:34:33 +0100
In-Reply-To: <CAFkzVZbf3A4npP1DvXYkKo0dDTm_zxJMptdwR73J5EG3YpXH-w@mail.gmail.com>
 (Scott Fan's message of "Tue, 31 Oct 2023 19:08:46 +0800")
Message-ID: <87fs1r0y3q.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump
 version to 3.1.4
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Scott" == Scott Fan <fancp2007@gmail.com> writes:

 > Sorry, i thought it would always follow the upstream.

We normally do, but given that there is no added value for !windows, I
haven't done the work to update the LTS. Normally it would be taken care
of once the next update comes out with Linux fixes, but that is unlikely
to happen for 1.1.1 given that it is EOL.

But if you like to have 1.1.1w then that is fine by me, please send a
patch.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
