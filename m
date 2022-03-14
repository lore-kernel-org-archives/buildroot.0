Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5D8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 19:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8B4A60BD3;
	Mon, 14 Mar 2022 19:28:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rhRsxX3LDg_J; Mon, 14 Mar 2022 19:28:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26848605E8;
	Mon, 14 Mar 2022 19:28:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41E941BF318
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 19:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 304D98135B
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 19:28:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AcUzB4LlUkO6 for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 19:28:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (guitar.tcltek.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 850B381357
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 19:28:50 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 31471440FB1;
 Mon, 14 Mar 2022 21:28:40 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1647286120;
 bh=24hz6bZkQ/BoyD6pLfQXCMf+DW3CaYxXGP8LeyDWLCM=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=SOtdgcECZ8YcPdAxKPH8C3yVe+WS9D0dblK2fI6Z1ZcNQFMoSdHHXPSyQEpphzRGQ
 v1lJ2RL2JtevviXSwgYZeocG0F4Y7BbWM12bQd6sqYVYrVjzj7e9ZTn+vvFtV0uDz5
 eapAjOZ7KkrmHJ2fqxAYPTLuDzH4xPyMWfoszQqAwP0yWOkiOoDGH+2QMW4PvxMIWR
 Yrmk8YQst8GYl3KVfF4kWdvFTb0IVBcDklv91hYoxuMJ9eNY2Pgd2E7wPwzS1I6Eno
 KbrdjGjeZTm51Qiex4CbySqrt0Glxyk0ujNi/mMJEMg8aQgDqfcDOmrfoLawVlASZo
 eGTj8fQ3iFQXg==
References: <20220313130424.3046857-1-bernd.kuhls@t-online.de>
 <877d8xd8nb.fsf__45952.9784087621$1647195156$gmane$org@tarshish>
 <pan$42f3$15c67e5c$d8ecaa9b$b73ab53a@ID-313208.user.individual.net>
User-agent: mu4e 1.6.10; emacs 27.1
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 14 Mar 2022 21:17:14 +0200
In-reply-to: <pan$42f3$15c67e5c$d8ecaa9b$b73ab53a@ID-313208.user.individual.net>
Message-ID: <87pmmobafl.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 7.82.0
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

On Mon, Mar 14 2022, Bernd Kuhls wrote:
> Am Sun, 13 Mar 2022 20:05:45 +0200 schrieb Baruch Siach via buildroot:
>
>> It looks like NSS crypto back-end support requires --with-nss-deprecated
>> now. Maybe just drop deprecated NSS support?
>
> curl will drop nss support in August 2022:
> https://github.com/curl/curl/blob/master/docs/DEPRECATE.md
>
> Until then why not change the nss configure option?

Upstream decision to deprecate NSS support hints that NSS is already not
the best choice for curl crypto back-end. The DEPRECATE.md document
lists specific issues with NSS.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
