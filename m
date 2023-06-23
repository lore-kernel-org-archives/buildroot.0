Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B70EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 23 Jun 2023 18:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADD5282342;
	Fri, 23 Jun 2023 18:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADD5282342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFK5R5BkwOKR; Fri, 23 Jun 2023 18:55:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDE2E82338;
	Fri, 23 Jun 2023 18:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDE2E82338
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 621691BF57F
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 18:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4882F60F72
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 18:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4882F60F72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qytaoFKI66Uh for <buildroot@lists.busybox.net>;
 Fri, 23 Jun 2023 18:55:46 +0000 (UTC)
X-Greylist: delayed 00:32:45 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1459A60F09
Received: from tr3.megatrhost.com (unknown [185.179.26.181])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1459A60F09
 for <buildroot@buildroot.org>; Fri, 23 Jun 2023 18:55:45 +0000 (UTC)
Received: from [159.146.47.99] (port=42906 helo=[192.168.1.120])
 by tr3.megatrhost.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <hk@hasankaraman.dev>) id 1qClQu-00GMtZ-0Z
 for buildroot@buildroot.org; Fri, 23 Jun 2023 21:22:58 +0300
Message-ID: <9bdad434-d2a1-0988-8d17-3cd2f23448c2@hasankaraman.dev>
Date: Fri, 23 Jun 2023 21:22:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: buildroot@buildroot.org
From: Hasan Karaman <hk@hasankaraman.dev>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - tr3.megatrhost.com
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - hasankaraman.dev
X-Get-Message-Sender-Via: tr3.megatrhost.com: authenticated_id:
 hk@hasankaraman.dev
X-Authenticated-Sender: tr3.megatrhost.com: hk@hasankaraman.dev
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=hasankaraman.dev; s=default; h=Content-Transfer-Encoding:Content-Type:
 Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z+HMnsm9m9vlqf76vkdHghFi+fc8RLze09QhwtMIngc=; b=b4+dff2JpgrRD1J1oX4YZHjI7n
 bc6T/Bp/HtAE8s7XXPXGxEnCt337mbttzHiNnknZlOFltH7B85DuF4I8Co4KTynKLRvZwrookkNEZ
 bOzVgAxQ0pglK34O9s7ZNIM9B+j1YhUZRdGv31zLIFv5lnazGOMc444Y0uXCNhHeejxLNs6lHfr//
 LqDuCkTwmx+WZhaKvvCFSLT8YbcwTnKtBgXuaar2ShKCmRTLw2Khr7qvcX/K08OgolIB3cPgDWV9H
 0VT1VWsSJqS6zUYEz3cTCFFqgDwR8pgtkFkL+8PumP6S9R2vkEdWE9S3tEbFfCDq5UmPyyYglNEse
 6dgWJqbw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=hasankaraman.dev header.i=@hasankaraman.dev
 header.a=rsa-sha256 header.s=default header.b=b4+dff2J
Subject: [Buildroot] FBTFT extension does not work out of the box
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

What I do is:

make orangepi_zero_defconfig

make menuconfig

Kernel > Linux Kernel Extensions > FB TFT Drivers

https://github.com/notro/fbtft cannot be compiled with mainline kernel. 
So I use my modified version of fbtft driver:

https://github.com/grizzlei/fbtft

And when I replace 
buildoot/output/build/linux-6.1.14/drivers/video/fbdev/fbtft with my 
code, this time i get compilation errors caused by CONFIG_FB_DEFERRED_IO 
macro not being defined. Does FBTFT support depend on other features?

-- 
Hasan Karaman
Embedded Linux, C&C++ developer
Survey & Geomatics Engineer
hk@hasankaraman.dev
https://hasankaraman.dev

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
