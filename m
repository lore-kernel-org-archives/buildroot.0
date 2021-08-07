Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D55C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:54:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B969D60EC0
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B969D60EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 744E0401CD;
	Sat,  7 Aug 2021 20:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BjqbbBwTiQJS; Sat,  7 Aug 2021 20:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CE3B40188;
	Sat,  7 Aug 2021 20:54:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 188841BF3F7
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F405A401E3
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d1YC3ZEGy6Om for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 20:54:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A268A401E0
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 20:54:45 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 8AED2440617;
 Sat,  7 Aug 2021 23:54:39 +0300 (IDT)
References: <20210726212334.B7EAE89049@busybox.osuosl.org>
 <874kc2ibaa.fsf@dell.be.48ers.dk>
User-agent: mu4e 1.4.15; emacs 27.1
From: Baruch Siach <baruch@tkos.co.il>
To: Peter Korsgaard <peter@korsgaard.com>
In-reply-to: <874kc2ibaa.fsf@dell.be.48ers.dk>
Date: Sat, 07 Aug 2021 23:54:40 +0300
Message-ID: <87r1f5gelr.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/htop: fix sources location
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Peter,

On Fri, Aug 06 2021, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>  > commit:
>  > https://git.buildroot.net/buildroot/commit/?id=7332bc6eb092a18c506e614fc950c5b697ba1114
>  > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
>  > Change sources location from bintray to github since bintray doesn't
>  > work anymore.
>  > Use commit hash for version instead of git tag to avoid breaking
>  > existing source caches.
>
>  > Signed-off-by: Daniil Stas <daniil.stas@posteo.net>
>  > Cc: Baruch Siach <baruch@tkos.co.il>
>  > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>
> Committed to 2021.02.x and 2021.05.x, thanks.

Not in 2021.05.x as of commit c5adedbc52b5 ("package/irqbalance: use
pkg-config to find numa").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
