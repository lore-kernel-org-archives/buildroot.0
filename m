Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6CE606A327
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 11:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sfupGemK;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=Lnnqj8jb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CFF780E1B;
	Mon, 23 Nov 2026 11:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBzHJyM9kwOF; Mon, 23 Nov 2026 11:25:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7DF5380E23
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795433122;
	b=JlbaMYSHWTXVKbb43i8RzpWeQJ+PE3WAOnebmYb/kG7qoQ7fprIR1pG6CZAIYHkwOHZW
	 U/xUF/+T/ckX00ihy2LSaUOs3sj5FbWyyVZuOQ/BMZlE1UUtVbt2acYnUpOQrrpHFrIwP
	 sKXX9pPzGgWQL2EGtzSlexD8GFXPAopxCjkrxSp5Zxwk0jiwt5HNvm5qK0cauaik0MG6n
	 HYTbVlq+7E2y0vCBcvb/FB69lfxCLra+29wu0o+5yUbgBWjI1YZ55yjXVh9aEjZqokYsL
	 U9rwCUx6fIVGf///nHlSKu+9Ezk+KbhjcNZg1OiBPC+9CYkgS3hrs81LaDL6cjZPrpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795433122;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Operating-System:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ylc/2U8HGN0AI+QPYyT+P85ejukhutA+1x39y/GXDAU=;
	b=OvnQMNoDr1cjiNWlfS/L3sTue+zEmnjfretghSiNhVW8LGBow6xaxUJEx3Op1JPEgzLf
	 shbjQ5xyfttUOszX8v9Q4dpd9mHr9G80s52kT5JHDF++pSwB1iQJmbkqHwceLFxz/dRnx
	 I8pucWQyDkvTNNx+S0IDpMvWwtKDL0lEyac6sniThBiVZ/8GzHJMmEDlaBqO0iwiUvZ0K
	 tIYWgCTCaHVvSPcxss2Lkm5xcbQH+ujlcgnpz7pB3Sd1g52ecx99sC/PpQ1qx/1Bajzof
	 875WKPAiisEic25rZvbk2XtqeYuoo5mc96aLxIx2NgMrbHf8KD+ruKnqOr8rKOuL6Pg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795433122;
	bh=ylc/2U8HGN0AI+QPYyT+P85ejukhutA+1x39y/GXDAU=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sfupGemK+I96fROZT+G5fuP7mvq/gigsmrWY5hKs+mDJ54bwqOqu8xEyWFwuNWYf4
	 cM9gEhkExLUvqCF9ifWmMEWLL2p4ccIAK6oku6wQTLwp0pTvwRwZW9ZllsJ/glDebd
	 liIT9/ro0oNDxpimMhUGMV0ZVWfRuV8jfKeI7Pdk7UYUfVinZnbNvwiSyJ67Ajtc+v
	 nw+fGanL2QT2atcRucuh1ASHOOZHAMgzkE2qMRFvnHhKAZk7OWN0gWBVgiTwBXZJoM
	 07gFQHq47ydlX+U+kmpBqD0S2TKYRaoJ4Y0eemNVo5zBhZUDUZ1CgSXhGsdu0MAV+t
	 01ur87foZVn2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DF5380E23;
	Mon, 23 Nov 2026 11:25:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40030260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 11:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3109840586
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 11:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEnNiv-HFDpJ for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 11:25:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9C4304050D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C4304050D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 11:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1795433115; bh=gIQgSN1MOPFMltt2Q+qc/loU8q3ycr8LpBjoYtmFm6Q=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=Lnnqj8jbWTyMD0ZHNejpre+ot8Lb2HMaGNjSTp0JsYrSitzv9N1UAe1icqj0aFIEK
 OoCTbPFTnAuzUX0VilCg3/t3QvvUd48OaPuadn56ZQw16ptRpg1NV6ROIdW3e4WlSJ
 Mk2MjEf4Bp8iJm5g2qor1E8tf5cyTivMRre8JG9iaINYmLnpyhxDoyyPJiWV909xxl
 KwBpv/zLF/bcncDgzxwtk+ff4cpSSPiLrCcBdL3nDc0U1II8uaycHIH4csvF8KuJaM
 cJIkaDiOnLzbK08OYfVwtVEwcpPxFlKt5efvFixwxOAzW52+zCEpvPO2N31g0KqrDj
 9bCAQq2jzLw7g==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9A2A731E0BA2; Mon, 23 Nov 2026 12:25:15 +0100 (CET)
Date: Mon, 23 Nov 2026 12:25:15 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <awQimxz6gjJIuJWn@waldemar-brodkorb.de>
References: <atfwG_AuFeMvY02v@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atfwG_AuFeMvY02v@waldemar-brodkorb.de>
X-Operating-System: Linux 6.12.113+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH] package/pkcs11-provider: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

friendly ping.

best regards
 Waldemar

Waldemar Brodkorb wrote,

> An OpenSSL 3.x provider to access Hardware and Software Tokens using the
> PKCS#11 Cryptographic Token Interface.
> 
> https://github.com/openssl-projects/pkcs11-provider
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  ...rovider-fix-OpenSSL-provider-install.patch | 53 +++++++++++++++++++
>  package/pkcs11-provider/Config.in             |  9 ++++
>  package/pkcs11-provider/pkcs11-provider.hash  |  7 +++
>  package/pkcs11-provider/pkcs11-provider.mk    | 15 ++++++
>  6 files changed, 86 insertions(+)
>  create mode 100644 package/pkcs11-provider/0001-package-pkcs11-provider-fix-OpenSSL-provider-install.patch
>  create mode 100644 package/pkcs11-provider/Config.in
>  create mode 100644 package/pkcs11-provider/pkcs11-provider.hash
>  create mode 100644 package/pkcs11-provider/pkcs11-provider.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1ecf7c991d..71f28df2cd 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3519,6 +3519,7 @@ F:	package/perl-cgi-session/
>  F:	package/perl-log-message/
>  F:	package/perl-log-message-simple/
>  F:	package/perl-switch/
> +F:	package/pkcs11-provider/
>  F:	package/ruby/
>  F:	package/uclibc/
>  F:	package/uclibc-ng-test/
> diff --git a/package/Config.in b/package/Config.in
> index a7c2433e08..24f0466a76 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1688,6 +1688,7 @@ menu "Crypto"
>  	source "package/parsec/Config.in"
>  	source "package/parsec-tool/Config.in"
>  	source "package/pkcs11-helper/Config.in"
> +	source "package/pkcs11-provider/Config.in"
>  	source "package/rhash/Config.in"
>  	source "package/sigsum-c/Config.in"
>  	source "package/tinydtls/Config.in"
> diff --git a/package/pkcs11-provider/0001-package-pkcs11-provider-fix-OpenSSL-provider-install.patch b/package/pkcs11-provider/0001-package-pkcs11-provider-fix-OpenSSL-provider-install.patch
> new file mode 100644
> index 0000000000..e2e9e57f87
> --- /dev/null
> +++ b/package/pkcs11-provider/0001-package-pkcs11-provider-fix-OpenSSL-provider-install.patch
> @@ -0,0 +1,53 @@
> +From aa14490c8c1fd693a44726a77f78b45abd9512db Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Mon, 19 Oct 2026 13:21:41 +0200
> +Subject: [PATCH] package/pkcs11-provider: fix OpenSSL provider install path
> +
> +When cross-compiling pkcs11-provider with Buildroot, Meson queries
> +OpenSSL's libcrypto.pc file to determine the provider installation
> +directory through the modulesdir variable.
> +
> +The pkg-config file defines modulesdir in terms of libdir, which
> +in turn depends on prefix. During cross-compilation, pkgconf uses
> +PKG_CONFIG_SYSROOT_DIR to prepend the target sysroot to the
> +resolved absolute path. Consequently, Meson receives a host-side
> +path such as:
> +
> +$(HOST_DIR)/$(GNU_TARGET_NAME)/sysroot/usr/lib64/ossl-modules
> +
> +Using this path as the shared module's install_dir causes the
> +module to be installed under the host sysroot directory inside
> +TARGET_DIR. Buildroot then rejects the package because it installs
> +files outside the expected target filesystem layout.
> +
> +Just strip the sysroot prefix from the resulting path. This ensures that
> +pkcs11.so is installed into the target's OpenSSL provider directory, for
> +example /usr/lib64/ossl-modules, rather than a host-specific directory.
> +
> +Upstream: https://github.com/openssl-projects/pkcs11-provider/commit/4e0be5aa9606b5ffe1cbeaf19efb70a0b4c9a5d0
> +Assisted-by: LLM
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +---
> + meson.build | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/meson.build b/meson.build
> +index fd14952..98cc114 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -50,6 +50,12 @@ if not libcrypto.found()
> +   libcrypto = dependency('libcrypto3', version: '>= 3.0.7', required: true)
> + endif
> + provider_path = libcrypto.get_variable(pkgconfig: 'modulesdir')
> ++
> ++sys_root = meson.get_external_property('sys_root', '')
> ++if sys_root != '' and provider_path.startswith(sys_root)
> ++  provider_path = provider_path.replace(sys_root, '')
> ++endif
> ++
> + libssl = dependency('libssl', version: '>= 3.0.7', required: false)
> + if not libssl.found()
> +   libssl = dependency('libssl3', version: '>= 3.0.7', required: true, method: 'pkg-config')
> +-- 
> +2.47.3
> +
> diff --git a/package/pkcs11-provider/Config.in b/package/pkcs11-provider/Config.in
> new file mode 100644
> index 0000000000..851bdff70d
> --- /dev/null
> +++ b/package/pkcs11-provider/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PKCS11_PROVIDER
> +	bool "pkcs11-provider"
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  an OpenSSL 3.x provider to access Hardware and 
> +	  Software Tokens using the PKCS#11 Cryptographic
> +	  Token Interface.
> +
> +	  https://github.com/openssl-projects/pkcs11-provider
> diff --git a/package/pkcs11-provider/pkcs11-provider.hash b/package/pkcs11-provider/pkcs11-provider.hash
> new file mode 100644
> index 0000000000..73df0f0870
> --- /dev/null
> +++ b/package/pkcs11-provider/pkcs11-provider.hash
> @@ -0,0 +1,7 @@
> +# Locally calculated
> +sha256 b8bbc30cfb7865603fff1dd0fb516cce90437d8ddb267e331cd89d6121960538  pkcs11-provider-1.3.0.tar.xz
> +
> +# Hash for license files
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSES/Apache-2.0.txt
> +sha256  4c42a835e1a5754dc85a3ac746b482005fec41205cb8843d335d9231550eaa66  LICENSES/LicenseRef-Public-Domain-PKCS11-Headers.txt
> +
> diff --git a/package/pkcs11-provider/pkcs11-provider.mk b/package/pkcs11-provider/pkcs11-provider.mk
> new file mode 100644
> index 0000000000..6eda9a0507
> --- /dev/null
> +++ b/package/pkcs11-provider/pkcs11-provider.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# pkcs11-provider
> +#
> +################################################################################
> +
> +PKCS11_PROVIDER_VERSION = 1.3.0
> +PKCS11_PROVIDER_SOURCE = pkcs11-provider-$(PKCS11_PROVIDER_VERSION).tar.xz
> +PKCS11_PROVIDER_SITE = https://github.com/openssl-projects/pkcs11-provider/releases/download/v$(PKCS11_PROVIDER_VERSION)
> +PKCS11_PROVIDER_LICENSE = Apache-2.0, Public Domain (src/pkcs11.h)
> +PKCS11_PROVIDER_LICENSE_FILES = LICENSES/Apache-2.0.txt LICENSES/LicenseRef-Public-Domain-PKCS11-Headers.txt
> +
> +PKCS11_PROVIDER_DEPENDENCIES = openssl
> +
> +$(eval $(meson-package))
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
