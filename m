Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CE7C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADC2D41740;
	Fri,  2 May 2025 10:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubsyzOzPovp5; Fri,  2 May 2025 10:35:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C2041868
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C2041868;
	Fri,  2 May 2025 10:35:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AA50EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B42D40B1F
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwSmcxki1Gky for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:35:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 18ACA40B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18ACA40B0E
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18ACA40B0E
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:35:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1F1831C1112; Fri,  2 May 2025 12:35:40 +0200 (CEST)
Message-ID: <92279ecc-1b9b-4fbe-9e5c-680ec962680b@rnout.be>
Date: Fri, 2 May 2025 12:35:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>
References: <20250415095025.671591-1-buildroot@bubu1.eu>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250415095025.671591-1-buildroot@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=RTm1z7TYQp3mkMojdGZQhvY1aD6/apMyAF73kpFpfCM=;
 b=XHosssHMo1O3E76sE5Opzqp5ExvaHHTXYHJFKy67isRgUeO9kCvYNHPGQ1nvTo3QszbPDT
 JMXsS8tQbZgcyz/f81bnQWEzSc+YRhc0m/FF7+RyDzfNLz/FxHGlg7A3Mz+Fw/TZHVm1Tx
 r2XrGc7JXzpD43Znn81Be1JfLwqyYt07acMXdOafZS4PZBcmKNMKTmaMK1bWZsR65mZ4O+
 Tv+ijR6n6VeJ1gAgxwe576x1lQsonOmGrrnjqLkhKIR/yOFAJ4wF4NJr7QF8tkbVaupR3f
 1KpFG2/pHVuKVJuUf54isWkvNLoFa7W02w7I1LfgWWrazs6/wXdE3jdQGwwJ3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XHosssHM
Subject: Re: [Buildroot] [PATCH] package/ca-certificates: bump to 20241223
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



On 15/04/2025 11:50, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/ca-certificates/ca-certificates.hash | 2 +-
>   package/ca-certificates/ca-certificates.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
> index 8a5b48dd79..363f43e13a 100644
> --- a/package/ca-certificates/ca-certificates.hash
> +++ b/package/ca-certificates/ca-certificates.hash
> @@ -1,4 +1,4 @@
>   # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
> -sha256  83de934afa186e279d1ed08ea0d73f5cf43a6fbfb5f00874b6db3711c64576f3  ca-certificates_20230311.tar.xz
> +sha256  dd8286d0a9dd35c756fea5f1df3fed1510fb891f376903891b003cd9b1ad7e03  ca-certificates_20241223.tar.xz
>   # Locally computed
>   sha256  e85e1bcad3a915dc7e6f41412bc5bdeba275cadd817896ea0451f2140a93967c  debian/copyright
> diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
> index fe115209a7..c354eb037e 100644
> --- a/package/ca-certificates/ca-certificates.mk
> +++ b/package/ca-certificates/ca-certificates.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -CA_CERTIFICATES_VERSION = 20230311
> +CA_CERTIFICATES_VERSION = 20241223
>   CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
> -CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20230317T205011Z/pool/main/c/ca-certificates
> +CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20241223T143500Z/pool/main/c/ca-certificates
>   CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
>   CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
>   CA_CERTIFICATES_LICENSE_FILES = debian/copyright

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
