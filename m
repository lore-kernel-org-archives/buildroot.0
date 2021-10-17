Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69923C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 21:03:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C083960EE9
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 21:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C083960EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 800E881076;
	Sun, 17 Oct 2021 21:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jkgd7-yfWnEC; Sun, 17 Oct 2021 21:03:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D12B281066;
	Sun, 17 Oct 2021 21:03:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80B591BF593
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 21:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F096402ED
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 21:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TiS5A-bwBusX for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 21:03:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB30940256
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 21:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634504603;
 bh=zD1zt7kf9hx20K2+Xd2TUUK0yu0xkJeDtqm9YqemVNo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=QJo9Uyb6r+3T6Tmj1Wc4Z/xQO7n0FTeR0kg2KDt0XbU9pfCUtanJN4lGFCtn9aMI9
 RBgwUQ9Nqy+hzzhZ1fpptgjbHGFY+UMQLg3G1st4N7goY6zcDiezSAtpKIu315QNTd
 pmbc3YjVVYOv98VhHaYqcKocbSOSnfj9BBvNp+ew=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [83.130.83.175] ([83.130.83.175]) by web-mail.gmx.net
 (3c-app-mailcom-bs08.server.lan [172.19.170.176]) (via HTTP); Sun, 17 Oct
 2021 23:03:23 +0200
MIME-Version: 1.0
Message-ID: <trinity-a8e521af-a576-4087-9be9-2a71b6fb4186-1634504603077@3c-app-mailcom-bs08>
From: daggs <daggs@gmx.com>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 23:03:23 +0200
Importance: normal
Sensitivity: Normal
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:4ZtYO2nsvGg2kSFlDJF+/KjssiYYPeKjtvOJdg1ojgdcJdVaYujyUOmo+Naytyp1U2GWM
 aPNN6/RcyhCUcGoJuuRBC6UIt/3QiE6pmrSIaM7yiCm1bKY7kOPeHqP2ollTtpyeZU61dRvMD1nT
 RB5og0CzAG+ijtR1Z5LMFJSWmdrBZOebQ9m7+ihHUnzJMpT518m+A2xF4hJj4UohK5OFHXezy93H
 025ADDuh0X7pdaRCryUqYqL347ZSxJ9hXOj0N9ypC7dYi/uVklhIdvpJhEyIIBFl5vUTacKJG+Ro
 MQ=
X-UI-Out-Filterresults: notjunk:1;V03:K0:U7aas+wfK7U=:G+VRnacJqQsIX0rOvSwjBo
 XXPQzXzjmggef90HAxLyk+y3FFx9B5S5JaI4Z9sxaBymfwzxAcUnPMiy/CoDJg/5p6HqSlFYy
 giBFOLgsqVmAsyntzn/iBs/amu7mEiCGn4XmOgSLyOa6gSt0fzkVqEviJQDypgUa2AROlHnOQ
 tx3x8nutvO+vqbETNUHkmPmG3CqZOWtugZtkV0Lji4QfWlbxzTzNYQZbTF08AWvWHZ173FUj4
 TPLIUXXGgaICjVPaPjoSSZR4XhBLNnHwHmNS/bVCG1cpHLMJJKnkOqaRk9ZaiacNfkD0qigW0
 sK/ACzMwlnB88JkzcBDJX8KJnj21H4N3LkX/NITjuC0p8qV8NhrOucvnF/28V0sUWYOsPTp23
 qJrQi8BqSzfAkPgCC0MAcYOrAh6psUFAPOw7vI8puygc/NWPFanWg5uZoQxsiWcSJhzF8Ss7x
 zUJO6jYiVMgDm9YKmfNf+mxLADrFsI+s2NKbZ01DMjRrPiobEcHEUYjKwHEPLwOPAadPgQdwq
 Ln4GAYd0y7dVmjX/XDQvmaWpul1uL4H60nwCQxqqFEaf+31sodUl9kU1FsMsh3F9Hcrgc6b4L
 Vrtw8tIE7qF1cAImxWNCTTbGePdeSzNewtFpS5pUb5RlQONUtj4ltHn+UMNYA/DPFLGP3U3vq
 DxQ9LJ/LtJfLqRvByAoG9sO7zVP0dgrLlo894ryu4q0lC9CkWYdUyiMIP9ZKzMrFIKC/X8jME
 jaEHYPCAwMh92RzMyfvzl6s8yWfUiAg6tvB5vKvg8GGP02UZAZo35Ad4VHOALMHo6P+1ufwDf
 j3YRiUH
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-10-16
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Greetings,

> Sent: Sunday, October 17, 2021 at 9:58 AM
> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Dagg Stompler" <daggs@gmx.com>
> Subject: [autobuild.buildroot.net] Your daily results for 2021-10-16
>
> Hello,
>
> Gitlab CI failures
> ==================
>
> Below is a list of Gitlab CI job failures in relation to defconfigs or
> runtime tests you are in charge of. Please help us improving the quality
> of Buildroot by investigating those build failures and sending patches
> to fix them.
>
> Results for '2021.08.1'
> -----------------------
>
> Build failures related to your defconfigs:
>
>                         defconfig |                        link to the job
> ----------------------------------+--------------------------------------------------------------
>                          odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667149
>
>
>
> Thanks for your contribution to Buildroot!
>
> --
> http://autobuild.buildroot.net
>

anyone else gets this timeout? is this an actual error in the config/build or an issue with the testing env?

Thanks,

Dagg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
