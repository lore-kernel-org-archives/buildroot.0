Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971B4C7EE2A
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 13:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C9B5614ED;
	Wed, 25 Jun 2025 13:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOp183gmWz6G; Wed, 25 Jun 2025 13:27:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63DDC614E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63DDC614E2;
	Wed, 25 Jun 2025 13:27:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59B8D12C
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55BA780DF1
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b67C8PRiMa2H for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 13:26:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.133;
 helo=smtpdh18-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E009980DCE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E009980DCE
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E009980DCE
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:26:56 +0000 (UTC)
Received: from [172.25.4.128] ([212.103.203.10]) by Aruba SMTP with ESMTPSA
 id UQ9OuJ3l9WAxHUQ9OuP0jx; Wed, 25 Jun 2025 15:26:54 +0200
Message-ID: <fcb67636-9dc3-41eb-a630-8bd9b097d7c6@benettiengineering.com>
Date: Wed, 25 Jun 2025 15:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20250625063302.3663685-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20250625063302.3663685-1-dario.binacchi@amarulasolutions.com>
X-CMAE-Envelope: MS4xfD7ar0aZq5vXB9BDrhCdt8qVlPR2HrXz6aByxe3my06AE6fXVOHa9XIkxhHbuZwDvlLbbOvdr30UCYRG4i6x7A79q2w8n3wrLTGC0vigHYOFeH4PwRfu
 A6VQUrHXYr+P0BG84x+mOEEnZfm2rzQX/cGQttsupPp4d21wcvJv+yq1iEyjme7/rZtcYOKKdfQM8rSvFFNod8lO4AxNqd1pLk8FIEcDGOntQQk7RvugHbGG
 YEcUvXymAZmCx0/P7A5h/YeHHZErH0+bjqFV+6kq/pyaUpDLiyVlx2K0wlCIX+0iwSjgGOYHdec1JjRgnPcCLVX3Xg2jo/Qgubi+sZhxGN3RcECR5KNuOXdg
 w/xrUVfyeZbdvIMbg2Cdlv85PbQvrg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1750858014; bh=YYauyumMuegEL/3cxdKLeJ4OIiJj6iOZW1yfjO6k4n4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=c2x+f8oOc0bCvzQN6Txazv1ZjY32+Ax91+AQKzNjiWVAKksxCaWrQ1QNOZZZ5fxAU
 GndXfTwEFxOJZcC8PAor3m1C2baFzWJpU9rnTkdLhDwtsURgB8e4RrSau0J1I0dWEt
 Zj3rxr87EuvNPCiwVTOX3gtdIW7XanyOLRK2AmglzJZlB1w4Yvk4dlh1YvzKHnEH1i
 PHyxBvsgJL4nCXI//in6zsqLEyZDUm3rev5Aa6ZCDyCX+9L2ReUtyNdcKRzUFGIAtX
 eRSoNM3jZJfbk0V2UXQrdC1Wg+5GdNEnVkTfZNTt8KPjILBlrDQW9jk7EdmXBQqqdX
 urfPm06O8cKfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=c2x+f8oO
Subject: Re: [Buildroot] [PATCH 1/1] package/mmc-utils: bump version to 1.0
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
Cc: linux-amarula@amarulasolutions.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On 6/25/25 08:33, Dario Binacchi wrote:
> This is the first tagged version of the package, so replace commit SHA
> with version tag.
> 
> Change log since last version bump:
> 
>    d8a8358a7207 mmc-utils: Pass key_mac buffer to rpmb_get_key()
>    a23ad7875b89 mmc-utils: Start to use the generic print_usage function
>    e769d44ecb77 mmc-utils: Introduce a generic print_usage function
>    6586fa5535dc mmc-utils: Simplify and streamline print_help function
>    ec75d4b3b671 mmc-utils: Remove unused adv_help member from struct Command
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Thank you for the patch!

Reviewed-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Kind regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
https://www.linkedin.com/company/benetti-engineering-sas/
https://www.linkedin.com/in/giulio-benetti-79975951/

> ---
>   package/mmc-utils/mmc-utils.hash | 2 +-
>   package/mmc-utils/mmc-utils.mk   | 5 ++---
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
> index 685952a6150b..781bd972d4ba 100644
> --- a/package/mmc-utils/mmc-utils.hash
> +++ b/package/mmc-utils/mmc-utils.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  e10cd7fded5f248d515fe40e35f73fe491e87e4b608ca857afa40fcb8cda1ae2  mmc-utils-c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58-git4.tar.gz
> +sha256  39e6a89e06b53f99816f110af6743d1adc82220b26c51b0c3fd0a11ccf4206c2  mmc-utils-1.0.tar.gz
>   sha256  49cd65f67b516078ff7e0dbe639972dad21ed3858246e3969fc8a8fc2a4dca66  README
> diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
> index b439c84d474f..9696f2a6dc85 100644
> --- a/package/mmc-utils/mmc-utils.mk
> +++ b/package/mmc-utils/mmc-utils.mk
> @@ -4,9 +4,8 @@
>   #
>   ################################################################################
>   
> -MMC_UTILS_VERSION = c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58
> -MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
> -MMC_UTILS_SITE_METHOD = git
> +MMC_UTILS_VERSION = 1.0
> +MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/snapshot
>   MMC_UTILS_LICENSE = GPL-2.0
>   MMC_UTILS_LICENSE_FILES = README
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
