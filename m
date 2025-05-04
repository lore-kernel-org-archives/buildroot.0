Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41650C369DC
	for <buildroot@archiver.kernel.org>; Sun,  4 May 2025 22:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE9F181138;
	Sun,  4 May 2025 22:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxatgAnPZ1bK; Sun,  4 May 2025 22:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E0A28187F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E0A28187F;
	Sun,  4 May 2025 22:27:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DEAF6EA
 for <buildroot@buildroot.org>; Sun,  4 May 2025 22:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D071640808
 for <buildroot@buildroot.org>; Sun,  4 May 2025 22:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nkybDoWYbYc for <buildroot@buildroot.org>;
 Sun,  4 May 2025 22:27:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.147;
 helo=smtpweb147.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C43B14080E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C43B14080E
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C43B14080E
 for <buildroot@buildroot.org>; Sun,  4 May 2025 22:27:55 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id BhoPuN2vn2QPuBhoPumKRY; Mon, 05 May 2025 00:27:53 +0200
Message-ID: <dff6d9ac-177a-478e-92b2-35cef9afb29c@benettiengineering.com>
Date: Mon, 5 May 2025 00:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250504222712.213695-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20250504222712.213695-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfJXdNYqLxDTEoaWO/MvP7iyJNubeP/xSq8ZXs4cJOd6PFaLTAoqM2EMVMTTlZtyaycs+jtI6HJ6PJzJv2RKcQRSPRio/2YA70FI0AjEd2qJIiWMJiuDH
 2/CXSiX4C50CG76rIJIxi7h2RXHmoDvEVC+MJMWs9Fb6LNhvn6SOtVi+adgSA6y81qUGMpV/Z/cnyQvBaMYU1Ifp7gzpqFhxH/dH/ZE3jX2fVPzpO7ej2mnt
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1746397673; bh=CFLFLKngaXAIpKMDtNeFqDWdEoiEvcv+mRaxFXChGQM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Xt/gzf2AmX9eCDk5+ZIGOaOUouJKkduIdQ8bp24+6h2cx0X9kQruTkGIJWZDPO2Fd
 bMGy8K43nRPNwFwD8XnOQ2bvdaKQ7Wq2F6pR69F6DFMVx+O8bJ1MBsZe2l6BJ50nn6
 KWenusXJBoxWjbQltVXZJDezfvidsuvGdXTAP/R5cZLDziRYlk3A32d8/BTGzpUsWu
 KV9rdXVtQv+HOGPB7U86OzyAWTVoi+OfybdZG4YP2vSNLADzY1jlsDHux4wSu109OQ
 0DVrBvtID4jZX3UTWul9l+h7H4m5EoZjo1Nee1e2GZQgtcemHGcFFQgIpmPO73yy32
 6Jydhy4hadYZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Xt/gzf2A
Subject: Re: [Buildroot] [PATCH v2] package/rtl8812au-aircrack-ng: bump to
 version 2025-03-30 on branch v5.6.4.2
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

On 5/5/25 00:27, Giulio Benetti wrote:
> This version adds support up to Linux version 6.14.
> 

Fixes:
https://autobuild.buildroot.org/results/4bbbd61aaca1172bb6be46c8f9cd577ee77a7ddc/

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * squashed with previous pending patch
> ---
>   package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
>   package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> index ea5ca3c56b..bb7c4b297d 100644
> --- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> +++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  d08bad19680047cb178d8984bfdd09d9ff7765b8c9ee35a9f8f87676f0c41a64  rtl8812au-aircrack-ng-b44d288f423ede0fc7cdbf92d07a7772cd727de4.tar.gz
> +sha256  d4a1435e29bf4a46a4b0b31cad91f30bb263a899b382f828125437dce3cb4bae  rtl8812au-aircrack-ng-c3fb89a2f7066f4bf4e4d9d85d84f9791f14c83e.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> index 3a7c56a3fc..1308508e00 100644
> --- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> +++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8812AU_AIRCRACK_NG_VERSION = b44d288f423ede0fc7cdbf92d07a7772cd727de4
> +RTL8812AU_AIRCRACK_NG_VERSION = c3fb89a2f7066f4bf4e4d9d85d84f9791f14c83e
>   RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
>   RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
>   RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
