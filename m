Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE71606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 13:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=l6MQAA//
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C62FE608A2;
	Fri,  6 Nov 2026 13:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-4Gdbvacycz; Fri,  6 Nov 2026 13:42:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9DAB76085F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793972553;
	b=j6PCS/cA2Hmfi7qbYdUQJkddpqJEYDM9sq7dib3+FIbMMnFe8PFuGThuCS7GJuMY43b9
	 gMmupyrmpngJgf508Ozks/VCXURrf1yHKzky+fV+8t9nSchAlT2pLrJZI68KK13CQ/DfC
	 CjgDvd5NgejfDdHPGfp45kxPfDCAx1sUlTVtbbEAUka9o+ASyB3VaRgQFpcFcS3KhE5Fk
	 /gZqiIMvXL++B80ElsTiNllQjByraVxlJgKlYhqTolEq7HsVYMnIuajpzvRwQegs2YRVe
	 mtCKvKMusGHwtPYH+toKDIV8vF+cHmH+OK0VabJEGNMuxjLr4U3YOZL9iNig68V0rEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793972553;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 In-Reply-To:References:Date:Cc:To:MIME-Version:Message-ID:User-Agent:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=9mKNjYWMJwW2DIY76VVbPPBrkHRLd0hHSNnp4N9N9v4=;
	b=Eyniy+t+xaIFDeCCXWNIXfqSkHoQAIW1QAmbLVEFloG0ecwkwYPsTohL5C7VFYnMpw78
	 GiBmyzCw0d+iYvQf94UhuZRwq3f1zT4effb443yVvtAeGa3EKMvW+WlsSk0xFROIytgWA
	 Qo1aLe8DFVkW/wYfP9+MGq7thoJFsxz34u3AUrC9G5VJiok/ddI9H2pnNOZku2NqQ/cb3
	 OhHfHyhQ1HYM5PjTJaYDxxNAdgv8tyC4StZM3RKW/2cssHNe4OPCvXrPEmAhtcue5PeVk
	 dEHZhSUUL96jumfTPg5R84oIHjSQ3YcppNviAtqD8rtMnpbxdCwez2Sg2vW3MrK3QCg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793972553;
	bh=9mKNjYWMJwW2DIY76VVbPPBrkHRLd0hHSNnp4N9N9v4=;
	h=In-Reply-To:References:Date:Cc:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l6MQAA//igKnD+vJRfTcnFRsCXLo7l2Zd1uA4punDo+eTH8mZ3o9cNJL7JhfJV5jr
	 t7KeenYwZYfCIAeYR/lkye8BfZ/zNujlpiS6+B9MlldKAdWBtZVWx6pr60pVlu0vNg
	 gMH/Hv61OkNL9kN88QX9ibAGVChySPaHiFjIxWSVTNAm99C0WLx1FKXYD8I2yoGN73
	 iqyBDaRtDr+RwG52+jfTt0TnDkx1p0jXBunKt5DZcGVecmsvnqvTdSr7nUSiZSvsi6
	 SHL7oV4Oq4VxsO2/G94tkrlf4WrVuUD43jkNQ4BwUxK1j4Vd7AKHFEMu6Zaps8P8RB
	 pOMyDRd0EANmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DAB76085F;
	Fri,  6 Nov 2026 13:42:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3B1B362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 13:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4F7E80D7B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 13:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLhmu2vypXsw for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 13:42:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F019F80D66
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F019F80D66
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 13:42:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id ED6FE1814BF; Fri, 06 Nov 2026 14:42:24 +0100 (CET)
In-Reply-To: <20261029140215.181385-1-giulio.benetti@benettiengineering.com>
References: <20261029140215.181385-1-giulio.benetti@benettiengineering.com>
Date: Fri, 06 Nov 2026 14:42:24 +0100
Cc: buildroot@buildroot.org
To: "Giulio Benetti" <giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <2d6af2ba-8770-a909-53ea-3a39da33d648@heine.tech>
User-Agent: SOGoMail 5.12.12
X-Last-TLS-Session-Version: None
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/harfbuzz=3A_fix_build_?=
 =?utf-8?q?failure_with_GCC_15?=
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Giulio, all

On Thursday, October 29, 2026 15:02 CET, Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> HarfBuzz 15.0.0 enables _GLIBCXX_ASSERTIONS, which introduces references to
> std::__glibcxx_assert_fail(). By default, HarfBuzz uses the C linker,
> which does not link against libstdc++. This results in undefined references
> to std::__glibcxx_assert_fail() when building with GCC 15.
> 
> So let's enable the with_libstdcxx Meson option to use the C++ linker and
> fix the build.
> 

The issue seems to only appear when BR2_OPTIMIZE_0=y is set. With the default BR2_OPTIMIZE=2 the build succeeds.

> Fixes:
> https://autobuild.buildroot.org/results/f88449ca8a3846ed2bdbcabc00a701ba73ebd5ac/

I think we should also add

Fixes: b82efddfa9 ("package/harfbuzz: bump version to 15.0.0")

Tested-by: Michael Nosthoff <buildroot@heine.tech>

Regards,
Michael
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/harfbuzz/harfbuzz.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index a68d8658b8..7395a2a93c 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -94,5 +94,8 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
>  HARFBUZZ_CXXFLAGS += $(TARGET_CXXFLAGS) -DHB_NO_MT
>  endif
>  
> +# Harfbuzz uses C linker by default, force C++ linker
> +HARFBUZZ_CONF_OPTS += -Dwith_libstdcxx=true
> +
>  $(eval $(meson-package))
>  $(eval $(host-meson-package))
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
