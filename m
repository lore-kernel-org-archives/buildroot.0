Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84FBE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 736AB60827;
	Wed,  8 Jan 2025 21:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CncqfHkpoZq7; Wed,  8 Jan 2025 21:29:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 870A760AF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 870A760AF9;
	Wed,  8 Jan 2025 21:29:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EFBD71FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D094380C89
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZeAvRiXIRZpF for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:29:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 18BC981144
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18BC981144
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18BC981144
 for <buildroot@busybox.net>; Wed,  8 Jan 2025 21:29:22 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@busybox.net
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1672412890; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 21:29:18 +0000 (UTC)
Message-ID: <7810ab9e-5299-4907-a327-1d31c0f6cf2f@korsgaard.com>
Date: Wed, 8 Jan 2025 22:29:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Fischer <mf@go-sys.de>, buildroot@busybox.net
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>
References: <20250102105002.31920-1-mf@go-sys.de>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250102105002.31920-1-mf@go-sys.de>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=aJcs2fzfym5XoqUuqvu1SRsQCR5vdBFyQx4nCsxpvdGc/HDEEqSLL/2NGk+yHi8ysJaXCUbf+a0+mGvqWqdWECyRDIXAAWtBb6o7+pWUEs8o3JXT4NBldObEceMWm64da0qFbIVnY7/dB9cfpeCQl1u32SYGLIIcGSgmCy0hrn+lS4rIcRSvRgrFTSp0w8V7FHxqlcJ887Ti4cFC8fiDIiaTS2MYQ6d9UNmrcxf3wQwONXK5unfsiV+tg0P0Lm5E8xvSFu03ayRuWRUzDZfaAkRE9z7HvQZWe8cuI89NxcR9yjjwzyNLAL2qKC7h18lhcvDWWfJhXZdEIuMWRCtdAw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=yNxDHaZkvteXy5fzMdWz0kmTp5MFRbGXkK7ccIhjeOE=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=aJcs2fzf
Subject: Re: [Buildroot] [PATCH] package/gnuplot: bump version to 6.0.2
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

On 1/2/25 11:50, Michael Fischer wrote:
> patch 0002: already applied upstream
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>   .../0002-check-for-defined-FE_UNDERFLOW.patch | 32 -------------------
>   package/gnuplot/gnuplot.hash                  |  8 ++---
>   package/gnuplot/gnuplot.mk                    |  2 +-
>   3 files changed, 5 insertions(+), 37 deletions(-)
>   delete mode 100644 package/gnuplot/0002-check-for-defined-FE_UNDERFLOW.patch

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
