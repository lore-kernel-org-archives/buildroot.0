Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC8F606A322
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o9ufrdRC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17932809BD;
	Fri, 30 Oct 2026 15:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jF2d6yTrPGNl; Fri, 30 Oct 2026 15:59:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 05D1980962
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793375941;
	b=kjOPku+rdfPn4ibXs9tCsfPlbHecCM3oO/l/BJFGeuKNp33qRrmu8b2NDp0Sq5xgytC0
	 U0+58ZN7PvZyzpbPUA9Rni+wH8jW1E41BX6hO2juoO+uts80SId7zB3wmOxEp8Ab4uz2G
	 3eujjAeP7OtehaL+C1PGzlJ0VGlT9/ilKBKosNmTSEq7nhThFP34XH/HJBPUelBTsFy8O
	 VoZk4cQfFNyiblukFUtSJdqPPgsLFj5QRyoU83EL7A1XoOl4XltR0q37eBEfxDZMF8ZQz
	 3YU3yvwbZ/ok06fj//VpNr7dfrlo2c5gw6JmSXPn0UyeunStv9d+dBT71iRJ/2pAOOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793375941;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=2PiLXy4SnRi0pF89g9JWdGZzOtIjGDV3+f3kMC2P1OA=;
	b=cXttlaD6kitRKEI+WNgasUVy+Enn+VjongodmOx+MGmV28vtWcepentDol4FuOZ6qvjs
	 FYXenvXtyqrR9VYBqOUPSCrXUJ0tbC5c/ia6XkyporkcqWkBa+86N5seVKu0f/zJbmNQR
	 77aLSKRiUamxoox3h8P3DGFo+tWUSo+/Zmhri2mTSf2CNKrmde+yQWtL8f1X20eNOaNDj
	 L/dEuBFjwJSBkAMOYoPN8ZJR2qkN2087pCALM8RjHnKRiK+18+c2TfVhWBuZkJ2SEYrnN
	 V6k/jBED5y8ylCbQrYqxGHoQjGIt/Mq3YsUYnRkd9kwyXIbH2tbKjRfmB8IdIzFTXpQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793375941;
	bh=2PiLXy4SnRi0pF89g9JWdGZzOtIjGDV3+f3kMC2P1OA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o9ufrdRCIzLYQN2fEwAodybI60PnO0qQhkFN9RFAg+JhMoNvcXC7ofX0Fy7tx03iE
	 D1RODKuQXYzfkGaPK8bIHHV0SkZl+6kQ1q9tKUMp1+8KkTBSvAafwr0pF9utg1jgeW
	 lfSniOfBy5vx3QVOA6cCi8wn53bPGWPf3XxUUWPooOgVPvXaIlDoTzcXocRX6r6RGT
	 ZwHGs9+hUtcYcw15LkGvB1E5ULBKUsM9o3ae1vpZLkDx0YVk1PnJBRug6Awy5IOjiI
	 E5oueXZcBlbJrWYm1W/aAgiKttqRJeXJwZFEo6qmcMuqzPkHnD4HkJyA+L1xEeTcex
	 Rj8YSgEfktQ0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05D1980962;
	Fri, 30 Oct 2026 15:59:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 30117D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 153C440542
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Z_Sf6NbxQ8u for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:58:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 89A2540541
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793375938;
 b=VRAEi5b1FlP0wO9saQGXJIseSd7AwM/7BuXuYb68+IkNKO5wUiCqmq3JmVWFFmb3n/FX
 BGuSmU+PLyVaNIOyvEcphSA98OO06g3fbOg/fvpLUIj8pDqW6RtgT0tMw7+KIJBU5ksVZ
 R8LN500oYStpNnL+aR2wFDqYSh/7lNvlkmSmO+mb76xz2g1TDm51lgJLyQWXapooukJOE
 AfYQrwYRZySpFn8ezE2V8m81OtG9jlmqS38XpDnc+ktR0DeldQ7SD6yZ0pZP+3MsU0Zr6
 U0mQEnxIPMltrCoVZLnGaUQ2WaPngvT0obQcRZC6dMsK3B3t1+nxIC1VArOqTllWvEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793375938;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=rIqaLyLkChoKW/HYz3GRPpWa+FjM+3QeYJQvS+4xnu0=;
 b=YyvVc2VNfh4OOh/m0cgrj6nwo/h+xsfPQUmg6eRt4lK3ez8YXEqEVucrfQaJHxvXAjSs
 5ECXdTZYVgouS6bUZhF6DMN8s0wMSw4bTLEZfSBXuURHoXoDyLl/3M0UscNEEE8bBtVpc
 M+zp+Utb5Ko4c8ECVhPHdSzSug8E6Uwgu5NYmZVrr2lduGZcvkfWipxsCRAS+yKzMFa1+
 fMbo6AF2Fh2sz34CS16bcWhKuB4JDWzKuqqeiRJ6AIvF5zTBDDPvbaSKmyKIhpE/TQ8sj
 EtE1RKUyBHbUze0I/cMVGXwmDdZHHWsfvjXrY1fFyav5RiEFe8LB3WWCDZMTFwswe2g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=JZdZcu41; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89A2540541
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:58:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgvrL-1wtEPL0Pc5-00hLJ5; Fri, 30
 Oct 2026 16:58:54 +0100
Message-ID: <7624e18f-85a2-4381-85ed-2037979c8943@gmx.de>
Date: Fri, 30 Oct 2026 16:58:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>
References: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
X-Provags-ID: V03:K1:7ODxDpAUaN1h0XwcEmQ034qXRbkMsLUlKULqmjC3Cxw9n1wuzQF
 +QCpZSYy8AVYG7LqdecVYpJRkEzdWyP1NToBofNM3BOE/hECjmCXjz0N7KsqLwoYySCpar5
 raR0LJSqxFpC+4JinUSrU8nvrQvPqM8IlXxFTmqnwhREcg4lFe5POsQu26tOeZ5I+RIoNQI
 Sr3C59aJVrOath3wLYDeg==
UI-OutboundReport: notjunk:1;M01:P0:iBgwIc5eeh4=;2et3UdyZV/grmwO6A+hujgxcPVz
 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
Subject: Re: [Buildroot] [PATCH 1/9] package/uthash: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angleo,

when you send a new version of a patch (or series) you sent before, 
please make sure to set the version when generating the patches (git 
format-patch -v N), and note the changes between the two in the patch 
notes (and cover letter, if any). It's confusing if there are two (or 
more) patches with identical titles in the mailbox.

Best regards,
Fiona

Am 30.10.26 um 16:24 schrieb Angelo Compagnucci:
> uthash is a set of C macros implementing hash tables, linked lists,
> dynamic arrays and other data structures, provided as headers only.
> 
> It is needed by falcosecurity-libs, which otherwise downloads uthash.h
> at build time.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>   DEVELOPERS                 |  1 +
>   package/Config.in          |  1 +
>   package/sysdig/Config.in   |  2 +-
>   package/uthash/Config.in   |  8 ++++++++
>   package/uthash/uthash.hash |  3 +++
>   package/uthash/uthash.mk   | 19 +++++++++++++++++++
>   6 files changed, 33 insertions(+), 1 deletion(-)
>   create mode 100644 package/uthash/Config.in
>   create mode 100644 package/uthash/uthash.hash
>   create mode 100644 package/uthash/uthash.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index b4ada4e1f9..8ca72bec84 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -261,6 +261,7 @@ F:	package/sam-ba/
>   F:	package/sshguard/
>   F:	package/sunwait/
>   F:	package/sysdig/
> +F:	package/uthash/
>   
>   N:	Andy Shevchenko <andy.shevchenko@gmail.com>
>   F:	package/fb-test-app/
> diff --git a/package/Config.in b/package/Config.in
> index 796c4f1ad6..02932e5ac1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2323,6 +2323,7 @@ endif
>   	source "package/tllist/Config.in"
>   	source "package/tz/Config.in"
>   	source "package/tzdata/Config.in"
> +	source "package/uthash/Config.in"
>   	source "package/uvw/Config.in"
>   	source "package/volk/Config.in"
>   	source "package/xapian/Config.in"
> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> index 73ac03e240..038a9734aa 100644
> --- a/package/sysdig/Config.in
> +++ b/package/sysdig/Config.in
> @@ -24,7 +24,7 @@ config BR2_PACKAGE_SYSDIG
>   
>   	  https://github.com/draios/sysdig/wiki
>   
> -comment "sysdig needs a glibc toolchain w/ C++, threads, wchar, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
> +comment "sysdig needs a glibc or musl toolchain w/ C++, threads, wchar, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
>   	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>   	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
> diff --git a/package/uthash/Config.in b/package/uthash/Config.in
> new file mode 100644
> index 0000000000..e19c277abd
> --- /dev/null
> +++ b/package/uthash/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_UTHASH
> +	bool "uthash"
> +	help
> +	  uthash is a set of C macros implementing hash tables, linked
> +	  lists, dynamic arrays and other data structures, provided as
> +	  headers only.
> +
> +	  https://troydhanson.github.io/uthash/
> diff --git a/package/uthash/uthash.hash b/package/uthash/uthash.hash
> new file mode 100644
> index 0000000000..37a5a66aba
> --- /dev/null
> +++ b/package/uthash/uthash.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  387ba027946d7c64e9aa19cc53b2edcd714f8f9dca9fa8e3aaef17e0e8e3d736  uthash-2.4.0.tar.gz
> +sha256  40f48f89e1d0095bf1c5fb4d00affd74959c3ff77463b672cf7fac547d1d6465  LICENSE
> diff --git a/package/uthash/uthash.mk b/package/uthash/uthash.mk
> new file mode 100644
> index 0000000000..2107a90d56
> --- /dev/null
> +++ b/package/uthash/uthash.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# uthash
> +#
> +################################################################################
> +
> +UTHASH_VERSION = 2.4.0
> +UTHASH_SITE = $(call github,troydhanson,uthash,v$(UTHASH_VERSION))
> +UTHASH_LICENSE = BSD-1-Clause
> +UTHASH_LICENSE_FILES = LICENSE
> +UTHASH_INSTALL_STAGING = YES
> +UTHASH_INSTALL_TARGET = NO
> +
> +define UTHASH_INSTALL_STAGING_CMDS
> +	$(INSTALL) -d $(STAGING_DIR)/usr/include
> +	$(INSTALL) -m 0644 $(@D)/src/*.h $(STAGING_DIR)/usr/include
> +endef
> +
> +$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
