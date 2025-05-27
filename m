Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0701C54F30
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 19:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E48860BEF;
	Tue, 27 May 2025 19:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6FsQJFaBbkc; Tue, 27 May 2025 19:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A101F60BEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A101F60BEA;
	Tue, 27 May 2025 19:51:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E92C228B
 for <buildroot@buildroot.org>; Tue, 27 May 2025 19:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAFD14030F
 for <buildroot@buildroot.org>; Tue, 27 May 2025 19:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6gB3bSdntYR for <buildroot@buildroot.org>;
 Tue, 27 May 2025 19:51:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 36447402C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36447402C7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36447402C7
 for <buildroot@buildroot.org>; Tue, 27 May 2025 19:51:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C3AB02003EE;
 Tue, 27 May 2025 21:50:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 27 May 2025 21:50:58 +0200
MIME-Version: 1.0
Date: Tue, 27 May 2025 21:50:58 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <a6505332-25fa-4633-b3ca-017274b99f21@benettiengineering.com>
References: <20250526203501.126937-1-ju.o@free.fr>
 <a6505332-25fa-4633-b3ca-017274b99f21@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <c9bdf9c64c09b4bcc8b59bd2b1e20be7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748375459;
 bh=PLcdlPaFgun5a1djulqsyPeiRc8ISmJiVO6+/+T6mE0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TCYUAlv3Mj7+oto2bJh+zvKab4fgesdvTMSWe3EThy7rjdQEpGNRGHSUn5gqfDHOB
 otV5yhGwFVARGcAygyDgIFYu5IqvsrAuNPN2joTsJaXdP9PTQmUXcKiuyHopMcoX9r
 tmKoITXHf47Gv5Ggchq7vPiRnz7ICVa5iER8592VUBt8fQWvShHVC9BxTPEctaGLjX
 Kt7iyLTPzJIsvJNOuM5c079T8vLFPHwg4IDGs2G3NB43DYbISxhxXBuNz+w1w2xiit
 B1muFHLxPHVbnzJ1oQwGYcQSFNZVXjmxtt9IvD4xXoND8/v0JRFJay+aOuqJrNV/ZI
 r8khMepGfJQYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=TCYUAlv3
Subject: Re: [Buildroot] [PATCH 1/1] package/esp-hosted: fix legal-info
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

On 26/05/2025 23:33, Giulio Benetti wrote:
> Hi Julien,
> 
> pardon, I haven't tested legal-info :-/
> 
> On 5/26/25 22:35, Julien Olivain wrote:
>> The esp-hosted package was introduced in [1] defining the variable
>> ESP_HOSTED_LICENSE_FILE (singular). The name should be
>> ESP_HOSTED_LICENSE_FILES (plural). This typo makes the license file
>> being ignored during a "make legal-info" which shows a warning at
>> the end:
>> 
>>      WARNING: esp-hosted-9a2312b0b: cannot save license 
>> (ESP_HOSTED_LICENSE_FILES not defined)
>> 
>> Fixing the variable name also reveals the license file path was
>> incorrect. The "esp_hosted_ng/host/" directory prefix is missing.
>> Finally, setting the correct path shows the hash was wrong (it was
>> the hash of the Apache-2.0 [2] file, which corresponds to another
>> unused code portion). So the license file hash is also changed to
>> correspond to the correct GPL-2.0 license file.
>> 
>> This commit fixes all the needed esp-hosted legal-info.
>> 
>> [1] 
>> https://gitlab.com/buildroot.org/buildroot/-/commit/7b2e5e6550aed4f79461919c6a59e00741eb4b11
>> [2] 
>> https://github.com/espressif/esp-hosted/blob/release/ng-v1.0.4.0.0/LICENSES/Apache-2.0
>> 
>> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks for the review. I applied this patch on master branch.

> Best regards
> --
> Giulio Benetti
> CEO&CTO@Benetti Engineering sas

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
