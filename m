Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F49C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 20:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0E9040989;
	Sat, 11 Jun 2022 20:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q93GwJuND8nx; Sat, 11 Jun 2022 20:19:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63BD44061C;
	Sat, 11 Jun 2022 20:19:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B4A3B1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 20:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C39F60EFB
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 20:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tpm.dev
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aUpd8gUxvNRS for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 20:19:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.84.23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DD99606B0
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 20:19:54 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se25.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1o07aD-0006HE-Sr; Sat, 11 Jun 2022 15:19:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YsxXlT/Uv3SVaYaBtaPyfp0ktfozxIbdnZcv88Kwo5w=; b=HSp+Dd8CYpY4wXPbwBKlwO7554
 ECdQrHXcbX4Vb6XzubWhlq+UbDK/COEmLz1eQkJw1EBCvx28i8CAxEaFTzhUwSFmSVKWkiw3EAEcY
 +qcF0UmDdDMtAGdhvaiQKzbK6s6SvzjzdHVCcYJzfHzP0A1aJLPR8QCpu7D0CntFDHVu6lKHZ5V3N
 1V9r3utWJuJr8CabwtkFBwO6z1VYZntx/ukwMJVeM8ENE0jUChqeNW7ueAZJHPjJr1AMTugRSzzi+
 qSyczT53W1Z0SJcAjz62MPgNKenm7C6+vNcz3dlP6h894K6AAutMByR87rXf/bgBbX0itabKCxh86
 +s7MS+ug==;
Received: from [127.0.0.1] (port=35106 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1o07aB-000Bfu-No; Sat, 11 Jun 2022 20:19:43 +0000
MIME-Version: 1.0
Date: Sat, 11 Jun 2022 23:19:43 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220611143544.844613-1-fontaine.fabrice@gmail.com>
References: <20220611143544.844613-1-fontaine.fabrice@gmail.com>
Message-ID: <4b6ad1f2e42a88e1bbffefb9480ff5f2@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00853472088219)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/lFWas1SWtSo6aw0khRKRmPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zXBqNSapTpPkqU8rtpw71NFyJHgrHSwCtEjluuUWcpJy6t
 qqQqDjtsvNgVjMorkiNpdtr/zHbEnQMJQw9jU01dUJRGtUOcUpjQoI0g1tgg30LkIjQmF3eA6uBR
 sOOfzIUI2QyQ+IxgL7AzMcQws+it044Yc3UKVoMsHpoDsGuRbwDxxiMAICz6P3g28tGAMvzqPqRB
 dN4gdbyCA2Yz2XfKiNHvZXVfQIZKaNTSUmy92zyhculNL4Kv1B7pfkqZpiV9qWu12vVUj5xBQUrw
 t1bFYx3aPgw+VqqMKwjqRu7K//WEQZ1uDRaTscddvLdr0QyZJ5g5HjmFDWGEJOBZxk7R5HHYEJjr
 oOvfkvm+jbvsKlE5ZCSoHa/7LfX2bMD5xLvhCcHQv+Vda3nPaVK0EfymGFvlHOQsi9fJrQH2HB7K
 cikRseCyBjclZpv6D8yHWO2ec6cBx3r3HXymDSnwWpGuuZvJzloHvXAavZZu2bOHz0lNEHF1LSWF
 /K4qKVXG9aOiuE2WsMQKCIxVc/Bl0gEhwVT9QLcFEqMOHs14qjRwSeexcQEBokpimN+IpZsSCXdU
 3Zc+tbQZZW2CB9MAVZ7m17NirEYyqwqMBGrw8ELiqJ2Lnubrt6xFfUVlzWE+fUwE/Xy9bqh2t87x
 wDNJ1ZQnkG4rgMcOadSlmA4Mg6UQtNxCHahZfsjvoDKdqQReE7opol7/zxbDwFIVzeFgpWdBcxw3
 qqhc+N6cuEg4XWh5FtyOJ22t24VloPyX9BGeStAkSLsOcUz+tDXKFe8JN6p6TWMhtpGJ7Yntcl2k
 6P08XH+V9p5Yms+BdRuRNxZgAvBqsgbDV2HxC6hTAaNRtelLABMII+MZt9lccg21Qbt2rvmiIpIf
 ET3DKy6eOfDTAmMFq60D0IrCERjnDPsHGlH62P/Q5P2avsXwIHCKRpn8mumteFnRQMgdmmdZ3dtr
 tugRtAjATd3Uexi+7hxR5Qhd2Z5JmISLRtpg+BX6Ks3o3eC1LXbNjyFcag1clVEejgaVTJXUyRYZ
 QAqUcyeNZ9Pw647lNwN4qOsSZg+fYhVZGweUF86gi0+ssgYHyuRMdamM1/vGHv5niZSzvePQswR9
 tAMyBK/fwHR0ICrRwpT/yWWLX2ZbQb3UJKihEmoDuwiHHKC85zpKzjzwXMd7fKV1b1JM50deWtJl
 +ohOvCmYEc6Ya55kz6ATxdSh2h2ztUM=
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: Re: [Buildroot] [PATCH 1/2] package/wolftpm: fix dependencies
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

Hi Fabrice,

1) I advise strongly against this patch in its current form due to 
security concerns. Please find my motivation below.

2) Existing wolfTPM dependencies are propagated from the wolfssl 
package.

3) I am unable to reproduce your build error. Please provide the exact 
commands and order you are running them on a clean buildroot master.

Topic #1

In order to have Man-in-the-middle protection, wolfTPM needs a 
cryptogrpahic provider to set a secure channel of communication between 
the HOST CPU and the TPM 2.0 HSM chip. Without MITM protection, keys and 
other sensitive data can be sniffed, making it pointless to use a TPM 
2.0 security chip in the first place.

Therefore, making the default wolfTPM build work without wolfssl is a 
SECURITY RED FLAG.

Please consider adding an OPTION to build wolfTPM without wolfssl, 
however keep the default wolfTPM build require the wolfssl library.

Topic #2

The threads and dynamic library support dependencies are propagated from 
the wolfssl package and per recommendation of Thomas (adding to our 
discussion).

Both, wolfssl and wolfTPM could be build statically, however this is not 
how I found the wolfssl package working in buildroot. Therefore, I used 
the existing code base and added the wolftpm package accordingly.

Topic #3

It is a good practice when reporting an error to share how it can be 
reproduced. I am unable to reproduce your build error.

Last

I find it difficult to address multiple topics/major changes in one 
patch. I have tried to decouple the topics above and I am ready to 
discuss further. Thank you for providing this feedback. I think there 
are improvements we could make based on what is the expectation and 
buildroot maintainers' requirements.

Regards,
Dimi
-- 
Founder of TPM.dev


On 2022-06-11 05:35 PM, Fabrice Fontaine wrote:
> pkg-config is not used by wolftpm and wolfssl dependency is missing 
> (and
> optional) resulting in the following build failure since the addition 
> of
> the package in commit 4bb884a3c61c6b71e33f69453a90eb2a367f64b7:
> 
> configure: error: WolfSSL library not found. You can get it from
> http://www.wolfssl.com/download.html
>         If it's already installed, specify its path using
> --with-wolfcrypt=/dir or --prefix=/dir
> 
> Moreover, BR2_PACKAGE_WOLFSSL_ALL, threads and dynamic libray support
> are not mandatory:
> 
> ./utils/test-pkg -p wolftpm
>                     bootlin-armv5-uclibc [1/6]: OK
>                      bootlin-armv7-glibc [2/6]: OK
>                    bootlin-armv7m-uclibc [3/6]: OK
>                      bootlin-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                             sourcery-arm [6/6]: OK
> 6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info 
> failed
> 
> Fixes:
>  -
> http://autobuild.buildroot.org/results/77a93521b909e701ef4e86f18524258b9242c721
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wolftpm/Config.in  |  7 -------
>  package/wolftpm/wolftpm.mk | 13 ++++++++++---
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
> index 0fe094f277..741d92aa4e 100644
> --- a/package/wolftpm/Config.in
> +++ b/package/wolftpm/Config.in
> @@ -1,9 +1,5 @@
>  config BR2_PACKAGE_WOLFTPM
>  	bool "wolftpm"
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on !BR2_STATIC_LIBS
> -	select BR2_PACKAGE_WOLFSSL
> -	select BR2_PACKAGE_WOLFSSL_ALL
>  	help
>  	  wolfTPM is a portable, open-source TPM 2.0 stack with
>  	  backward API compatibility, designed for embedded use.
> @@ -11,6 +7,3 @@ config BR2_PACKAGE_WOLFTPM
>  	  resource usage.
> 
>  	  https://www.wolfssl.com/
> -
> -comment "wolftpm needs a toolchain w/ threads, dynamic library"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
> index ea01eaad6b..f0cf0df0d3 100644
> --- a/package/wolftpm/wolftpm.mk
> +++ b/package/wolftpm/wolftpm.mk
> @@ -10,7 +10,6 @@ WOLFTPM_INSTALL_STAGING = YES
>  WOLFTPM_LICENSE = GPL-2.0+
>  WOLFTPM_LICENSE_FILES = LICENSE
>  WOLFTPM_CPE_ID_VENDOR = wolfssl
> -WOLFTPM_DEPENDENCIES = host-pkgconf
>  WOLFTPM_CONFIG_SCRIPTS = wolftpm-config
> 
>  # wolfTPM's source code is released without a configure script,
> @@ -19,8 +18,7 @@ WOLFTPM_AUTORECONF = YES
> 
>  WOLFTPM_CONF_OPTS = \
>  	--disable-examples \
> -	--enable-devtpm \
> -	--with-wolfcrypt=$(STAGING_DIR)/usr
> +	--enable-devtpm
> 
>  # Fix for missing config.rpath in the codebase
>  define WOLFTPM_TOUCH_CONFIG_RPATH
> @@ -29,4 +27,13 @@ define WOLFTPM_TOUCH_CONFIG_RPATH
>  endef
>  WOLFTPM_PRE_CONFIGURE_HOOKS += WOLFTPM_TOUCH_CONFIG_RPATH
> 
> +ifeq ($(BR2_PACKAGE_WOLFSSL),y)
> +WOLFTPM_CONF_OPTS += \
> +	--enable-wolfcrypt \
> +	--with-wolfcrypt=$(STAGING_DIR)/usr
> +WOLFTPM_DEPENDENCIES += wolfssl
> +else
> +WOLFTPM_CONF_OPTS += --disable-wolfcrypt
> +endif
> +
>  $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
