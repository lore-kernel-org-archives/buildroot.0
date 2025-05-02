Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2A8C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ACD283A8E;
	Fri,  2 May 2025 10:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FifPfxINnO-v; Fri,  2 May 2025 10:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A798F83AB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A798F83AB8;
	Fri,  2 May 2025 10:29:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D4BD229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E7AD40B1F
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxqPYDCeJJoN for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:29:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6364B40A92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6364B40A92
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6364B40A92
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:29:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6B6021C1112; Fri,  2 May 2025 12:29:46 +0200 (CEST)
Message-ID: <3ea3f914-ecb5-4177-b68c-ff963a1efa50@rnout.be>
Date: Fri, 2 May 2025 12:29:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250415191548.2122362-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250415191548.2122362-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181786; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xzlMoc8Ud1lJ4UVstvGrTzgsNj4+eiv61aP5jIbPiw4=;
 b=Lr+Z9geiimMyjkfKsZ2A3/Tz57i48Y3/B3YozFm0Fn/2Ca97jShhMufPJekZVD7JJio6cW
 QFDw4u+S3O+we14kIV/h5EL6FqtU3a6PS8hS2nCfVQGY4QyFHp45CK+0CmKy118l3JnBTP
 Gz04eiA42sD/ajMG5U8TuPyErgZBUnFloLIzErdrseO+ZcrvIjhLzFHq4/ZRxIPyDU5yq4
 fi/QMAKbp8z2mF5ZBPu1DuJ86MltuNt5tM656HwNpO74q0+Ln3vrYHQo8CkCqkmFRwH75b
 oP0sUH/msIuY/BA7fRXkuCTYv07rHvoAJcG8vZjjDhx2MXigugvMJSADQaSxww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Lr+Z9gei
Subject: Re: [Buildroot] [PATCH] package/double-conversion: bump to version
 3.3.1
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



On 15/04/2025 21:15, Thomas Petazzoni via buildroot wrote:
> Upstream changelog from
> https://github.com/google/double-conversion/releases/tag/v3.3.1:
> 
>      Hash pin Github workflows by @joycebrum in #198
>      Create dependabot.yml by @joycebrum in #199
>      Add _ITERATOR_DEBUG_LEVEL=2 and _DEBUG defines by @ffa-csturdy in #202
>      Add bzlmod MODULE.bazel file by @jsharpe in #205
>      Add CIFuzz Github Action by @DavidKorczynski in #203
>      Update MODULE.bazel and README.md. by @BYVoid in #234
>      Remove the explicit dependency on rules_cc. by @BYVoid in #235
>      Add missing headers by @BhavikaSharma in #239
> 
> Tested with the following configuration, which includes the only two
> reverse dependencies of double-conversion.
> 
>   BR2_arm=y
>   BR2_cortex_a9=y
>   BR2_ARM_ENABLE_VFP=y
>   BR2_TOOLCHAIN_EXTERNAL=y
>   BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>   BR2_INIT_NONE=y
>   BR2_SYSTEM_BIN_SH_NONE=y
>   # BR2_PACKAGE_BUSYBOX is not set
>   BR2_PACKAGE_QT6=y
>   BR2_PACKAGE_PYTHON3=y
>   BR2_PACKAGE_PYTHON_UJSON=y
>   # BR2_TARGET_ROOTFS_TAR is not set
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/double-conversion/double-conversion.hash | 2 +-
>   package/double-conversion/double-conversion.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/double-conversion/double-conversion.hash b/package/double-conversion/double-conversion.hash
> index e3a5754933..a10da6d75d 100644
> --- a/package/double-conversion/double-conversion.hash
> +++ b/package/double-conversion/double-conversion.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  04ec44461850abbf33824da84978043b22554896b552c5fd11a9c5ae4b4d296e  double-conversion-3.3.0.tar.gz
> +sha256  fe54901055c71302dcdc5c3ccbe265a6c191978f3761ce1414d0895d6b0ea90e  double-conversion-3.3.1.tar.gz
>   sha256  4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  COPYING
> diff --git a/package/double-conversion/double-conversion.mk b/package/double-conversion/double-conversion.mk
> index 74e90d30d7..a4760236ca 100644
> --- a/package/double-conversion/double-conversion.mk
> +++ b/package/double-conversion/double-conversion.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DOUBLE_CONVERSION_VERSION = 3.3.0
> +DOUBLE_CONVERSION_VERSION = 3.3.1
>   DOUBLE_CONVERSION_SITE = $(call github,google,double-conversion,v$(DOUBLE_CONVERSION_VERSION))
>   DOUBLE_CONVERSION_LICENSE = BSD-3-Clause
>   DOUBLE_CONVERSION_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
