Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FDCC982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53D78406A0;
	Wed, 16 Sep 2026 21:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BM8czkFBDu3z; Wed, 16 Sep 2026 21:20:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 244A2406D2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789593625;
	b=Tgf78TO7OC3GVRql9Fw/4axqNV8j3etKSSI4yEFcXgkqHfX22S3CkI3IMi/bFtzZ0nVC
	 i5al7Thb8Hv8D5wfmILrmOmGCWUcxf37hseNiHkSH7KsKf0E5sv6wtltpK6PVyauQjG28
	 Qu7wtfB/uGoQF1v7qLzczo58AqMjtkpV+JUhx5tHUHXUAVxuaeoxjiITavZ7Hq8aZfouj
	 3ExIju3o6YxkJJu/LDUaVCAEROzJUOC0Ox3+MFBXR44tHWn4BH2hEQetYXZNuM1w1VM/v
	 DEDnZB3Y3QBpEtTpV12t3jExRK9mZi0X0df77MFbTq0xVYtB982V9jGI49R2/TNdTfA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789593625;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lXUhCYHla/unvavZ0bbPoD9onMWf69ccjFdr9vM5QBM=;
	b=mwVePt54TabmgcDBK/4PSgSHrEQ6K3GhRli8j/FuKvoOLD+zypU/61SVrW7caWqnDavL
	 2LVja1CWWdHIE7CxL4vK3zx5pjJjXc+/EqG6637a2FHOYhyr9dn80b7HQkCMS+vdJc+q+
	 UUQWM4FHxsXWYQrQtX5MlIuAmTNSNx/uB514oSey+aqXkX17xBBeKmUuH7ay1iGepcm6F
	 MGTaDi7w68roqIJ1OikEMCYlTTQL5GaqsTYR699RvK0WAgFlcFKim8CHCpKDZm+hmJLOG
	 YodeyxhvgR0b4tAg7v7brJD6MxpJlBo0KRBX+vrsotm7l475ihhUjz3764mnAVllYUQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789593625;
	bh=lXUhCYHla/unvavZ0bbPoD9onMWf69ccjFdr9vM5QBM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OsKGxd8PoJAsqIpJQOXy5w32R/mph1eNfHN6NWc5fBoYtuZoikbtvjECFl8VhYBaK
	 7Sz4+9gTaDdSTCCiZ1Mu/xZwQW9xnIalqjOBhugqaxMn+Cja27kcoQ8Y+TiVH4Pd6u
	 K6+wcmqM52d3oxumwIq1gtsb/Hk5qKzw3yiF3aEQBH4wv6OVkYZNxOFpRKTaPKlnaS
	 egJhmI6Mume3AhqucEUtM+V9bDmItaIL5rNRZW11u7hsn+sqNbvJSMnGK0NSjFKgyJ
	 LlymEmjgtExnlJN5jpO+Pf2jOEutYetA96yzPwLLtAU/2lTS0iOM3f7/AAIGjOKXm5
	 vguuR4QkwbzPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 244A2406D2;
	Wed, 16 Sep 2026 21:20:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA4CB13D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBCDC80DD6
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsHm2T0_UnEL for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:20:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 66A0680DD3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789593622;
 b=nXAAoMq3TfG62oPI18k91mZAlmwqcd7dyCwZ0wr58oUWVfNv3JCjWg27snvtys7lIHRw
 lsUIvcO2ZjqqugiwfOLnjk6STghOHzFeiAZb1tv7HkLcLxxkZ2mS6YfEOr7gqPAB0EdnS
 EpbPG/oKedDhzGz88Dyc7O9MLnVzyUd7rOrew1Q+KJhjPFNv6UMEflhxRQyNJkDdPE85V
 VUPWc9GZIo668GCOEzrPwXcjW75xzELjxemp+a9XabVXFiiblgSidpaNCfIR29lswCdkG
 F3KBUH4oPW97jqB46U3XRURpmJ/5f3KpygbXNgufsEJHYA9Kt/lrKlHYpD+5uGUjZrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789593622;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=rer6aUDH/IHpewV/RQE1TdGnPJ9G7B6s7I8SBIcH9/A=;
 b=kP6vLmGJVSmyljDKBS/xSFxJ1RchsWjb6B915EQ5y2tAxnjjMdM1TFHOnAkUZJwmd3Zo
 qxHK/FcqP9UEealJvQljZUjRm+NJS/1M/c2bjPEQtlvlSbFkFKq/HrBvjf7Pgh+ZZi08U
 UxlZyygAYyfkZXgSmmmaayvRVNosVXSHxWJGF8g3c9dlTkWSxk6Lt180joq9CEbt3fqGt
 NCrevKkcWa3dSH7Lim9fc1UCuo48K/tnEVfDovYRogLQukMtcViK6rS+hNTb8eVN9z+Nb
 GV9y2nQp3gs2JMkFNv8a7cwpG4FgWL6Z2kNi7jHceIfGS6xXfJujvybZDMQmtneLwWg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BTg70mbX; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66A0680DD3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:20:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3BA251A0903
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:20:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0969D60337;
 Wed, 16 Sep 2026 21:20:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0609011C79EA0; 
 Wed, 16 Sep 2026 23:20:13 +0200 (CEST)
Date: Wed, 16 Sep 2026 23:20:13 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aqsHJwIBte5JUy6M@windsurf>
References: <20260907194602.1646514-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260907194602.1646514-1-shirokovalexs@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/nnn: bump to version 5.3
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

Hello,

Thanks for your patch! A number of questions/comments below.

On Mon, Sep 07, 2026 at 09:45:37PM +0200, Alexander Shirokov wrote:
> This commit updates the package version to 5.3.
> 
> Changelog: https://github.com/jarun/nnn/blob/v5.3/CHANGELOG
> 
> It also brings some improvements.
> 
> 1. Adds libatomic dependency, as the library is required since commit
> 7ce4913bc39bc3b34a0e2c3de7153fb09d489152.

Is this upstream commit part of this version bump 5.1 -> 5.3, or did
it already exist?

> 
> 2. Adds a dependency on BR2_TOOLCHAIN_HAS_THREADS to prevent failures
> in test-pkg.

Is this new dependency needed because of the version bump, or was it
already needed with version 5.1?

If some of those topics are independent from the version bump, they
should be in a separate commit.


> config BR2_PACKAGE_NNN
> 	bool "nnn"
> 	depends on BR2_USE_MMU # fork
>+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>+	depends on BR2_TOOLCHAIN_HAS_THREADS

This needs an update of the Config.in comment:

comment "nnn needs a toolchain with wchar"
        depends on BR2_USE_MMU # fork
        depends on !BR2_USE_WCHAR

should become:

comment "nnn needs a toolchain with wchar, threads"
        depends on BR2_USE_MMU # fork
	depends on BR2_TOOLCHAIN_HAS_ATOMIC
        depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

>  ################################################################################
>  
> -NNN_VERSION = 5.1
> +NNN_VERSION = 5.3
>  NNN_LICENSE = BSD-2-Clause
>  NNN_LICENSE_FILES = LICENSE
>  NNN_SITE = $(call github,jarun,nnn,v$(NNN_VERSION))
> @@ -15,10 +15,12 @@ NNN_MAKE_FLAGS = \
>  	CFLAGS_OPTIMIZATION= \
>  	PREFIX=/usr
>  
> +# Must be passed in env so it can be appended to by the Makefile
> +NNN_MAKE_ENV += LDLIBS="-latomic"

Should be conditional on BR2_TOOLCHAIN_HAS_LIBATOMIC.

>  ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
>  NNN_DEPENDENCIES += musl-fts
> -# Must be passed in env so it can be appended to by the Makefile
> -NNN_MAKE_ENV += LDLIBS="-lfts"
> +NNN_MAKE_ENV += LDLIBS="-lfts -latomic"

We want to avoid duplicating this.

>  endif

So probably:

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
NNN_LDLIBS = -latomic
endif

ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
NNN_DEPENDENCIES += musl-fts
NNN_LDLIBS += -lfts
endif

NNN_MAKE_ENV += LDLIBS="$(NNN_LDLIBS)"

Could you have a look at sending a new version?

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
