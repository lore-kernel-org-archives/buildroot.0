Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5220FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 12:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E72CE60BC3;
	Sat, 12 Mar 2022 12:25:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hdu9sXjrG2tZ; Sat, 12 Mar 2022 12:25:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1125260A90;
	Sat, 12 Mar 2022 12:25:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD6171BF83C
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 12:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC69784375
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 12:25:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FRUcYx9QIjts for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 12:24:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6275D841A6
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 12:24:59 +0000 (UTC)
Received: from [192.168.0.175] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MEUaQ-1nMzSn2Jvm-00G0ZZ; Sat, 12 Mar 2022 13:24:55 +0100
Message-ID: <be4b622c-9c46-a27c-d8c0-2595f8638c1a@green-communications.fr>
Date: Sat, 12 Mar 2022 13:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: fr
To: Thomas Ruschival <thomas@ruschival.de>, buildroot@buildroot.org
References: <20220312104402.33075-1-thomas@ruschival.de>
 <20220312104402.33075-2-thomas@ruschival.de>
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <20220312104402.33075-2-thomas@ruschival.de>
X-Provags-ID: V03:K1:q2LabmCNAypsMW5LA4O5r9V8S5ZT8HZOQVT2nvsRoXvCGF/l/gp
 Xj1Ro/ZwEnKiB2SnQ52csPgcr3qbEDqdCpOyAa0gpKG4orai+vFTBZeP6LXQlczGpIcMmva
 oHnsc/hkd+1vyKjRzDr5iquo5kD+zQ7VAE+64iW7ksxo2YYKDGf2yqfUgcF44N3ia8yBtIK
 A2ox/ouX1vTIzHL//kRLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZrSUt2d83Io=:K2cgL5PJ+24R5XrpJ+lQbP
 SawieWU8WuRI+n3wzKRUW825LhDO66/kIjn2A1ukZiAEo3eKL+1aNOeqCZl3Hqt2sdO+o4Zgs
 iGcxuKvfpI2PqTrCxpf2o2ZYz/EzZt+1D9yHV8yTRitgLehweIAa7NnwUd2SPI46bXfz1tEbA
 WSFuwPpO72UBwJk6vgQfcb6qvUWAt/HgSaP9pEVMPOCoGXDvUSqz38/KxqfkuTq0XTiy1k1ah
 203QtrBHO+FDa6i7fUET7GohuSC7Xh5FMKj1qQinHQqtsQRJfziQ6s7w66DTNrVTvQoZn6/LH
 0hLXbVhhYGQSgnFFFjuCdEceTZLhiL/HnPZEzQYA9Jbj1Ofysrq5G7elDYF4is3m9hxD2ggW0
 w7F8oOwnkYolAdeRAyBkojbrwSMVabTct93tXJWON0yTyDMFfTA9EiYamBYzLQUoMoDHhiJ1K
 hFp+8pozME2WXXEAAAcnkLlHd3CbV4aGd6DAyYqftiFkMdqaM1ACz2ERhBKl8cGTz6KVmdqPz
 vue/m1UWw2zrwpTIVesjXEYf2QVZhqLQj3QurcN8q1KrET/kJvtQUVJoe9W50mnMbUBQyW9Ur
 9Zm++Z3EsLWRBSsQ3o001/O0SSCkOywSDnTTD1h2n4uMUnSiPHoYPTXuYEI6J9PQ5wJgI6PK/
 YE9ASmaK1PVZLuSHmC492UD+u4fjTxtqTpaN8rUDfBlaXL6kk/qS88rggw6URItvbDTsViyR+
 Um2/bROmsVf7CAec4qaFITK+bUN46e0WZbqTyg==
Subject: Re: [Buildroot] [PATCH 1/1] package/pistache: bump version & switch
 to meson build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On 12/03/2022 11:44, Thomas Ruschival wrote:
> While upstream pistache has not yet released a stable 'tag'
> a lot has changed since June 2020:
> 
> * project has moved to meson build system, cmake builds
>    do not install headers.
> * patches in buildroot are no longer required
> * project-implemented Pistache::Optional was replaced by
>    use of std::optional. This is only available in C++17
> * dependency to rapidjson has been introduced
 > [...]
> diff --git a/package/pistache/Config.in b/package/pistache/Config.in
> index 96aed5210a..806c27077a 100644
> --- a/package/pistache/Config.in
> +++ b/package/pistache/Config.in
> @@ -1,22 +1,23 @@
>   config BR2_PACKAGE_PISTACHE
>   	bool "pistache"
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17, std::optional
>   	depends on BR2_USE_WCHAR
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_RAPIDJSON
>   	depends on !BR2_TOOLCHAIN_USES_UCLIBC
>   	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
>   	help
>   	  Pistache is a modern and elegant HTTP and REST framework
> -	  for C++. It is entirely written in pure C++14 and provides
> +	  for C++. It is entirely written in pure C++17 and provides
>   	  a clear and pleasant API.
>   
>   	  https://github.com/oktal/pistache
> [...]
> --- a/package/pistache/pistache.mk
> +++ b/package/pistache/pistache.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PISTACHE_VERSION = f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d
> +PISTACHE_VERSION = 3ec9d7c4f8b828fdd391550fff81b01e72dd6269
>   PISTACHE_SITE = $(call github,oktal,pistache,$(PISTACHE_VERSION))
>   PISTACHE_LICENSE = Apache-2.0
>   PISTACHE_LICENSE_FILES = LICENSE

You need to add rapidjson to PISTACHE_DEPENDENCIES in pistache.mk, 
otherwise pistache may be compiled before rapidjson or without 
rapidjson's headers and libraries.
The "depends on" in Config.in only ensures that rapidjson must be 
enabled if pistache is to be enabled. It does not impose any order.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
