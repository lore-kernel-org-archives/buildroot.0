Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA35AC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5994760FF3;
	Mon,  5 Feb 2024 11:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5994760FF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nfPGLWJ573mp; Mon,  5 Feb 2024 11:41:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FDE760FEF;
	Mon,  5 Feb 2024 11:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FDE760FEF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 513851BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29E5360FEF
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29E5360FEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GaxRXukhJNaI for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:41:54 +0000 (UTC)
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3800460FE9
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3800460FE9
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id WxMErj6whD7V9WxMErkZFc; Mon, 05 Feb 2024 12:41:50 +0100
Message-ID: <9525ca43-ac12-46bb-b2da-9e1e1d8d6e02@benettiengineering.com>
Date: Mon, 5 Feb 2024 12:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Maciej Grela <enki@fsck.pl>, buildroot@buildroot.org
References: <20231004131256.2113233-2-enki@fsck.pl>
 <20231006140511.3840643-2-enki@fsck.pl>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231006140511.3840643-2-enki@fsck.pl>
X-CMAE-Envelope: MS4xfEyC5wvszRZwvoSCR/ciDeZhlj5JdW9Kz/jVzzaARmzaPNQhi2lPFZLe0VR9fgRxTFzMEHW6Nl3A+Z0neUJETXtDxecxG649/gvYDYrD77Vqn42A2IDH
 /TSWeR7cXcfE6uzsJHmMn8zwwX+AYX/JdG2iOhHnWHpLUf/t3Z7esHM0DP5Lbpb0PkHyQGLxfFeS8+0dBZEee3wMxgKyS5gn4ZYuEJZm4MGMdadotjamwhWS
 6L5zx14pJ5mTfICtGi1je0FLWOlOe9/XzHvvDQfx/JQkewaECyhjrurSdjBLX3TM
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707133310; bh=rt8GeAFRLGH0Dc5o0Da/WCbsCp6Benk/g+7oe+rrn8c=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=aVQ2A/9YObuzGeloJquII9c1ukfpC5h72V3m1U/Suiwhxtlu1h34vy51Mi9/y6s5e
 1HUoH1l/RsjZGwD2xE+Utl+y9JDOHUK6sMchG0UCmLwPi05rN/EclrJFXPruZnAC8S
 +SnlCSziriyryGc2tKjCSn5FGHN6th/JBBRjxzex37W/t8/U/nwNKd8MQwwRl7n7cH
 a+8fRivUSS5RK7n9sBeyJ/b4ybZousrFZ7KDw52Q4dwlMETGi8U4YleWlNabNAJMLe
 /IB2Xr1Uq2MXlcW+e8ywkF4pQ6D1Q6p1t2dJf5P9v5e7GqaEXiN6JYvGdw7KohoQqJ
 ZVSZ99uAKRg0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=aVQ2A/9Y
Subject: Re: [Buildroot] [PATCH v3 1/3] package/iniparser: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maciej,

On 06/10/23 16:05, Maciej Grela wrote:
> iniparser is a required dependency of dns320l-daemon

This is a package itself and also a required dependency of 
dns320l-daemon, but you shouldn't specify it here.
Here you have to describe what is iniparser package, for example as
written in project github:
"
Iniparser is a modules that offers parsing of .ini files from C.
"

> Signed-off-by: Maciej Grela <enki@fsck.pl>
> ---
>   package/Config.in                |  1 +
>   package/iniparser/Config.in      |  6 ++++
>   package/iniparser/iniparser.hash |  2 ++
>   package/iniparser/iniparser.mk   | 56 ++++++++++++++++++++++++++++++++
>   4 files changed, 65 insertions(+)
>   create mode 100644 package/iniparser/Config.in
>   create mode 100644 package/iniparser/iniparser.hash
>   create mode 100644 package/iniparser/iniparser.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 009f7ba186..228e9eb1e3 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2085,6 +2085,7 @@ menu "Other"
>   	source "package/gtest/Config.in"
>   	source "package/gumbo-parser/Config.in"
>   	source "package/highway/Config.in"
> +	source "package/iniparser/Config.in"
>   	source "package/jemalloc/Config.in"
>   	source "package/lapack/Config.in"
>   	source "package/libabseil-cpp/Config.in"
> diff --git a/package/iniparser/Config.in b/package/iniparser/Config.in
> new file mode 100644
> index 0000000000..4932869943
> --- /dev/null
> +++ b/package/iniparser/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_INIPARSER
> +	bool "iniparser"
> +	help
> +	  ini file parser

Here ^^^ you can repeat more or less what I've suggested for commit log

> +
> +	  https://github.com/ndevilla/iniparser
> diff --git a/package/iniparser/iniparser.hash b/package/iniparser/iniparser.hash
> new file mode 100644
> index 0000000000..a745062fcd
> --- /dev/null
> +++ b/package/iniparser/iniparser.hash
> @@ -0,0 +1,2 @@
> +# From https://github.com/ndevilla/iniparser/releases
> +sha256  960daa800dd31d70ba1bacf3ea2d22e8ddfc2906534bf328319495966443f3ae  iniparser-4.1.tar.gz
> diff --git a/package/iniparser/iniparser.mk b/package/iniparser/iniparser.mk
> new file mode 100644
> index 0000000000..f3f74601f3
> --- /dev/null
> +++ b/package/iniparser/iniparser.mk
> @@ -0,0 +1,56 @@
> +################################################################################
> +#
> +# iniparser
> +#
> +################################################################################
> +
> +INIPARSER_VERSION = 4.1
> +INIPARSER_SITE = $(call github,ndevilla,iniparser,v$(INIPARSER_VERSION))
> +INIPARSER_INSTALL_STAGING = YES
> +INIPARSER_LICENSE = MIT
> +INIPARSER_LICENSE_FILES = LICENSE
> +INIPARSER_SO_TARGET = libiniparser.so.1
> +INIPARSER_A_TARGET = libiniparser.a
> +INIPARSER_BUILD_TARGETS =
> +INIPARSER_STAGING_INSTALL_TGTS =
> +INIPARSER_TARGET_INSTALL_TGTS =
> +
> +INIPARSER_CONFIGURE_OPTS = $(TARGET_CONFIGURE_OPTS)
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +INIPARSER_BUILD_TARGETS = $(INIPARSER_A_TARGET)
> +INIPARSER_STAGING_INSTALL_TGTS = $(INIPARSER_A_TARGET)
> +INIPARSER_TARGET_INSTALL_TGTS = $(INIPARSER_A_TARGET)
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +INIPARSER_LINK_SO = y
> +
> +INIPARSER_BUILD_TARGETS = $(INIPARSER_SO_TARGET)
> +INIPARSER_STAGING_INSTALL_TGTS = $(INIPARSER_SO_TARGET)
> +
> +INIPARSER_TARGET_INSTALL_TGTS = $(INIPARSER_SO_TARGET)
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +INIPARSER_LINK_SO = y
> +
> +INIPARSER_BUILD_TARGETS = $(INIPARSER_A_TARGET) $(INIPARSER_SO_TARGET)
> +INIPARSER_STAGING_INSTALL_TGTS = $(INIPARSER_A_TARGET) $(INIPARSER_SO_TARGET)
> +
> +# Don't install static libs on target
> +INIPARSER_TARGET_INSTALL_TGTS = $(INIPARSER_SO_TARGET)
> +endif
> +
> +define INIPARSER_BUILD_CMDS
> +	$(INIPARSER_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(INIPARSER_BUILD_TARGETS)
> +endef
> +
> +define INIPARSER_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/src/iniparser.h $(@D)/src/dictionary.h $(STAGING_DIR)/usr/include/
> +	$(foreach target,$(INIPARSER_STAGING_INSTALL_TGTS),$(INSTALL) -D -m 0755 $(@D)/$(target) $(STAGING_DIR)/usr/lib/)
> +	$(if $(INIPARSER_LINK_SO),ln -s -r $(STAGING_DIR)/usr/lib/$(INIPARSER_SO_TARGET) $(STAGING_DIR)/usr/lib/libiniparser.so)
> +endef
> +
> +define INIPARSER_INSTALL_TARGET_CMDS
> +	$(foreach target,$(INIPARSER_TARGET_INSTALL_TGTS),$(INSTALL) -D -m 0755 $(@D)/$(target) $(TARGET_DIR)/usr/lib/)
> +	$(if $(INIPARSER_LINK_SO),ln -s -r $(TARGET_DIR)/usr/lib/$(INIPARSER_SO_TARGET) $(TARGET_DIR)/usr/lib/libiniparser.so)
> +endef
> +
> +$(eval $(generic-package))

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
