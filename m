Return-Path: <SRS0=OK8R=OO=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866BCC433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 07:56:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B382E60F39
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 07:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B382E60F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CF82403AC;
	Fri, 24 Sep 2021 07:56:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kdvTw912SR3X; Fri, 24 Sep 2021 07:56:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F137400B5;
	Fri, 24 Sep 2021 07:56:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3948C1BF39A
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 07:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28F3B8422A
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 07:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pl2BqjhmWtHy for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 07:56:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7B7984228
 for <buildroot@busybox.net>; Fri, 24 Sep 2021 07:56:14 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id C09AE100005;
 Fri, 24 Sep 2021 07:56:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mTg40-0001sD-Pp; Fri, 24 Sep 2021 09:56:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <CAKAnv4E=JmqtbHR_EM8hL9QTjrSbjNKsBjvA5Ogiv1BYqGDVEQ@mail.gmail.com>
 <b7942247-9f9e-8517-257d-538e96cc6e32@mind.be>
 <20210924090415.24fb5ff4@windsurf>
Date: Fri, 24 Sep 2021 09:56:08 +0200
In-Reply-To: <20210924090415.24fb5ff4@windsurf> (Thomas Petazzoni's message of
 "Fri, 24 Sep 2021 09:04:15 +0200")
Message-ID: <87fstuquef.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] buildroot u-boot.nand oob size
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net, Ivan Riabtsov <ivriabtsov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> lists.buildroot.org is only the website. The mail address is 
 >> buildroot@buildroot.org (or .net, or buildroot@busybox.net, they all end up at 
 >> the same place).

 > This issue was reported on IRC as well. If you read
 > https://lists.buildroot.org/mailman/listinfo/buildroot, it says:

 >   To post a message to all the list members, send email to
 >   buildroot@lists.buildroot.org. 

 > So basically, it tells you to use an e-mail address that doesn't work :-/

Ahh, that is presumably a mailman configuration issue after the latest
changes. Will you report it to osuosl or should I?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
