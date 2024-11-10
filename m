Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA986D12D4F
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 19:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7406940291;
	Sun, 10 Nov 2024 19:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zG-AHqxojvYO; Sun, 10 Nov 2024 19:06:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B00D40292
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B00D40292;
	Sun, 10 Nov 2024 19:06:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABDCED8F
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A40D40139
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUrG_ll9_XbT for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 19:06:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B3B940003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B3B940003
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B3B940003
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:06:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AE27313F846;
 Sun, 10 Nov 2024 20:06:42 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46170])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 10 Nov 2024 20:06:42 +0100
MIME-Version: 1.0
Date: Sun, 10 Nov 2024 20:06:42 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241110173328.48325-2-vjardin@free.fr>
References: <aedee4f5789c42dae10d18bc9f9f7c61@free.fr>
 <20241110173328.48325-1-vjardin@free.fr>
 <20241110173328.48325-2-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <2ed2fc8699f527954e3c8a1cd8d9e1f6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731265603;
 bh=/SS9UReHKCGJR+Okm1CWHxbhCsFdMfb0gMW9CQwf7iM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X3WpAjaDlpxmgQZFI4p8TGtZ9iNQylzCncmBD4FFhFun0/Quh//JNdMbjuVbxaQSt
 oycyH/pgFVA3hDFlqunhFmnDUuwGtkXSuuFQ6qhuIY26ies6VeXkzASOV1DRaOkmS3
 3IeC61xY7NyQe58gp50J3Kj30IE8+zN8qIbnJHQFCQ6MQ7XppQwmptAnaTNgXkeG41
 kI7/U4sxeX15AI92f+3Sj+yFN9KHxdhk7+xG9nuw4/sHYQpZKFxiYETjK/icR+Yr1+
 8UoacKowrlkWR3YCCwx7KozeFWOcd1whBc8Yq56fZ4yteIGbZEC4Me/ZUUvBLSo7/f
 NxHdxF0YRLIZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=X3WpAjaD
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bfscripts: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

On 10/11/2024 18:33, Vincent Jardin wrote:
> Bootstrap the installation of Mellanox/NVIDIA Bluefield scripts
> that can be run either on the host CPU or on the onboard ARM64 CPU.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Reviewed-by: Julien Olivain <ju.o@free.fr>

Thanks for the updates. Applied to master.

> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/bfscripts/Config.in      | 12 ++++++++++++
>  package/bfscripts/S99bfup        | 20 ++++++++++++++++++++
>  package/bfscripts/bfscripts.hash |  3 +++
>  package/bfscripts/bfscripts.mk   | 28 ++++++++++++++++++++++++++++
>  6 files changed, 65 insertions(+)
>  create mode 100644 package/bfscripts/Config.in
>  create mode 100644 package/bfscripts/S99bfup
>  create mode 100644 package/bfscripts/bfscripts.hash
>  create mode 100644 package/bfscripts/bfscripts.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index edf823b34b..a11e4e580e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3273,6 +3273,7 @@ 
> F:	support/testing/tests/core/test_root_password.py
>  N:	Vincent Jardin <vjardin@free.fr>
>  F:	board/nvidia/bf3/
>  F:	configs/nvidia_bf3_defconfig
> +F:	package/bfscripts/
>  F:	package/dpdk/
> 
>  N:	Vincent Prince <vincent.prince.fr@gmail.com>
> diff --git a/package/Config.in b/package/Config.in
> index 876b340a8a..d7430287b9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -475,6 +475,7 @@ endmenu
>  	source "package/apcupsd/Config.in"
>  	source "package/avrdude/Config.in"
>  	source "package/bcache-tools/Config.in"
> +	source "package/bfscripts/Config.in"
>  	source "package/biosdevname/Config.in"
>  	source "package/brickd/Config.in"
>  	source "package/brltty/Config.in"
> diff --git a/package/bfscripts/Config.in b/package/bfscripts/Config.in
> new file mode 100644
> index 0000000000..73f55e25d8
> --- /dev/null
> +++ b/package/bfscripts/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_BFSCRIPTS
> +	bool "bfscripts"
> +	depends on BR2_USE_MMU # bash
> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
> +	select BR2_PACKAGE_BASH # runtime
> +	help
> +	  Collection of scripts that are used for Mellanox/NVIDIA
> +	  Bluefield SoC management.
> +
> +	  Currently, it installs: bfcfg, bfrshlog and bfup.
> +
> +	  https://github.com/Mellanox/bfscripts
> diff --git a/package/bfscripts/S99bfup b/package/bfscripts/S99bfup
> new file mode 100644
> index 0000000000..6c301993dc
> --- /dev/null
> +++ b/package/bfscripts/S99bfup
> @@ -0,0 +1,20 @@
> +#!/bin/sh
> +#
> +# notify to the root PCIe (/dev/rshimN/misc) that Linux is up
> +# and that BF3 board is ready
> +
> +DAEMON="bfup"
> +
> +case "$1" in
> +	start)
> +		printf "bfup: "
> +		/usr/bin/$DAEMON
> +		exit_code=$?
> +		[ $exit_code = 0 ] && echo "OK" || echo "FAIL"
> +		;;
> +	*)
> +		echo "Usage: $0 {start}"
> +		exit 1
> +esac
> +
> +exit $?
> diff --git a/package/bfscripts/bfscripts.hash 
> b/package/bfscripts/bfscripts.hash
> new file mode 100644
> index 0000000000..05f2966ab9
> --- /dev/null
> +++ b/package/bfscripts/bfscripts.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  
> 92123fcaeb8eb9ba7f296e2457e82f56831c6fd19c1ad1a5949b7bc7d5d0a837  
> bfscripts-3.9.7-1.tar.gz
> +sha256  
> ab52bc4ac5e66e42e0ce14172c4d1d40969919db98cc0e11d2f6178dcc97bf4d  
> LICENSE
> diff --git a/package/bfscripts/bfscripts.mk 
> b/package/bfscripts/bfscripts.mk
> new file mode 100644
> index 0000000000..aec788e7cb
> --- /dev/null
> +++ b/package/bfscripts/bfscripts.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# bfscripts
> +#
> +################################################################################
> +
> +BFSCRIPTS_VERSION = 3.9.7-1
> +BFSCRIPTS_SITE = $(call 
> github,Mellanox,bfscripts,$(BFSCRIPTS_VERSION))
> +BFSCRIPTS_LICENSE = BSD-2-Clause
> +BFSCRIPTS_LICENSE_FILES = LICENSE
> +
> +BFSCRIPTS_FILES_TO_INSTALL = \
> +	bfcfg \
> +	bfrshlog \
> +	bfup
> +
> +define BFSCRIPTS_INSTALL_TARGET_CMDS
> +	$(foreach f,$(BFSCRIPTS_FILES_TO_INSTALL),\
> +		$(INSTALL) -D -m 0755 $(@D)/$(f) $(TARGET_DIR)/usr/bin/$(f)
> +	)
> +endef
> +
> +define BFSCRIPTS_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 755 package/bfscripts/S99bfup \
> +		$(TARGET_DIR)/etc/init.d/S99bfup
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
