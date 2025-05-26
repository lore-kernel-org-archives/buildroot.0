Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233BBC54FB3
	for <buildroot@archiver.kernel.org>; Mon, 26 May 2025 21:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF0AE60609;
	Mon, 26 May 2025 21:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7bWib0M6JgZg; Mon, 26 May 2025 21:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E72F4605BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E72F4605BD;
	Mon, 26 May 2025 21:34:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 982BD19F
 for <buildroot@buildroot.org>; Mon, 26 May 2025 21:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A3D54006C
 for <buildroot@buildroot.org>; Mon, 26 May 2025 21:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qcZeep8whps for <buildroot@buildroot.org>;
 Mon, 26 May 2025 21:34:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.71;
 helo=smtpcmd0871.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF425403FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF425403FC
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF425403FC
 for <buildroot@buildroot.org>; Mon, 26 May 2025 21:33:59 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id JfSHuAQ0oyJfSJfSHuwZ9l; Mon, 26 May 2025 23:33:57 +0200
Message-ID: <a6505332-25fa-4633-b3ca-017274b99f21@benettiengineering.com>
Date: Mon, 26 May 2025 23:33:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250526203501.126937-1-ju.o@free.fr>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20250526203501.126937-1-ju.o@free.fr>
X-CMAE-Envelope: MS4xfGbyCSBzOhUMRw3konOVEp5AfMNlCRMbhm2Jtg71tcxth6ICu0V7RAzyNwSLRKhR+wmDRQnq09ROQvCZ08Zrx2mPiKGX8r9EYu6za1RSBxbCAiJskSBG
 AjnG+xtV8+ZQxAPc9nlxpwqNbyq0WK7eNK0fjnnzD4BedlBh6HcdUYyQ+Bijpa+Uwo7XCbSpQ6DFGcpviqsC/QggeplwjMxnYdo4ObaCfksTU7DX+DXP84Az
 OhtTcWJ8993v6MUW1mj1WQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1748295237; bh=RekYunD6GtWL8csgbKuwqmUfHwy9FmJASR8bYUOeIOM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=GG7twOLT/Lk7Oi0rf6oWuX8bt9CEXP0PNvssIm9SPIqc4eOFzPG0zRugle2UaP+Xe
 dntr7j5W8JUJd6jaN8QIzH2O+Nln5/tHFIgr/48pZtCNF+Uu/JlE0nnCuPCXQJszxz
 JMkOl0UQmimHhwVmGG7drfZFgyJr4lH8YBI0hOtmg4Smm+gac07JygeDub7PJuLXlZ
 oF5NVbUAsM9kD8voDmPcLPRB8i13EoPLdetDyxoXIKTSsOphbNiPnnm/Rvb0RhVGmx
 C0fhWY+PGApDN55ymLJ7tT9mgre/6Rfdj6s+aCAfAeWt0/DlUcflnt32JCKLwNSeOz
 yukac022143nw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=GG7twOLT
Subject: Re: [Buildroot] [PATCH 1/1] package/esp-hosted: fix legal-info
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

Hi Julien,

pardon, I haven't tested legal-info :-/

On 5/26/25 22:35, Julien Olivain wrote:
> The esp-hosted package was introduced in [1] defining the variable
> ESP_HOSTED_LICENSE_FILE (singular). The name should be
> ESP_HOSTED_LICENSE_FILES (plural). This typo makes the license file
> being ignored during a "make legal-info" which shows a warning at
> the end:
> 
>      WARNING: esp-hosted-9a2312b0b: cannot save license (ESP_HOSTED_LICENSE_FILES not defined)
> 
> Fixing the variable name also reveals the license file path was
> incorrect. The "esp_hosted_ng/host/" directory prefix is missing.
> Finally, setting the correct path shows the hash was wrong (it was
> the hash of the Apache-2.0 [2] file, which corresponds to another
> unused code portion). So the license file hash is also changed to
> correspond to the correct GPL-2.0 license file.
> 
> This commit fixes all the needed esp-hosted legal-info.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/7b2e5e6550aed4f79461919c6a59e00741eb4b11
> [2] https://github.com/espressif/esp-hosted/blob/release/ng-v1.0.4.0.0/LICENSES/Apache-2.0
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> ---
>   package/esp-hosted/esp-hosted.hash | 2 +-
>   package/esp-hosted/esp-hosted.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
> index 8de3c00190..fee82b00e0 100644
> --- a/package/esp-hosted/esp-hosted.hash
> +++ b/package/esp-hosted/esp-hosted.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
>   sha256  66c07e2f69d8a10fb111b6df27fbe3558734d660207a54391c46eea3e12b29ee  esp-hosted-9a2312b0b2630e41bacb3091faaba489cb43b0ab.tar.gz
> -sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
> +sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  esp_hosted_ng/host/LICENSE
> diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
> index 4c249eec46..475d32da43 100644
> --- a/package/esp-hosted/esp-hosted.mk
> +++ b/package/esp-hosted/esp-hosted.mk
> @@ -8,7 +8,7 @@ ESP_HOSTED_VERSION = 9a2312b0b2630e41bacb3091faaba489cb43b0ab
>   ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
>   ESP_HOSTED_DEPENDENCIES = linux
>   ESP_HOSTED_LICENSE = GPL-2.0
> -ESP_HOSTED_LICENSE_FILE = LICENSE
> +ESP_HOSTED_LICENSE_FILES = esp_hosted_ng/host/LICENSE
>   ESP_HOSTED_MODULE_SUBDIRS = esp_hosted_ng/host
>   
>   define ESP_HOSTED_LINUX_CONFIG_FIXUPS


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
