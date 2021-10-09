Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D562C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 18:04:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB6B661055
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 18:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB6B661055
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A92C4045D;
	Sat,  9 Oct 2021 18:04:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NAavhmmygQsf; Sat,  9 Oct 2021 18:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA679400E7;
	Sat,  9 Oct 2021 18:04:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBA041BF95F
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 18:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D62C1400E7
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 18:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 76k_ucxdaUtI for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 18:04:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D23F6400A8
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 18:04:34 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D651AFF806;
 Sat,  9 Oct 2021 18:04:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mZGhx-00052t-Km; Sat, 09 Oct 2021 20:04:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
References: <YV8+R2DNGs/T5x9O@waldemar-brodkorb.de>
 <87wnmmv6ot.fsf@dell.be.48ers.dk>
 <YWF5ZK6he2BR5WjQ@waldemar-brodkorb.de>
Date: Sat, 09 Oct 2021 20:04:29 +0200
In-Reply-To: <YWF5ZK6he2BR5WjQ@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Sat, 9 Oct 2021 13:13:40 +0200")
Message-ID: <87o87yrs5u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/uclibc: update to 1.0.39
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
Cc: Waldemar Brodkorb <mail@waldemar-brodkorb.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Hi,
 > Peter Korsgaard wrote,

 >> >>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:
 >> 
 >> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 >> 
 >> Committed, thanks.
 >> 
 >> Your announcement mentions something about a DNS security issue, does
 >> this mean that this should also be backported to the stable branches?

 > Could be not bad.

 >> Is there an advisory or a CVE available?

 > Not yet as I know.
 > I asked the reporter on Thursday if they managed to open one.

Ok.

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
