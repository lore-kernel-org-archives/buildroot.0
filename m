Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18577C27C40
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 21:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9A9541D6D;
	Thu, 24 Aug 2023 21:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9A9541D6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d2alAezzuleI; Thu, 24 Aug 2023 21:10:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBA5041B99;
	Thu, 24 Aug 2023 21:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBA5041B99
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20D3B1BF84C
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0130E833CA
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0130E833CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dgxWwWQQYSAh for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 21:10:29 +0000 (UTC)
X-Greylist: delayed 121680 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 24 Aug 2023 21:10:28 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA00F83083
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA00F83083
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 21:10:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65CFF40003;
 Thu, 24 Aug 2023 21:10:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qZHay-002HpI-HM; Thu, 24 Aug 2023 23:10:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Afshin Pir <Afshin.Pir@gallagher.com>
References: <SY2PR01MB2778500474B41D29E8E7D54C940AA@SY2PR01MB2778.ausprd01.prod.outlook.com>
 <20230801121118.72610acf@windsurf>
 <SY2PR01MB2778DE94AA435DAE575AAFD7940BA@SY2PR01MB2778.ausprd01.prod.outlook.com>
Date: Thu, 24 Aug 2023 23:10:24 +0200
In-Reply-To: <SY2PR01MB2778DE94AA435DAE575AAFD7940BA@SY2PR01MB2778.ausprd01.prod.outlook.com>
 (Afshin Pir's message of "Wed, 2 Aug 2023 22:30:03 +0000")
Message-ID: <87y1i0cfjz.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] Update schedule of sources.buildroot.org
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Afshin" == Afshin Pir <Afshin.Pir@gallagher.com> writes:

 > Hi,

 > I wonder if you have found out the problem and is there any ETA for
 > when it will be resolved?

I'm back and now had time to investigate. The problem is the following
commit that got added at the end of July:

commit 08171f1fd0c31165a39d79389300ddf9adb5bbb6
Author: Bernd Kuhls <bernd@kuhls.net>
Date:   Sun Jul 16 09:28:33 2023 +0200

    support/dependencies/dependencies.sh: require IPC::Cmd perl package for libopenssl

The machine handling s.b.o did not have the IPC::Cmd perl module
installed, so all the source update runs would fail. I've now installed
that and started a s.b.o update.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
