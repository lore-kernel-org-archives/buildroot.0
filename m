Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA09C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:28:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C820260527
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C820260527
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74BA880D83;
	Tue, 26 Oct 2021 12:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vq4aRv_KfRZM; Tue, 26 Oct 2021 12:27:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBC2580E24;
	Tue, 26 Oct 2021 12:27:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0ED3A1BF38D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F18C840270
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wM0Kd6QbUlb6 for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 12:27:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9817D401EF
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:27:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 94F8A200002;
 Tue, 26 Oct 2021 12:27:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mfLYP-0006Yq-Rl; Tue, 26 Oct 2021 14:27:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Paul Cercueil <paul@crapouillou.net>
References: <20211018214014.1202-1-matthew.weber@collins.com>
 <20211018214014.1202-2-matthew.weber@collins.com>
 <FYZI1R.QAI4TMAEMRIG2@crapouillou.net>
 <SN5P110MB0480C708DCA6CEC9E1765471F2839@SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM>
 <V9BJ1R.G7Z0UMF2MZVF@crapouillou.net>
Date: Tue, 26 Oct 2021 14:27:45 +0200
In-Reply-To: <V9BJ1R.G7Z0UMF2MZVF@crapouillou.net> (Paul Cercueil's message of
 "Mon, 25 Oct 2021 14:10:43 +0100")
Message-ID: <87sfwot1ha.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [External] Re: [PATCH 2/2] package/lightning:
 [revert]ignore not applicable CVE-2020-7747
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
Cc: buildroot@buildroot.org, "Weber,
 Matthew L Collins" <Matthew.Weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

Hi,

 >>> I still get the emails about CVEs in Lightning though :(
 >>> I just got one a few hours ago.
 >> 
 >> The changes to resolve that were merged on master last week and I
 >> noticed today that Peter applied them to the long term support
 >> branch (probably after you received that email).  Which branch did
 >> the email list CVE against?

 > I get those emails for the 2021.02.x and 2021.08.x branches.

You shouldn't get them any more. Please let me know if you do.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
