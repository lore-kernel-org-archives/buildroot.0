Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A617C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 19:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF0F584055;
	Tue, 17 May 2022 19:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N8S2Q78jZO3I; Tue, 17 May 2022 19:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF77D84051;
	Tue, 17 May 2022 19:05:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC37F1BF403
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8D17400E7
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:05:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tpm.dev
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1VLpoeRfaOr for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 19:05:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.84.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B382E400D6
 for <buildroot@buildroot.org>; Tue, 17 May 2022 19:05:16 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se15.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1nr2VH-000BZ0-Oy; Tue, 17 May 2022 14:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wSzPz3sXF4ZlgwQ5xsvFgklJwvUjsZ28D4rRZnwN23U=; b=vfz9twijtZsi1GNWFvhIOj5mhR
 R2K3vFEqFAJTZkZ2YDsNIRd6R559d0htZaA8ZyGFH+HkYNFUt518vJUV9iF6xoVnjfyPPQXb6teWN
 kGfdwgU8KUlunt0Qy0ePGeXzW7UTTxu6HezbFAz80rp/01rLPuNyIgISXY2640p8L0AicObnX/zA7
 XiOzmx95+ll1wG3nEQngOxjTIw22t8NwwabG7pJFyHr1lXlxO0T2+76jdYQtKoP+1ZqVj6r+mSZx1
 kADGJBjDx0f2ve/KC/WJluLj15KjcwHAS85GNJJx60LctcPyZJHZyDJ0zhRs669CZs7xQQ5VKsn49
 ab0yaUPw==;
Received: from [127.0.0.1] (port=55866 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1nr2VF-0005T3-OP; Tue, 17 May 2022 19:05:05 +0000
MIME-Version: 1.0
Date: Tue, 17 May 2022 22:05:05 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220508212014.629607-1-dimi@tpm.dev>
References: <20220508212014.629607-1-dimi@tpm.dev>
Message-ID: <539cab4f25219d3d7136e45ee5b676cb@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.07)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/kKBN2yEG8jbY01Oez7syUPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zHcgQ1GLCGZipGdBYX2IdejIhOyETOLJV5VgRmbWjZJaaj
 T7GK+pV+DB0C1T8MJSONp1orT0zdSv/EvZ56A6zUQaXPwIlI4yu/PH1NWDdGRXrh7kU/SuqHD4Cv
 Q979nLRTtObPqIqeRAv2CqzEPfjvBK5fzIEWxOKtcShtfOYYenQg45AD+/l6P8h0+TPjaDxMfcvw
 9uVrltEafCGDyHAgdas/VTNCC9cNG0ZUHetAVuAXlm/yIarJ6MLtuWSGk5WZn7S9PqmI7CxqPRD6
 uYFudoaWhtzmZkRARzb78U8jgtvvQ7y3dU9ER0LU50yMqo1YAXmmS2uxFfdNkSrBSOzvSb4d2v72
 6lpj8/w5Va6KvnTD1aveotlgoppd3/OkI+ve6RqPPT75ZQBVMc+Li61b6cTrAfIBtLJVe62uoyOA
 UtfsPev7LNp/T0V6wcNiJWH6ZboosCGGDrdx/yGEn66RE9n6xcs9dAjFcdYUmx6p0CV+3YBwFTmQ
 DwcsbTdCl4f6Bfy1T3PwsUos1yNYdTOG17NirEYyqwqMBGrw8ELiqDAff04cDRXGaP/Cy6sgzmsE
 /Xy9bqh2t87xwDNJ1ZQn9Z1kUo7APEynsyHYUP3usgPt8rNcco5Lt6ku63DkksyWUQhsiRV7ToHt
 3HSONnNjcxw3qqhc+N6cuEg4XWh5FjslDV7JB4HFfS0/2yGK2yCDXFRbN2pkrihG/UKyJjnjMhu5
 TRR5cKFUN7m6ISC70DEpm2ullKxIwLsgWlzZNEZaQCr/dvGoj2N6wPGyQhcy/xMlGH0grBJyegCM
 lHzlnVvxDejqc1gSvA2YxCROcMKj46tpTq90fyEpkn1wmMJknWEFS9JKrkl3Ur0zyZYa76Aa+NDD
 gxIDReJqDhBLh9OA6FUBPUmckVrDaGHG7IPt5VWnW7TvTEgILf+wkQBcTJsQ3wBLhfjzLLk2xAYe
 CQ5MKMVNU1MWbk3aYt4d3CGj9R/2gMGq0KWAzmMf+ibVDk8gzUl63tPLnledawfW6jQnnFjtsPZC
 g5QQOAc5oHYvTwkJPEpc5Yq4Nm1q4KoqJC7/+fOTvqVqTiiM4NskccTs6mXQ/4uVfOguYCGyTIL+
 KM69iZgNhXgmyObHGuYd7aarXFBjLtWuD4L90XktJ6A=
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: Re: [Buildroot] [PATCH 1/1] package/wolftpm: new package,
 wolfTPM library for TPM2.0
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-05-09 12:20 AM, Dimi Tomov wrote:
> From: Dimitar Tomov <dimi@tpm.dev>
> 
> wolfTPM is an open-source TPM 2.0 stack with backward API 
> compatibility,
> designed for embedded use. It is highly portable, and has native 
> support
> for Linux. wolfTPM has a compact code size with low resource usage.
> 
> Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
> ---
>  package/Config.in            |  1 +
>  package/wolftpm/Config.in    | 14 ++++++++++++++
>  package/wolftpm/wolftpm.hash |  2 ++
>  package/wolftpm/wolftpm.mk   | 29 +++++++++++++++++++++++++++++
>  4 files changed, 46 insertions(+)
>  create mode 100644 package/wolftpm/Config.in
>  create mode 100644 package/wolftpm/wolftpm.hash
>  create mode 100644 package/wolftpm/wolftpm.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 8892134133..2a8bf18699 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1432,6 +1432,7 @@ menu "Crypto"
>  	source "package/trousers/Config.in"
>  	source "package/ustream-ssl/Config.in"
>  	source "package/wolfssl/Config.in"
> +	source "package/wolftpm/Config.in"
>  endmenu
> 
>  menu "Database"
> diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
> new file mode 100644
> index 0000000000..497f5ae6e9
> --- /dev/null
> +++ b/package/wolftpm/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_WOLFTPM
> +	bool "wolftpm"
> +	depends on BR2_PACKAGE_WOLFSSL
> +    select BR2_PACKAGE_WOLFSSL_ALL
> +	help
> +	  wolfTPM is a portable, open-source TPM 2.0 stack with
> +	  backward API compatibility, designed for embedded use.
> +	  No external dependencies, compact code size with low
> +	  resource usage.
> +
> +	  https://www.wolfssl.com/
> +
> +comment "wolfTPM needs the wolfSSL cryptographic library"
> +	depends on !BR2_PACKAGE_WOLFSSL
> diff --git a/package/wolftpm/wolftpm.hash 
> b/package/wolftpm/wolftpm.hash
> new file mode 100644
> index 0000000000..871e3e2d1d
> --- /dev/null
> +++ b/package/wolftpm/wolftpm.hash
> @@ -0,0 +1,2 @@
> +# Hash from 
> https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.3.1.tar.gz
> +sha256
> f0d7c095491ac2cc9e44aa4ac3c22febf15942ef080431d8b43a9d0312ca6567
> wolfTPM-2.3.1.tar.gz
> diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
> new file mode 100644
> index 0000000000..33cfdef6af
> --- /dev/null
> +++ b/package/wolftpm/wolftpm.mk
> @@ -0,0 +1,29 @@
> +################################################################################
> +#
> +# wolftpm
> +#
> +################################################################################
> +
> +WOLFTPM_VERSION = 2.3.1
> +WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
> +WOLFTPM_INSTALL_STAGING = YES
> +
> +WOLFTPM_LICENSE = GPL-2.0+
> +WOLFTPM_LICENSE_FILES = LICENSE
> +WOLFTPM_CPE_ID_VENDOR = wolfssl
> +
> +WOLFTPM_DEPENDENCIES = host-pkgconf
> +
> +# wolfTPM's source code is released without a configure script,
> +# therefore we need autoreconf
> +WOLFTPM_AUTORECONF = YES
> +
> +WOLFTPM_CONF_OPTS = --disable-examples --enable-devtpm
> --with-wolfcrypt=$(TARGET_DIR)/usr/
> +
> +define WOLFTPM_CONFIG_RPATH
> +    touch $(@D)/build-aux/config.rpath
> +endef
> +# Fix for autoconf bug with config.rconf
> +WOLFTPM_PRE_CONFIGURE_HOOKS += WOLFTPM_CONFIG_RPATH
> +
> +$(eval $(autotools-package))

Hi Thomas,

Could you please take a look at this contribution?

Regards,

Dimi
--
Founder of TPM.dev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
