Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F674C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 22:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D866A60C0F;
	Thu, 30 Dec 2021 22:31:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rvwf4lVWdC7R; Thu, 30 Dec 2021 22:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3196C60AC5;
	Thu, 30 Dec 2021 22:31:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3599E1BF3C2
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CBD240374
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:31:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PvuMnH1SNwTF for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 22:31:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD2AE40373
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 22:31:47 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 33xZnPnL9LDgd33xZnsEsY; Thu, 30 Dec 2021 23:31:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640903505; bh=NlPvG+0U3yDBISq52oShX5kJYj4b9tELHfIFOo99INk=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=c8fRKCEK7Ukf8niDKLQKz40xWk5oiBtGrLdlYjS92+PA4uBD4jPmiVoCngjm1py/v
 gZo/Qa2M8YNgxfLx3hIVo3Za3NqQ21uCrWOYqakvmWomT0amTS7WeyHlsl3QS3AUBJ
 jSma1TrvRJxxVq15ifIiGLqox5PKgbDIoyQWQAsoFT9dOHCroV1xizRAwqrVobO0wn
 81JNFRSsugc7yIlq8yrKODJ8DnED/3ywfHZIPVqf80mMTEgUj7vmraMWRfRUSOFVyw
 Mg0D8kLWye4wIF5NgEdnyMmeLfVCOnBLUIA+4zw9s8rqkCE/uhJvP0YN5Vx+yziG1W
 hpdJEn6LDc90Q==
To: buildroot@buildroot.org
References: <20211230215631.2024770-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <0d31bb5d-d975-a388-905c-dddfccc47562@benettiengineering.com>
Date: Thu, 30 Dec 2021 23:31:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211230215631.2024770-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfP494+lV4cM/+mvCl76nm6z8elhMb8/0T/w3/8A3IuePppZvJJEkJPyJFtyEs214eG8xzURjeO16uYhgjSGF4ugOYOn67SwXKBgE6TUezJMHDZ4ghCne
 b8xPaCMtFHTw433N07925HE53/5Vbenxy6phOpp0cf3l6Z3ZE5pPx1dPmO0VJ49ohPrBocAFN9p4joc+RD7MTsr0dXD9ou+S3Vu63UGX2llwqAT2+1tPgzw9
Subject: Re: [Buildroot] [PATCH] Makefile: fix build failure due to buggy
 'make' version 4.3
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/12/21 22:56, Giulio Benetti wrote:
> Make version 4.3 is buggy in various ways, so let's skip it by checking
> RUNNING_MAKE_VERSION against the SKIP_MAKE_VERSION list. This way, if other
> make versions show up we can add them to SKIP_MAKE_VERSION list.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   Makefile | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 0b8c7b2867..a07c05f8aa 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -105,6 +105,12 @@ ifneq ($(firstword $(sort $(RUNNING_MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MA
>   $(error You have make '$(RUNNING_MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
>   endif
>   
> +# Check for make versions to skip because of their bugs
> +SKIP_MAKE_VERSION = 4.3
> +ifneq ($(filter $(RUNNING_MAKE_VERSION),$(SKIP_MAKE_VERSION)),)
> +$(error You have make '$(RUNNING_MAKE_VERSION)' installed. GNU make != $(SKIP_MAKE_VERSION) is required)
> +endif
> +
>   # absolute path
>   TOPDIR := $(CURDIR)
>   CONFIG_CONFIG_IN = Config.in
> 

We can't avoid using make 4.3, so please ignore this patch. I'm going to 
work around the problem it causes, basically:
- 'make printvars' won't work stating that is supported by make 4.3
- host-libnss(probably libnss too) will be built or with MAKE1 or with 
BR2_MAKE

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
