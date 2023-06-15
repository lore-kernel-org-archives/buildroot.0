Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC24EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 06:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CC8A4172D;
	Thu, 15 Jun 2023 06:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CC8A4172D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XTuPqQG3ft0f; Thu, 15 Jun 2023 06:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C41C0405E3;
	Thu, 15 Jun 2023 06:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C41C0405E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D91C11BF48C
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 06:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B067F409B6
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 06:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B067F409B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zJSisx-aTG-A for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 06:54:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95A37408CE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95A37408CE
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:54:47 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE81C1BF208;
 Thu, 15 Jun 2023 06:54:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9gsX-00A7Xw-23; Thu, 15 Jun 2023 08:54:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20230614210926.7723-1-romain.naour@smile.fr>
Date: Thu, 15 Jun 2023 08:54:45 +0200
In-Reply-To: <20230614210926.7723-1-romain.naour@smile.fr> (Romain Naour's
 message of "Wed, 14 Jun 2023 23:09:26 +0200")
Message-ID: <87r0qdkyfe.fsf@48ers.dk>
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

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Fixes CVE-2023-0330:
 > A vulnerability in the lsi53c895a device affects the latest version of
 > qemu. A DMA-MMIO reentrancy problem may lead to memory corruption bugs
 > like stack overflow or use-after-free.

 > See:
 > https://lists.gnu.org/archive/html/qemu-devel/2023-06/msg00221.html

Committed after marking it a security bump, thanks.

Looks like we need to bump 2023.02.x to 7.2.3 for the same fix:

https://lists.gnu.org/archive/html/qemu-devel/2023-06/msg00218.html

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
