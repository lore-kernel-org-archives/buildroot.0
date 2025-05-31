Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B75AC5AD49
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 06:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2EC040B2D;
	Tue,  3 Jun 2025 06:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2yXCtRdNwSl; Tue,  3 Jun 2025 06:22:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D23F41588
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D23F41588;
	Tue,  3 Jun 2025 06:22:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C9AFDA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CC2A81FDA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uv8JKxolltdI for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 06:22:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 662F381332
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 662F381332
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 662F381332
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6C73F1C140E; Tue,  3 Jun 2025 08:22:03 +0200 (CEST)
Message-ID: <794d47bd-a3b7-49da-b651-218d8a40d0f5@rnout.be>
Date: Sat, 31 May 2025 19:00:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250509121718.761131-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250509121718.761131-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748931723; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LMdBAE8IpxeSPCKDpt50S/KrYFhn5i61vJYVDMh4v9c=;
 b=dvxQMQIuRKzFqKTvKkKTsCVcxic8bo8Y8S9C9gPR6ONFd6xhO6J0aYMj3MhS36oMOZ9OU4
 VX0LS5UslNmpGvi9CdrZp4aCv9hCQatCzso2oycvc9Str4a32ldRWvpBYR4ScLs08llIRs
 L9iMaELdPumhlcF9GrWZxArKVXP+aWBNNiwHgRlLTymYJ+LBP46WWG1SiXAvvRI2kUO/38
 b3WOyl2f3UDOIQYowaA/7MbkHnE1ZraInA+lKIcZO10COGQRYJwNDBsWGJEZXavEfBJ0PJ
 aQbAmG7/ChI1UB7MbLhla58kJrngOpVmgkLCUb+C3B3Yq6HBBYKMKHG8G243Yw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dvxQMQIu
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_t1040d4rdb: bump
 linux kernel to 6.12.27
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



On 09/05/2025 14:17, Julien Olivain wrote:
> Since commit [1] "package/binutils: make 2.43 the default version",
> the freescale_t1040d4rdb_defconfig fails to build the Linux
> kernel, with the error:
> 
>      arch/powerpc/boot/util.S: Assembler messages:
>      arch/powerpc/boot/util.S:49: Error: junk at end of line, first unrecognized character is `0'
>      arch/powerpc/boot/util.S:54: Error: syntax error; found `b', expected `,'
>      arch/powerpc/boot/util.S:54: Error: junk at end of line: `b'
> 
> This commit fixes the issue by updating the Linux kernel to the lastest
> LTS version.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089767
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/360fd01de20eb42aa0e6b5e9f7b37eaa104c6fc9
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/9984902177
> ---
>   configs/freescale_t1040d4rdb_defconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/freescale_t1040d4rdb_defconfig b/configs/freescale_t1040d4rdb_defconfig
> index ad231e7f1e..851e011983 100644
> --- a/configs/freescale_t1040d4rdb_defconfig
> +++ b/configs/freescale_t1040d4rdb_defconfig
> @@ -1,10 +1,10 @@
>   BR2_powerpc64=y
>   BR2_powerpc_e5500=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
>   BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
>   BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="fsl/t1040d4rdb"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
