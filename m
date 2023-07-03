Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96215C001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35EA560E4B;
	Mon,  3 Jul 2023 20:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35EA560E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P8oTQ4RKVAX4; Mon,  3 Jul 2023 20:16:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77B4060E0A;
	Mon,  3 Jul 2023 20:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77B4060E0A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C5B11BF357
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2566D60E87
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2566D60E87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C1HccM40QPnH for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:16:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2685B60E0A
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2685B60E0A
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:16:40 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.103.145])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GPyQqYTtPDAUdGPyQqxKza; Mon, 03 Jul 2023 22:16:39 +0200
Message-ID: <9aa3488e-4648-25a4-0b20-e0498d469610@benettiengineering.com>
Date: Mon, 3 Jul 2023 22:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230703191617.1338283-1-giulio.benetti@benettiengineering.com>
 <20230703191617.1338283-2-giulio.benetti@benettiengineering.com>
 <20230703215917.16bfa729@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230703215917.16bfa729@windsurf>
X-CMAE-Envelope: MS4xfG4b1iWxPVX4xvePkR1p7WlHo54PCgeHcBANQzfTTttU7C56RZOWWz67qpm2jClkVt+RvlpA629FDf5KlJmXsK9t5YaGbCGoQKUzCFXE6ng4HTgJibn6
 Mf+LM/F1SfPPEYHTqvZ0xs7ig5P7Nh2JYPkAbQDj1pJVoMppTvQnhg+6jUWi5cjGGqYtjuRIeoehs5gm1PXJA/pl3BjVqQV2RrgNQhJuFCXb3A1PQiXwQKZk
 cFf7zYt4bAo2bGl6Zxz764jxx64YeGn2Cfv8zjV49p1w3VRnLsaHPSRlB8m3Bq1i/63kZD9Kkk/xs+WEMWjBYtumM5tWG7kOHeM115nupYA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1688415399; bh=5YSnE20H9JvUH6/8reyq+m1mTcwIC8WUk83KqKGSZtY=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Cff89AJqKhUexc/R2W+1X9MeOYhKmt6o+2UGT9hiDt7TsXqCxdJKGzzRc2aPK//wp
 qUpWVqgQeWPzZjdSeXllrnCNd4h2VISJ+KHpRpo8XYZH1HcyaUG/I1c0z3ylmsnZe7
 IvtBzhAFowGbTNGhYNe4F92jw+J26kYGFQSyU5YYMMVar56QZC+6Q2S10jx/5BGPg4
 UFqZD9i6RZrZLgm0QG08aCuaeD24cPTCmw+SiJkJYVEKe+ExIFiwiqUKXRrs5BAcHb
 jJgexKUnTLnVbGBYROy/od8Rc7B1w4kY8iwddAorxMu1pzfDe/cgV9VCf9PF/PbPUO
 aaleP8uFBucKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Cff89AJq
Subject: Re: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: bump to
 version 2023-07-03
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/07/23 21:59, Thomas Petazzoni via buildroot wrote:
> On Mon,  3 Jul 2023 21:16:16 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> This version fix build failure on Linux version < 5.15.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
>>   package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> This patch doesn't apply cleanly on the current master. Are you sure
> it's based on master?

I've give a try to this on master and it applies correctly.

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
