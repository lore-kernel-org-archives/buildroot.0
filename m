Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA64C4167B
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 10:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 874A54F586;
	Mon, 30 Oct 2023 10:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 874A54F586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZLKKx_LMi2Vb; Mon, 30 Oct 2023 10:13:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0FD14F4BF;
	Mon, 30 Oct 2023 10:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0FD14F4BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60D981BF408
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A44C4F4BF
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A44C4F4BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kFIRwz-uoZae for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 10:13:42 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD1694F4B0
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 10:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD1694F4B0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 251481BF207;
 Mon, 30 Oct 2023 10:13:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1qxPH7-000ndv-2F;
 Mon, 30 Oct 2023 11:13:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sergey Bobrenok via buildroot <buildroot@buildroot.org>
References: <20231024153023.19173-1-sibobrenok@salutedevices.com>
Date: Mon, 30 Oct 2023 11:13:37 +0100
In-Reply-To: <20231024153023.19173-1-sibobrenok@salutedevices.com> (Sergey
 Bobrenok via buildroot's message of "Tue, 24 Oct 2023 18:30:23 +0300")
Message-ID: <87o7gg5sfi.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-kernel-module: add
 BR2_MAKE_HOST_DEPENDENCY
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
Cc: Sergey Bobrenok <SIBobrenok@sberdevices.ru>,
 Alexey Romanov <avromanov@sberdevices.ru>,
 Sergey Bobrenok <sibobrenok@salutedevices.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Sergey" == Sergey Bobrenok via buildroot <buildroot@buildroot.org> writes:

 > From: Alexey Romanov <avromanov@sberdevices.ru>
 > Commit 0b9efc991f ("linux: use BR2_MAKE") switched LINUX_MAKE to
 > $(BR2_MAKE) to avoid build issue with kernel version >= 6.2 and GNU
 > Make version < 3.82. However, the same issue is actual for kernel
 > modules as well.

 > Using $(BR2_MAKE) should guarantee a consistent behavior between
 > kernel and kernel-modules builds.

 > Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
 > Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
