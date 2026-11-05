Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D804606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XNsW+cC5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3822F60833;
	Thu,  5 Nov 2026 07:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HbIqlcq76Njw; Thu,  5 Nov 2026 07:33:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E0C18606D3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793864024;
	b=imonEkTYiGyCem7Rwx8KCLUH1zyr3RU97ogGNR57AOURp4UJQRI5wP2vdtICWmjv2Jmj
	 tWpbWFPHxNsbEuphw1oiv4+O00YiG1yLif1RRJE59hpjQY3Y0MToDyUP6wAGAsL+xMFRo
	 gS2DZskitYIQCIhfefUWChEG8ib9UMoLxt4LssgmQR9Ghi8SyINtGkx0b8LkHnX8j38D6
	 1TEDDU+ddhbcxHmtu1Zi7M6f0KTMxmHHfXH+AGCs/EIM3A8pDF8n90dNIVxfRKJ7O1rg8
	 XCVxLgKQSZow5Qhb+HOBOomdHxQK0hixm29x/r2N86Eh+Z9FvV8NV/tsqkqO+Sxu2cA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793864024;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=shIAbFfcUl10wg6cLWVa5sYuQ02l1dlgf/YH9w1EdN4=;
	b=ixPd5SnMtVVlmtX+SkKuSpDK/PayhrY5S9+I+ZV7U+aMs/nDNZoJfqeuM8L960Sf9u4N
	 PXiQdC1xWVoF4ycGId1m2qr8NAJpxWyqGz1NmDwxl6o0VGAPeaKwSapeWO5ZZg/XCje6G
	 i6ZMz2RIalw5N/kBUAooogRfqYJT+AVXTU8CT10PJXgLTguwskNNjWwsUn8sBducYuEwb
	 i3LCiRdx+HRIN3P3/xyg786r0JdmHXijYYvJsKzCTZA6rBt71JYb5H4HNSRLq/8rtMkLT
	 k+H5AcHDljbmruqUlANNhKF5LfdpcnpNduFzLhQ+cmDX6Dmy3TSxnnDQoNie+5E3/pA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793864024;
	bh=shIAbFfcUl10wg6cLWVa5sYuQ02l1dlgf/YH9w1EdN4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XNsW+cC5Z5HmYNseBCjlwIW48gpY8WUxkMqiwlCBF7Fe834BhSpZ2Z16rTceUx6k9
	 QDRLRAo+btj6n06G/FiF618E87f9Hq3o6/3xL/MgSLZMertZfVMbR8A6XtXMl2bxmg
	 pW3v235M31fGrWOyQ55IUZKA+mANzY/07vPCU24/Fb6aOx82DvvKoaW1ohFfk2l+01
	 AwbXBq40i+/khAQDhlczSbdYn0zHPkCH/jzKSlW7CArqB47THT64e0AcXw1JxW64lR
	 oHR5NQw4odTm0Mb0rtQb/VIld2hzI8HzznDHJMj45FriPDp6uta+pa7/S4B960fLoe
	 mztB7clFaLtYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0C18606D3;
	Thu,  5 Nov 2026 07:33:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C99311779
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE9EC81083
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X32SZmR0sifx for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 07:33:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9A64D81036
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A64D81036
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:33:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 357851A07D9;
 Thu,  5 Nov 2026 07:33:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0CECE5FF85;
 Thu,  5 Nov 2026 07:33:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF88410328E67; Thu,  5 Nov 2026 08:33:36 +0100 (CET)
Date: Thu, 5 Nov 2026 08:33:36 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auww9WDtA-QQl06g@windsurf>
References: <20261028113331.2960539-1-adam.duskett@amarulasolutions.com>
 <20261028113331.2960539-6-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261028113331.2960539-6-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 6/6] package/mender-connect: depend on
 mender, drop sysvinit file
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 12:33:31PM +0100, Adam Duskett wrote:
> Much like the mender-update-modules package, have the mender-connect
> package depend on the mender package. Also, as mender no longer supports
> sysvinit, it's safe to remove S43mender-connect
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/mender-connect/Config.in         | 20 +++------
>  package/mender-connect/S43mender-connect | 53 ------------------------
>  package/mender-connect/mender-connect.mk |  5 ---
>  3 files changed, 5 insertions(+), 73 deletions(-)
>  delete mode 100644 package/mender-connect/S43mender-connect
> 
> diff --git a/package/mender-connect/Config.in b/package/mender-connect/Config.in
> index d478e468c2..b8f3770509 100644
> --- a/package/mender-connect/Config.in
> +++ b/package/mender-connect/Config.in
> @@ -1,15 +1,7 @@
>  config BR2_PACKAGE_MENDER_CONNECT
>  	bool "mender-connect"
> -	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> -	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS

Are you sure this dependency is no longer needed?

> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, mender
> -	depends on BR2_USE_WCHAR # libglib2 -> gettext
> -	depends on BR2_USE_MMU # dbus -> fork()
> -	select BR2_PACKAGE_DBUS # runtime
> -	select BR2_PACKAGE_HOST_GO
> -	select BR2_PACKAGE_LIBGLIB2
> -	select BR2_PACKAGE_MENDER # runtime
> -	select BR2_PACKAGE_OPENSSL

And why are all those selects gone? For the BR2_PACKAGE_MENDER select,
I understand it has been changed to a "depends on", which is a very
good idea. But since mender-connect.mk has all these other packages
(dbus, libglib2, openssl) in its DEPENDENCIES variable, then those
select should stick, and therefore perhaps the related "depends on" as
well (threads, wchar, mmu).

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
