Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5F3C02182
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 19:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D5D884A3F;
	Thu, 23 Jan 2025 19:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNVIjtf8WBBh; Thu, 23 Jan 2025 19:55:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2C3C84A06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2C3C84A06;
	Thu, 23 Jan 2025 19:55:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 81532B88
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 19:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EBF14175B
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 19:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEkCB0vDJ160 for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 19:55:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37CE14173E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37CE14173E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37CE14173E
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 19:55:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B170213F861;
 Thu, 23 Jan 2025 20:55:20 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43438])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Jan 2025 20:55:20 +0100
MIME-Version: 1.0
Date: Thu, 23 Jan 2025 20:55:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: Guillaume Chaye <guillaume.chaye@zeetim.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20250123110604.2623742-2-guillaume.chaye@zeetim.com>
References: <20250123110604.2623742-1-guillaume.chaye@zeetim.com>
 <20250123110604.2623742-2-guillaume.chaye@zeetim.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6cc0efa6d8ac24014f34a67865867a08@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737662122;
 bh=GZP0idNKS7DhXBM7MsNJPgOmCf6gxCDcS7x/vWHu7aY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kDAeGai2EtmmBwupPVuZVd433gjs8nyOQVYz5IuzzKNg1B8KJdO+JD0kcQ+5Cg7Rs
 IZmRovfnCIw+poXbo3YHs24dGA6CjUkkz6U7eK0os5oyXjsMIa8pQ6TgsQYzT16OTL
 chBznsQ6YO7fOzMHmwcLiVHdABIefMSdZCjqsd/UBvAjiV/bLDBfoX32CB41zV1qze
 fClANEYgxDaeYBIwSP3LCyNz5V9hHF1Vfa0j7rVZB6ijgZMsQySHWiZY7EuKt9H/cC
 AyrRPSsFIdVQ8zqjTDdXUo4+q72802iyneiXdUyYTWLxsmokj4FIasb/5VjFmCmyzA
 4a/400IfUQydQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=kDAeGai2
Subject: Re: [Buildroot] [PATCH 2/2] package/sane-airscan: add new package
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

Hi Guillaume,

Thank you for your patch!

I have few comments, see below:

On 23/01/2025 12:06, Guillaume Chaye wrote:
> sane-airscan is a SANE backend for AirScan (eSCL) and WSD document 
> scanners.
> 
> Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
> ---

[...]

> diff --git a/package/sane-airscan/Config.in 
> b/package/sane-airscan/Config.in
> new file mode 100644
> index 0000000000..584a102a03
> --- /dev/null
> +++ b/package/sane-airscan/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_SANE_AIRSCAN
> +	bool "sane-airscan"
> +	select BR2_PACKAGE_SANE_BACKENDS
> +    select BR2_PACKAGE_AVAHI

This patch generates few check-package errors. Running the command:

     utils/docker-run make check-package

reports:

     package/sane-airscan/Config.in:4: should be indented with one tab 
(https://nightly.buildroot.org/#_config_files)
     package/sane-airscan/Config.in:5: should be indented with one tab 
(https://nightly.buildroot.org/#_config_files)
     package/sane-airscan/Config.in:6: should be indented with one tab 
(https://nightly.buildroot.org/#_config_files)
     package/sane-airscan/Config.in:7: should be indented with one tab 
(https://nightly.buildroot.org/#_config_files)
     package/sane-airscan/Config.in:8: should be indented with one tab 
(https://nightly.buildroot.org/#_config_files)
     package/sane-airscan/Config.in:9: should be indented with one tab 
(https://nightly.buildroot.org/#_config_files)
     package/sane-airscan/Config.in:10: should be indented with one tab 
(https://nightly.buildroot.org/#_config_files)
     package/sane-airscan/Config.in:12: should be indented with one tab 
(https://nightly.buildroot.org/#_config_files)
     package/sane-airscan/Config.in:13: help text: <tab><2 spaces><62 
chars> (https://nightly.buildroot.org/#writing-rules-config-in)
     package/sane-airscan/Config.in:17: help text: <tab><2 spaces><62 
chars> (https://nightly.buildroot.org/#writing-rules-config-in)
     package/sane-airscan/Config.in:17: line contains trailing whitespace
     package/sane-airscan/Config.in:18: help text: <tab><2 spaces><62 
chars> (https://nightly.buildroot.org/#writing-rules-config-in)

Could you fix those please?

See also:
https://buildroot.org/downloads/manual/manual.html#_preparing_a_patch_series
https://buildroot.org/downloads/manual/manual.html#check-package

> +    select BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT
> +    select BR2_PACKAGE_GNUTLS
> +    select BR2_PACKAGE_LIBXML2
> +    select BR2_PACKAGE_JPEG
> +    select BR2_PACKAGE_LIBPNG
> +    select BR2_PACKAGE_TIFF

Could you sort those select lines alphabetically please?

> +
> +    help
> +        SANE backend for AirScan (eSCL) and WSD document scanners
> +
> +        https://github.com/alexpevzner/sane-airscan

The homepage URL should be the last line of the package "help" section.
Can you move it there?

[...]

> diff --git a/package/sane-airscan/sane-airscan.mk 
> b/package/sane-airscan/sane-airscan.mk
> new file mode 100644
> index 0000000000..d19dde232c
> --- /dev/null
> +++ b/package/sane-airscan/sane-airscan.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# sane-airscan
> +#
> +################################################################################
> +
> +SANE_AIRSCAN_VERSION = 0.99.31
> +SANE_AIRSCAN_SITE = $(call 
> github,alexpevzner,sane-airscan,$(SANE_AIRSCAN_VERSION))
> +SANE_AIRSCAN_DEPENDENCIES=  sane-backends avahi gnutls libxml2 jpeg 
> libpng tiff

Could you sort dependencies alphabetically (and add a space before "=")?
For example:

SANE_AIRSCAN_DEPENDENCIES = avahi gnutls jpeg libpng libxml2 
sane-backends tiff

> +SANE_AIRSCAN_LICENSE = GPLv2

Buildroot is using SPDX short identifiers for license names. Looking at:
https://github.com/alexpevzner/sane-airscan/blob/master/LICENSE
we should preferably have here:

SANE_AIRSCAN_LICENSE = GPL-2.0-or-later

See:
https://spdx.org/licenses/GPL-2.0-or-later.html

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
