Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E56606A326
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KMiBMGzL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=EyY/AtY+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29BDE4066A;
	Mon,  9 Nov 2026 10:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1euEL4E-jorL; Mon,  9 Nov 2026 10:44:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 876E9405F1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794221079;
	b=nWIvrTvogwWDU4ysxwPLjhHRD6z2DP311pQGWB0PA8nlR7HPQrjVMJlNRCtBGt6e/QKZ
	 041vOTAyofJ8Myk10sCxmIJQJBLYK0+E9rJlmrr1uf21cELNjN+shNLq5M8+eAf0Pmr0p
	 PahWxIn1ZGFUCSyqDGxfDGmwKCQyScYJ0pewm5LMsD6xlpn7Bt2SjU2Y1e9lDXy0vHNZa
	 6PvmgweGyTeH2k48K9RNHdvz49gdXO24ggIhaYtil9xWFvLqtf70+NmXhcea3Vw56Rpv+
	 OgnNzj9ntpR6X7Z8eXQsmdREiMKsvd+YDpHULpfU3yqJrwsCQby/k8kAfQ5VwwUm7Bw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794221079;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Content-Language:From:In-Reply-To:X-CMAE-Envelope:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=P4TC70so/uRt19F2DcMBQGRqQlcjI+0Pzs3fOZnU5RY=;
	b=HMp3Q6DzZ00nQ1BRsxJGNWySBFNEnYznHdvrT5rToJIJhMSUAn7BmsuDebHkmZmgFPdN
	 aBcb3CO1Z26AhM1Jv7a+3MNywJ/mSwawP0cHklIK3YS5D3j14B/j6i4fsi8yT42Be2y6o
	 l02xfPraDLmIT30FdRGtggpvjjxSjH6drSCTpMMpGwIrsE9HJ4NDDRJ/m0vCJE5WjHW9J
	 NykV01s7oPbLzD2Uk6H1DaL3xZJS+TWo7c97kZu9UkfCFtG3ks2Mm/esGlKnb6XAATaPt
	 H7XMqDAgf9kEO0Yu/CZq8jEaF1sKBGtbDaRFDrzZ52a/wQsb9DrgPWhjJj2+qregRSw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794221079;
	bh=P4TC70so/uRt19F2DcMBQGRqQlcjI+0Pzs3fOZnU5RY=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KMiBMGzLuoazZMVB07y1jHnwnHFd6W7DDuBow+2v1+1Irt/AOPFSBAkn2jUdUrwP2
	 MBpnS7J5rhOMnzNWV3fYbcH5sPP5E3als9cDa5mVLx549yEy+LjEtp/IyhpGa+FM1B
	 /iVHaY0SqAOE7f40jR8Q8Uzl4UcabQVL9GYoP96N76/cxFl0IeZH6KsbnnmCOFkAR3
	 s8OlEFouVVDK7+8RbV1EOU1JuEm9OS1BGKnL9twxTYh3T17QFI2p5TKbl48l7LiEtQ
	 KyIMhtKmBPFXmHnwBWIw+7ZFMO625gBoS/1QVroXWk+dG10OGhcIqEasdUYMmm6qIu
	 jWwq0UfAtNVqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 876E9405F1;
	Mon,  9 Nov 2026 10:44:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D0ED6361
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 10:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C233C80E9C
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 10:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5mOO0JNx3jk for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 10:44:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 67FC580E7C
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.147
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.147;
 helo=smtpweb147.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=EyY/AtY+
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67FC580E7C
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 10:44:34 +0000 (UTC)
Received: from [192.168.1.115] ([151.95.84.63]) by Aruba SMTP with ESMTPSA
 id QMrXxrOxpyeI3QMrXxLEeV; Mon, 09 Nov 2026 11:44:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794221071; bh=cH5/Y3R/GrLshAZdkPeYzIv+TtCc1yFqKE91fyZn80U=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=EyY/AtY+9atlAOoksY6uggq2jXaKB6UdzTOkXErARc6OOy9s9ZphkmprKMO3hI0UD
 +HCgz0MDuuXK/CGEQS2UeqOjGA7NLB5qmPu6G/H+rAEUPo11bSb0rrvUbMwl8SFWPA
 SxD3Ma3R5wIpBQQHou3OCZW8cPM1DhAHx36Nm0W+4FUUQbtAoOV4EApYQMxs/yASJm
 VK8PZ65thNwm3D8VX95HXgPqqmGdOt2nknUrHlLZyDKbwqnSJKKPBEW54zfPAC8B0o
 89+wAT6gwN/FGKajweQdhFXBxrF3iy0M7UPXqAA0v788b9VVFcx8KBYMzYft9kZCMG
 j37iRdpFiciDQ==
Message-ID: <9faaae85-80ff-474c-9769-00510c416bfd@benettiengineering.com>
Date: Mon, 9 Nov 2026 11:44:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20261103100549.4129021-1-giulio.benetti@benettiengineering.com>
 <auujHIM_rYvtwAIh@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <auujHIM_rYvtwAIh@windsurf>
X-CMAE-Envelope: MS4xfPJdEo62cRCUe4ggWNSv00qpjpYJoQbsvLE4b/eCwB06BDjkk6x3sk6sCh7GyClIeYbkciwZ1P7tJY+qcdEu1vAXkGILK0a2IUtJBZLcICoh0/xZ4HB7
 t0dLDRr5+v2Psfa51mYOuyekIhGN62YtXRO5rOjH2zQp6/BkoJebEtWWJ2HBjWQQKUMac9hyFTBfTtgJCnTvnG2uL1dbf8udqqEtiXdK919asEnOxJwglSOb
 TzW8eFBHorbStACecCAAxip0Dn1bY623tknjqlnPTRUBL/u3L9s42q+5EqCBEOQ/hxxi8mUvHMQ2Cit73JLlkw==
Subject: Re: [Buildroot] [PATCH] package/rtl8723ds: fix build failure up to
 Linux 7.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26 22:27, Thomas Petazzoni wrote:
> On Tue, Nov 03, 2026 at 11:05:49AM +0100, Giulio Benetti wrote:
>> Drop local patch already upstreamed.
> 
> Your patch (below) doesn't drop any local patch. Should it?

Pardon, no there is no local patch, could you please drop that line?

Thanks in advance
Best regards
Giulio

> Thanks!
> 
> Thomas
> 
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/rtl8723ds/rtl8723ds.hash | 2 +-
>>   package/rtl8723ds/rtl8723ds.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
>> index 580f5d09f6..8557414e0e 100644
>> --- a/package/rtl8723ds/rtl8723ds.hash
>> +++ b/package/rtl8723ds/rtl8723ds.hash
>> @@ -1,3 +1,3 @@
>>   # Locally computed
>> -sha256  a04bc28cbaead30aca2894633ffa93d4bf0bf407a8c5b7120dd9832ceaf0310e  rtl8723ds-122a574f780da32bb0de760bf089a3a9ec1e8f87.tar.gz
>> +sha256  e0cd998331f37d4ec5b18df695638ff9f3c2c564bcea936b55ef4b40d9c4613d  rtl8723ds-83191afe47af29d622701bab24020e2dc8b0fc48.tar.gz
>>   sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
>> diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
>> index d8072f14bc..8dfda059f3 100644
>> --- a/package/rtl8723ds/rtl8723ds.mk
>> +++ b/package/rtl8723ds/rtl8723ds.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>   
>> -RTL8723DS_VERSION = 122a574f780da32bb0de760bf089a3a9ec1e8f87
>> +RTL8723DS_VERSION = 83191afe47af29d622701bab24020e2dc8b0fc48
>>   RTL8723DS_SITE = $(call github,benetti-engineering,rtl8723ds,$(RTL8723DS_VERSION))
>>   RTL8723DS_LICENSE = GPL-2.0
>>   RTL8723DS_LICENSE_FILES = COPYING
>> -- 
>> 2.47.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
