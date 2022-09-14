Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE7CECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 09:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42EFA40B60;
	Wed, 14 Sep 2022 09:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42EFA40B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4BUBrJgXiM5N; Wed, 14 Sep 2022 09:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A751404AF;
	Wed, 14 Sep 2022 09:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A751404AF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12BE31BF355
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFEBF60701
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFEBF60701
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lEUMfcPeSiau for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 09:11:02 +0000 (UTC)
X-Greylist: delayed 18:55:39 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 764A560655
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 764A560655
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 09:11:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A3C2340007;
 Wed, 14 Sep 2022 09:10:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oYOQ2-003ylB-I6; Wed, 14 Sep 2022 11:10:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220625224224.1446787-1-christian@paral.in>
 <20220803000627.74f6a12f@windsurf>
Date: Wed, 14 Sep 2022 11:10:54 +0200
In-Reply-To: <20220803000627.74f6a12f@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 3 Aug 2022 00:06:27 +0200")
Message-ID: <875yhqs4m9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gocryptfs: fix build against
 riscv
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sat, 25 Jun 2022 15:42:24 -0700
 > Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

 >> Replace dependency jacobsa/crypto with a fork with support for riscv64.
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.net/results/caa60874781c4077273884eb37281cc9e02ef9ac/
 >> - https://github.com/rfjakob/gocryptfs/issues/666
 >> 
 >> Upstream PR: https://github.com/jacobsa/crypto/issues/13
 >> 
 >> Signed-off-by: Christian Stewart <christian@paral.in>
 >> ---
 >> ...-fix-jacobsa-crypto-build-on-riscv64.patch | 152 ++++++++++++++++++
 >> 1 file changed, 152 insertions(+)
 >> create mode 100644 package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch

 > Applied to master, thanks.

Committed to 2022.05.x (no go riscv64 support in 2022.02.x), thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
