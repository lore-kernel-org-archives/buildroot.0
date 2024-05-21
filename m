Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EB4C25B75
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 10:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A935480E59;
	Tue, 21 May 2024 10:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id igHWgriqL73c; Tue, 21 May 2024 10:39:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B299C80E74
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B299C80E74;
	Tue, 21 May 2024 10:39:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A26D31C512A
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 10:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DE6880E74
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 10:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wg1i6KgYUMs7 for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 10:39:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1822880E59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1822880E59
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1822880E59
 for <buildroot@buildroot.org>; Tue, 21 May 2024 10:39:20 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 6F3AC4402D3;
 Tue, 21 May 2024 13:38:54 +0300 (IDT)
To: Jarkko Sakkinen <jarkko@kernel.org>
In-Reply-To: <20240521103154.32660-3-jarkko@kernel.org> (Jarkko Sakkinen's
 message of "Tue, 21 May 2024 13:31:53 +0300")
References: <20240521103154.32660-1-jarkko@kernel.org>
 <20240521103154.32660-3-jarkko@kernel.org>
User-Agent: mu4e 1.12.4; emacs 29.3
Date: Tue, 21 May 2024 13:39:16 +0300
Message-ID: <877cfnphyj.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1716287934;
 bh=XLr/NJCDwdkIhsRpXY/P1sKeHFBwk8QgJZMyCqRYd9g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=rV2Idf/UtXOxEJFwrk2h6Ymy634FwJxQgCgJz8AC1pC/ruuVOALOZuavmiOyedJT1
 43fXxszqRMSej4wJnNQzfBlTjyjeaWOFOaj6rAIbhEEjPT0ByiByXLINnlo0AwV+M9
 PXtDG5XDwWaGPbbuinWdEK7SjiWXP1dEPQICirwuno0mzATuA99g8+sgsYlVqQKKPP
 TJvKYH20HpiHGC7w27ARlmfSb8SAG5ukdW/5RTrq6gNuwe3l7tlsA1z4fs8mhI34Gg
 I/z3ErkZVq5OUOmSNaBiiiKmWZ4yct6WBqMkFnRF8QXnoeJy8IpLoe50DDCYmf9OrL
 K5CsgV9heCe3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=rV2Idf/U
Subject: Re: [Buildroot] [PATCH v4 2/3] package/libtpms: add host package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jarkko,

On Tue, May 21 2024, Jarkko Sakkinen wrote:
> diff --git a/package/Config.in b/package/Config.in
> index 1b6a5b0dab..30b76349ec 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1569,6 +1569,7 @@ menu "Crypto"
>  	source "package/libssh/Config.in"
>  	source "package/libssh2/Config.in"
>  	source "package/libtomcrypt/Config.in"
> +	source "package/libtpms/Config.in"
>  	source "package/libuecc/Config.in"
>  	source "package/libxcrypt/Config.in"
>  	source "package/mbedtls/Config.in"
> diff --git a/package/libtpms/Config.in b/package/libtpms/Config.in
> new file mode 100644
> index 0000000000..335a5bc7b6
> --- /dev/null
> +++ b/package/libtpms/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_LIBTPMS

You are not adding a target package, right? So this config symbol
doesn't do anything.

baruch

> +	bool "libtpms"
> +	select BR2_PACKAGE_LIBTOOL
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  Libtpms is a library that targets the integration of TPM
> +	  functionality into hypervisors, primarily into Qemu. Libtpms
> +	  provides a very narrow public API for this purpose so that
> +	  integration is possible. Only the minimum of necessary APIs
> +	  are made publicly available.
> +
> +	  It is assumed that the user of libtpms is familiar with the
> +	  concepts of the Trusted Platform Module (TPM). For the
> +	  interaction with libtpms it is necessary to know how to
> +	  construct valid TPM commands and to be able to parse their
> +	  results. It is not within the scope of libtpms's documentation
> +	  to provide background on this. See the section on references
> +	  below.
> +
> +	  https://github.com/stefanberger/libtpms/wiki

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
