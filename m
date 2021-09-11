Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39E8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:29:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FEC0611C3
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FEC0611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E5D081987;
	Sat, 11 Sep 2021 14:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23e4V1iurxGV; Sat, 11 Sep 2021 14:29:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F9D980F7D;
	Sat, 11 Sep 2021 14:29:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE81B1BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7F2A80F7D
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:29:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rRq4W7H472z0 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:29:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7360780F13
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631370559;
 bh=mJCKJOvwwzdQnV5W+o0aTniQiIdhl1nfLmwcWD+OI2M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=CT6t+/nZrtVON6EF/I+jm1qP4ezoSqIKhEbmYLg5vhgchQ3bLpcC2rYj4GWQFEMq2
 rszPD+S2ii7peHeCZFv4PgucOOuzp3HeWwBX4rvzoACXbG6OdtAlRr3b6wkaFEpNG5
 qpurO44BwF2xXl+INTrEaoMfE63CR+FbMOfzd0oM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [83.130.82.162] ([83.130.82.162]) by web-mail.gmx.net
 (3c-app-mailcom-bs14.server.lan [172.19.170.182]) (via HTTP); Sat, 11 Sep
 2021 16:29:18 +0200
MIME-Version: 1.0
Message-ID: <trinity-8842de39-896a-41dd-9128-939d22dcb2f8-1631370558915@3c-app-mailcom-bs14>
From: daggs <daggs@gmx.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sat, 11 Sep 2021 16:29:18 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20210911092713.GI1053080@scaer>
References: <20210911084204.22150-1-daggs@gmx.com>
 <20210911092713.GI1053080@scaer>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:5UfGK61Nlse3MKrq8SFSVoqkeqtIAPV5CIsFuZ5R8ap8UwMUUG7sdEDbfV7wghgzVw/SG
 F0JIwPvLvf1WbNIsksEIgZDCzEsmTFx48YFOm3yx/cyjAs3C1TOKjg4dPCRbNpACaVXxVMVnBBSN
 o6Z+cbjPhHTn3PdibYSftUNYAE1Iu9+CLboRXouVF0QVhmKWomPWMJFExzPGkmxBoOvFrIUfnQ+x
 S5niOwUU7Sb7aUZYO6X59ik3ViscdW8JKUv7JU99eM6jfxTqLDNNxztsdbojWQ7GrU2ZEHlW3iDN
 CM=
X-UI-Out-Filterresults: notjunk:1;V03:K0:QK9TWoVyJGQ=:B8GyBR98OYCFmt6fT0Sygz
 m9I2v5Dsuj5iaAj7u0ATiXA/M3AKrxLfMeR7oPY7y75GUooJegxYHFouoc7EnssuIwPw0B6FX
 XKeVn/CC9rfZOj9Alf3QtJlb+0e9MoY600bUnALq5f/NHZzhpVEdz4/y/dQIDY4Zeqh52nRao
 mks3awbGXphhyh4BfrvsnYxo5VE1yG6GVclRbXXfoZQyMuIN/CqmQSuZQtJxMJedpHwHWcysO
 Fnf/DAL4MOYzsip/+bAvMHaxZZx5LZSYV80qTCTV4RZ6lQ2wAcZdzyuqKInp4JSpOQJXbsWZv
 ZBE0GJr4LQxbRMPqSQ/ioQYhzkddkIE+wTV7CAwU3dBptkzyOUwNS7evVWYbl5JqThr7fhuJs
 Dc0gjvNxtQ6M+t33HrH/qloXWWnVe+hQjYO28tGVGOCjBjOcNBBC5ei5nrn8t+Y+YKIXJRbyR
 S5vT8YX018QSdIJNROwbm/4n3nYqhs1BL8zY+aXC8cqvXa4rJlKVzHUWLi4fGuONsPD2/4Pg+
 PzviDab9ix6yg0342uDQkEo7ntcuNJhWvzTAzXIIvlFtLucK5ab81v2CL/aEG52S7zaRMZCsr
 h+pvb41tOqKsGI8cW5iKyO6X2SQDYD7a6/Z3uHxSc1hSbsWovlmxOkG2ZIo5sXhT4iwFlQXfP
 /x0+AVL+LqqUUfhKB4erPCDaY0LBtuEUkMzAqzcfqylknb3tAaksWgDJXU17ccqKSDVM4zoTv
 Wl2zKb3vYaQbK2NmYYFkrMO5y0kD+6k21INjuk4/o4XyYdlLqxx9Aau/QUgwNNasD05h+P29N
 zdvhsaCZTfED6IGw/drGkJcMU6vCjHF0CZKKB3hnt6VZblYylY=
Subject: Re: [Buildroot] [PATCH] configs/ordeidc2: increase image size to
 256M
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Greeting Yann,

> Sent: Saturday, September 11, 2021 at 12:27 PM
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: "Dagg Stompler" <daggs@gmx.com>
> Cc: buildroot@buildroot.org
> Subject: Re: [Buildroot] [PATCH] configs/ordeidc2: increase image size to 256M
>
> Dagg, All,
>
> On 2021-09-11 11:42 +0300, Dagg Stompler spake thusly:
> > following Commit 9f127cc4, the resulting image is bigger than possible.
>
> I fail to see how commit 9f127cc4 can be the culprit:
>
>     9f127cc4 utils/getdeveloperlib.py: explicitly set devs document encoding
>
> > so BR2_TARGET_ROOTFS_EXT2_SIZE set to 256M is required.
>
> The default is 60M; bumping to 256M is surely a big jump. Can't we
> settle for something smaller, like 128M?
>
> Also, note that the default is 60M, as we consider a 64M SDCard, and
> thus some space is reserved at the begining for the boot blobs; see
> board/hardkernel/odroidc2/genimage.cfg
>
> And as a consequence, the size of the SDCard must also be updated in
> board/hardkernel/odroidc2/genimage.cfg.
>
> So, maybe:
>   - update board/hardkernel/odroidc2/genimage.cfg from 64M to 128M
>   - update BR2_TARGET_ROOTFS_EXT2_SIZE to 124M
>
> Regards,
> Yann E. MORIN.
>

if you open the link stated in the commit msg and look at the right, you see the commit stated in it.
I didn't thought I should verify if it is that commit.
this is the first error the autobuild  finds which I can reproduce, so I assumed it is related to that commit.

I bumped it to 256M because I assumed the minimum is 60M, I'll test with 128M and report back

I'll adjust the commit based on our suggestions above.

Dagg.
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
