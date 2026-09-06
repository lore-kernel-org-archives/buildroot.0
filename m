Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139C0C79F9E
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 20:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7A3160640;
	Sun,  6 Sep 2026 20:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6D1CsSug9C_r; Sun,  6 Sep 2026 20:34:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D9D55605F0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788726858;
	b=p0A5r2w7hUCnT+hxUWPstPLgVPqfIFR7JmZdFZH2XF3qGaE0+ZtPDTinrVk/sWAHcLyx
	 o2+vFBk3SjDM7sB20D5cZfGhuet2gF1gQrxup/G5+8Lzl5vSfcaXCHhylAKcB0pbHVvtj
	 uiSRA8EuLiBsGGTducFtGPoatfBrVaPgoGDBQYLJ4G/SVj9rsqC8n91P8phc55B1mvaGO
	 t980TIEtUcFpLbRAkGNENvMhj2lcRY1nrFwNMcWCZJYyKqSLQlfvKF+Waj5fa64ZFP2Z/
	 jWKK4XABwA1v4gF8FDBbXVyQdQjz0JSKIQ8xcNbWhLt8B9CTjw1RzH2bVBr25DKCRqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788726858;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gq/T+Tt3oV/HWoxlWlkwQvo7EwD59T7KfoRjHBr04rw=;
	b=pCBftQnhUkVN/dNo5DTw/YDYY2anx7QL1AdIRiuPcXrYu+ePOaAEelSCKgTLMmW/kMLw
	 uqzjhUuAKIR6Tzpb3x+DObVr0QMhHHYE7KA33Rq1ATFBLwe2TuorDuSf798g2CdVDm5B+
	 XVeofltIHftx8/gWXoiWl5GB5iVblCrtwTo/lGiGjZ7BM4XSfcW/7wkbzZxkguDC7ZYlM
	 XbcBupzrI8WOYLZElQkWzG3crUmuL46KBLOCsU/pFwb+Bc+i3nc6M04g3uXxp9tvrDrJU
	 kQ9xcyr/TkWnPWZzB1cbocdYIkvMyV5xSaBX9B8Ots5ei54uH6rDLobtm2/EwxrkMrQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788726857;
	bh=gq/T+Tt3oV/HWoxlWlkwQvo7EwD59T7KfoRjHBr04rw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DPtgKIQj4vKqNZFFB+w5TsSWvFgNC+mtOpx0StpMFtUJWTFnMrBxa47HISeVZUrHO
	 XiDBOA8SLK6piy9KXNumDD2WgKdyW2yLu3fsGtiehkHqxW74uLcPEe9P1xpKZrH5se
	 3UD59NJAu4nyQ7d6PAnr7/p0dfk8yCh7nwyu1iUsgBYvtYfoiSBT+74wqKTkXPcrJf
	 pYaZ9na5fW3j9iYM5Ph7GUIuv0R3NKbuS58ucn5bAzHtaqynFRjm/yRGaMk0tCTe4j
	 tE3nP+rJG0gIc/4T3HIWaBCpvc037Tn0DdDS+teHZ2l3LRklN74mGb5mRkG4Ulrzd0
	 kgnjJ2OEYWi3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9D55605F0;
	Sun,  6 Sep 2026 20:34:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DF4C72C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 20:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3B144009C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 20:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srRBiY1YY9bu for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 20:34:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6D9DA40079
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788726855;
 b=HfhxqG5vl5mEaM6fwU83ERVtDF4NwYGIKpTI/HR8h3wOWfX8pax+U+XGFM7eB3Y+BHAn
 qJRfptBs3in62hcp7XPbLrDhq7uqH9OEFTVokD7gEtTzqbX80z63MbFZir0pVduzZRMxJ
 wqxE5OJ9tHwG1YKrnzhcJ1eJchkqT0+lajLRYs5yY1I3YiqgDB15noyNLDxGAPpHnxkXx
 tvX7dPqNxlhJDE4EBFY//NgO5AQ32omnTW4XgoafSysbsshWMZyf9rTX2QdUISZw0C1B5
 aLVaRMRgPeR1aR6hZKVQklsqL0XOSFFYmlcj63H4SLFbKH30U9s8VCgtMYEdtDzuvDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788726855;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=wrdwYBcCWROBqW8UHxdffC7vSfQSAyZESIzDdBbqTqs=;
 b=m+vsOuHBMJnb0XJwl4nLT0jPIBxczycJx8W97zr5h3ZfvXi+H6AwYs+0pJ4ZxzFlJWAu
 /Of/H/f+HDAl/uSKun3E4mVPvi98BphUqLnOhenOWI8kOHHON9HEFDSLY811e7cNJmsIV
 C2czqZ9BvV1HU7K+9AGzMXQyEBrEbCVqa19b3RW+KuBm0v4XH8RcUH7r3NIUGAFjxOtGO
 dzfpdolMocNTTqmYa+givcnwA7nzuR/GQpN0QtTxUTNQyHYfmQ19mQReLVq3eIu4tgQ6y
 BmH9dvZ3mtq5mUmJM6GqUo2JtN9lKiFQSOaohttsX8ZoRdiJIhOQZ2izzHByEnu4Fjw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ctuzfvUY; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D9DA40079
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 20:34:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 087601A1935;
 Sun,  6 Sep 2026 20:34:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B608860288;
 Sun,  6 Sep 2026 20:34:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2FBB711C79FF0; 
 Sun,  6 Sep 2026 22:34:05 +0200 (CEST)
Date: Sun, 6 Sep 2026 22:34:04 +0200
To: Philippe MONTCHO <philippemontcho@gmail.com>
Cc: buildroot@buildroot.org, ju.o@free.fr, fiona.klute@gmx.de
Message-ID: <ap3Nf0YFNYG1CmLM@windsurf>
References: <20260805141803.1647733-1-philippemontcho@gmail.com>
 <20260813130848.875659-1-philippemontcho@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260813130848.875659-1-philippemontcho@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/1] package/dtc: bump version to 1.8.1
 and switch to meson build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Philippe,

On Thu, Aug 13, 2026 at 03:08:46PM +0200, Philippe MONTCHO wrote:
> Release note, since 1.7.2:
> https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=v1.8.0
> https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=v1.8.1
> 
> - Some typos has been fixed in Readme.license:
> https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/README.license?h=v1.8.1&id=205fbef17b7b2f410e34ac79aa1559a8d492b66c
> 
> - This commit also removes 0002-fix-discarded-const-qualifiers.patch,
> since it has been merged in v1.8.0 already
> 
> - upstream dtc warns that Makefile-based builds are deprecated in
> favor of Meson after version was updated. So we migrate to Meson build.
> 
> - we also add a patch to downgrade unrecognized check name fatal error
> to non-fatal warning, so that unknown check names passed by external
> tools no longer abort the build.
> 
> Signed-off-by: Philippe MONTCHO <philippemontcho@gmail.com>

Thanks for this work!

> diff --git a/package/dtc/0002-downgrade-unrecognized-check-name-error.patch b/package/dtc/0002-downgrade-unrecognized-check-name-error.patch
> new file mode 100644
> index 0000000000..f255d8f7d0
> --- /dev/null
> +++ b/package/dtc/0002-downgrade-unrecognized-check-name-error.patch
> @@ -0,0 +1,47 @@
> +From e23b89701bbfbab629ba11cbce945a439e1ac85f Mon Sep 17 00:00:00 2001
> +From: Philippe MONTCHO <philippemontcho@gmail.com>
> +Date: Tue, 11 Aug 2026 15:41:39 +0200
> +Subject: [PATCH] checks.c: downgrade unrecognized check name error
> +
> +dtc removed the graph_child_address checker in v1.8.0 [1], after
> +introducing it in v1.4.7 [2].
> +U-boot has been passing -Wno-graph_child_address to dtc since
> +v2020.07 [3], and only stopped doing so in v2026.07 [4].
> +Any defconfig pinning a U-boot version older than v2026.07 fails to
> +build once dtc is bumped to >= v1.8.0, with :
> +
> +FATAL ERROR: Unrecognized check name "graph_child_address"
> +
> +This buildroot patch downgrades this to a non-fatal warning, so that
> +outdated or unknown check names passed by external tools (such as U-boot
> +pinned to pre-v2026.07 release) no longer abort the build.
> +
> +This is a Buildroot-specific patch, not intended for submission
> +upstream: U-Boot has already fixed this on its side as of v2026.07.
> +
> +[1] https://github.com/dgibson/dtc/commit/cba90ce82064ad1e6d25f20d8eaa940bd2fc97e
> +[2] https://github.com/dgibson/dtc/commit/df536831d02c51556a8e88cd8da0be024448415
> +[3] https://source.denx.de/u-boot/u-boot/-/commit/5972ff077e0f6db36f327f303b0c381f56238ef
> +[4] https://source.denx.de/u-boot/u-boot/-/commit/b427decccfe983eda4f815ddcf5dcbe733cd04f
> +
> +Signed-off-by: Philippe MONTCHO <philippemontcho@gmail.com>

This patch needs an Upstream: tag. In this case, it can't be submitted
upstream because it doesn't make sense, so maybe:

Upstream: N/A, needed for compatibility with older U-Boot releases

> diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> index 5b810c6e65..c16a3c6c8d 100644
> --- a/package/dtc/dtc.mk
> +++ b/package/dtc/dtc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DTC_VERSION = 1.7.2
> +DTC_VERSION = 1.8.1
>  DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
>  DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
>  DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
> @@ -14,24 +14,24 @@ DTC_INSTALL_STAGING = YES
>  DTC_DEPENDENCIES = host-bison host-flex host-pkgconf
>  HOST_DTC_DEPENDENCIES = host-bison host-flex host-pkgconf
>  
> -DTC_MAKE_OPTS = \
> -	PREFIX=/usr \
> -	NO_PYTHON=1 \
> -	NO_VALGRIND=1
> +DTC_CONF_OPTS = \
> +	-Dpython=disabled \
> +	-Dvalgrind=disabled \
> +	-Dtests=false
>  
>  # For the host, we install headers in a special subdirectory to avoid
>  # conflicts with the in-kernel libfdt copy.
> -HOST_DTC_MAKE_OPTS = \
> -	PREFIX=$(HOST_DIR) \
> -	INCLUDEDIR=$(HOST_DIR)/include/libfdt \
> -	NO_PYTHON=1 \
> -	NO_VALGRIND=1 \
> -	NO_YAML=1
> +HOST_DTC_CONF_OPTS = \
> +	--includedir=$(HOST_DIR)/include/libfdt \
> +	-Dpython=disabled \
> +	-Dvalgrind=disabled \
> +	-Dyaml=disabled
>  
>  ifeq ($(BR2_PACKAGE_LIBYAML),y)
>  DTC_DEPENDENCIES += libyaml
> +DTC_CONF_OPTS += -Dyaml=enabled
>  else
> -DTC_MAKE_OPTS += NO_YAML=1
> +DTC_CONF_OPTS += -Dyaml=disabled
>  endif
>  
>  define DTC_POST_INSTALL_TARGET_RM_DTDIFF
> @@ -41,39 +41,11 @@ endef
>  ifeq ($(BR2_PACKAGE_DTC_PROGRAMS),y)
>  
>  DTC_LICENSE += , GPL-2.0+ (programs)
> -DTC_INSTALL_GOAL = install
>  ifeq ($(BR2_PACKAGE_BASH),)
>  DTC_POST_INSTALL_TARGET_HOOKS += DTC_POST_INSTALL_TARGET_RM_DTDIFF
>  endif
>  
> -else # $(BR2_PACKAGE_DTC_PROGRAMS) != y
> -
> -DTC_INSTALL_GOAL = install-lib
> -
>  endif # $(BR2_PACKAGE_DTC_PROGRAMS) != y

What bothers me here is that BR2_PACKAGE_DTC_PROGRAMS basically
doesn't do anything anymore.

The only thing it does now is to remove dtdiff if bash is not
available. Among other things, it means that when
BR2_PACKAGE_DTC_PROGRAMS is disabled, DTC_LICENSE only contains
"GPL-2.0+ or BSD-2-Clause (library)", while programs are actually also
installed.

If the installation of programs cannot be disabled with the new meson
build system, then I would suggest to just remove the
BR2_PACKAGE_DTC_PROGRAMS option.

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
