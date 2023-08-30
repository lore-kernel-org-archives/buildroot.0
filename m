Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772EAC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 08:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0330C8216F;
	Wed, 30 Aug 2023 08:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0330C8216F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3xRBdvkyYMeu; Wed, 30 Aug 2023 08:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65F838210D;
	Wed, 30 Aug 2023 08:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65F838210D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F0D51BF40D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 08:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EDBB60F10
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 08:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EDBB60F10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4MOW_ag_akR4 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 08:13:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FF6660F05
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 08:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FF6660F05
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56635FF80A;
 Wed, 30 Aug 2023 08:13:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qbGK7-008s6z-DH; Wed, 30 Aug 2023 10:13:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Frank Vanbever <frank.vanbever@mind.be>
References: <20230713161139.182388-1-frank.vanbever@mind.be>
 <87il917em8.fsf@48ers.dk> <5966703.lOV4Wx5bFT@wintermute>
Date: Wed, 30 Aug 2023 10:13:11 +0200
In-Reply-To: <5966703.lOV4Wx5bFT@wintermute> (Frank Vanbever's message of
 "Wed, 30 Aug 2023 09:29:33 +0200")
Message-ID: <87ttsh0wyw.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2023.02.x] package/libmodsecurity: backport
 security fix for CVE-2023-28882
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
Cc: Frank Vanbever via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Frank" == Frank Vanbever <frank.vanbever@mind.be> writes:

 > Hi Peter,
 > I believe your assessment is right, at this point it would be best to backport 
 > the bump to 3.0.10 on master to the stable branches and get rid of multiple 
 > CVEs at the same time. Do I resubmit that patch or do you take it directly 
 > from master?

OK, good. I'll backport it when I finish synching 2023.02.x with master
(I'm currently running a few weeks behind because of the holidays).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
