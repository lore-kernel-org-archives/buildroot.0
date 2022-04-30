Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19160C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 10:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94CE340385;
	Sat, 30 Apr 2022 10:59:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiahpfzHZzTC; Sat, 30 Apr 2022 10:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A20F40377;
	Sat, 30 Apr 2022 10:59:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4813D1BF287
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 10:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90D99417B8
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 10:59:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=agner.ch
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WS9e9YzB3Cca for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 10:59:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05454417BE
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 10:59:41 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id E36665C99D0;
 Sat, 30 Apr 2022 12:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1651316378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JxpmfGiisrBf7N/UITOLPrMNHjUwcaB3bdeogQN/lrU=;
 b=AqIUEhETPKhWcyjoR6epBwoleoP+h1OQD1PtuCKDRSbKyVhP2rBZs+5oamHukUsVQ7iOxb
 XyC8jq9zdMxCJZVkgCjwL7QosXsED8WBFUcRIdGlUfdM8+1ErwUjBy8hgrmZmcbKsQ+2Po
 nEmWXXlYw5s6EBI6IWVym+i4z4jH6Pk=
MIME-Version: 1.0
Date: Sat, 30 Apr 2022 12:59:38 +0200
From: Stefan Agner <stefan@agner.ch>
To: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <f3fa9d6c-a440-e146-a07b-b6b95d351295@mind.be>
References: <1f0d993a5097ca6e94a4ded0b7e0c5cb@agner.ch>
 <f3fa9d6c-a440-e146-a07b-b6b95d351295@mind.be>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <2e6a24d9176e2beaaf5108195183406a@agner.ch>
X-Sender: stefan@agner.ch
Subject: Re: [Buildroot] GRUB2 2.04 (buildroot 2022.02.1) failure reading
 sector errors
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-04-30 12:46, Arnout Vandecappelle wrote:
> On 29/04/2022 16:47, Stefan Agner wrote:
<snip>
>> I am considering moving to 2.06 to see if that fixes the problem, is
>> anyone working on 2.06 already? I see that buildroot is carring 150
>> patches on-top of vanilla GRUB2, so that requires some work.
> 
>  (Almost?) all of those patches are backports of upstream, because
> there were a large number of CVEs beginning of 2021 and there was no
> release which included fixes for them.  So updating grub shouldn't be
> that much of a problem.

I've noticed that some of the patches patch files only available in the
tarball release (where autoconf is already run). Not sure how those have
been generated?

In an experiment we used Debian sid 2.06 GRUB2 build on an affected
system, and it seems to suffer the same issue. Which would mean that its
not related to one of the patches, and the issue is also not fixed in
GRUB 2.06. Debian booted fine otherwise on that system, so it must be
related to the squashfs we are using.

It probably still makes sense to move GRUB 2.06, just to be on a release
closer to the current state of development.

Best regards,
Stefan

> 
>  Regards,
>  Arnout
> 
> 
>>
>> Best regards,
>> Stefan
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
