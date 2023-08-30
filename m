Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5406CC83F14
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 11:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD6C48223B;
	Wed, 30 Aug 2023 11:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD6C48223B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9YONCErDWq6j; Wed, 30 Aug 2023 11:40:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EFDD8201D;
	Wed, 30 Aug 2023 11:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EFDD8201D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87C431BF42D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DD9541BBF
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DD9541BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZUDRiz2273T9 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 11:40:17 +0000 (UTC)
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF54841B8C
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 11:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF54841B8C
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id C8D21440E97;
 Wed, 30 Aug 2023 14:39:27 +0300 (IDT)
References: <20230727162340.3303969-1-bernd@kuhls.net>
 <87edjkre3b.fsf@48ers.dk>
User-agent: mu4e 1.9.21; emacs 28.2
To: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Aug 2023 14:39:06 +0300
In-reply-to: <87edjkre3b.fsf@48ers.dk>
Message-ID: <878r9svjvn.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1693395567;
 bh=zlGG5ck06vgbEZ2KyG5mU09n7Ij0JTXKTHwnAKblb7U=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=PN8hvkhzULkfw8yUal+PuSxPldwDIbdw4szY3ufaKw4j5MyNUmufCNknafKxYVOnq
 NZKtbvL8gwUL3OD1Ct0HgBdtYm6jqGCcIKhyRsQRqYrMWb3qPEk/7Zkgr8VS11o2cN
 LnK8l9hlKQFTeghmsWiDaEGPrYkiicVJIbB6nqvIhOqcWNyssbkyAKCYagx0zJU3K1
 HeykysMyhpV4t66JduIZtaSJ8jldMkoJJhpmei0teDhuukM1q+bCGmbHj3lJOWMRa+
 pkic8jwWdNuvPlnLx5Q0zWE9rz6Fx0NTupb5yLGRwjejDL6L69pizMOpuikht7M7M7
 NhGxQSxW1Nhkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=PN8hvkhz
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.7.14
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Wed, Aug 30 2023, Peter Korsgaard wrote:

>>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:
>
>  > Changelog:
>  > https://gitlab.torproject.org/tpo/core/tor/-/blob/release-0.4.7/ChangeLog
>
>  > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>
> Committed to 2023.02.x and 2023.05.x, thanks.

This patch is not in the 2023.05.x branch as of commit 69e694d0dd.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
