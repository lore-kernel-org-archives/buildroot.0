Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464DDC07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:09:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A97E660C41
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A97E660C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74B964028C;
	Tue, 20 Jul 2021 21:09:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVyJRdkeVfd7; Tue, 20 Jul 2021 21:09:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72E524027F;
	Tue, 20 Jul 2021 21:09:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF4FB1BF313
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEB89401BA
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eLcLtAoSv15b for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:09:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id E65C04018D
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:09:07 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.223.176])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 5wzBmOFt2iG5U5wzBmtlR5; Tue, 20 Jul 2021 23:09:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1626815346; bh=uNGJA7qt+Cy+9h9XLs46HaBup+kPLXwuESrVFy3pa94=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=L4U2UwmNve3AtKriZ4GtTGrZLEH7T8TQ2FYz06ROsuAEmX1sHzFgh7vCGssQGogQA
 dqdVhw5gKIS5eErNU9D1U25NtCPcKSpAsAxUweTBJh1iRYiKAWCdll7+5tckFVgb8z
 7dbTJE4TaMTs4I/DUebjypifaM/kPCB96SzMPtsHdo4H4BiN4/EiYzu6/FauD/XaNR
 GFAdQHH18yiQXVrC4ODqwNvnEBZZoHHgm63m8i+1TOv3XbJSfBFJVJg51b/PY5dOHf
 IHcFWnosm+1ZeRNPblkbm75ZN1vOoC+nJ41+RSbtVlHkRTjvi9ZiK5HyKudieGi2ZD
 OTbPK/rW4AH5w==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210612173513.2253959-1-giulio.benetti@benettiengineering.com>
 <20210720224443.24edcd0f@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <900065c9-8832-df20-35ac-ea69cbfe72e4@benettiengineering.com>
Date: Tue, 20 Jul 2021 23:09:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720224443.24edcd0f@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfHRYm7FYbnLw69ODVOj6/2fh0fGUFs2fIcSUyIZynOTw1iGL9RkIKSihu8qWfPqPlCM0HclMW0VhB4s6hWL9a2cyhuTDvfJLoJaIjbe3SKLScYnyESE/
 91IRJskSRg/SEjFqW+hAYxjOusBfQcN3ZV/MwwEf5iJSfz5DW43CBHQUxtQJsTemLD+U/GAMQaNrn1EMhGQBDPmDuuz6CwGCYT8hpR7CZznHJgmoKHvY45RI
 zTknF8eQEnN5CFAYIpARpkcPvitgVuMyDcvCVYWp7YpQZHbmyYw5TyVzd+JqE3e3
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.67
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720210905.5ykLz-ChYGiGQr1mxcQ0x__RsELnVxGgqGURxcaWCik@z>

Hello Thomas,

On 7/20/21 10:44 PM, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> On Sat, 12 Jun 2021 19:35:13 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Note: NSS 3.67(like NSS 3.66) requires NSPR 4.31.
>> Release Notes (not yet available, but should eventually land):
>> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.67_release_notes
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> This patch doesn't apply in master: master has libnss 3.65, and your
> patch assumes a code base that has libnss 3.66.
> 
> Also, according to your reply to this e-mail, libnspr 4.31 is needed as
> a requirement for this bump of libnss, so you should always resend both
> in a single series.

Ah sorry, you're right.

> Could you resend the libnspr and libnss version bumps in a single patch
> series, rebased on master ?


Sure I can. Here there is a "problem" if we can call it that way. It's 
from some month that they release very very fast. Now they are at NSS 
3.68 and NSPR 4.32 [1], but very soon there will be version 3.69. Even 
if I send version bumps, they will release another version before you 
apply for sure. Let's see if it gets slower.
They also stopped emitting the Release Notes that doesn't help[2].

What can I do? Do I send the latest I see in the moment I bump and 
that's it, right?

[1]: https://hg.mozilla.org/projects/nss
[2]: 
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
