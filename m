Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F5AC3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBEC8416F8;
	Fri,  2 May 2025 10:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqoPHusadE4c; Fri,  2 May 2025 10:24:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96B624115B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96B624115B;
	Fri,  2 May 2025 10:24:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E5FA229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24722839D8
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5xSYRivNx3J for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:24:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D5B91839CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5B91839CF
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5B91839CF
 for <buildroot@busybox.net>; Fri,  2 May 2025 10:24:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B0DBF1C0FD5; Fri,  2 May 2025 12:24:51 +0200 (CEST)
Message-ID: <1b69b05a-68c8-4c7e-b712-99a08bf030b4@rnout.be>
Date: Fri, 2 May 2025 12:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20250415090638.319859-1-francois.perrad@gadz.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250415090638.319859-1-francois.perrad@gadz.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181491; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CVp9p0Y0N62d1xPgSiY4+RYj3VRn2FHErcotcX4Jyx8=;
 b=Kligd98B05l0FU3UVmXn40Cf07MaVzAk7wp8qqllrkUaDSKy1Ly2IE9dAx1UxskRnuWRW7
 rPjZtnR2L6RnEofEVvV5Dxj7E+w7/DrRzlepltQKa8528Etj60u8bLXpLmJuT/C+tpLLzT
 2b7tVt6AI/zPYSxzmE3jNJbK4qfE7uqcYaFAXNN954huqiDFNCHtCTruzQF1bx/Z0dVxlx
 Ed/hxgP+inrUgJOg21Kk5+/A8nle24YVYtzScngPqiL/+7inTqqemNmH9jUQESDsWZrlhi
 PD5HOhMHODInjJV089m07tQJQVYjAHoEcK6Hzew5mgcSqJMJMKSSeXo74uM+CA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Kligd98B
Subject: Re: [Buildroot] [PATCH] package/perl: security bump to version
 5.40.2
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



On 15/04/2025 11:06, Francois Perrad via buildroot wrote:
> fix CVE-2024-56406: A heap buffer overflow vulnerability
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/perl/perl.hash | 12 ++++++------
>   package/perl/perl.mk   |  4 ++--
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/perl/perl.hash b/package/perl/perl.hash
> index 04ebf83b3..308f58605 100644
> --- a/package/perl/perl.hash
> +++ b/package/perl/perl.hash
> @@ -1,10 +1,10 @@
> -# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.1.tar.xz.{md5,sha1,sha256}.txt
> -md5  bab3547a5cdf2302ee0396419d74a42e  perl-5.40.1.tar.xz
> -sha1  4ffe5246c791df884363aed05ba81ba41cb02084  perl-5.40.1.tar.xz
> -sha256  dfa20c2eef2b4af133525610bbb65dd13777ecf998c9c5b1ccf0d308e732ee3f  perl-5.40.1.tar.xz
> +# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.2.tar.xz.{md5,sha1,sha256}.txt
> +md5  9ad7a269dc4053cdbeecd4fde444291b  perl-5.40.2.tar.xz
> +sha1  661fe9ee085ca0aec8ddd65e055bee922af12663  perl-5.40.2.tar.xz
> +sha256  0551c717458e703ef7972307ab19385edfa231198d88998df74e12226abf563b  perl-5.40.2.tar.xz
>   
> -# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.1/perl-cross-1.6.1.hash
> -sha256  b5f4b4457bbd7be37adac8ee423beedbcdba8963a85f79770f5e701dabc5550f  perl-cross-1.6.1.tar.gz
> +# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.2/perl-cross-1.6.2.hash
> +sha256	131f7496152ee32067dbac2bc9b44b2f582fc778140e545701b3b2faee782f1d  perl-cross-1.6.2.tar.gz
>   
>   # Locally calculated
>   sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 37b9fe185..34abb734d 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -6,7 +6,7 @@
>   
>   # When updating the version here, also update utils/scancpan
>   PERL_VERSION_MAJOR = 40
> -PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
> +PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
>   PERL_SITE = https://www.cpan.org/src/5.0
>   PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
>   PERL_LICENSE = Artistic or GPL-1.0+
> @@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
>   PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>   PERL_INSTALL_STAGING = YES
>   
> -PERL_CROSS_VERSION = 1.6.1
> +PERL_CROSS_VERSION = 1.6.2
>   # DO NOT refactor with the github helper (the result is not the same)
>   PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
>   PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
