Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7896FC433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 10:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 249C540482;
	Fri,  4 Feb 2022 10:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MDhEZ04R9vKg; Fri,  4 Feb 2022 10:24:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06D274020B;
	Fri,  4 Feb 2022 10:24:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2CCC1BF34D
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 10:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0DA541515
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 10:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O5VjBzFTvPfn for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 10:24:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44CAE410E6
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 10:24:38 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FvlbnNhem4NL9FvlcnVJtT; Fri, 04 Feb 2022 11:24:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643970276; bh=BzDes3KtqRsmPoKvzg5ja3dGiMMGjB4rooWqsBMOseU=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=I4tXxfaNcEuTb3VOMmsEhBYp20JZtvsrW77Ac4yW1C/7NAeA8RM0cgQKbNi0Yksa1
 PyZhvGhpWt8FxKbdn4/4AgPgT0AdKWJVkXhF1nJUol3ZTX2HLquGArLKgLb84f4Nvo
 k5u04eamjAUGC60rjOC14QeVxK5QfnM1DyrAbvZB0uudGhnm4eSIvylcsFHKUfINSZ
 LRa+ihb5ms+b0wPlmQQ41dX+uerEUTs1VJwfQ+NVmZCshvoPp6oO5DcVl+ij+g78Sm
 YwbLIzCn+Cp6UuSciuQcK6VZKW8mfmUPpzIvQZJbCRY4TV70PmLBCOMiTCeRWFcsxN
 Dt89Fg6h36yWQ==
Message-ID: <92e2c20f-86dd-812b-e13f-5479146e640b@benettiengineering.com>
Date: Fri, 4 Feb 2022 11:24:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Peter Seiderer <ps.report@gmx.net>
References: <1662cf67-b9ef-33be-c5c4-5d5e786f944a@benettiengineering.com>
 <20220204085100.77deaeb8@gmx.net>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220204085100.77deaeb8@gmx.net>
X-CMAE-Envelope: MS4wfA+He8NabweK7g9yU7Cyylv/do2cJd8uRBlafTBUlFC40j/SG+rQmKD4fiF+UXKNenV2v5JEOvaM+u6KBb9KL2iwbVNqXdZEPb/c7LLjbTN6+xj4iw8O
 7ymV3EDTxjqzyzZ238C2UCp6g5XiMnjEMfHiDD9rV+GSchQjF9CSK63eK9QWlMB6M30eQWWbmsMX7Z443L1hm4uTn88Llw5sWjaLn/RlkztSt6WX9orECxgZ
 EtZVbTGo8FcPOTAYkpA4tpvEbca/Qa9ROscmICcdMgY=
Subject: Re: [Buildroot] qt5webengine build failure on gitlab-CI
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
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 04/02/22 08:51, Peter Seiderer wrote:
> Hello Giulio,
> 
> On Fri, 4 Feb 2022 02:03:48 +0100, Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Hi Peter and James,
>>
>> I can fix this build failure[1] due to qt5webengine, you're the experts
>> here, can you take a look please?
>>
>> You have to build using official docker as I've described in this patch
>> for the manual:
>> https://patchwork.ozlabs.org/project/buildroot/patch/20220203235438.610277-1-giulio.benetti@benettiengineering.com/
>>
>> I've tried this patch:
>> https://patchwork.ozlabs.org/project/buildroot/patch/20220117114358.3814200-1-james.hilliard1@gmail.com/
>> but it didn't help :-/
> 
> See [2], [3] and [4]....

Thank you for pointing, this patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20201221203952.22168-3-ps.report@gmx.net/
seems to be what we need at the moment IMHO. It can also be backported.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Regards,
> Peter
> 
> [2] http://lists.busybox.net/pipermail/buildroot/2020-December/601542.html
> [3] http://lists.busybox.net/pipermail/buildroot/2021-January/301496.html
> [4] http://lists.busybox.net/pipermail/buildroot/2022-January/633204.html
> 
>>
>> Thanks in advance!
>>
>> [1]: https://gitlab.com/buildroot.org/buildroot/-/jobs/1929717230
>>
>> Best regards
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
