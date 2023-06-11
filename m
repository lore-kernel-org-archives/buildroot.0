Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99C1C7EE2E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 18:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47CFE403E7;
	Sun, 11 Jun 2023 18:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47CFE403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZzefmfeYc83; Sun, 11 Jun 2023 18:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F73E400F2;
	Sun, 11 Jun 2023 18:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F73E400F2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6C051BF27A
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 18:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDB50400F2
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 18:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDB50400F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mHb3tWl7E37E for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 18:06:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D73C9400E5
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D73C9400E5
 for <buildroot@uclibc.org>; Sun, 11 Jun 2023 18:06:08 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.109.39])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 8PS1qAySSgE4H8PS1qwENW; Sun, 11 Jun 2023 20:06:06 +0200
Message-ID: <64f2c882-7018-8dc8-4897-bb1f23eb57e0@benettiengineering.com>
Date: Sun, 11 Jun 2023 20:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@uclibc.org
References: <20230604191614.78018-1-giulio.benetti__7689.64225878648$1685906204$gmane$org@benettiengineering.com>
 <pan$522fc$aec867d8$5181d07f$922343b4@ID-313208.user.individual.net>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <pan$522fc$aec867d8$5181d07f$922343b4@ID-313208.user.individual.net>
X-CMAE-Envelope: MS4xfFO9jgwIg0Iea1ABLVfzDmgmioIDJohTZvYCt8qX+BSy2bDhoWpb0XWkBLHOm/SaAvVdZkRVwRjpp2wXezz3jnYMDgT8RcZM9F9X/gLG1+xerATFdntK
 wJCcQ5Ekx1W8J83hwi1kAdEyTzoEmLGCsmWx9lwPSmDa+CwCa2A4keqHVsaCBdrkzSqFVKVkqR6T41FnpTdvVNBpAqeYUzZF3pc1Br+oIYE4S1S62YZD2XGp
 1wuHmma/jyW3XTKYE9x4Ug==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1686506766; bh=M010htlMLFLtWQoqqfTBDH+eFnHMnQE0QdMGaTYDIag=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=YR72ZWupNAhpjsQIOvJKVKhg5pDS9UPUOCOh/gz26O/RfU1GzOXgveJbHTVs8fciM
 YvXcbU0pC5e+SgHrifyFvYc9NhhvPaqTPkyHctsCTWm0+z9tc0gHR+bzj9YnQOJC3h
 mD5kx5WcYFDGHQAY/aRIlLh2OGyUcAopyEfko3UHAUrQc00jdhxvh9XRAhafL53aJB
 Bgxq29VDOUjVAnQCPXhmyyDrFnvkNhjf4nSxjAj3kvZHXp5prrpBnA7+z+LWm5LzPZ
 os0zxxJVMy5Vw3ulGB9Tjaj9Y6jz9b1esC90u1DWNtAPURWKiKtRbN/c2AGCugdTbU
 670mT4HUn8+IA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=YR72ZWup
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.90
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

Hi Bernd,

On 11/06/23 10:22, Bernd Kuhls wrote:
> Am Sun,  4 Jun 2023 21:16:14 +0200 schrieb Giulio Benetti:
> 
>> Signed-off-by: Giulio Benetti
>> <giulio.benetti@benettiengineering.com>
>> ---
>>   package/libnss/libnss.hash | 4 ++--
>>   package/libnss/libnss.mk   | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> Hi Giulio,
> 
> could you please check whether we need this fix?
> https://bugzilla.mozilla.org/show_bug.cgi?id=1836781

yes, we need it. Thanks for finding it, I have test'd-pkg
without -a so I didn't see that build failure.
Sending V2.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
