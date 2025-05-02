Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC493C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ADD8813E9;
	Fri,  2 May 2025 11:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLD7bbbI8mZF; Fri,  2 May 2025 11:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B876981407
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B876981407;
	Fri,  2 May 2025 11:02:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8819EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEE5160AE6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvCfNESmZeaa for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:02:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C5F260AD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C5F260AD6
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C5F260AD6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:02:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0FA831C0D8C; Fri,  2 May 2025 13:02:53 +0200 (CEST)
Message-ID: <a7984d35-9f96-40f0-afcc-2f6ad6504311@rnout.be>
Date: Fri, 2 May 2025 13:02:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Charlie Jenkins <charlie@rivosinc.com>, buildroot@buildroot.org
References: <20250410-pixman_riscv_dependency-v1-1-25d44d225acc@rivosinc.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250410-pixman_riscv_dependency-v1-1-25d44d225acc@rivosinc.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183773; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=jOCZRhiJH0NB4oFsfUk1oaYBikWItOmbxUgWfOy+6A8=;
 b=Hup4M4c0fVSF/vRxB2UfGmO+5m1XIpEtrw8BdFiFQ7RTPwd2NXcSizIlLFwaMzc2uKg2Gf
 MNZLnbAkdgZYRmI+KGu818C7fJnTNliyvL+do1D1djrfNuhhn2dD9UIhSaAb8t6rwsQnJD
 7gYiP1f8iLCdtK1pF0joJKHB5S0XF1U+RGu59Rrw5xJ5t56qB4drHrc7XTGrjEfaP3cssD
 uejYjisSsh2ewFiEQyRKHHJwYzTaS1zmImS9Grnf9p79z/4yC0zm7lBOyMcVLPvK63LUA5
 oi/y5Z0Yu95nwUv5Awo853HNIdjPeHCSN+8T07kV5rVpY9HKbJRkt+oHFHKAow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Hup4M4c0
Subject: Re: [Buildroot] [PATCH] package/pixman: Specify riscv dependency
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



On 11/04/2025 03:08, Charlie Jenkins wrote:
> riscv Pixman depends on COMPAT_HWCAP_ISA_V which is available in Linux
> 6.4+, so make Pixman dependent on headers that are at least 6.4.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/pixman/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/pixman/Config.in b/package/pixman/Config.in
> index aa2a68f6257ccc30f7daa9f1d8a4e93ba366101b..a10c19c673c4e7d778167f8c0c11475e74fc1943 100644
> --- a/package/pixman/Config.in
> +++ b/package/pixman/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_PIXMAN
>   	bool "pixman"
> +	depends on !BR2_riscv || BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
>   	help
>   	  Cairo pixel manager
>   
> 
> ---
> base-commit: f2b14baf2576b54cca43e6f2aebbb4a19fae3bd9
> change-id: 20250410-pixman_riscv_dependency-00d2cca17b88

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
