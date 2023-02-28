Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84502C64EC4
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 20:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB94B60AE2;
	Tue, 28 Feb 2023 20:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB94B60AE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4yIM54rpdZZ; Tue, 28 Feb 2023 20:35:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2512560AD5;
	Tue, 28 Feb 2023 20:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2512560AD5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67C2B1BF293
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4154C60AD5
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4154C60AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9oPFkGoyis5t for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 20:34:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFF0960AD2
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFF0960AD2
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 20:34:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DD3C4C0002;
 Tue, 28 Feb 2023 20:34:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pX6gW-00BLHv-0A; Tue, 28 Feb 2023 21:34:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Joachim Wiberg <troglobit@gmail.com>
References: <20230210184704.3381562-1-troglobit@gmail.com>
Date: Tue, 28 Feb 2023 21:34:51 +0100
In-Reply-To: <20230210184704.3381562-1-troglobit@gmail.com> (Joachim Wiberg's
 message of "Fri, 10 Feb 2023 19:47:04 +0100")
Message-ID: <87lekhh6l0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ssdp-responder;
 drop systemd unit installation, not needed
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

>>>>> "Joachim" == Joachim Wiberg <troglobit@gmail.com> writes:

 > When systemd is enabled the ssdp-responder build system already installs
 > the unit file, with the correct name, so we can safely drop this.

 > This fixes the recurring autobuilder problems that cropped up the last
 > week+ or so after fixing the spelling error in 6e0ba6b.

 >  - http://autobuild.buildroot.net/results/f6912d6f79155c5d12811beeb6cb43860e37e7e7
 >  - http://autobuild.buildroot.net/results/7ee4ed26de7e45b52a9f6f36b839e578d2319247
 >  - http://autobuild.buildroot.net/results/33d9c10ea58a7cd3b3e2ed75d586007a92ccdaf0
 >  - http://autobuild.buildroot.net/results/f1238081fc94e3004aebb8e849fdd567a92a2d39
 >  - http://autobuild.buildroot.net/results/f7f2cf790f51e6224dca258c52bd31d21d621074

 > Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
