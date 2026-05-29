Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2CFCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54CDB61594;
	Fri, 29 May 2026 08:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7xSCtHJyy5KZ; Fri, 29 May 2026 08:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 577BC613D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043415;
	bh=q3W7uzvYxaBspsHowQu2+T+0pm6KM3wt2pyxznIqseU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qh5KGNgW5Ld8f+eVIa6XACA/Tb3Mv51sXKo6opzByWYVtQOB4iu0naNH290INPMGe
	 bHok6JuDcY5X1ClK6VhHaoCTXugmQNIkeu9ztblrCt66Lqrm8ADC+uKFJi2+5854YD
	 SuaLFCmrwXkUGjcyZPFj1Q2ilPC7J5W2/NLUJVfK6qqq6dV/tMP6UjKoc5X2nZHyGJ
	 pCbxDt535IEspf1Cn+zqh7q5OuaR2mt2V7bNPHFDhO0YtN7uarmMiDa4KJNOqLJXBp
	 WS9nds855iY2aDGlz8sGnWsCIIsGtkHgLAveqeCi+sZtAC5nXacNYSPcFJ541U57QW
	 0Ye+XsVTGcUkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 577BC613D0;
	Fri, 29 May 2026 08:30:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71655288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52E9E613C6
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zo_tZe-FeCxx for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 37B3261389
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37B3261389
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37B3261389
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:09 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso46272105e9.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043407; x=1780648207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wVPRRZ8DhVTTcGE3eRpgQU20pey7Q1E9xtVNbanoS4U=;
 b=fmbtvDH4XM3+hldWdlclGq1E4cF/HVEH198BKapjkPELVnviVijm/6d5trLzsSZ0q8
 +Woy1Qq0EKIU+whidezDqKd/7NIPwbED7L0XPmHO3t3MDES9ST2BGmxHTfpUXAROZby/
 eGQ3JoBuknX3skgs6jOeuyuAeZ7R4t3HCt/VvMGi62Rv/31e9DK/F87dwnUfi8eW5a09
 X3AyIgVsD6Y8iBjkf91H660VCIIBrDmot6bffrPL+6Uewt7B0YNrcd/bFSzLi3ShH3N+
 F5+0ViZ0cr4L6ppgYEbtPse+otT8wBnxLLCEChOY49XzusCfOL69wdBlbDYOzqIelyx5
 9RRQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/yd/dJJAZ+AMlD4l01Vsbeq82sKJ/UdDuyoz9ggnI0A4YBLI4y+r7z+YP/wptEkdM1J78jo+fxV7c=@buildroot.org
X-Gm-Message-State: AOJu0Yy71ugOA5olebWM2cD1t22ITJlSe6CvMSik0JYd/1TaDxe0KiQy
 VSwcLMIRguC8p8gaxEvD5LPRONlXyStl22NCQkEaTLg+OLdSNSSTEhwwohgH6xW0xE4=
X-Gm-Gg: Acq92OEwzd3fBqFTVmFLx2K7HvSGPxP05c+wqKtswzSDUxLwUeby5QeL+SK/o6F4guc
 bQeMlLlLAeQI/jdg1JxU0l4s5gVWOapHiraxJZ+7a8mfqacgHE29HaqxfysSoyYl1LOMqalD3uF
 9HnYAwY9Rrkw0Sg1SfoZgp/PRi6gWjWcNX9LQapu/8jR9vx0R77WV0q3+7M8U24flAZFTAiUkL0
 MxKlM2yoc99/QZn92CewmG1mhy7gTeThTK9N5aX/6PsawdFp2RBW8Gn19R5mm9tirWc9k99piUm
 /rdV0qS8HssXenb1NtYDYkOjmK4xoXzr1DSv7rIoC8QHhdcy0fZlaPoxUkSxKulu1SXr3dTgMVD
 aAcGUd+uPgoYavTZH1quOMCGPcSubBwgsL9josdcb31yeCkUqbsxjPfG1KDnH7vFK304/6i/0P/
 gdU2tNxpfWSFJ6yZaIiIUqTrrinuQVnVJ7HwfHfPg1ocb5wNLMGwM2VROZNw==
X-Received: by 2002:a05:600c:6219:b0:490:9df1:f0cf with SMTP id
 5b1f17b1804b1-4909df1f29bmr22837425e9.2.1780043406917; 
 Fri, 29 May 2026 01:30:06 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c0ac831sm9738865e9.10.2026.05.29.01.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:06 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:05 +0200
Message-ID: <20260529083005.58764-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427201606.896700-1-ju.o@free.fr>
References: <20260427201606.896700-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043407; x=1780648207; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wVPRRZ8DhVTTcGE3eRpgQU20pey7Q1E9xtVNbanoS4U=;
 b=MZ2SPgmtoobswnqXlYoy/ufrKacTrhRZXU9vARKvT/NAnrUN3HxWZcZp5NhRDZaEOL
 OWkRmMr7e/54iAaZOzKiqKcEDtWNFMAMgmtu2G+cRLH5I05QWvdUKKSPolaKSC0KllYs
 hoT999wHKmJ+fo139JsXDru/p8HeZbyY0VZCX4v0h13DPb3Ui5pPPsMne8gLr8Lvusyr
 qJtVJxut27hUeUyzAjd0BHjuT2BWfGE08uW/Xvo08DdMwtB6lN93qFYvk5Mg53mSzENK
 0m9GvcyF/vQIqj63rVl0MgvtKoXkTAzVpRxYiueAi9G7y6XaqiZzxU7VCAnwGd0L3xzT
 mb9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MZ2SPgmt
Subject: Re: [Buildroot] [PATCH 1/1] package/libabseil-cpp: add patch to fix
 build with gcc <= 12
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> libabseil-cpp headers can break some packages build, like protobuf,
> when compiled with gcc 12. See [1] [2]. The issue has been reported
> in protobuf upstream, in [3].
> 
> The issue is due to gcc <= 12 not supporting the mix of standard
> C++ attributes with GNU attributes. See [4].
> 
> Gcc 12 has been removed from Buildroot internal toolchains in
> commit [5], but gcc 12 can still be present in external toolchains
> or on the host. This is currently the case of the Buildroot Docker
> reference image, based on Debian 12 (Bookworm).
> 
> This commit fixes the issue by adding a package patch.
> 
> Fixes:
> - [1] [2] and many more.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/13904066346
> [2] https://autobuild.buildroot.org/results/33f6cfd37cb48c15a53b3e7123d5ce8388a0f2ab
> [3] https://github.com/protocolbuffers/protobuf/issues/26383
> [4] https://gcc.gnu.org/PR69585
> [5] https://gitlab.com/buildroot.org/buildroot/-/commit/58cf7c51da3ae4804332f68ee934e153d695d047
> [6] https://github.com/abseil/abseil-cpp/pull/2044
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  ...SL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch
> 
> diff --git a/package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch b/package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch
> new file mode 100644
> index 0000000000..8f5e255795
> --- /dev/null
> +++ b/package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch
> @@ -0,0 +1,55 @@
> +From 77326826119439c06e341c9d090633ecd9b520d6 Mon Sep 17 00:00:00 2001
> +From: Julien Olivain <ju.o@free.fr>
> +Date: Mon, 27 Apr 2026 19:38:19 +0200
> +Subject: [PATCH] base: fix ABSL_ATTRIBUTE_WARN_UNUSED with gcc <= 12
> +
> +Gcc <= 12 does not support mixing standard C++ attributes with
> +GNU attributes. See [1].
> +
> +This can lead to build failures such as [2] [3] and [4]. In those
> +situations, the compilation fails with error such as:
> +
> +    /usr/include/absl/base/attributes.h:1076:36: error: expected identifier before '[' token
> +
> +Gcc maintainers mentioned in [1] comment 9 that this bugfix will
> +not be backported in Gcc 12. Gcc 12 is still used in LTS
> +distributions. For example, it is included in Debian 12 (Bookworm),
> +which is still supported until 2028. See [5].
> +
> +This commit adds a workaround for gcc <= 12 which uses
> +__attribute__ in that case, which fixes the compilation failure.
> +
> +[1] https://gcc.gnu.org/PR69585
> +[2] https://github.com/protocolbuffers/protobuf/issues/26383
> +[3] https://autobuild.buildroot.org/results/33f6cfd37cb48c15a53b3e7123d5ce8388a0f2ab/build-end.log
> +[4] https://gitlab.com/buildroot.org/buildroot/-/jobs/13904066346
> +[5] https://www.debian.org/releases/bookworm/
> +
> +Upstream: https://github.com/abseil/abseil-cpp/pull/2044
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +---
> + absl/base/attributes.h | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/absl/base/attributes.h b/absl/base/attributes.h
> +index 5887fcaf..a26143e1 100644
> +--- a/absl/base/attributes.h
> ++++ b/absl/base/attributes.h
> +@@ -1092,7 +1092,14 @@ struct AbslInternal_YouForgotToExplicitlyInitializeAField {
> + // See https://clang.llvm.org/docs/AttributeReference.html#warn-unused and
> + // https://gcc.gnu.org/onlinedocs/gcc/C_002b_002b-Attributes.html#index-warn_005funused-type-attribute
> + #if ABSL_HAVE_CPP_ATTRIBUTE(gnu::warn_unused)
> ++// Only GCC >= 13 allows mixing standard and gnu attributes.
> ++// In case of gcc < 13, fallback on using __attribute__.
> ++// https://gcc.gnu.org/PR69585
> ++#if defined(__GNUC__) && !defined(__clang__) && __GNUC__ < 13
> ++#define ABSL_ATTRIBUTE_WARN_UNUSED __attribute__((warn_unused))
> ++#else
> + #define ABSL_ATTRIBUTE_WARN_UNUSED [[gnu::warn_unused]]
> ++#endif
> + #else
> + #define ABSL_ATTRIBUTE_WARN_UNUSED
> + #endif
> +-- 
> +2.54.0
> +
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
