Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78490EB64D8
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 08:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 286A060F74;
	Fri, 16 Jun 2023 08:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 286A060F74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7s2tRMq2Ufpv; Fri, 16 Jun 2023 08:39:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65EA260AA4;
	Fri, 16 Jun 2023 08:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65EA260AA4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0CCA1BF5E6
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 08:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5C5841F5B
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 08:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5C5841F5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8v8tsvy6te0 for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 08:39:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BD7A41F1D
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BD7A41F1D
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 08:39:34 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8010420002;
 Fri, 16 Jun 2023 08:39:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qA4zT-00FFeq-Mr; Fri, 16 Jun 2023 10:39:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20230614210926.7723-1-romain.naour@smile.fr>
 <87r0qdkyfe.fsf@48ers.dk>
Date: Fri, 16 Jun 2023 10:39:31 +0200
In-Reply-To: <87r0qdkyfe.fsf@48ers.dk> (Peter Korsgaard's message of "Thu, 15
 Jun 2023 08:54:45 +0200")
Message-ID: <87fs6rkdh8.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/qemu: bump to version 8.0.2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:
 >> Fixes CVE-2023-0330:
 >> A vulnerability in the lsi53c895a device affects the latest version of
 >> qemu. A DMA-MMIO reentrancy problem may lead to memory corruption bugs
 >> like stack overflow or use-after-free.

 >> See:
 >> https://lists.gnu.org/archive/html/qemu-devel/2023-06/msg00221.html

 > Committed after marking it a security bump, thanks.

 > Looks like we need to bump 2023.02.x to 7.2.3 for the same fix:

 > https://lists.gnu.org/archive/html/qemu-devel/2023-06/msg00218.html

Committed to 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
