Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DF2C001DB
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 19:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83B10404A5;
	Fri,  4 Aug 2023 19:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83B10404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TbU3Zasodndj; Fri,  4 Aug 2023 19:41:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C70E41603;
	Fri,  4 Aug 2023 19:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C70E41603
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E954F1BF30A
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 19:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ED3A60899
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 19:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ED3A60899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2L5YrObaV0aa for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 19:40:49 +0000 (UTC)
Received: from smtpcmd14173.aruba.it (smtpcmd14173.aruba.it [62.149.156.173])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B2BC60F76
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 19:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B2BC60F76
Received: from [10.10.3.240] ([217.14.215.226])
 by Aruba Outgoing Smtp  with ESMTPSA
 id S0fGqjiMuXI7yS0fGq51CV; Fri, 04 Aug 2023 21:40:47 +0200
Message-ID: <48bef18e-b43b-cc91-6ce4-e214ddf300f0@benettiengineering.com>
Date: Fri, 4 Aug 2023 21:40:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20230802141636.528011-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230802141636.528011-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfILEJU1cEjIaU/Xev/K6MInMalLRyt+f+N4hIXzAhUoz/5zq+0vsY+AXY+Fu+a7G07TpLCyc259upvRz8tP6nXZKnG1k4w5YJloP2/Loy1MwGMWQMRCo
 PpOrjzktLBRaF8av7DJPXECrLK/Mhf8fYc35GZCLA+oDpDy93JA1NKakUfEIys6pSxizmtx+o76y25RLBmNXrS63RFwYMUTIl2OKB31d1ezv4qR8eaJjpo0p
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691178047; bh=YLgDxypqR427qM0vQDTFnw0HqT+nQWl28Hg/+TA3i/A=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=mIVPIVVA/83Z7bpXD2QAdhfW7WyJlIPAd9hQwa8WBGaWS/gw6AkEmzxIzOO2j+qq3
 1/ZxlDB0/Wur+j2QU5Sfey4VNTaE/IV0W8GSG3lzYUZERS2PbxgBC9UDvDtfZ31JAs
 v6AbcOtVHPmd7H5o2b8o7UDA+QZje8sNDpfAAGV+8rtq8AhVKDubp/z+3P3O1iNtYN
 XpKW725LiisyHcuJRkP8wRlS895ZhK84Vc8xBKuCIB+zWLKh4VGHNZ9M1H6+s5W95h
 UFOD543F9M9/m7f+Aj9am36rf1Kg8N0kShS8WJBDSECFdwXHLb+6TTjSne/0T0Zzq5
 igHCTuNYCXQdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=mIVPIVVA
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 8.1.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch is superseded in favor of:
https://patchwork.ozlabs.org/project/buildroot/patch/20230804193801.93049-1-giulio.benetti@benettiengineering.com/

So please ignore it.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

On 02/08/23 16:16, Giulio Benetti wrote:
> Release notes: https://github.com/harfbuzz/harfbuzz/blob/main/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/harfbuzz/harfbuzz.hash | 2 +-
>   package/harfbuzz/harfbuzz.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index 6b71e3819c..72210a78f9 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  c1ce780acd385569f25b9a29603d1d5bc71e6940e55bfdd4f7266fad50e42620  harfbuzz-8.0.1.tar.xz
> +sha256  639596da7c26cc503b16b3bf4dfdca77fe832d3c9e06004ef63a7ce53cafbac9  harfbuzz-8.1.0.tar.xz
>   sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index 3118ec62c9..ce3573c10d 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 8.0.1
> +HARFBUZZ_VERSION = 8.1.0
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
