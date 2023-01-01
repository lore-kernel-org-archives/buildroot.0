Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CD2C4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 14:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DF6A405A5;
	Sun,  1 Jan 2023 14:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DF6A405A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pyunC-UetTKd; Sun,  1 Jan 2023 14:33:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF786405EF;
	Sun,  1 Jan 2023 14:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF786405EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC9A31BF33C
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 14:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9445B60BE8
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 14:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9445B60BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id as6xzfUtKu_W for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 14:33:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AC8E60BE0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AC8E60BE0
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 14:33:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0EE5E100002;
 Sun,  1 Jan 2023 14:32:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pBzOS-000Vet-22; Sun, 01 Jan 2023 15:32:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20221222104927.775C986D45@busybox.osuosl.org>
Date: Sun, 01 Jan 2023 15:32:56 +0100
In-Reply-To: <20221222104927.775C986D45@busybox.osuosl.org> (Yann E. MORIN's
 message of "Thu, 22 Dec 2022 11:47:26 +0100")
Message-ID: <87y1qme353.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] support/testing: remove leftover
 kernel config fragment
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

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=0627cb0e8a9e19d1ac19c1a72302b25ab7b938dc
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 86d32208b62a (support/testing/tests/init/test_systemd.py: use
 > downloaded kernel) stopped building a custom kernel for the systemd
 > tests, but forgot to drop the associated kernel config fragment.

 > That fragment is now not used in any test case, so we can drop it.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
