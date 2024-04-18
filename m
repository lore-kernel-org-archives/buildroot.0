Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25B8C4345F
	for <buildroot@archiver.kernel.org>; Thu, 18 Apr 2024 14:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48B74410B9;
	Thu, 18 Apr 2024 14:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTVEtzSD-OrN; Thu, 18 Apr 2024 14:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B63F4410AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B63F4410AE;
	Thu, 18 Apr 2024 14:03:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BD7D1BF3AD
 for <buildroot@lists.busybox.net>; Thu, 18 Apr 2024 14:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17E8941702
 for <buildroot@lists.busybox.net>; Thu, 18 Apr 2024 14:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yarGjAHPg8kY for <buildroot@lists.busybox.net>;
 Thu, 18 Apr 2024 14:03:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B61E416D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B61E416D3
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B61E416D3
 for <buildroot@buildroot.org>; Thu, 18 Apr 2024 14:03:05 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xSLurMvcPEZuWxSLvrhFQO; Thu, 18 Apr 2024 16:03:03 +0200
Message-ID: <fc33f5e4-094a-4cab-b6b1-c9212fea6e37@benettiengineering.com>
Date: Thu, 18 Apr 2024 16:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240207214729.115691-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240207214729.115691-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfBvnbp84bWp1P+lgvFmNIbwltfuZFFWpknymzahPDATlXHBs4C6yPyk+2+SwZVQcQ3wAcmxBqICJZ7R3l+p8zqzmLi+NlO4dDM/5rSZ+8FgpilPfa2gf
 Gjt8DrrZjw72AiEZdXTelDtsIpCWf8jtZEnGcdSJS7w4Lrs1ZbQd0Q8K/292wkP5snf/ab/OLvzMRJ5gPWjWzkCmaF6K8EHjGg0CydcwLcpQuUxHgK8yaBCb
 /mulJnYLMl+T086d24GfFg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1713448983; bh=JTvWeO0BX8hx19TosU/8wFvIeGPYdU1GnQFlO970ywc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=dQTSeBrdrNQrG/XTCHdfpljL8x8IgPsXre1fhw7c6UOpZiiyonbcue0u0R6vRS0cV
 3bMs9EBZzfmwH7C8Wodz49sUE7bdi8KrCyZi7/4409E/hfPQFHi9hb/s4vmGD7CjA5
 LZWDDT3AaDgEAcFRN+CH9xuyXQVqi7QHoWK3C/R8GZEd/muJhhlMT1gSngkqV+BDAD
 dhtRJatBln4dhiGkfHMks4VGzQlMSSc4FUCyXXbqadj/xSFGGNSbU6tBXbTN9vAd4u
 vyf6CgxzuYwO7OXJmjIjBYUDVgfb1HqjgcaCYvbxWANtnVqddk9xHWSlMw4ohc6JcL
 splPj3A+oASQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=dQTSeBrd
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: bump to 2024-02-06
 version on v5.2.2.4 branch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/02/24 22:47, Giulio Benetti wrote:
> This version allows to build with Linux 6.8

Fixes:
http://autobuild.buildroot.net/results/c2524c7580d97f7387ec22da62be71d77f2ed8ec

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/rtl8188eu/rtl8188eu.hash | 2 +-
>   package/rtl8188eu/rtl8188eu.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
> index eb28e6cf0a..4f8f83e78c 100644
> --- a/package/rtl8188eu/rtl8188eu.hash
> +++ b/package/rtl8188eu/rtl8188eu.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  8cb10a047d39f13c776b0097ef1290f6b3c63590fd57bc0827e8638c878819f0  rtl8188eu-306f3e62cf7cddf8cee74f70f88a7a7b3af46f56.tar.gz
> +sha256  507d32eb91d3d407c7758319c81a36a9dc69e2b89378cabcd382411153927b7b  rtl8188eu-f42fc9c45d2086c415dce70d3018031b54a7beef.tar.gz
>   sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
> diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
> index 36a84d34de..eca0fb8007 100644
> --- a/package/rtl8188eu/rtl8188eu.mk
> +++ b/package/rtl8188eu/rtl8188eu.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8188EU_VERSION = 306f3e62cf7cddf8cee74f70f88a7a7b3af46f56
> +RTL8188EU_VERSION = f42fc9c45d2086c415dce70d3018031b54a7beef
>   RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
>   RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
>   RTL8188EU_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
