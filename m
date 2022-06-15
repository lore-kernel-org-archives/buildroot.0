Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE60C43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 07:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DBAC83DF2;
	Wed, 15 Jun 2022 07:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQcqZAPHBiBd; Wed, 15 Jun 2022 07:10:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7565881A64;
	Wed, 15 Jun 2022 07:10:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 847E41BF5A9
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 07:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81EE081A3B
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 07:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f1WBl2gRaHvl for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 07:10:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.84.9])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B5B481A27
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 07:10:27 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se18.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1o1NAM-0000jH-JM; Wed, 15 Jun 2022 02:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xjEO+x/k/bVCfFnIbGVPkXwADuCDr6HIu2dSvrpzjJg=; b=VZf6bBv0XBUSR1jk89qVBEM0Ig
 40xMuiahOvXXdFUi+3xlHjJ3zuwSYh1v0Zr6AGvlYntEFrLgBFJzTqIoE+GBZ6ZfGSwgoxFiF5Uv0
 1GetKPEm+y+P+BJAtTOSHnMH1mi5eLip0GHjl4liEW5GafwNATA6lxO3d8WzTTBx7D2sZagbHc4lx
 VSsytiPGzwHRdOuKoWuwuJRP4Knihlgik2/tk2eHhjXkOghAwR+bLDMsHx+2kqyZMZ+lmRJLHLOcC
 r/QpHRpHaZ2fRcm11z3H4fcmOwqTOXoAwqHb/y7yBPJJVVtlyUFrlD5O/jTkUConFWil2tBU2/vCu
 VF11SjJA==;
Received: from [127.0.0.1] (port=45946 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1o1NAK-00081d-Rq; Wed, 15 Jun 2022 07:10:12 +0000
MIME-Version: 1.0
Date: Wed, 15 Jun 2022 10:10:12 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20220612151904.GF427639@scaer>
References: <20220612084538.1873673-1-fontaine.fabrice@gmail.com>
 <20220612151904.GF427639@scaer>
Message-ID: <724114769b03de7a3f3368aeabbc10d0@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.0027935271632)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9wxqGXGyESbuIrbeWApDLlPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zpwbOo7FnRW+8Ip+np/BrogLmJmB1kdf2zdyJYrc+nY9W0
 S8NJdHhZHyTGSP5laBeEkYZEhPZH1e9QQ25QMAK4psTXNfl2OTzOk92IQdWevo8wUiRihvC73ecr
 qaqBbHBgv3Hg2Qxqgy66qkx4N3UuBMmyNbDn7R5kilAhwr3KtE82Y55K6y9ZgAjMP1BdBtH99j24
 fCKFjJ00TfwRkP5Nim7uLhpYYJK3x23WQwPUUy7K60IW4/F/dWke8muiACEDtkk3QQOVL9hnwCPn
 of/p12Kq0X+vYLUKAMtfkvFCdXwG9qS5noYi2/izXyY+xWRaG2Xk5Dlma9rwsgne6VKziWydTyuV
 sA5kcI37RzHY9GeupYYdzPm7YfRDaULOU2kfgMf4XRgCk/48zRqgqXKN2lJzhbC5sYrXgIPy4N0E
 H/ShdP00nxzh/m35ytL/WYih7iAUACC9x9WSYyrCeKS5bUjJJPVsoak2L6UN8XlZCQoCGrlIzmqo
 F6CrEjw8HUvhPepG2LHjJMOL7cEyEf/vZQ6F+Hg4zpzHGe6cAOcYKEEqJ2YhaHYKPX4HHcW4fmJS
 GPT7VoYsI2YVvkK6lGQtFUjdDqt+zJcNyHrxFv0ub1s765aq/7Ihe5JpNEYIVsOMyGnDIpSchlco
 6RIDoNg/kjEeNMiapTg5JX5KyFUGeq+cGqR018mIinnrbkyUvY39mkdHzbUjd6PRfLJZDPRgASJF
 C/49WOPBr5nlEUI4xF6m56I0EEjlhs/mxHlTAcEhaep+euoQTJhdJ2HwLe1OniV+EO2UBCIEkzB+
 GGGKd74psP3fwInntW8+pKXMGvPMNKA0p+dLpcDnf/J+k9RIP+W8A3B8nDj+/2idH/kmGN0TLeVm
 0LDxkp5Slw3D/dn8trXm8CSJ+CxrhgPz59v42zfpgu2LUdQgOCrcnAageSA8FNtjB5ezWYN+wb+L
 qnzC+1oJdfQ221qaogEuSz81zuHBtSIvvSbOg5y2PaLczMXXGYstYpg1aStNjeF0icagVK7rqkdf
 gX6DyKL6XdgR4IHYrIbYz2C4wiGCDLIKbNgLR/FK6k6oQUdkOyfhXJ192qRF9bBtNVjkzEF0Oa4o
 uvrE/Ci1Twv+1x7iubuz8XgOrHGWcKc5AqOFqAQq4tI6O/LMoTQbFDUuZ1WtW1QKACZF8JzWBjmW
 TydMzcZ/SbXl4lQtInzkoxKi3Rc48Do=
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: Re: [Buildroot] [PATCH v2,1/2] package/wolftpm: fix dependencies
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

I just noticed one really bad typo. I could submit a patch that also 
adds extra wolfTPM options, so it is not a one-word patch.

"Enable wolfCrypt hooks for RNG, Auth Sessions and Parameter encryption. 
"

The TPM chip is the source of RNG. To claim that a TPM 2.0 library is 
using a Software-based source of RNG would be a red flag for users. The 
rest is accurate - wolfCrypt is used by wolfTPM to establish Session and 
Parameter encryption between the Host CPU and the TPM chip.

Thanks,
Dimi

On 2022-06-12 06:19 PM, Yann E. MORIN wrote:
> Fabrice, All,
> 
> On 2022-06-12 10:45 +0200, Fabrice Fontaine spake thusly:
>> pkg-config is not used by wolftpm and wolfssl dependency is missing 
>> (and
>> optional but highly recommended) resulting in the following build 
>> failure
>> since the addition of the package in commit
>> 4bb884a3c61c6b71e33f69453a90eb2a367f64b7:
>> 
>> configure: error: WolfSSL library not found. You can get it from 
>> http://www.wolfssl.com/download.html
>>         If it's already installed, specify its path using 
>> --with-wolfcrypt=/dir or --prefix=/dir
>> 
>> Fixes:
>>  - 
>> http://autobuild.buildroot.org/results/77a93521b909e701ef4e86f18524258b9242c721
>> 
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Both patches applied to master, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>> Changes v1 -> v2 (after review of Dimi Tomov):
>>  - Add a wolfcrypt option which is enabled by default
>> 
>>  package/wolftpm/Config.in  | 23 ++++++++++++++++++-----
>>  package/wolftpm/wolftpm.mk | 13 ++++++++++---
>>  2 files changed, 28 insertions(+), 8 deletions(-)
>> 
>> diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
>> index 0fe094f277..0b964c3d7e 100644
>> --- a/package/wolftpm/Config.in
>> +++ b/package/wolftpm/Config.in
>> @@ -1,9 +1,5 @@
>>  config BR2_PACKAGE_WOLFTPM
>>  	bool "wolftpm"
>> -	depends on BR2_TOOLCHAIN_HAS_THREADS
>> -	depends on !BR2_STATIC_LIBS
>> -	select BR2_PACKAGE_WOLFSSL
>> -	select BR2_PACKAGE_WOLFSSL_ALL
>>  	help
>>  	  wolfTPM is a portable, open-source TPM 2.0 stack with
>>  	  backward API compatibility, designed for embedded use.
>> @@ -12,5 +8,22 @@ config BR2_PACKAGE_WOLFTPM
>> 
>>  	  https://www.wolfssl.com/
>> 
>> -comment "wolftpm needs a toolchain w/ threads, dynamic library"
>> +if BR2_PACKAGE_WOLFTPM
>> +
>> +config BR2_PACKAGE_WOLFTPM_WOLFCRYPT
>> +	bool "wolfCrypt hooks"
>> +	default y
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # wolfssl
>> +	depends on !BR2_STATIC_LIBS # wolfssl-all
>> +	select BR2_PACKAGE_WOLFSSL
>> +	# not mandatory, but needed to get all features
>> +	select BR2_PACKAGE_WOLFSSL_ALL
>> +	help
>> +	  Enable wolfCrypt hooks for RNG, Auth Sessions and Parameter
>> +	  encryption. Disabling this option is not recommended as it
>> +	  could create a security breach in most environments.
>> +
>> +comment "wolfCrypt hooks need a toolchain w/ threads, dynamic 
>> library"
>>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
>> +
>> +endif
>> diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
>> index ea01eaad6b..760656e134 100644
>> --- a/package/wolftpm/wolftpm.mk
>> +++ b/package/wolftpm/wolftpm.mk
>> @@ -10,7 +10,6 @@ WOLFTPM_INSTALL_STAGING = YES
>>  WOLFTPM_LICENSE = GPL-2.0+
>>  WOLFTPM_LICENSE_FILES = LICENSE
>>  WOLFTPM_CPE_ID_VENDOR = wolfssl
>> -WOLFTPM_DEPENDENCIES = host-pkgconf
>>  WOLFTPM_CONFIG_SCRIPTS = wolftpm-config
>> 
>>  # wolfTPM's source code is released without a configure script,
>> @@ -19,8 +18,7 @@ WOLFTPM_AUTORECONF = YES
>> 
>>  WOLFTPM_CONF_OPTS = \
>>  	--disable-examples \
>> -	--enable-devtpm \
>> -	--with-wolfcrypt=$(STAGING_DIR)/usr
>> +	--enable-devtpm
>> 
>>  # Fix for missing config.rpath in the codebase
>>  define WOLFTPM_TOUCH_CONFIG_RPATH
>> @@ -29,4 +27,13 @@ define WOLFTPM_TOUCH_CONFIG_RPATH
>>  endef
>>  WOLFTPM_PRE_CONFIGURE_HOOKS += WOLFTPM_TOUCH_CONFIG_RPATH
>> 
>> +ifeq ($(BR2_PACKAGE_WOLFTPM_WOLFCRYPT),y)
>> +WOLFTPM_CONF_OPTS += \
>> +	--enable-wolfcrypt \
>> +	--with-wolfcrypt=$(STAGING_DIR)/usr
>> +WOLFTPM_DEPENDENCIES += wolfssl
>> +else
>> +WOLFTPM_CONF_OPTS += --disable-wolfcrypt
>> +endif
>> +
>>  $(eval $(autotools-package))
>> --
>> 2.35.1
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
Founder of TPM.dev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
