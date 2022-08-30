Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611EDECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 16:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D11DB4174F;
	Tue, 30 Aug 2022 16:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D11DB4174F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IkA5cUaErrUL; Tue, 30 Aug 2022 16:05:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B61241705;
	Tue, 30 Aug 2022 16:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B61241705
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A3E91BF3A8
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 551C560DE5
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 551C560DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ALmzWPJeuvOx for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 16:04:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10AF360E3A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10AF360E3A
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 16:04:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B822A60003;
 Tue, 30 Aug 2022 16:04:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oT3jT-001XWG-7r; Tue, 30 Aug 2022 18:04:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220115143344.12319-1-romain.naour@gmail.com>
 <20220115143344.12319-2-romain.naour@gmail.com>
 <20220727155742.492bcb84@windsurf>
Date: Tue, 30 Aug 2022 18:04:55 +0200
In-Reply-To: <20220727155742.492bcb84@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 27 Jul 2022 15:57:42 +0200")
Message-ID: <871qsx3efs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/boot-qemu-image.py:
 increase the timeout by 10
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sat, 15 Jan 2022 15:33:44 +0100
 > Romain Naour <romain.naour@gmail.com> wrote:

 >> As for the Buildroot testsuite, multiply every emulator timeout by 10
 >> to avoid sporadic failures in elastic runners.
 >> 
 >> qemu_arm_vexpress_tz_defconfig tested locally with sucess.
 >> 
 >> Fixes:
 >> https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084046
 >> 
 >> Signed-off-by: Romain Naour <romain.naour@gmail.com>
 >> ---
 >> support/scripts/boot-qemu-image.py | 8 ++++----
 >> 1 file changed, 4 insertions(+), 4 deletions(-)

 > Applied to master, thanks.

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
