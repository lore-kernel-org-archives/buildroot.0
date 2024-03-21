Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D589AC6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 20:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EC0B81DAB;
	Thu, 21 Mar 2024 20:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id muQpKYjKx1hJ; Thu, 21 Mar 2024 20:15:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A502F81EFF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A502F81EFF;
	Thu, 21 Mar 2024 20:15:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 288941BF2BD
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 20:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14CF081EFF
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 20:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A3FJowdwnOoP for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 20:15:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A32E81DAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A32E81DAB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A32E81DAB
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 20:15:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BFC9FF805;
 Thu, 21 Mar 2024 20:15:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rnOp3-005WS3-2N;
 Thu, 21 Mar 2024 21:15:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240211222706.2959549-1-thomas.petazzoni@bootlin.com>
 <82397d49-8d5a-4349-aef5-50e83e5a9b40@bubu1.eu>
 <87wmq8sjtn.fsf@48ers.dk>
Date: Thu, 21 Mar 2024 21:15:33 +0100
In-Reply-To: <87wmq8sjtn.fsf@48ers.dk> (Peter Korsgaard's message of "Mon, 11
 Mar 2024 19:29:56 +0100")
Message-ID: <87v85f734q.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/util-linux: bump to version 2.39.3
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 >> Likely due to
 >> https://github.com/util-linux/util-linux/commit/fdd9f11f5e38b044617d3bc5f6c00789096b233f

 >> Which as far as I read it doesn't change any licensing but clarifies
 >> in the top level license readme that part of the code base (fdisk.c)
 >> is GPL-1.0-or-later licensed which wasn't mentioned before. The file
 >> in question already had correct license information before.

 > Agreed. Committed with that fixed and added an autobuilder fix line, thanks.

Committed to 2024.02.x and 2023.11.x, thanks.


 > -- 
 > Bye, Peter Korsgaard
 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
