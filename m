Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED73C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:55:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BADA06103D
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BADA06103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 876D6403D4;
	Tue, 19 Oct 2021 17:55:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qkVXea6AooMK; Tue, 19 Oct 2021 17:55:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C433540344;
	Tue, 19 Oct 2021 17:55:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30E6B1BF9AC
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2040D403EC
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:54:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7OIL4mnjOQo for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 17:54:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3620B40134
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 17:54:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 80895100006
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 17:54:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mctK9-0005a2-TA
 for buildroot@buildroot.org; Tue, 19 Oct 2021 19:54:53 +0200
Resent-To: Artem Panfilov via buildroot <buildroot@buildroot.org>
Resent-From: Peter Korsgaard <peter@korsgaard.com>
Resent-Date: Tue, 19 Oct 2021 19:54:53 +0200
Resent-Message-ID: <87bl3kaoia.fsf@dell.be.48ers.dk>
X-From-Line: nobody Sun Oct 17 23:48:05 2021
From: Peter Korsgaard <peter@korsgaard.com>
To: Artem Panfilov via buildroot <buildroot@buildroot.org>
References: <20210929161438.85913-1-artemp@synopsys.com>
Date: Sun, 17 Oct 2021 23:48:05 +0200
In-Reply-To: <20210929161438.85913-1-artemp@synopsys.com> (Artem Panfilov via
 buildroot's message of "Wed, 29 Sep 2021 19:14:38 +0300")
Message-ID: <8735ozfhm2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/lftp: fix build with OpenSSL
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
Cc: Artem Panfilov <Artem.Panfilov@synopsys.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Artem" == Artem Panfilov via buildroot <buildroot@buildroot.org> writes:

 > Add upstream patch from master(0276d5c) that fixes build with OpenSSL.

It is a bit confusing to call it OpenSSL when this is specifically about
LibreSSL, so I've changed that and committed to 2021.02.x and 2021.08.x,
thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
