Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499DFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 18:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B399D4090B;
	Thu, 10 Feb 2022 18:56:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-R2Kd-RWg01; Thu, 10 Feb 2022 18:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09196408F9;
	Thu, 10 Feb 2022 18:56:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 049891BF407
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 18:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7EA060B1D
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2j4yolWexBN for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 18:56:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B986760B0C
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 18:56:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 670A7240008;
 Thu, 10 Feb 2022 18:56:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nIEcX-0000Do-BE; Thu, 10 Feb 2022 19:56:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220210075821.493485-1-fontaine.fabrice@gmail.com>
Date: Thu, 10 Feb 2022 19:56:45 +0100
In-Reply-To: <20220210075821.493485-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 10 Feb 2022 08:58:21 +0100")
Message-ID: <87h796wnwy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/omniorb: switch to host-python3
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Switch to host-python3 which is supported since version 4.2.1 and
 > https://sourceforge.net/p/omniorb/svn/HEAD/tree/tags/4_2_1/omniORBpy/update.log
 > to avoid the following build failure since removal of host-python in
 > commit 2743ce00ca61fde1537b64a165a69d497052be58:

 > make: *** No rule to make target 'host-python', needed by
 > '/home/buildroot/autobuild/instance-1/output-1/build/host-omniorb-4.3.0/.stamp_configured'.
 > Stop.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d415c2501b27cacf2356f0f6924ee7706d7a4070

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
