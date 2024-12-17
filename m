Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E61E7717F
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 20:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7122845CE;
	Tue, 17 Dec 2024 20:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxtS8C2JXAhx; Tue, 17 Dec 2024 20:10:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C1B3845FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C1B3845FB;
	Tue, 17 Dec 2024 20:10:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78429CE
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 20:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 630EF413A4
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 20:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TpOrYjTDY6H for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 20:10:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EC81A41393
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC81A41393
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC81A41393
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 20:10:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 81701B00572;
 Tue, 17 Dec 2024 21:10:21 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46972])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Dec 2024 21:10:20 +0100
MIME-Version: 1.0
Date: Tue, 17 Dec 2024 21:10:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Petr Kulhavy <brain@jikos.cz>
In-Reply-To: <20241217153557.939266-1-heiko.thiery@gmail.com>
References: <20241217153557.939266-1-heiko.thiery@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3884797c5fb2d1ee1e49ccdb4d6db535@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734466223;
 bh=UC59pec5M0jpSOhxKy5yGA0tuGMMKPZHEnZghcAV8+Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T+dxjPhO8mwy0jXtLEga1ltHJX0uizfFgIHNCqNkl2aLhN1WJKxZzj/XpKt9PvSId
 3+dnxpcmylq8Nx+tzbp1O0clX1NWxzXkLJ9zFoVQWRZJrLAEejU3jyRYaQmrrUgueR
 3C9l+0wvf68oinrizdiC0RFgOb9hD6ENCxGYIZ31GieI9R1XDcdBgn6I/oPcGXK112
 RkbwVFZeZ1wAeUx/fsltP7UhQD9Xedr9gSZW+u2nVyARrGQuoHkFy/2QVs83EqqbDp
 CiRVIYd5EsLfisomS+84jwh86ATrWBfmiwB0d6CYFehWY7eng/RUPDsU+Nw5u9vnhm
 U0JjpT4Ch1Dmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T+dxjPhO
Subject: Re: [Buildroot] [v2] package/linuxptp: bump version to 4.4
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

On 17/12/2024 16:35, Heiko Thiery wrote:
> The released package is no longer available under sourceforge. So we
> switch the download URL to the official download page [1]. Also the 
> info URL
> about the package source is changed to the official LinuxPTP project 
> page [2].
> 
> The release note [3] and annoucement on the mailinglist [4] give more
> information about the changes.
> 
> [1] http://downloads.nwtime.org/linuxptp/
> [2] https://linuxptp.nwtime.org/about/features/
> [3] https://www.nwtime.org/news/linuxptp-4.4-released/
> [4] 
> https://lists.nwtime.org/sympa/arc/linuxptp-devel/2024-09/msg00020.html
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.

> ---
> 
> v2: changes according review comments by Julien Olivain
>  - change project URL
>  - change download URL
>  - add release note information
> 
>  package/linuxptp/Config.in     | 2 +-
>  package/linuxptp/linuxptp.hash | 2 +-
>  package/linuxptp/linuxptp.mk   | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/linuxptp/Config.in b/package/linuxptp/Config.in
> index c88b7a0619..5f2f267bf1 100644
> --- a/package/linuxptp/Config.in
> +++ b/package/linuxptp/Config.in
> @@ -11,7 +11,7 @@ config BR2_PACKAGE_LINUXPTP
>  	  Linux kernel. Supporting legacy APIs and other platforms is
>  	  not a goal.
> 
> -	  http://linuxptp.sourceforge.net/
> +	  https://linuxptp.nwtime.org/about/features/
> 
>  comment "linuxptp needs a toolchain w/ threads"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/linuxptp/linuxptp.hash 
> b/package/linuxptp/linuxptp.hash
> index 1d5c590ea7..06ba8eb12b 100644
> --- a/package/linuxptp/linuxptp.hash
> +++ b/package/linuxptp/linuxptp.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  
> 70e38e5d2764e0217443da6f14e8846fe401a472293ac138d8419c07a665447a  
> linuxptp-4.2.tgz
> +sha256  
> 61757bc0a58d789b8fcbdddf56c88a0230597184a70dcb2ac05b4c6b619f7d5c  
> linuxptp-4.4.tgz
> 
>  # Hash for license file:
>  sha256  
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
> COPYING
> diff --git a/package/linuxptp/linuxptp.mk 
> b/package/linuxptp/linuxptp.mk
> index eea41f0baf..044656aec5 100644
> --- a/package/linuxptp/linuxptp.mk
> +++ b/package/linuxptp/linuxptp.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -LINUXPTP_VERSION = 4.2
> -LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
> -LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
> +LINUXPTP_VERSION = 4.4
> +LINUXPTP_SOURCE = linuxptp-4.4.tgz
> +LINUXPTP_SITE = http://downloads.nwtime.org/linuxptp
>  LINUXPTP_LICENSE = GPL-2.0+
>  LINUXPTP_LICENSE_FILES = COPYING
>  LINUXPTP_CPE_ID_VALID = YES
> --
> 2.39.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
