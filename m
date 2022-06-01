Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E2EC433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 20:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51257409B0;
	Wed,  1 Jun 2022 20:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I5dJERthW30L; Wed,  1 Jun 2022 20:20:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4393F40920;
	Wed,  1 Jun 2022 20:20:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DA8C1BF2C7
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 20:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DBE0813FF
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 20:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tpm.dev
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mUjZ4mE-T-s3 for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 20:20:02 +0000 (UTC)
X-Greylist: delayed 00:28:49 by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.85.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C554C813D8
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 20:20:02 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se21.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1nwUN0-000I9I-5F; Wed, 01 Jun 2022 14:51:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z9ugSqoZGmEd0iFiSJkSYkYLZh45g1vJy/uD0V6S+jo=; b=N3zAg/ds3bfXMxepBvt0ksD2kw
 WLSNqUJnHmLh5O6d5xES0wUeTrx/WusKbKLbrN8YFmB8JYHDviODkkZN/pTZQyKdVIgEVgHQDrx4e
 3gfKvXT+0UyJvwESYeBzJwSDtR7TaS9StIZT5f/mH6iTX5gXAyRrf8KzvGHlXtnN9YVaz73IUEhX6
 PfiMidGKAmP/cOuUXYvnh6G00MW/t19Iu0V/si9l3uEMS+qNHqL8KhxbIV1ZwnWerkjVcm30VmyF3
 1xwImv4awBubSg/J37JVSHCwzYPTEkjZqcJ8v806fK496a+rmZzkO2JoH69oKwtjiWk2K0aQ9qr97
 gqgtchtQ==;
Received: from [127.0.0.1] (port=54174 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1nwUMy-000IeW-CI; Wed, 01 Jun 2022 19:51:04 +0000
MIME-Version: 1.0
Date: Wed, 01 Jun 2022 22:51:04 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220601194746.29106-1-dimi@tpm.dev>
References: <20220530203001.574908-1-dimi@tpm.dev>
 <20220601194746.29106-1-dimi@tpm.dev>
Message-ID: <9f915a23d9405688bf99ed0b2a3c9f92@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.05)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/XJ6C0Bew/adSRPcN5k08rPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zHcgQ1GLCGZipGdBYX2IdejIhOyETOLJV5VgRmbWjZJaaj
 T7GK+pV+DB0C1T8MJSONp1orT0zdSv/EvZ56A6zUQaXPwIlI4yu/PH1NWDdGRdNUOq8Nyt+6s5nR
 wAu4zPZTtObPqIqeRAv2CqzEPfjvBK5fzIEWxOKtcShtfOYYenQg45AD+/l6P8h0+TPjaDxMfcvw
 9uVrltEafCGDyHAgdas/VTNCC9cNG0ZUHetAVuAXlm/yIarJ6MLtuWSGk5WZn7S9PqmI7CxqPRD6
 uYFuWlL+AzdNu5X5f7NNcHGqANvvQ7y3dU9ER0LU50yMqo0fwo59SDjkNCcxe0BTVI7WSb4d2v72
 6lpj8/w5Va6KvnTD1aveotlgoppd3/OkI+ve6RqPPT75ZQBVMc+Li61b6cTrAfIBtLJVe62uoyOA
 UtfsPev7LNp/T0V6wcNiJWH6ZboosCGGDrdx/yGEn66RE9n6xcs9dAjFcdYUmx6p0CV+3YBwFTmQ
 DwcsbTdCl4f6Bfy1T3PwsUos1yNYdTOG17NirEYyqwqMBGrw8ELiqDAff04cDRXGaP/Cy6sgzmsE
 /Xy9bqh2t87xwDNJ1ZQn9Z1kUo7APEynsyHYUP3usgPt8rNcco5Lt6ku63DkksyWUQhsiRV7ToHt
 3HSONnNjcxw3qqhc+N6cuEg4XWh5FmdlgpEWziJwQtUee+sRGgaLzmzPHF75ctLa3ZifTUQf5moM
 X+8dqNqgOVnG1GB4GRv/vrSLvCUHMT/dLj+6VWWeH+mIf4ZAwT1XjbqQQ/uU0mCTpRgcoQPyBmzG
 6HJjvZ5ECu3zMC6/UIvU+dfuPW4Fq60D0IrCERjnDPsHGlH62P/Q5P2avsXwIHCKRpn8mrgUqWtM
 kwf3MnkWOmaXxaAMUwmPqXUOKsDnvG22XYVZms96Sn3BLlTueZmxDBWCyR66OQ0NojUFkvjGWF6o
 Utbn/4Ny/m4PJtdsKlQhcDiq647lNwN4qOsSZg+fYhVZG+aNsL2JRrOpejgF0fuKp2SDLX1tyhUO
 sR3FEBVf9eq5Q/RubER29Gsl7u8pEy3UTWWLX2ZbQb3UJKihEmoDuwjgD4vT+QwiY2D1YBmu6gZc
 v+1j2oorz4YWED/OKQ7wdK30zNNQQeLujWA6r47gmJ4=
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: Re: [Buildroot] [PATCH 1/1] package/wolftpm: new package
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

I have taken all your feedback. Please review v3 of this patch series.

ps: for some reason git send-email has ignored my 
--subject-prefix="PATCH v3"

Regards,
Dimi

On 2022-06-01 10:47 PM, Dimi Tomov wrote:
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
> Changes v2 -> v3:
> - Applied feedback from the maintainer, list of changes below
> - Added new entry to the DEVELOPERS file
> - Replaced depends with select for BR2_PACKAGE_WOLFSSL
> - Added missing depends for BR2_TOOLCHAIN_HAS_THREADS
> - Removed redundant --with-wolfcrypt option
> Changes v1 -> v2:
> - Fix typo in the hash file and create path before using touch
> ---
>  DEVELOPERS                   |  3 +++
>  package/Config.in            |  1 +
>  package/wolftpm/Config.in    | 15 +++++++++++++++
>  package/wolftpm/wolftpm.hash |  2 ++
>  package/wolftpm/wolftpm.mk   | 29 +++++++++++++++++++++++++++++
>  5 files changed, 50 insertions(+)
>  create mode 100644 package/wolftpm/Config.in
>  create mode 100644 package/wolftpm/wolftpm.hash
>  create mode 100644 package/wolftpm/wolftpm.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 71cc3da6d7..c123d1b915 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3072,3 +3072,6 @@ F:	package/quazip/
>  F:	package/shapelib/
>  F:	package/simple-mail/
>  F:	package/tinc/
> +
> +N:	Dimi Tomov <dimi@tpm.dev>
> +F:	package/wolftpm/
> diff --git a/package/Config.in b/package/Config.in
> index 00f061015f..b287c5a94d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1431,6 +1431,7 @@ menu "Crypto"
>  	source "package/trousers/Config.in"
>  	source "package/ustream-ssl/Config.in"
>  	source "package/wolfssl/Config.in"
> +	source "package/wolftpm/Config.in"
>  endmenu
> 
>  menu "Database"
> diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
> new file mode 100644
> index 0000000000..23932a4170
> --- /dev/null
> +++ b/package/wolftpm/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_WOLFTPM
> +	bool "wolftpm"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select on BR2_PACKAGE_WOLFSSL
> +	select on BR2_PACKAGE_WOLFSSL_ALL
> +	help
> +	  wolfTPM is a portable, open-source TPM 2.0 stack with
> +	  backward API compatibility, designed for embedded use.
> +	  No external dependencies, compact code size with low
> +	  resource usage.
> +
> +	  https://www.wolfssl.com/
> +
> +comment "wolftpm needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/wolftpm/wolftpm.hash 
> b/package/wolftpm/wolftpm.hash
> new file mode 100644
> index 0000000000..6dbf143ffe
> --- /dev/null
> +++ b/package/wolftpm/wolftpm.hash
> @@ -0,0 +1,2 @@
> +# Hash from 
> https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.3.1.tar.gz
> +sha256
> f0d7c095491ac2cc9e44aa4ac3c22febf15942ef080431d8b43a9d0312ca6567
> wolftpm-2.3.1.tar.gz
> diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
> new file mode 100644
> index 0000000000..1e1ddc13e3
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
> +
> +define WOLFTPM_CONFIG_RPATH
> +    mkdir $(@D)/build-aux
> +    touch $(@D)/build-aux/config.rpath
> +endef
> +# Fix for autoconf bug with config.rconf
> +WOLFTPM_PRE_CONFIGURE_HOOKS += WOLFTPM_CONFIG_RPATH
> +
> +$(eval $(autotools-package))

-- 
Founder of TPM.dev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
