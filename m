Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B4EC71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 617E8408FA;
	Thu, 12 Jun 2025 20:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VehX9yFF2z4; Thu, 12 Jun 2025 20:03:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C72A4089F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C72A4089F;
	Thu, 12 Jun 2025 20:03:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BBF21BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1CE080C2D
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CGS1Taoyd4-I for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:03:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A1C680C06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A1C680C06
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A1C680C06
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:03:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 31CB41C0E09; Thu, 12 Jun 2025 22:03:02 +0200 (CEST)
Message-ID: <a741ab74-af99-4555-9f88-63443836dd78@rnout.be>
Date: Thu, 12 Jun 2025 22:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20250528195252.4D25E87758@busybox.osuosl.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250528195252.4D25E87758@busybox.osuosl.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758582; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NYkYbqcyGHwaoNtZ7sowtjAW2bKdOtA+JRpLkuoMUVc=;
 b=kon1wUTHSJs23kqeh29KKoyI+Qk6H0IJCTCvw4wzycyGpPIu1ldu2Zo1T2yPxEaiO9Wda6
 SgsqpIG73U0zy0bttnIpxDqDMCDMyOS7Vr2Y88L64jaHFpQKE+GAoFNoHyio6FMG3X/ieh
 w4temE5XtX7MfgT0rulVHzN5RIdVv3jxcG59JFR2ulqMBGiYh2eWDDlkgOG8C4juIAdVJx
 jNAHdnOSO4/FLeif8wADwY8PmNk5LvYaUYHRznitPbj/BfKGPMDkRqPtJmhw2aRUi1myGF
 roKcCmfQnq4imE9Bt2iuAn4XoF4DDjoyBqlwxLth5TV1iBUshMHHvZL0K/Ooug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kon1wUTH
Subject: Re: [Buildroot] [git commit] package/libcamera: correct build
 directory for IPA stripping
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



On 28/05/2025 21:52, Peter Korsgaard wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=c9355a3869e3d735df90fc1c012108fdca72ac78
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Commit 4e95062f8 ("package/pkg-meson: use buildroot-build for build
> directory") changed the build directory for meson packages to
> 'buildroot-build', so update the find invocation to match.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/libcamera/libcamera.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index d732424015..1cd7a22952 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -130,7 +130,7 @@ endif
>   # otherwise the signature won't match the shlib on the rootfs. Since meson
>   # install target is signing the shlibs, we need to strip them before.
>   LIBCAMERA_STRIP_FIND_CMD = \
> -	find $(@D)/build/src/ipa \
> +	find $(@D)/buildroot-build/src/ipa \
>   	$(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
>   		-not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) ) \
>   	-type f -name 'ipa_*.so' -print0
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
