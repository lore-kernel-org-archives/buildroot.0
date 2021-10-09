Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB153C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 11:51:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A1CB60F58
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 11:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A1CB60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16B744056D;
	Sat,  9 Oct 2021 11:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yw9zmmnlDc4b; Sat,  9 Oct 2021 11:51:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33AF240502;
	Sat,  9 Oct 2021 11:51:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA0AD1BF36E
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 11:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9ED582FF9
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 11:51:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLqRJ0NFbnbT for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 11:51:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B182382F8A
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 11:51:45 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 262F3E0004
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 11:51:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mZAtD-00045O-H6
 for buildroot@buildroot.org; Sat, 09 Oct 2021 13:51:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20211008115304.19930-1-peter@korsgaard.com>
 <87r1cuy34b.fsf@dell.be.48ers.dk>
Date: Sat, 09 Oct 2021 13:51:43 +0200
In-Reply-To: <87r1cuy34b.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 09 Oct 2021 11:11:16 +0200")
Message-ID: <87czoetnzk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/squid: security bump to version 4.17
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
 >> Fixes the following security issue:
 >> - SQUID-2020:12 Out-Of-Bounds memory access in WCCPv2
 >> (CVE-2021-28116 aka ZDI-CAN-11610)

 >> Due to an out of bounds memory access Squid is vulnerable to an
 >> information leak vulnerability when processing WCCPv2 messages.

 >> This problem allows a WCCPv2 sender to corrupt Squids list of
 >> known WCCP routers and divert client traffic to attacker
 >> controlled routers.

 >> This attack is limited to Squid proxy with WCCPv2 enabled and
 >> IP spoofing of a router IP address configured as trusted in
 >> squid.conf.

 >> For more details, see the advisory:
 >> http://lists.squid-cache.org/pipermail/squid-announce/2021-October/000136.html

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Committed, thanks.

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
