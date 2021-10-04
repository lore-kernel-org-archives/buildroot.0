Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B6BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 23:22:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B14F611C0
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 23:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B14F611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2135F402B4;
	Mon,  4 Oct 2021 23:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uLwCOSLVzjrH; Mon,  4 Oct 2021 23:22:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4870640235;
	Mon,  4 Oct 2021 23:22:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B5721BF34D
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 23:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E84B40235
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 23:22:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QdwHtlRQ6Az for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 23:22:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5A88400DA
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 23:22:07 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XXHYmcF6mJzjeXXHZmLJ1n; Tue, 05 Oct 2021 01:22:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633389725; bh=IvuZVTiQbYsmOxn9bUzRyBuNO0fPcgAfb8b/UVrdoMI=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=J0pb7Dya4B4T0woVEmEufylnXdauRLOYN83btraVVR8ak3s/u4xxTHwAW9b0eQ3nb
 VHwtCDdMu4oIgKWo7tq48jKXCnmFoMbJItCmoMwWu7aa/W6C3iw51auLgKctyWr/N0
 MRj3zZLPp4S169JSwZh1EDcSlkMUocSS05aZmPuHiuk+S74KHjtDl1nLD6uZa9XcZL
 YaLAWDp2B/F9803TdBCfvGceK9E3wfJQseqGWFOQeJPFMkt9DTDo6fOnBgCVcidMcU
 c+vKA91ZXeTJpR/9bYR6xSEEotADDEEvNssaoGwHsHVd2F1qTf9qisu+83WMh8KQjb
 lEEnBBkr/wc3g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
References: <20210921235951.805592-1-giulio.benetti@benettiengineering.com>
 <3880a173-1333-3e8b-2aba-f40a235e7304@benettiengineering.com>
Message-ID: <61d16e6f-b99e-33d2-8729-21a4a98eb526@benettiengineering.com>
Date: Tue, 5 Oct 2021 01:22:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3880a173-1333-3e8b-2aba-f40a235e7304@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfDjExgdhKNPAr3/Y0LyODyzd2zbbTMD2DbR6K47K2xFVzPNCLDLJS/ubcuuRBzZrCE0+i0S4LfbBLEMkkA9fv3r3hgyx/a3k625dE+n3xi9rCEyOAmiY
 M39WCHulY/hQ8DW9Slb8P02Y90C0pqIhj+RcHTmefbr23xa9AnOJUrH/f5l+0wqklHw7Y/8dkHfhe9PqHPzgBB/jWSZGepFcXJt0q3FXkcVLMbMdBbVsenf5
 R+d9GkHKqud3yLtFxnYGZA==
Subject: Re: [Buildroot] [PATCH 0/1] Fix libnss parallel build failure
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 9/23/21 6:50 PM, Giulio Benetti wrote:
> Hi All,
> 
> On 9/22/21 1:59 AM, Giulio Benetti wrote:
>> I ask to accept this patch even if I couldn't test it. Unfortunately I
>> can't reproduce the build failure but as explained in commit log that
>> should be the way. Only this libnss parallel build bug is left and it's
>> only a bunch of symlink creation, it's not compiling/linking related.
>> Any further suggestion is accepted anyway.
> 
> libnss is building fine since 3 days while using the same machine for
> building other heavy stuff or for doing nothing than compiling libnss,
> so it seems promising.

It built for 10 days with no problems, so kindly ping because it still 
sporadically fails.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
