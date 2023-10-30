Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8E0C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 22:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50BA5820EC;
	Mon, 30 Oct 2023 22:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50BA5820EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DKoxxHFX_LB2; Mon, 30 Oct 2023 22:00:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4619820D0;
	Mon, 30 Oct 2023 22:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4619820D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D41541BF34E
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 22:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADADC41735
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 22:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADADC41735
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pAL2PyGcUBKr for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 22:00:56 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF56941732
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 22:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF56941732
Received: by mail.gandi.net (Postfix) with ESMTPSA id 908E7C0002;
 Mon, 30 Oct 2023 22:00:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1qxaJX-003dE7-2z;
 Mon, 30 Oct 2023 23:00:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Oleg Lyovin via buildroot <buildroot@buildroot.org>
References: <20231027155221.977752-1-ovlevin@salutedevices.com>
Date: Mon, 30 Oct 2023 23:00:51 +0100
In-Reply-To: <20231027155221.977752-1-ovlevin@salutedevices.com> (Oleg Lyovin
 via buildroot's message of "Fri, 27 Oct 2023 18:52:21 +0300")
Message-ID: <874ji73h4c.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: fix
 package build with gcc 4.8
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
Cc: olegartys@gmail.com, James Hilliard <james.hilliard1@gmail.com>,
 Oleg Lyovin <ovlevin@salutedevices.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Oleg" == Oleg Lyovin via buildroot <buildroot@buildroot.org> writes:

 > python-pycryptodomex uses C99 features like variable
 > declaration in for-loop statement, while old compilers
 > assumes C89 by default.

 > This patch explicitly specifies C99 standard.

 > Change-Id: I934211714307cea43541167fbc72ff30fb66ad5f
 > Signed-off-by: Oleg Lyovin <ovlevin@salutedevices.com>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
