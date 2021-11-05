Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDC4C433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:06:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76C446124A
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76C446124A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A9AC40743;
	Fri,  5 Nov 2021 16:06:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q09kYj-Dd_DO; Fri,  5 Nov 2021 16:06:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FC0C4075B;
	Fri,  5 Nov 2021 16:06:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ACBD31BF2A5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A82114018B
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:06:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zwDk61y0Vkkp for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:06:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85C1D40012
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:06:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 62F801BF205;
 Fri,  5 Nov 2021 16:06:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mj1ja-0007Zk-I2; Fri, 05 Nov 2021 17:06:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211102222127.719703-1-thomas.petazzoni@bootlin.com>
Date: Fri, 05 Nov 2021 17:06:30 +0100
In-Reply-To: <20211102222127.719703-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 2 Nov 2021 23:21:26 +0100")
Message-ID: <87ee7uh9ix.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-unitest-xml-reporting: new
 package
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>, Asaf Kahlon <asafka7@gmail.com>,
 Jeremy Connat <Jeremy.Connat@orolia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Based on initial work from Nicolas Carrier
 > <nicolas.carrier@orolia.com>, with the following additions:

 > - Updated to a newer version
 > - Added proper license file handling
 > - Added runtime test case
 > - Restricted to Python 3.x

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
