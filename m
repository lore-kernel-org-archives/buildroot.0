Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0D4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 16:50:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9E7360F43
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 16:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9E7360F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 732FF403FF;
	Thu, 23 Sep 2021 16:50:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJ5Fcrka_888; Thu, 23 Sep 2021 16:50:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 936E840169;
	Thu, 23 Sep 2021 16:50:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F3681BF5DD
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 16:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DDAE605BF
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 16:50:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2HWw2NXaPjLm for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 16:50:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp3.osuosl.org (Postfix) with ESMTP id 241A1605AC
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 16:50:21 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id TRvQmmpiUa4UMTRvQmfOCo; Thu, 23 Sep 2021 18:50:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632415820; bh=pTeywrIsoWdFx67dnz5NUrX5O8Bev5hE6EM4p6cyO6o=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=Gugjit8Fmo5YQqvB6jxjwkMxL2y5tRNBqk88prBZg/P7+WYSVwqB6Npaj8daJHp4/
 ZmN4pCaRIchYYwa+1/fnh8zda9OfgYdXY9SAhAnwvCe+MFDqtrWIwfgOStF2jzUEs/
 RuHacNEHXcJ7ESLxVEhdBjMc3XU1y3iWoQOd3iLbLteEnwGwjWMtxYS/gtcMLkpA75
 uXkHyvHpXhj4p10FEObYpvSHAraUfkMspMdscwI3Fw9/nyt3UGvPwYkOpVsLsCzqOU
 u95jmijbL+m1BRtap5ZQCA/RmwAbur9vN5ixtQ8LHTzRz51Lizu3aUYDcBPUEXV6KT
 7sfzhb5p7Ea5A==
To: buildroot@buildroot.org
References: <20210921235951.805592-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <3880a173-1333-3e8b-2aba-f40a235e7304@benettiengineering.com>
Date: Thu, 23 Sep 2021 18:50:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921235951.805592-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfOhWGdDoN8D5gZqJDVPa1KyL2tlw02v9CbiTowYJozGg2GBvpsGrzLLA/c2ZHwFq9n6aM1tIqaFr5S8w+0iS3RLHjpJbsfhGxESREzbBDBWw873pZ0p9
 M7Dwe6r6dlQYPA+fS1LODdhrXuyNG1aUxcrXXels+vCit7nR51k5l/nbF1B1++bT9v2MvKzZMdeLvOv2g8P5IniRdl6vWgEklyuf0dxDYtH6pf9gR61p8L4W
 qAIo4tfXPS8a3DATBEKeAQ==
Subject: Re: [Buildroot] [PATCH 0/1] Fix libnss parallel build failure
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi All,

On 9/22/21 1:59 AM, Giulio Benetti wrote:
> I ask to accept this patch even if I couldn't test it. Unfortunately I
> can't reproduce the build failure but as explained in commit log that
> should be the way. Only this libnss parallel build bug is left and it's
> only a bunch of symlink creation, it's not compiling/linking related.
> Any further suggestion is accepted anyway.

libnss is building fine since 3 days while using the same machine for 
building other heavy stuff or for doing nothing than compiling libnss,
so it seems promising.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Best regards
> 
> Giulio Benetti (1):
>    package/libnss: fix parallel build failure
> 
>   ...31911-Fix-nsinstall-parallel-failure.patch | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.patch
> 

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
