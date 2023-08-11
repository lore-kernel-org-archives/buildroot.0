Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D78CC0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 07:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A765360B06;
	Fri, 11 Aug 2023 07:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A765360B06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QemJqXeYHhj1; Fri, 11 Aug 2023 07:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA98160AAE;
	Fri, 11 Aug 2023 07:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA98160AAE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8369E1BF228
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 07:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59CC7835E9
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 07:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59CC7835E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDc1qttZ1r-c for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 07:11:05 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5AF3835D3
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 07:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5AF3835D3
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id F24DCA091F;
 Fri, 11 Aug 2023 09:11:03 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix03.mail.de (Postfix) with ESMTP id D6433801C7;
 Fri, 11 Aug 2023 09:11:03 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id 9DC48C002F;
 Fri, 11 Aug 2023 09:11:03 +0200 (CEST)
To: buildroot@buildroot.org, Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 11 Aug 2023 09:11:03 +0200
Message-ID: <4822318.GXAFRqVoOG@kilian-aisec>
In-Reply-To: <CAOCHtYhLi5cdJBYc_umDvNbdwLTyE6+X3c2fMDvvrN+_q65bEQ@mail.gmail.com>
References: <2691942.mvXUDI8C0e@kilian-aisec> <3249536.44csPzL39Z@kilian-aisec>
 <CAOCHtYhLi5cdJBYc_umDvNbdwLTyE6+X3c2fMDvvrN+_q65bEQ@mail.gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 487
X-purgate-ID: 154282::1691737863-34F25C09-3704A503/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691737863;
 bh=53EmoYh6JF4DglrpeGuTJU8LtswXTIAuQmQ8fmvYraw=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=ZpaoVpgLKCkpc46ROyLmznQKY5lQ1VdUbL83RyKDML0jI2WNxekPstJGoSc7G1cGW
 BJjqIM5/hG1O1HFWAbd4w6yzB+pNMoeqDdsXXEiJJZz70WSCSV7el7WUcXxY02HZwP
 TgcoTa/VurBvBGPprJXbkued9ss3DlXZqMSPHW18GKYORmAMwkGxswtK0N0WHMtQxk
 7WgkYlUqhSu8E3OiDx9jXePi97Fp1x+YGuzAPVofrA645WCeZ1fKCqL0eVX/yBthIX
 ej665yIAHl+6A/LemZ43QI2Yhgtc+xrdsjya0glql/qI8RCUJRgSVWGu12WHcDZT1i
 tBOwE2oJ/k2IA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=ZpaoVpgL
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Robert,

[--SNIP--]
> Yeah, your one boot 'showing' it actually worked 'once' is still way
> more info than we ever got from the vendor on requesting info on our
> goal of booting from external microSD!
> 
> I was at the office for my job that day, and didn't have the board in
> my grab bag.

Maybe I did flash something else and documented it wrong? I don't know. I will 
try to help figuring out about this on the beagleboard forum.

Best regards,
Kilian




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
