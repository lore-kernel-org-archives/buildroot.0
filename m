Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48548C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 21:50:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 039E360F51
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 21:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 039E360F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A26E6402BB;
	Thu,  7 Oct 2021 21:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SuFeOGFy7xoZ; Thu,  7 Oct 2021 21:50:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B52224032C;
	Thu,  7 Oct 2021 21:50:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC1351BF866
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 21:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB707842DD
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 21:50:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xhB0_0d__0UK for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 21:50:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3125F842D9
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 21:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633643420;
 bh=wxttZOlxyM+digLq2zTdfio/bwEuTzrSNwX1l7JZA2w=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Hhx7jCoZ+nn0u3G9bAd2axcjE8sJiHPa+Brp2bSrtmsw/c5/B1WFxS5jwpaA8JXXn
 bm54UzM1sUst9izz1ABPJ1q0xWvb9vyIgNDXWmMdyMSzjVBG/qt8w0KIlbS0BWCdEe
 a0xbn95xNcTglbtorN1mx8/rt7WelcBRT2gUUYmA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.41]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlf4c-1nG9F81NQ2-00ilMD; Thu, 07
 Oct 2021 23:50:20 +0200
Date: Thu, 7 Oct 2021 23:50:19 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: "Walter, Stefan" <stefan.walter@iml.fraunhofer.de>
Message-ID: <20211007235019.51751a53@gmx.net>
In-Reply-To: <DB6P194MB00220117F126EF57A84FB509B7B19@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
References: <DB6P194MB00220117F126EF57A84FB509B7B19@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:9cgvqjPxV9oNIDeKjfFTsWpt8Pn4fGSO3mpm8lPK3opjAs1IUW8
 HyiLdi8+y7Dv9qaEZLf4R1/AL6LpfVURS0P5GFBmKP8sL15NPcCrxK2aQeix6T9xi2IX/ji
 aeE0xu0x1m9bnok9AzochAlODXUCzhgpAhwxYnqGE0DY0uOb3hfpe8is7Zm+xI/DYm0kTxK
 hjotBA6wbUaPQwzo1xexw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IVFJFU04taA=:IYfCVimBOqp3WqvFAqXfga
 o+wPHNbq7KK0tY1dlx1T90MMx/28C+7wH63ktgmZu/d80kDJjFM6Kg0B5eoWvD3Kn+wSiTViz
 uvqPaFFL2LWdF/ANywEhq+OtVHqdH43lgGxziECVW06KAg+5JLjfO9dY0Cpnzcsx0QJScFPHh
 UzgFqlXfQ9CZYOO7d5ZBogKDi6ve3xSaWtv/6hdYNrBONO7k7APo0pptp7YZgIMLEps1B9cVe
 qHDXPQYP+SFqTXXBMNQiQtgm1ocQBPENnofeMpz8kfeOstOHSMQYVDuv6WyS/ptEE7AdRj5So
 T9h1vcnHeKvxWEuXJiarQ0lwFyx62HjDy3VXsdmpyY2G0lSYmaMajR+ZQF3nJiOKT+eLdgKHz
 TshacdqvoavB1BOZXsOJHlDn9JeZDqGZ6aZ2L4OIhws9LFbZD/+Knkl5S52SY50ZMbqdUz6Qs
 iLQRq3vUj52pSPwIIpKVDnFyWQ60HRcIyQ7AWOoGymnd6rwvmUP18Q64dqGbMhyaIoDshqxHt
 ILzai9d2R2vyzSgBwq1eORW5yejNNM0Xl9VhXJo5vBmf8dUx0KgY2IQO6CWMJlncPkJZmSUtH
 ETcpQ/uxqxbOPRzNzJlmzM5OnyDcE7AfJ/AqnA/Uq10Vc0pyQkxDgpQ3Ja3C/YJiNhu9g+AWn
 emDvErcD4uIIPZc5/+LyKAvEE9J/NFV5mh7m65zTF4VBMUAqyp7pUEQiRcGvmgRcRVJo3FU57
 7zWC10pKSP3dh5tuCy7fwGyZzuW/XL8lpmK5ospSLHe88JRHy5jG+fJzZNb2+TMeNxq2vz5xT
 f35ZaNbjoTSiMMoW19rMyvgZ+lDlIXMsYKsfrP1gqv0ETTGktKDDd5F9y12K3+MpcOP/DbIP5
 367asp4MH9JY5LmYH+1MI05n4sHG9Q9fmval84yXvwC/PMQoF6m21yPSTC9HxvO3kukjo02uj
 I8Q6uHJyGZtNJLzKQ1O7UDh9t1jFfpN2yCcDZuqkYf1Cx8jBtj9v8FpvLlURZ7Cud5XQkeG5Y
 /xGHlO85NQRleqXhQs7kTJzu6Aj/9fO304ibECreY5QiWtmgslhnWf+IE0Wcidp6DdKpv20wB
 4/hLRwAcKN/S+M=
Subject: Re: [Buildroot] Boot process stuck at "GRUB loading.." since
 2021.02.1
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Walter,

On Thu, 7 Oct 2021 20:36:07 +0000, "Walter, Stefan" <stefan.walter@iml.fraunhofer.de> wrote:

> Hi,
>
> the following used to work until Buildroot 2021.02, i.e. the resulting image booted normally. Ever since Buildroot 2021.02.1 and up until 2021.02.5, the resulting image does not boot any more - the boot process either gets stuck right after displaying "GRUB loading..", or it reboots at that point, leading to an infinite boot loop.
>
> What I'm doing:
>
> 1. Run Buildroot to create a root partition image (my_defconfig attached).
> 2. Create a GRUB image like this (grub_early.cfg attached):
>
> /path/to/buildroot-sdk/host/bin/grub-mkimage --config=grub_early.cfg --directory=/path/to/buildroot-sdk/host/lib/grub/i386-pc -o ./genimage_input_tmp/grub_core.img --format=i386-pc --prefix==/boot/grub biosdisk part_msdos ext2 normal linux configfile
>
> 3. Create a home partition image like this:
>
> MKE2FS_CONFIG=/path/to/buildroot-sdk/host/etc/mke2fs.conf /path/to/buildroot-sdk/host/sbin/mke2fs -d home_partition_prep/home -j -L home -t ext3 -U random -b 4096 ./genimage_input_tmp/home.ext3 25M
>
> 4. Create a disk image like this (genimage.cfg attached):
>
> /path/to/buildroot-sdk/host/bin/genimage --loglevel=1 --config=genimage.cfg --inputpath=./genimage_input_tmp --outputpath=images --rootpath=home_partition_prep --tmppath=./genimage_tmp --tune2fs=/path/to/buildroot-sdk/host/usr/sbin/tune2fs --e2fsck=/path/to/buildroot-sdk/host/usr/sbin/e2fsck
>
> Does anyone have any idea what's going wrong here since 2021.02.1?

Only known issue was 'Bug 13586 - grub failure with BR2_OPTIMIZE_3' (see [1]),
but should be fixed by commit 'boot/grub2: workaround breakage with -O2,
-O3 build' (see [2])

Regards,
Peter

[1] https://bugs.busybox.net/show_bug.cgi?id=13586
[2] https://git.buildroot.net/buildroot/commit/?id=7cb51d4843caaa9144270d92f86e60d8b5a2a1ec

>
> Best regards,
> Stefan

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
