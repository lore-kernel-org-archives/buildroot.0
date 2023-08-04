Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13809C00528
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 20:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 968E640109;
	Fri,  4 Aug 2023 20:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 968E640109
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VRqrFLJts3kZ; Fri,  4 Aug 2023 20:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BFCC41F98;
	Fri,  4 Aug 2023 20:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BFCC41F98
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48C401BF328
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 20:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23A0B40448
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 20:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23A0B40448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0XlkjWT5ANtF for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 20:25:43 +0000 (UTC)
Received: from smtpcmd03128.aruba.it (smtpcmd03128.aruba.it [62.149.158.128])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9F3B405F6
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 20:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9F3B405F6
Received: from [10.10.3.240] ([217.14.215.226])
 by Aruba Outgoing Smtp  with ESMTPSA
 id S1MgqY925c544S1Mgqeh9S; Fri, 04 Aug 2023 22:25:39 +0200
Message-ID: <c5722386-f614-e42e-72e0-79728276fa42@benettiengineering.com>
Date: Fri, 4 Aug 2023 22:25:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230802141636.528011-1-giulio.benetti@benettiengineering.com>
 <48bef18e-b43b-cc91-6ce4-e214ddf300f0@benettiengineering.com>
 <20230804221815.6fbf8bc5@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230804221815.6fbf8bc5@windsurf>
X-CMAE-Envelope: MS4xfDhDanWdrWJpUSKL1KxXa3EXTd+8FTaBEktxJPEpWtVliOINRoohzoMHSh9QpG75aISbXCvZf2w/sCQ0RTlNThh4631XaJ8BsRDMhh6MCmXeNdD/zmZ3
 BrBxtXDp0LWuAPkUqtOntFncKmpVh7yyfnz1YFAkhwLPljJ60dS1NxWt+LQvqKScq2VHxvjHe8Awl6l6EVIu9jeQC9VXXtEQehyaBQtKFTvupOKjKEit887G
 NXNrQpN7Ry1sJkm4OccCRVBUV/m538NL62oEDHlJsBU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691180739; bh=w35oG8o1OidE3nuVzyr9YCM2SgsBGQhpoiWzw00G8Yc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=nspFb1AG/usRfhd0J8JE29GJ6zA0rDlzjt4MNr1ZtWcNzGpRGMq4LL5bwC1DwpWhb
 FvVuF7YwlkFtdjbe1viEFYRAnzPunhqGiHRblONCyV5pxQA6KtN4z2i1DPhR+o+a67
 tHceb38cvdAZWm8aWwX7Cv9uxVVzU1RMv0MZ/nBF5329WUqrcqk96Rt9/BFo4xdSh+
 MytXlSeSlYtDL4zLfEJ6V27VQfc7nCCzFzfHtS+/737gPslkvzJH7jhQiFpnNshS/p
 TL1KIJQgrG/4ZoZyS5Oe2yXINJeggoEPbxrXd3HY7WY7iZrQrottFoxRRMTQnbBEqY
 hkHMvLYh77FNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=nspFb1AG
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 8.1.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/08/23 22:18, Thomas Petazzoni wrote:
> On Fri, 4 Aug 2023 21:40:45 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> This patch is superseded in favor of:
>> https://patchwork.ozlabs.org/project/buildroot/patch/20230804193801.93049-1-giulio.benetti@benettiengineering.com/
>>
>> So please ignore it.
> 
> You can mark your own patches as Superseded in patchwork :-)

Yes, I've already done it, I thought I had to point it anyway on Mailing
List but then it's useless because you pick patches from Patchwork in
the end.

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
