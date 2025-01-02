Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4FEE77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 11:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 590DC402FD;
	Thu,  2 Jan 2025 11:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBPe6e6xtKYS; Thu,  2 Jan 2025 11:33:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DBAF40312
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DBAF40312;
	Thu,  2 Jan 2025 11:33:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F78BE0F
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DE6E40280
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bfH3JUEFddcF for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 11:33:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8EB81400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EB81400DA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EB81400DA
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:33:12 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1888071227; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 02 Jan 2025 11:33:04 +0000 (UTC)
Message-ID: <8e4d8e13-7d89-4ded-a7f6-ab16d11d8aa6@korsgaard.com>
Date: Thu, 2 Jan 2025 12:33:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>
References: <20241216-add_gdb_hash-v2-1-4eeb897a9f25@bootlin.com>
 <911dc716d6e5f87fa825b07dca9e9a52@free.fr>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <911dc716d6e5f87fa825b07dca9e9a52@free.fr>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Fu5U5oMmnID3LlL8FmgnO7rOJpXnGtPJh2KkRGRXFoX102QBen2OhJT/YITL+1+Cq9eqGKGeILUJK1GYD3L1dYSdHuw6p1bL5YI0zHJ09iK+wi2Czr35dkSrnCPtwSJlyPPJ+WpvDwmkfgFsSziUPOoKDnj8rPC939BiP9wfR1A185d+G08DI9701JPmxijHKWPBMrJWWCXdFRLR12+Ukhnk5DDjuLP3OFGHldILrzBAiH3LlOSQxNzvakm55RduXiWp872lwL46PHx5fNBat/ep5Lw+JOiFwBrCZZKgBM/0GgHLISrIGEQO7ZMBPXNcHTEmudXDIfIk07+Th0vMSA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=+rkYUf+9QDiMVtYgs7NbSNGpZvClJn4WUdTYnjtGkoU=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Fu5U5oMm
Subject: Re: [Buildroot] [PATCH v2] package/gdb: add hash of licence files
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

On 12/17/24 22:44, Julien Olivain wrote:
> On 16/12/2024 22:16, Thomas Bonnefille via buildroot wrote:
>> Adds sha256 hash of the license files for GDB.
>>
>> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> 
> Applied to master, thanks.


Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
