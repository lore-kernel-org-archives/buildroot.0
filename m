Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B489C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 12:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09A3C82C9C;
	Sun, 31 Jul 2022 12:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09A3C82C9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3V9C3CDpv2Pb; Sun, 31 Jul 2022 12:09:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 318E582C89;
	Sun, 31 Jul 2022 12:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 318E582C89
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32D8A1BF33E
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 12:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C6504098E
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 12:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C6504098E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1PiEUJoMUfYe for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 12:09:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF64B40981
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF64B40981
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 12:09:00 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 3DD0C440F39;
 Sun, 31 Jul 2022 15:08:20 +0300 (IDT)
References: <20220731114235.93784-1-bernd.kuhls@t-online.de>
 <87les9wlk0.fsf__10495.4630181723$1659268091$gmane$org@tarshish>
 <pan$9391d$38089e12$245e79a3$aad97a61@ID-313208.user.individual.net>
User-agent: mu4e 1.8.6; emacs 27.1
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jul 2022 15:02:57 +0300
In-reply-to: <pan$9391d$38089e12$245e79a3$aad97a61@ID-313208.user.individual.net>
Message-ID: <87h72xwkkn.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1659269300;
 bh=2RtoUB0x0xProNTTbv7NkWCx7zMblWwnCwyTdAwg3Zg=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=ZeWFagWvA+khtHXp/xhBLv2cxtC4SfWTrBSpP9Ubfm19gq3nt8N/nSYFhGLqo6lZA
 XrvNqdumjEz3Sln+zXttRgeFOfLmMMGhdLiM0EXH73Ilr+35WyPCGZy6VNeKS0PKu9
 U62AV/inEC+lIwA6Yq95eBQaR8fysZ0H+xapLvXdx2SDEC2AcwO2wO71fvOv/IlxDo
 FTpGpMISSvpvj2HG+02ev38m+GqtkyW2llGghduEWmyJCN8xwEi9K30FIxZbuARlkG
 VeH6A8Nb6vEFQo/rC1dGvnhYKMmbJWx1nWlCogJVWQm3UGc+2ouIomTA32uTbZBjul
 Equldqv475gpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=ZeWFagWv
Subject: Re: [Buildroot] [PATCH 1/1] package/php: ignore various CVEs
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On Sun, Jul 31 2022, Bernd Kuhls wrote:
> Am Sun, 31 Jul 2022 14:45:27 +0300 schrieb Baruch Siach via buildroot:
>
>> Why do we need to ignore these old CVEs?
>
> to reduce the lenght of the weekly mail:
> https://lists.buildroot.org/pipermail/buildroot/2022-July/646199.html

I share your desire to make the weekly list more useful. My question is
why current version check method does not filter out these CVEs
automatically?  I think that the value in moving the list from the
weekly mail to a permanent location in Buildroot source tree is
questionable. An explanation of why this is necessary would be nice.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
