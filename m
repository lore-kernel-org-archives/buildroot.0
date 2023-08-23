Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A779CC3DA66
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 19:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DDFA81CC3;
	Wed, 23 Aug 2023 19:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DDFA81CC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lW8MXF6-DKfN; Wed, 23 Aug 2023 19:12:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6088E81E61;
	Wed, 23 Aug 2023 19:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6088E81E61
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B18C81BF340
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 19:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B30E40CA6
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 19:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B30E40CA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wcdYBQRCDBUi for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 19:12:20 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06848400C8
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 19:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06848400C8
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id BD89B780304;
 Wed, 23 Aug 2023 21:12:15 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54718])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Aug 2023 21:12:15 +0200
MIME-Version: 1.0
Date: Wed, 23 Aug 2023 21:12:15 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230822234113.12dd618b@windsurf>
References: <20230822194922.71368-1-ju.o@free.fr>
 <20230822234113.12dd618b@windsurf>
User-Agent: Webmail Free/1.6.1
Message-ID: <695d398827606c825566d544ee8665c5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692817936;
 bh=EH8US5fbEXkzyKHlGL3/wE2c0kIGAr6UpBR1MlMLq74=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NgjEp23L8veGsH98Qos6P6GidNJ88254OLRAX03f4XDnOktqktCTCK2CsGlJWh0EV
 40KM/qoJvTe+QR/U4s9XKzQoGVZyx1Oo1mwvpMFdJz3uhRF8UCjppnE+OJRXdCSptz
 AZXGhJWWMut73KQ+gbmBtWPWZzFzSGn628Imwd75lv1l994aN9m01nLMHvtgitcOF/
 JioQN+2NRYp98SdhxkhIqygzYF4+QWIdix2ogz2vqxIxSpO72D9K/ALAX8HkmpgAv9
 SYmT/c3V4CpRQ3nDc7CT1FflK3CHmrR0LxKnvD06cX8XpDm8wJunySbC0jMA5glvow
 /AgxwftP9ASOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NgjEp23L
Subject: Re: [Buildroot] [PATCH 1/2] package/screen: security bump to
 version 4.9.1
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


   Hi Thomas,

On 22/08/2023 23:41, Thomas Petazzoni wrote:
> On Tue, 22 Aug 2023 21:49:21 +0200
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> See release announce:
>> https://lists.gnu.org/archive/html/screen-users/2023-08/msg00000.html
>> 
>> Fixes:
>> CVE-2023-24626: https://www.cve.org/CVERecord?id=CVE-2023-24626
>> 
>> Note: Buildroot installs screen as setuid, so the described scenario
>> in CVE applies.
>> 
>> This commit also rebases all patches on this release. Patch were
>> regenerated with 'git format-patch -N', so patch file name changed in
>> this process. The file .checkpackageignore is also updated 
>> accordingly.
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> You posted this as PATCH 1/2, but I don't see any PATCH 2/2. Is this
> just a mistake?

This is not a mistake. It is more an unfortunate technical issue. My
original series was including a new screen runtime test in patch 2/2.

I'll shortly explain, because this situation might happen again: my
internet provider smtp (namely smtp.free.fr) decided few month ago to
deploy an "AI based" anti-spam filter. Apparently, the thing was not
trained enough on "git send-email" content. This generates many false
positives, specifically on runtime tests. I'm working with the
postmaster to solve the issue and complete this series when
possible. Sorry about that.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
