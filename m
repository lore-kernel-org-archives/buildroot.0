Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AD4C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98078608B0;
	Fri, 16 May 2025 10:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lwA-geUHb0E; Fri, 16 May 2025 10:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6A1660AF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6A1660AF3;
	Fri, 16 May 2025 10:44:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 865281AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77B10608B0
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8I2NvugnU0v for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:44:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 992AA60AC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 992AA60AC1
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 992AA60AC1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:44:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B4AA21C10FD; Fri, 16 May 2025 12:44:43 +0200 (CEST)
Message-ID: <9c77c838-3abc-4248-b1dc-6ca63f82863a@rnout.be>
Date: Fri, 16 May 2025 12:44:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yegorslists@googlemail.com, buildroot@buildroot.org
References: <20250428103506.147979-1-yegorslists@googlemail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250428103506.147979-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392283; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=BUZdq5XhWjONKRDXa8GhwW5UJtkufwB3yxvrRR9K+FA=;
 b=XGuT2a2RPgdu6oEQwEk0ihOLmXOesFDt2YTU49c7NuG/rRzrCJMA0moiSyJXhy80YkAo+4
 ymCiOk0kHyhXx+WM6CLUV11Zm9YjZLUnma9Tl82h0bpFrvbaVGAhMg57oJOpqYMQhsq9Y9
 nv0bSQcThdBAJAOHtYCIEcw6y5Rg4kOiUUezzKa56w8kdjh0g2lwLrjsWLW9Mv8yoTk+Jb
 z5gMGxdBMSAz5aUECZjrDAWld//Q1o9gQ3Ws7I4GJkpCBn4zo3+XTaPg1Rq1ZMB+xBlLtR
 lpzO6V6jlSTmyhAEofd68hM5FiRsX49Pv4/ljoV63sTjEWBh9Rw1qqtcNgl0Qw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XGuT2a2R
Subject: Re: [Buildroot] [PATCH] package/ncftp: bump to version 3.3.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/04/2025 12:35, yegorslists@googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Fixes:
> https://autobuild.buildroot.org/results/103b86c5473077cd95a245a762059a23f78c1a44/build-end.log
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/ncftp/ncftp.hash | 2 +-
>   package/ncftp/ncftp.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ncftp/ncftp.hash b/package/ncftp/ncftp.hash
> index a9414d62f5..029e4c6d43 100644
> --- a/package/ncftp/ncftp.hash
> +++ b/package/ncftp/ncftp.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  f1108e77782376f8aec691f68297a3364a9a7c2d9bb12e326f550ff9770f47a7  ncftp-3.2.9-src.tar.gz
> +sha256  7920f884c2adafc82c8e41c46d6f3d22698785c7b3f56f5677a8d5c866396386  ncftp-3.3.0-src.tar.gz
>   sha256  4fe2f063d25d79c49712a272ebb68e050c703eed9c66c80108427edfe3285580  doc/LICENSE.txt
> diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
> index fa46bc3339..c56fc86848 100644
> --- a/package/ncftp/ncftp.mk
> +++ b/package/ncftp/ncftp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NCFTP_VERSION = 3.2.9
> +NCFTP_VERSION = 3.3.0
>   NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.gz
>   NCFTP_SITE = https://www.ncftp.com/public_ftp/ncftp
>   NCFTP_TARGET_BINS = ncftp

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
