Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E01AC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 101BF40710;
	Fri, 16 May 2025 10:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Ls18r3nlLOK; Fri, 16 May 2025 10:43:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 359E841814
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 359E841814;
	Fri, 16 May 2025 10:43:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06F621AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90B8841814
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBzR1moiF_Et for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:43:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A69CE41992
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A69CE41992
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A69CE41992
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:43:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CBD641C10FB; Fri, 16 May 2025 12:43:04 +0200 (CEST)
Message-ID: <8ead5945-b86b-4370-af29-10591a964c1c@rnout.be>
Date: Fri, 16 May 2025 12:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lance Fredrickson <lancethepants@gmail.com>, buildroot@buildroot.org
References: <20250417043845.2171938-1-lancethepants@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250417043845.2171938-1-lancethepants@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392184; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vxXEsXLiMe4Kn6IISuQsOaqi4ZFxuQBVzy1GzjZBr30=;
 b=AbA2LuLRoiGSyB3RPydLbE7wTrbWhVycX05dHRxRGiI1sAZoa3FZlfWxw0Tc1fZd5JnuRz
 CDhf14dFtm6RoJgmuCeEW/N/xkXjoifHYFiOGXp3x3Ob5YLADybskLfTpEN83xxDvyqXJG
 d6ne0xCm+z+B7h1GpMB9tdKOktY6YsnovpnxCEAF9ZERYH4tYK+F+iMeornqT5fJyDQrLs
 iUTz+zQGHg8r2GHlYkEkYjj6Xk6HRdAJHs18MpHFdQ0g+bLMhDvBbs8UzdJmvAg3fb64YR
 VlU+MC7SV8dYpij+ZetcMkSzMy6YuKk4o2NamQCT/CHGRmmc1hBZaaj1yTwFLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=AbA2LuLR
Subject: Re: [Buildroot] [PATCH 1/3] package/libubox: bump version to 3868f47
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



On 17/04/2025 06:38, Lance Fredrickson wrote:
> From: Lance Fredrickson <lancethepants@gmail.com>
> 
> Changelog:
> 
>   - 3868f47 blob: constify attr argument to blob_memdup
>   - eb9bcb6 ustream: prevent recursive calls to the read callback
>   - 12bda4b CI: add CodeQL workflow tests
>   - a2fce00 CI: add build test run
>   - c1be505 udebug: fix crash in udebug_entry_vprintf with longer strings
>   - 6339204 CMakeLists.txt: bump minimum cmake version
>   - ca3f6d0 udebug: fix file descriptor initialization for __udebug_buf_map
>   - df5b714 udebug: add mips specific quirk
>   - d27acfe udebug: add more checks for uninitialized buffers
>   - 40acbe3 udebug: wait for response after buffer add/remove
>   - e84c000 udebug: add inline helper function to test if a buffer is allocated
>   - 325fea5 udebug: add functions for manipulating entry length
>   - e80dc00 link librt if needed for shm_open
>   - 260ad5b udebug: add ulog support
>   - b77f2a4 uloop: fix build using C++ compilers
>   - d4c3066 udebug: add udebug library code
>   - b3fa3d9 uloop: reset flags after __uloop_fd_delete call
>   - 8a5a431 uloop: fix typo in signal handling rework
>   - f7d1569 uloop: properly initialize signal handler mask
>   - 13d9b04 uloop: add support for user defined signal handlers
>   - 82fa648 uloop: add support for interval timers
> 
> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>

  Applied all three to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/libubox/libubox.hash | 2 +-
>   package/libubox/libubox.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
> index 7738caf223..eb37d33230 100644
> --- a/package/libubox/libubox.hash
> +++ b/package/libubox/libubox.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  918acc85199117ef109f2a204020f6fe4d5a1724a09888f45b70b6474345d6fe  libubox-75a3b870cace1171faf57bd55e5a9a2f1564f757-git4.tar.gz
> +sha256  df6e1350fd11016ef30242a279cec195d91e6748c11c40e0991593718c46fa52  libubox-3868f47c8f6c6570e62a3cdf8a7f26ffb1a67e6a-git4.tar.gz
> diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
> index d6da078c7b..00ae2b0595 100644
> --- a/package/libubox/libubox.mk
> +++ b/package/libubox/libubox.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBUBOX_VERSION = 75a3b870cace1171faf57bd55e5a9a2f1564f757
> +LIBUBOX_VERSION = 3868f47c8f6c6570e62a3cdf8a7f26ffb1a67e6a
>   LIBUBOX_SITE = https://git.openwrt.org/project/libubox.git
>   LIBUBOX_SITE_METHOD = git
>   LIBUBOX_LICENSE = ISC, BSD-3-Clause

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
