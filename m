Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86D5C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 09:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7841681ECA;
	Wed, 15 Feb 2023 09:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7841681ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdRL_7K2dNpS; Wed, 15 Feb 2023 09:22:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C053081EAC;
	Wed, 15 Feb 2023 09:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C053081EAC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A84C1BF255
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 09:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 356E3400CF
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 09:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 356E3400CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kpSGS5Og9-Vo for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 09:22:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D860400B8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D860400B8
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 09:22:24 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3447260002;
 Wed, 15 Feb 2023 09:22:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pSDza-004qdt-5m; Wed, 15 Feb 2023 10:22:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: thomas@devoogdt.com
References: <20230211182546.633728-1-thomas@devoogdt.com>
 <20230211182546.633728-3-thomas@devoogdt.com>
Date: Wed, 15 Feb 2023 10:22:22 +0100
In-Reply-To: <20230211182546.633728-3-thomas@devoogdt.com>
 (thomas@devoogdt.com's message of "Sat, 11 Feb 2023 19:25:45 +0100")
Message-ID: <87pmab471t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 3/3] package/fluent-bit: fix builds on
 s390x architectures
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "thomas" == thomas  <thomas@devoogdt.com> writes:

 > From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
 > Fixes:
 >  - http://autobuild.buildroot.net/results/856fd250f75a696694c70e3208ffcef7470a7082
 >  - http://autobuild.buildroot.net/results/dceb413fb5d459338417d8dd5a42d95aa23e849b

 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
 > ---
 >   v2: new patch in this serie

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
