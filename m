Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752D7C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2897A813E3;
	Sun, 13 Nov 2022 21:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2897A813E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HWSrNYZUjZFf; Sun, 13 Nov 2022 21:19:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73169813DF;
	Sun, 13 Nov 2022 21:19:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73169813DF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CFD81BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 571564006B
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 571564006B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BMp-qOF8LZcX for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:18:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CB5C40061
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CB5C40061
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:18:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5873CE0002;
 Sun, 13 Nov 2022 21:18:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouKNT-005deh-8m; Sun, 13 Nov 2022 22:18:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Wolfgang Grandegger <wg@grandegger.com>
References: <44ae3630-5f21-54d4-8d77-9cb9fa137289@grandegger.com>
Date: Sun, 13 Nov 2022 22:18:55 +0100
In-Reply-To: <44ae3630-5f21-54d4-8d77-9cb9fa137289@grandegger.com> (Wolfgang
 Grandegger's message of "Fri, 7 Oct 2022 09:27:37 +0200")
Message-ID: <87wn7ymu2o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/udisks: install to staging
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:

 > UDisks2 provides a Library API [1] for accessing the UDisks2 service
 > via "libudisks2.so". For development of UDisks2 clients, install to
 > staging as well!

 > [1] http://storaged.org/doc/udisks2-api/2.9.4/ref-library.html

 > Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
 > ---

 > -Changes since v1:
 >   Remove note about the reported bug and add authors listed by
 >   "utils/get-developers".

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
