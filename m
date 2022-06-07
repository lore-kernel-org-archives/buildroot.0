Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A71EC43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 14:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2874E613F4;
	Tue,  7 Jun 2022 14:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SjKU2HGH4SP5; Tue,  7 Jun 2022 14:01:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03F5860FA5;
	Tue,  7 Jun 2022 14:01:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 370721BF360
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 268B242498
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id trWXJNwFtdKb for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 14:00:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 150D542491
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 14:00:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E2F6FFF80F;
 Tue,  7 Jun 2022 14:00:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nyZlP-0007gQ-Vz; Tue, 07 Jun 2022 16:00:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <Yoe28imNyGUIMxBi@waldemar-brodkorb.de>
 <20220601234811.55ecbd5a@windsurf>
Date: Tue, 07 Jun 2022 16:00:55 +0200
In-Reply-To: <20220601234811.55ecbd5a@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 1 Jun 2022 23:48:11 +0200")
Message-ID: <874k0w7eug.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/uclibc: update to 1.0.41
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Fri, 20 May 2022 17:42:42 +0200
 > Waldemar Brodkorb <wbx@openadk.org> wrote:

 >> Fixes CVE-2022-30295.
 >> 
 >> See here:
 >> https://www.nozominetworks.com/blog/nozomi-networks-discovers-unpatched-dns-bug-in-popular-c-standard-library-putting-iot-at-risk/
 >> 
 >> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 >> ---
 >> package/uclibc/uclibc.hash | 4 ++--
 >> package/uclibc/uclibc.mk   | 2 +-
 >> 2 files changed, 3 insertions(+), 3 deletions(-)

 > Applied to master, thanks. I've changed the commit title to "security
 > bump to 1.0.41". For future security related version bumps, please make
 > sure that the commit title includes "security" so that it gets handled
 > in priority.

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
