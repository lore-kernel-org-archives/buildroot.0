Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775B8C77B75
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 11:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D2B3429A9;
	Fri,  5 May 2023 11:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D2B3429A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QWhHcy6npJzo; Fri,  5 May 2023 11:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EB3E41DED;
	Fri,  5 May 2023 11:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EB3E41DED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9151BF27C
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 11:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DC164208D
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 11:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DC164208D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1PbdGIdHnUb8 for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 11:59:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4075C4208C
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4075C4208C
 for <buildroot@buildroot.org>; Fri,  5 May 2023 11:59:03 +0000 (UTC)
Received: from [192.168.0.66] ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MUooJ-1pmH5H2SbB-00QnpU; Fri, 05 May 2023 13:58:50 +0200
Message-ID: <fd7fd0c9-b179-0e1b-0aa7-5039ce950d19@green-communications.fr>
Date: Fri, 5 May 2023 13:58:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Baruch Siach <baruch@tkos.co.il>, buildroot@buildroot.org
References: <87o7mz4amx.fsf@tarshish>
Content-Language: en-US
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
In-Reply-To: <87o7mz4amx.fsf@tarshish>
X-Provags-ID: V03:K1:1AA/+BrS6x+zs5pt3aiBB0W9sD6VavfpBPXz1mMgf68FIt6sYBO
 anah0fZysZ7LogrWyDPix4XCxkGO0AiNmGrBtOjxQ6r6PrRhbM7YEYMLyS3+CrmWF/pcvHk
 o8ZkRJLopvwatPOpMjZ0vFyAjUg9dvUfoWBA1Tu+l2uQlwGn+EU/G7ZuXY21zIX0l1PtKRn
 WyJhi8BRVmgoF1AhV8HFw==
UI-OutboundReport: notjunk:1;M01:P0:wQg5kSKpAVk=;Q2GyrYiYe+JhbOIzRzO0ReJAAtm
 a4Q6dvgN/itgFUzrKDcnd87OwP0dx8k/+XGTkQcYiEqcbC8F5pKkiJN9+dj6RmdjmtiaiH9yh
 h81xhbdVz8Ee7exiYzHQOqPMm6bgLVsVeMRRkAIQ6+sbGR4o7ou0H2gloduqy2n/DC/Zwg87h
 AUlzLsI9m0JewfkVE1Y+wwXFGph30sYB/Mft9rzrvduaWP8j+eEifYup60UmwrtR3TZVlkkz2
 EgTcixng6U+/yf97x3bV58qgvVlMYtC2VTPHW2zBzdpcwdwTohbV2CmnGQJuxPGJFGiubRvz5
 JSgVGLax8Kd7YQh1ptnqRqomKqDpKiM939RQo4vHppy+p8RtKVNN+XD+BOUOTHjl5iaEnhFFJ
 xhfH33l2JS4SdfvF/TW31QM2hZA9rttkYx9vnqcgefRbToYUrWuOXXXPDV8zk3sX5wtQJRnOa
 2pizOeQTmNymcVTwIehC3IPLJqDZ5XoD5YEsM/anIgDw45mQKes1o24HscovsGNdIvqIpFhb4
 7MJD+GQcCqgK2tpm9fcVGi+tYf5VEMKZDFjPI+ez0T6dLHMvc/YvbEovd3LnOfqdZDwWM4qIU
 GaBsNttHzuWNmQSrGaHsIqeenGuVsDPfngZ2aQ90YV/5lNoymVrZw/B8aHqxcMskwHhtBWsk5
 CF7jt0VixveRiSv16HcRCAyHtg9AhAmXTvKH2zqfJA==
Subject: Re: [Buildroot] List of trivial old patches
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 05/05/2023 07:17, Baruch Siach via buildroot wrote:
> package/libgit2: bump version to 1.6.3
> http://patchwork.ozlabs.org/project/buildroot/patch/20230327121702.30959-1-nicolas.cavallari@green-communications.fr/

libgit2 1.6.4 is out and i'm wondering if i should submit a trivial 1.6.3 -> 
1.6.4 bump (which would depends on this patch) or a 1.6.2 -> 1.6.4 bump (which 
would replace it).
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
