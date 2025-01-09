Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12816E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 08:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6C1B60AE1;
	Thu,  9 Jan 2025 08:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z6f9ya_RLOJJ; Thu,  9 Jan 2025 08:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4B1860ADC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4B1860ADC;
	Thu,  9 Jan 2025 08:53:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9E9776C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 08:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED72B80CB6
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 08:53:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_JbXleBC1IR for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 08:53:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9010D80CEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9010D80CEE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9010D80CEE
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 08:53:34 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1348169392; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Jan 2025 08:53:28 +0000 (UTC)
Message-ID: <f6c3ace8-cc54-4a7b-ac50-292357e4027c@korsgaard.com>
Date: Thu, 9 Jan 2025 09:53:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, yann.morin@orange.com
Cc: buildroot@buildroot.org
References: <cover.1734938835.git.yann.morin@orange.com>
 <05938c936119392a3e652cbb27b55b7da436e36c.1734938835.git.yann.morin@orange.com>
 <d2baa32aed31f6779eccb1e9cf7724df@free.fr>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <d2baa32aed31f6779eccb1e9cf7724df@free.fr>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=XUgZ8QguEryE5qtIBAfVFUDqGujm3mDAm2iCT/M9bvT38zfQ+zWNBeYTgo1E5BCqYzwuKIeg1LYGVsuxzIoGYQgyFkTo0gM/DulXEkPYDtvBVraYg8fvRXjUH9HqMuYR+7Q/8UyQ5yBhKezdaLsUq9zTBXa3vf2JszIvjVczOnX4wXgJEPAaI8KaLGGDAaZyM0cjwTAO2CMDo10kYtVQoVuBRPbQsbyF5O9aJKj1OTqyfHT1uPzBNB1LSAZcNG0+a/2PNScSbaEoW1vUG4OBK5yt9vVhz+VtcsHgQVTK96TgesZRcZQ7Ov94Q8FzICHKZo5WalcfCe/1C92j3fjK/A==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=F45jL+N+E8AZ3EDinAICFRAEBYBU5Q4vZmU0NUqyY88=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=XUgZ8Qgu
Subject: Re: [Buildroot] [PATCH 1/5] utils/get-developers: don't offload
 parse_args()
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

On 1/5/25 14:21, Julien Olivain wrote:
> On 23/12/2024 08:27, yann.morin@orange.com wrote:
>> From: "Yann E. MORIN" <yann.morin@orange.com>
>>
>> Offloading parser.parse_args() to a helper function does not bring much,
>> if at all; it even is restrictive: indeed, we can't use parser.error()
>> to report errors and thus have to resort to a canned print+return
>> sequence...
>>
>> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> 
> Series applied to master, thanks.

And 2024.02.x / 2024.11.x as well, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
