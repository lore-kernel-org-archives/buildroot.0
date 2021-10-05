Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACB2C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 06:20:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1628D61247
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 06:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1628D61247
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B824740738;
	Tue,  5 Oct 2021 06:20:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zBVfW6_Ekl30; Tue,  5 Oct 2021 06:20:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 380894072B;
	Tue,  5 Oct 2021 06:20:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA9541BF3C9
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 06:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A22D83C36
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 06:20:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVzxO9OeGWJo for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 06:20:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79E2483C34
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 06:20:30 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 815B924000D;
 Tue,  5 Oct 2021 06:20:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXdoO-0002ta-Lv; Tue, 05 Oct 2021 08:20:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Petr Vorel <petr.vorel@gmail.com>
References: <20210921210438.41808-1-petr.vorel@gmail.com>
 <20210921210438.41808-3-petr.vorel@gmail.com>
Date: Tue, 05 Oct 2021 08:20:24 +0200
In-Reply-To: <20210921210438.41808-3-petr.vorel@gmail.com> (Petr Vorel's
 message of "Tue, 21 Sep 2021 23:04:38 +0200")
Message-ID: <87ilycdmc7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH v3 2/2] utils/scanpypi: remove python2
 compatibility imports
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
 David Laight <David.Laight@ACULAB.COM>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > ee8b680816 ("utils/scanpypi: use python3 explicitly") started to use python3,
 > thus compatibility can be removed:

 > from __future__ import print_function
 > from __future__ import absolute_import

 > Tested with python3 -m py_compile.

 > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
