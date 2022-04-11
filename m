Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073D3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 04:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D15F415B5;
	Mon, 11 Apr 2022 04:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5mQeWrBfuux; Mon, 11 Apr 2022 04:09:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 125D8415AE;
	Mon, 11 Apr 2022 04:09:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5A011BF36A
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 04:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2AA4402B1
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 04:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KDfbwmK_WrTO for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 04:09:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E1D9400BA
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 04:09:52 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 3059B440B04;
 Mon, 11 Apr 2022 07:09:17 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1649650157;
 bh=pkp/opQKqtrG/71mv9EXoOtf8lHmMRTk04vJogTtAe8=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=RQErty+mmGCvvt4xab4bePMsBsr2ml9zeuz5gPMd+4b46VQqWG/EKtAZ18iXDmZvF
 voBKo49b9m69TzSWVaybH5z+Yguc/NouXeQUtQRZZ+keCQlL14Dbf7WRJyi/iLPzyL
 ScAxE8gJbB9G8Jf7IFFEao9nDusAGiA5rh42PDSCRrcSPYBf9XjaHdq7TOuYi5HJP+
 XpRHrce0QuiP13tnWr7kb3YRwi2/OpVxZuOra8j0YAgGcdD1EATtBt6jfovtbn7j1U
 /yIPoUO0csu/PFf/y5vpaCYCdPKamk8Z6ZdtolEkIAmr6qkxFFHfaYtwBR0hwYQZlk
 c+3rjqOoaxwAA==
References: <20220405012059.2680327-1-james.hilliard1@gmail.com>
 <877d7wogm1.fsf@dell.be.48ers.dk>
User-agent: mu4e 1.6.10; emacs 27.1
To: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Apr 2022 07:08:53 +0300
In-reply-to: <877d7wogm1.fsf@dell.be.48ers.dk>
Message-ID: <87pmlodzw4.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] linux/linux.mk: ensure custom kernel
 version is set
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Sun, Apr 10 2022, Peter Korsgaard wrote:
>>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>
>  > Validate that BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE is set when
>  > required.
>
>  > Fixes:
>  > http://autobuild.buildroot.net/results/117/117c08e414776202446a9fdb96d084aa3c16af48
>
>  > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Committed to 2022.02.x, thanks.

Not in 2022.02.x as of commit 989c7c8f7b6e ("package/vim: security bump
to version 8.2.4732").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
