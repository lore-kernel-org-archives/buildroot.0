Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D60AC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 13:10:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19D5A61BF8
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 13:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19D5A61BF8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE40484405;
	Mon,  4 Oct 2021 13:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3wENOLiATrc4; Mon,  4 Oct 2021 13:10:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A67D8428F;
	Mon,  4 Oct 2021 13:10:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94D211BF2FE
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 13:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 910D5415E5
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 13:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qNGAK1ykmIV0 for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 13:10:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E73E415E3
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 13:10:02 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 41A1820010;
 Mon,  4 Oct 2021 13:09:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXNjC-0000Go-B3; Mon, 04 Oct 2021 15:09:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
References: <20210908133010.31005-1-nicolas.cavallari@green-communications.fr>
 <20210908133010.31005-2-nicolas.cavallari@green-communications.fr>
Date: Mon, 04 Oct 2021 15:09:58 +0200
In-Reply-To: <20210908133010.31005-2-nicolas.cavallari@green-communications.fr>
 (Nicolas Cavallari's message of "Wed, 8 Sep 2021 15:30:10 +0200")
Message-ID: <87r1d1hr6h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libressl: depend on threads
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

>>>>> "Nicolas" == Nicolas Cavallari <nicolas.cavallari@green-communications.fr> writes:

 > If the toolchain does not have threads (e.g. br-arm-full-nothread),
 > compilation fails:

 > In file included from /home/fail/br-test-pkg/br-arm-full-nothread/build/libressl-3.3.3/crypto/cryptlib.c:117:
 > /home/fail/br-test-pkg/br-arm-full-nothread/build/libressl-3.3.3/crypto/../include/compat/pthread.h:114:15: fatal error: pthread.h: No such file or directory
 >   114 | #include_next <pthread.h>
 >       |               ^~~~~~~~~~~
 > compilation terminated.

 > Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
