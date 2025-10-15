Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CC9CCD193
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 10:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67685415CD;
	Wed, 15 Oct 2025 10:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0wU_SqRGMjQ; Wed, 15 Oct 2025 10:08:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84916415D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84916415D1;
	Wed, 15 Oct 2025 10:08:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EACE1BA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 10:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2073E41619
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 10:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUeIhiHvMq7i for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 10:08:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A02141608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A02141608
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A02141608
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 10:08:00 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C8A782C80CE5
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 12:07:58 +0200 (CEST)
Message-ID: <471b9ed3-c6f1-4c6c-a596-87867d63c272@bubu1.eu>
Date: Wed, 15 Oct 2025 12:07:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20251015095641.2677817-1-buildroot@bubu1.eu>
Content-Language: en-US
In-Reply-To: <20251015095641.2677817-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760522878; bh=R/6WWPIoNhpfWQpXYQTlIIRsylET7MaVsy2tjhjmm7E=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=EIFA9OUiPv2gIfnK6QfIBgO53T5BZuDVm6Y0ix0lFC5VXzbDcaGBv5zi9DNKHHtH2
 qKnKCxpNpTPAUXlBvtiBBg54YObB8eG31Sev5R38QUjELwtRM3h7RhkAo2uHJbu7eS
 aIG5on9AAfhlR1GTBIWroZk07cBGI8HApTK2Z68EaTTOM77APROfr7a4WMgssRJIOu
 SbIqE09ymbHckLD61BzYKUFaL0Z5RIsis9nmI65mVd6YZfstql2DTTyysDjz44ujB3
 8K2OIPy/KsxAp2YRoaITnSA5b3esI3OSZlgDHRpWGhlEoi2RIXgPYmVWoiBlazpDOm
 LHOyzl1ht403g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=EIFA9OUi
Subject: Re: [Buildroot] [PATCH] package/python-starlette: bump to 0.48.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Forgot the signoff.

On 10/15/25 11:56, Marcus Hoffmann via buildroot wrote:
> Release Notes: https://github.com/Kludex/starlette/releases/tag/0.48.0
> Github namespace changed, so change the link in Config.in.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---
>   package/python-starlette/Config.in             | 2 +-
>   package/python-starlette/python-starlette.hash | 4 ++--
>   package/python-starlette/python-starlette.mk   | 4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-starlette/Config.in b/package/python-starlette/Config.in
> index 90f590689a..64f8345a92 100644
> --- a/package/python-starlette/Config.in
> +++ b/package/python-starlette/Config.in
> @@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_STARLETTE
>   	help
>   	  The little ASGI library that shines.
>   
> -	  https://github.com/encode/starlette
> +	  https://github.com/Kludex/starlette
> diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
> index 4937d93ad0..bcc71c09c5 100644
> --- a/package/python-starlette/python-starlette.hash
> +++ b/package/python-starlette/python-starlette.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/starlette/json
> -md5  5ae93b12a6b5527fc97c5ba3921bc552  starlette-0.47.3.tar.gz
> -sha256  6bc94f839cc176c4858894f1f8908f0ab79dfec1a6b8402f6da9be26ebea52e9  starlette-0.47.3.tar.gz
> +md5  9e56e4be3ee2a746ee6375fd9e81f61c  starlette-0.48.0.tar.gz
> +sha256  7e8cee469a8ab2352911528110ce9088fdc6a37d9876926e73da7ce4aa4c7a46  starlette-0.48.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
> diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
> index 04f40460b7..a643623e03 100644
> --- a/package/python-starlette/python-starlette.mk
> +++ b/package/python-starlette/python-starlette.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_STARLETTE_VERSION = 0.47.3
> +PYTHON_STARLETTE_VERSION = 0.48.0
>   PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
> -PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/15/b9/cc3017f9a9c9b6e27c5106cc10cc7904653c3eec0729793aec10479dd669
> +PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/a7/a5/d6f429d43394057b67a6b5bbe6eae2f77a6bf7459d961fdb224bf206eee6
>   PYTHON_STARLETTE_SETUP_TYPE = hatch
>   PYTHON_STARLETTE_LICENSE = BSD-3-Clause
>   PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
