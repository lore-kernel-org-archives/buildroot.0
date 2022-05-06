Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8672C433EF
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 11:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E47A408A5;
	Fri,  6 May 2022 11:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2XljHZZjTMUh; Fri,  6 May 2022 11:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E10140422;
	Fri,  6 May 2022 11:05:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6C91BF2BB
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 11:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF724404F8
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 11:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kMng155qIvLv for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 11:05:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id 317FD40025
 for <buildroot@buildroot.org>; Fri,  6 May 2022 11:05:35 +0000 (UTC)
Received: from pwmachine.localnet (91.red-83-59-174.dynamicip.rima-tde.net
 [83.59.174.91])
 by linux.microsoft.com (Postfix) with ESMTPSA id 840A920EB6C1;
 Fri,  6 May 2022 04:05:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 840A920EB6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1651835134;
 bh=csDZNwuArPhuQdjaQV7fjmtVwQupcR392rzzNaa2cNs=;
 h=From:To:Cc:Subject:Date:From;
 b=sbaNbM0Pk6XpGX830Z6Y8zXtQkfwWIAeFMKaY+evv09eEZfiokxDOkyZRosS+lgj9
 uwRb4oYT8fN96pAPCvXYEZPlofzM1B3d9PX62BDvI3obqxXFLPjZtok/Di53hOoG44
 78QP2OqsB/wKj+hw3rbKfrG01yQXGcPkDUrpnMp4=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 06 May 2022 12:05:30 +0100
Message-ID: <5818465.lOV4Wx5bFT@pwmachine>
Organization: Microsoft
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-05-04
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.


Le jeudi 5 mai 2022, 05:41:36 BST Thomas Petazzoni a =E9crit :
> Hello,
> =

> Autobuilder failures
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> Below is a list of build failures reported by the Buildroot autobuilders
> in relation to packages or CPU architectures you are in charge of.
> Please help us improving the quality of Buildroot by investigating those
> build failures and sending patches to fix them.
> =

> Results for the 'master' branch
> -------------------------------
> =

> Build failures related to your packages:
> =

>     arch     |             reason             |                          =
   =

>          url
> -------------+--------------------------------+--------------------------=
--
> ----------------------------------------------------- powerpc    |
> host-pahole-73383b3a39afe86... |
> http://autobuild.buildroot.net/results/77e892fc30b45c0ccabac5f785edd3662c=
d5
> f1e6 powerpc    | host-pahole-73383b3a39afe86... |
> http://autobuild.buildroot.net/results/d71c564994d5722ee20c93f18c85fb7799=
76
> 8319
> =

> =

> Thanks for your contribution to Buildroot!

I think this bug is caused by this line in libbpf.mk:
rm $(HOST_DIR)/include/linux/bpf.h

I already wrote a patch which I think fixes the above issue but I am not re=
ally =

happy with it.
Indeed, the tweak consists in removing this file before building the kernel=
, so =

in linux.mk, rather than in libbpf.mk

I would like to be sure my new patch will solve above issue, so is there a =
way =

for me to run a build on buildroot builders or to copy their environment?


Best regards.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
