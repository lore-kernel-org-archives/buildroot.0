Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F2FE77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 16:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 206F880B16;
	Mon,  6 Jan 2025 16:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAbhOj4PTLfQ; Mon,  6 Jan 2025 16:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2300C80CDA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2300C80CDA;
	Mon,  6 Jan 2025 16:18:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8171DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5ECC80B16
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFAtzNrMwHBC for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 16:18:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 99FDE80CDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99FDE80CDA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99FDE80CDA
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:18:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1622448600; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 06 Jan 2025 16:18:29 +0000 (UTC)
Message-ID: <d27ef0cd-0896-4220-8736-1ad0594a14a8@korsgaard.com>
Date: Mon, 6 Jan 2025 17:18:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20241229202647.788835-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241229202647.788835-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=fGNMPb1IHh0lJ0vyKBK69WB4I3pIChcmjlZbuKOfAR5Uje9m0yH+oiTziiHK5dQUb7ebs65mOAumT2EJXX0uBIte34mVcX87kYY7JYhfWufmYUkzS5GglSAVQh+BRdi9q/YIMmIOv0Fleycoce2uymVaxKJnIYJd5IAJtPYxQd7EzhO10blumoAsXMALeje20y922SYuXrbRZExhiLgiXeCJCZa7L5I2chFVA6eGQjoTWg4xpxJdU2MAw3nm24iOPvdaEbixD5PPpvNzFet2Rq0jspC+XCmENVQBp8USWQlp5Y3kN4ugIEBXIVoFN6o4flJ0Uk/DBJRxBDdLA8W6gw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=HqiV+BxTHwxT551icmm7vQKsSrK1Rwy5RK1D6AeTh/U=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=fGNMPb1I
Subject: Re: [Buildroot] [PATCH v2 1/2] package/procps-ng: add wchar
 dependency
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

On 12/29/24 21:26, Thomas Petazzoni via buildroot wrote:
> Since procps-ng was bumped from 3.3.17 to 4.0.4 in commit
> d79f40dbbe98983bc657d4c82d46b38b8283351b ("package/procps-ng: security
> bump to version 4.0.4"), the build has been failing on !wchar
> configurations with:
> 
> src/ps/output.c:68:10: fatal error: wctype.h: No such file or directory
>     68 | #include <wctype.h>
>        |          ^~~~~~~~~~
> compilation terminated.
> 
> The problematic code has been added by upstream commit
> https://gitlab.com/procps-ng/procps/-/commit/605ea4a8f7460920b6de9e432757bd13f80f0dba,
> which landed in upstream release v4.0.0.
> 
> To solve this, we simply add a BR2_USE_WCHAR dependency, and update
> the comment related to this dependency on the only reverse dependency
> of procps-ng.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/afc035e866bec6f2c14f9d52fa74a9c1897706de/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> v1 -> v2: no changes

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
