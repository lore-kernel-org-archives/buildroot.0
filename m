Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2996CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 10:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 628A161518;
	Fri, 13 Oct 2023 10:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 628A161518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nk_aOO2Xofyv; Fri, 13 Oct 2023 10:23:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4AFA61504;
	Fri, 13 Oct 2023 10:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4AFA61504
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32FE11BF349
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 10:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C1CD61512
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 10:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C1CD61512
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TFwVAFc6dMTD for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 10:23:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C47C461513
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 10:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C47C461513
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7D77E0006;
 Fri, 13 Oct 2023 10:23:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrFK2-0073Q8-Eq; Fri, 13 Oct 2023 12:23:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20230930221348.6363783D49@busybox.osuosl.org>
Date: Fri, 13 Oct 2023 12:23:10 +0200
In-Reply-To: <20230930221348.6363783D49@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 1 Oct 2023 00:13:20 +0200")
Message-ID: <87v8ba6ctt.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/rockchip-mali: fix hash of
 generated archive
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=f7f2de3da7e1a5af4e2773ff6bb9e528159be7d3
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The "official" repository we used to reference disapeared quite some
 > time ago, so in commit 8c25838b53e6 (package/rockchip-mali: fix build
 > failure due to missing URL) we switched to using a mirror.

 > The tarballs generated on the Github side have a top-level directory
 > that is named "repo-name-HASH", so when we switched to a repository
 > named "libmali" to one named "mirrors", the content of the generated
 > tarball changed, even though the content of the files did not.

 > We can't just change the hash to the new value, or that would conflict
 > with thecopy on s.b.o and older versions of Buildroot.

 > So, we drop one cahr from the commit hash, which eans the tarball name
 > changes, and thus we can calculate a new hash for that tarball, and
 > there will be no conflict with any existing tarball on s.b.o.

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
