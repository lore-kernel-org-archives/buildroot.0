Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4232EC433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 12:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD98F41849;
	Fri, 27 May 2022 12:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-2COA5LUqIJ; Fri, 27 May 2022 12:44:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECCC2417E9;
	Fri, 27 May 2022 12:44:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3C291BF3D1
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 12:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F15EF84B3B
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 12:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQ9epqVC4h4c for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 12:44:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBA5C84B39
 for <buildroot@buildroot.org>; Fri, 27 May 2022 12:44:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3082E20002;
 Fri, 27 May 2022 12:44:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuZK8-001vu3-M1; Fri, 27 May 2022 14:44:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <20220427035556.1814178-1-james.hilliard1@gmail.com>
 <87zgj3jp4g.fsf@dell.be.48ers.dk> <87h75brz4z.fsf@tarshish>
Date: Fri, 27 May 2022 14:44:12 +0200
In-Reply-To: <87h75brz4z.fsf@tarshish> (Baruch Siach's message of "Fri, 27 May
 2022 14:29:29 +0300")
Message-ID: <87k0a7i1r7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: fix unsafe openssl
 header path
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Fri, May 27 2022, Peter Korsgaard wrote:
 >>>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
 >> 
 >> > Explicitely set the openssl path so that python3 doesn't search host
 >> > header paths for target openssl headers.
 >> 
 >> > Fixes:
 >> >  - http://autobuild.buildroot.net/results/c27/c27fe795e079350dd1c9af45be417d41b55e57c3
 >> 
 >> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 >> 
 >> Committed to 2022.02.x, thanks.

 > Not in 2022.02.x as of commit 15e59056c47 ("package/vim: security bump
 > to version 8.2.4843").

Ups, fixed now - Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
