Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB52C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D35D460BDA;
	Tue, 16 Aug 2022 20:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D35D460BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZjBeRcbmHvpL; Tue, 16 Aug 2022 20:59:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECA0F60B3F;
	Tue, 16 Aug 2022 20:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECA0F60B3F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A69A51BF2A4
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8183B404F3
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8183B404F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3LAKb3Qkcuj for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:59:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34E274010D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34E274010D
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 20:59:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e933:8a8a:6743:9483])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6E8EE78050C;
 Tue, 16 Aug 2022 22:59:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 16 Aug 2022 22:59:18 +0200
Date: Tue, 16 Aug 2022 22:59:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220816205918.GO2854108@scaer>
References: <20220815214815.2234201-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815214815.2234201-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660683562;
 bh=WSbw+roQ67wcK626aloKeX6EZ6ItMBOTxxP73iAxl/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uoz+5mNZ9cGRXjmT3hLyzTfMb8taeAn2WKkG/qxYK7ItTnjcKwLPFkTIT4yrwat+s
 OkxfhE2N5baVNIlVz7QN6q/xn28GM4ZRqp3CzKbLXCYBSCbqvaQN1IXnnh1ZySyMad
 /n287p+fYPMHVraFajS3EdysPOWpELLfioqRi4GIn0JRyFHklYvQnP/JYVDjr9VWK8
 kyELWHbQ638lMJaa+cGjPDIAs5yUdybLP9wxtumsCbXlm6PqdPmD/5atB/xx8o8N40
 d8ZQ0YNyy/hLinSBpTXH4gO/tBaVYBEecGcAi40FsurIgdJ5UM6t7rhcLJ91bMoSnC
 5IxNQl5JyLAYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Uoz+5mNZ
Subject: Re: [Buildroot] [PATCH 0/3] Fix 3 Python test cases
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-15 23:48 +0200, Thomas Petazzoni via buildroot spake thusly:
[--SNIP--]
> Thomas Petazzoni (3):
>   support/testing/tests/package/test_python_boto3: use ext2 instead of
>     cpio
>   support/testing/tests/package/test_python_botocore: use ext2 instead
>     of cpio
>   support/testing/tests/package/test_python_s3transfer: use ext2 instead
>     of cpio

All threeour applied to master, after removing the superfluous line
disabling rootfs-tar.

Regards,
Yann E. MORIN.

>  support/testing/tests/package/test_python_boto3.py   | 12 ++++++++++++
>  .../testing/tests/package/test_python_botocore.py    | 12 ++++++++++++
>  .../testing/tests/package/test_python_s3transfer.py  | 12 ++++++++++++
>  3 files changed, 36 insertions(+)
> 
> -- 
> 2.37.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
