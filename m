Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2843AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 16:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9794283196;
	Tue, 11 Jan 2022 16:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wJrwE-B3WaCb; Tue, 11 Jan 2022 16:14:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AABA282F8B;
	Tue, 11 Jan 2022 16:14:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 067271BF83E
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 16:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E354C60E93
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 16:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZG0XKpfIOMhS for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 16:14:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 954F960E8F
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 16:14:07 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 1C5734401D4;
 Tue, 11 Jan 2022 18:14:03 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1641917643;
 bh=ENcg044dPWlFRNOt7VV9sWSWb+feCAis2VIJjeNCV+Y=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=X64j/nLOgJOJ8wssbWR54fkUYv/0ysSHTYB0BrBj7D+yOfH2WoVzLVbz772eoQUzk
 0pcoKtMLehImePlxLyXLbwsrIeE9Ei74bKl8Cq7WFca40XQ09G0Gb30q9rXaDmmBqx
 I3ttI59CDJQZ0ZJFXYzVZeedN1sUIXm6RLSd1X7nUSZJTCzcuQkhUQm7JwHEBdVqqT
 a5ObSgz7KfSxuiafi2upzw0h24vR6Sr21VLtLTplwHcUq4lwVkAE9QlcQ6KbDoHFKH
 k9ffbmnHtaf1EtxIECIk+xKV2f/Hc4IMfXVgSDoEVmoXOV7a+OxkRM9HOHtBBK8vy+
 cKCOStSIXQzWw==
References: <DM5PR02MB32914F0603DC48BC02D1CA328A519@DM5PR02MB3291.namprd02.prod.outlook.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: "Karicheri, Murali" <Murali.Karicheri@sandc.com>
Date: Tue, 11 Jan 2022 18:13:15 +0200
In-reply-to: <DM5PR02MB32914F0603DC48BC02D1CA328A519@DM5PR02MB3291.namprd02.prod.outlook.com>
Message-ID: <87o84iw8qc.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] creating packages for opkg for buildroot based
 embedded platform software
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

Hi Murali,

On Tue, Jan 11 2022, Karicheri, Murali wrote:
> Hello, buildroot experts,
>
> I am new to buildroot and was working with a buildroot expert for migrating
> our yocto based build system to use buildroot. Unfortunately, he has left our
> company for another oppotunity. Ever since I have started using buildroot for
> our build, I am very happy with its simplicity compared to yocto based build
> system. However, I have learned that buildroot expect the entire rootfs to be
> updated on a running system for updating fixes which is very expensive for
> deployment where there is limited bandwidth available to update the system. So
> that is the challenge that I am facing. Good news is opkg tools are supported
> in buildroot which is good. Typically, we would like to let our customer do
> periodic update to the system to have vulnerability fixes and other fixes
> released by buildroot. For example, let us say we base our system on
> 2021.02.x. So, when there is a maintenance update to this branch say,
> 2021.02.06, we would like to create an ipk file with the changes and provide
> that for syst
>  em update. Idea is the file will be smaller and thus requires less bandwidth
> and will result in quicker update to the system. Do you have information on
> any project that is working to create a package manager for systems that uses
> buildroot for their build?
>
> My research showed one resource but is for open embedded or yocto or openwrt
> and is here. https://raymii.org/s/tutorials/Building_IPK_packages_by_hand.html
>
> Do you think this is what I should try or any other relevant information on this topic?

This Buildroot FAQ is relevant:

  https://buildroot.org/downloads/manual/manual.html#faq-no-binary-packages

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
