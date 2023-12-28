Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99D2C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 10:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E866400CB;
	Thu, 28 Dec 2023 10:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E866400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJXONSp6UDSb; Thu, 28 Dec 2023 10:46:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40DE440494;
	Thu, 28 Dec 2023 10:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40DE440494
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 297C31BF316
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 10:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEC7D417EC
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 10:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEC7D417EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQ7vhC4bIXSq for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 10:46:47 +0000 (UTC)
Received: from relay3.mail.vrmd.de (relay3.mail.vrmd.de [81.28.224.24])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD1F741773
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 10:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD1F741773
Received: from [2a00:1c38:1:1:511c:e03c::] (helo=webmail.variomedia.de)
 by relay3.mail.vrmd.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <mail@sebastianbauer.info>)
 id 1rInuW-001CHo-FI; Thu, 28 Dec 2023 11:46:44 +0100
MIME-Version: 1.0
Date: Thu, 28 Dec 2023 11:46:42 +0100
From: Sebastian Bauer <mail@sebastianbauer.info>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <ZYyiB4POkcCnTbd6@landeda>
References: <20231227182429.1215185-1-mail@sebastianbauer.info>
 <20231227182429.1215185-2-mail@sebastianbauer.info>
 <ZYyiB4POkcCnTbd6@landeda>
Message-ID: <1bdef4089fb978901f6afe221af0b456@sebastianbauer.info>
X-Sender: mail@sebastianbauer.info
X-Relay-User: mail@sebastianbauer.info
Subject: Re: [Buildroot] [PATCH 2/3] packages/libcamera: Fix libcamera build
 with rpi pipeline
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 2023-12-27 23:15, schrieb Yann E. MORIN:
> On 2023-12-27 19:24 +0100, Sebastian Bauer spake thusly:
>> The name of the pipeline was renamed from raspberrypi to rpi/vc4 in
>> version 0.1.0 of libcamera, which is why, without this fix, the build 
>> is
>> broken.
> As Peter pointed out, his patch is a bit more complete, so I ended up
> applying his patch.

Yes, I agree. I didn't know that there was another patch pending (I have 
not yet figured out how to search through patches). Thanks for fixing 
the problem!

Bye
Sebastian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
