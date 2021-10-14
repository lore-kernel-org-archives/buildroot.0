Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B88EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:29:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 873C461130
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 873C461130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C8E140591;
	Thu, 14 Oct 2021 20:29:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIXWbrDH8e0o; Thu, 14 Oct 2021 20:29:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1DA340460;
	Thu, 14 Oct 2021 20:29:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1258D1BF599
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E53F40460
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:29:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dizYxucu-fnf for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 20:29:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6961D4039A
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 20:29:25 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id DAF28240002;
 Thu, 14 Oct 2021 20:29:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mb7Lt-00036i-1c; Thu, 14 Oct 2021 22:29:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20211013114809.25474-1-peter@korsgaard.com>
Date: Thu, 14 Oct 2021 22:29:21 +0200
In-Reply-To: <20211013114809.25474-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 13 Oct 2021 13:48:08 +0200")
Message-ID: <87k0ifnye6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH-2021.02.x] package/systemd: security bump to
 version 247.9
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2020-13529: An exploitable denial-of-service vulnerability exists in
 >   Systemd 245.  A specially crafted DHCP FORCERENEW packet can cause a
 >   server running the DHCP client to be vulnerable to a DHCP ACK spoofing
 >   attack.  An attacker can forge a pair of FORCERENEW and DCHP ACK packets
 >   to reconfigure the server.
 >   https://talosintelligence.com/vulnerability_reports/TALOS-2020-1142

 > - CVE-2021-33910: Denial of Service (Stack Exhaustion) in systemd (PID 1)
 >   https://blog.qualys.com/vulnerabilities-threat-research/2021/07/20/cve-2021-33910-denial-of-service-stack-exhaustion-in-systemd-pid-1

 > Update hash of README for a change of IRC network:
 > -        #systemd on irc.freenode.org
 > +        #systemd on irc.libera.chat

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
