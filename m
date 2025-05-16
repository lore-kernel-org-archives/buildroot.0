Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B675C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3167A60863;
	Fri, 16 May 2025 10:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 750xTZ3QAmGb; Fri, 16 May 2025 10:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 624C6608B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 624C6608B0;
	Fri, 16 May 2025 10:55:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D1E911AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B68434178C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXgRx3t9Qp5f for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:55:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE0C741743
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE0C741743
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE0C741743
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:55:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C9F561C10F2; Fri, 16 May 2025 12:55:37 +0200 (CEST)
Message-ID: <f40f26aa-3e10-4a15-b704-9a3defa259da@rnout.be>
Date: Fri, 16 May 2025 12:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
References: <20250506194148.2957434-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250506194148.2957434-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392938; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=94ZPyAHrIu9YyDkr3j8Bk4Bwz5RuIAiIYLBjMMA7xMo=;
 b=AOTTZgmUq88qsfoerL7lwJdWwTFCM8HupGdsdJGi8JMB0oroBPhIicxSN1oobU+3n2iHKE
 mRDz7zUK6eNHqOlH+yXFR4QAF5QBs4xN+QYsk3O6QAuJOeFYtIXpNSpLgrQa2SAAXr7bWO
 D0wLhx9x9Nlj5I6aUnS37lxhVtArfONtpFALuw9E7xxlnyyMla/PF18vVGJBEGpi1ms8C/
 Nm4y6XGbs+Py956AlRaCHaFXw/Syz2QYrxZLofO//l3yCeHiGfuZZWTFDsfzWs2wPGr9hR
 cjP7f9S1+c1fdGa/WiUAEjjTYqts3o6PiMg3E0qEHgSTwNhF6CZZ7miNIWXp1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=AOTTZgmU
Subject: Re: [Buildroot] [PATCH 1/1] configs/friendlyarm_nanopi_r3s: fix
 host linux headers custom version
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



On 06/05/2025 21:41, Julien Olivain wrote:
> Since its introduction in commit [1], the
> friendlyarm_nanopi_r3s_defconfig is failing to build with error:
> 
>      Incorrect selection of kernel headers: expected 6.12.x, got 6.13.x
> 
> The error happens because the defconfig has:
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
> and
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.13.4"
> 
> This commit fixes the issue by setting instead:
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_13=y
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216429
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/41734e00c0cc36f4df2f492e72b535a0716d4048
> 
> Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/9947235741
> ---
>   configs/friendlyarm_nanopi_r3s_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/friendlyarm_nanopi_r3s_defconfig b/configs/friendlyarm_nanopi_r3s_defconfig
> index 39e21c74fd..4219147033 100644
> --- a/configs/friendlyarm_nanopi_r3s_defconfig
> +++ b/configs/friendlyarm_nanopi_r3s_defconfig
> @@ -1,6 +1,6 @@
>   BR2_aarch64=y
>   BR2_cortex_a55=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_13=y
>   BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-r3s/patches"
>   BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>   BR2_TARGET_GENERIC_HOSTNAME="nanopi r3s"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
