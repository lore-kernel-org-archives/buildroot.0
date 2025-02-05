Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58BEC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94DCD4249B;
	Wed,  5 Feb 2025 11:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Q3tL4Ft_XIT; Wed,  5 Feb 2025 11:29:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 697C5424A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 697C5424A8;
	Wed,  5 Feb 2025 11:29:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E5D212A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F206F424A8
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBMPphKhWdYb for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:29:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A13C54249B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A13C54249B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A13C54249B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:29:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0D5A4327E;
 Wed,  5 Feb 2025 11:29:23 +0000 (UTC)
Date: Wed, 5 Feb 2025 12:29:23 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: buildroot@buildroot.org
Message-ID: <20250205122923.269e3a87@windsurf>
In-Reply-To: <20241219053053.2389046-13-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
 <20241219053053.2389046-13-brian.cain@oss.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghrihgrnhdrtggrihhnsehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738754964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vhpa+d031OTjD19hlRfPCGEg03x/pAsUVQG+AsiM+0E=;
 b=RPAD7bjsWBr810nrBLOdBztPqiIKaJWsTUSph/ZOad1CFfJyidg8P1wJhuXQ+KKfkY7E4M
 bCmdSYpuPXSHQSFo84OhA/o1cYIfx1RTpO4fr7bSC6HL17ApXiJIKxsSFuDF6fUPl6yLdJ
 eylMXT9oSPQsdDiR84WtcsKv2Av13wcRhYpJEBUxRsBage7MsNLjtamE+pEAqqOvzJW5QG
 ykVhG5NJ4Hq+BoBqfR24/+IoH+blSgQpobIyI6xsZz1IylpL0ikXKH/nMIYoQY5ALx2SwZ
 FDq8pFPsOCvwTlxt1lJ07jst4bBhkpGPRGaaetl2a7KUonb/F8jPZXX4TyDD3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RPAD7bjs
Subject: Re: [Buildroot] [RFC v2 12/14] toolchain: disable PIE for hexagon
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 18 Dec 2024 21:30:51 -0800
Brian Cain <brian.cain@oss.qualcomm.com> wrote:

> Without this change, dav1d fails to detect atomics:
> 
>     Command line: `/local/mnt/workspace/upstream/obj_br_qemu/host/bin/hexagon-unknown-linux-musl-clang /local/mnt/workspace/upstream/obj_br_qemu/build/dav1d-1.5.0/build/meson-private/tmpvgk6hjv0/testfile.c -o /local/mnt/workspace/upstream/obj_br_qemu/build/dav1d-1.5.0/build/meson-private/tmpvgk6hjv0/output.obj -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -O2 -g0 -D_FILE_OFFSET_BITS=64 -O0 -Werror=implicit-function-declaration -Werror=unknown-warning-option -Werror=unused-command-line-argument -Werror=ignored-optimization-argument -std=c99 -D_GNU_SOURCE` -> 1
>     stderr:
>     hexagon-unknown-linux-musl-clang: error: argument unused during compilation: '-pie' [-Werror,-Wunused-command-line-argument]
>     -----------
>     Checking if "GCC-style atomics" compiles: NO
> 
> Because the toolchain wrapper adds linker args to compiler invocations and
> -Werror=unused-command-line-argument is enabled, it fails here.
> 
> Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
> ---
>  toolchain/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 4354fde340..e650236e06 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -34,7 +34,7 @@ config BR2_TOOLCHAIN_USES_MUSL
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_STATIC_LIBS
> +	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_STATIC_LIBS && !BR2_hexagon

Isn't that rather related to the fact that Clang is used?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
