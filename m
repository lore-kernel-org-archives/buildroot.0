Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F23CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 14:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98C7E60FDF;
	Fri, 13 Oct 2023 14:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98C7E60FDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ulZvJrcVzsRT; Fri, 13 Oct 2023 14:35:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDB7060F1F;
	Fri, 13 Oct 2023 14:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDB7060F1F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8754C1BF2F8
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E4B3821B1
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E4B3821B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RSN29Z6K2z1N for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 14:35:54 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 157F48139F
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 157F48139F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63D2FE0010;
 Fri, 13 Oct 2023 14:35:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrJGR-007Izq-Rq; Fri, 13 Oct 2023 16:35:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20230929075844.1145939-1-thomas.devoogdt@barco.com>
 <87zg125yr2.fsf@48ers.dk>
Date: Fri, 13 Oct 2023 16:35:43 +0200
In-Reply-To: <87zg125yr2.fsf@48ers.dk> (Peter Korsgaard's message of "Sun, 01
 Oct 2023 14:10:57 +0200")
Message-ID: <87a5sm614w.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 1/4] package/webkitgtk: require GCC 9 for
 the 2.40.x series
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:
 >> Raise the minimal GCC version to 9.3, which is required since webkitgtk-2.40.0 [1].
 >> Similar to commit ec1ff802df9a0f17dd2b734ba536a5e206aa5aa4,
 >> we do check on >= GCC 9, because we can't check on >= GCC 9.3.

 >> [1] https://github.com/WebKit/WebKit/commit/f9c142d9b5b8c48fe310bc6d3620e634901b2930

 >> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

 > Committed, thanks. What about wpewebkit? This seems to be common code,
 > so we presumably need GCC 9 there as well?

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
