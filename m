Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587CDC4345F
	for <buildroot@archiver.kernel.org>; Sat, 13 Apr 2024 19:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB5CA406C5;
	Sat, 13 Apr 2024 19:44:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EoD0CLlBtORb; Sat, 13 Apr 2024 19:44:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4FE940604
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4FE940604;
	Sat, 13 Apr 2024 19:44:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB81D1BF297
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 19:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7908405D2
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 19:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8L_uxUWOP61y for <buildroot@lists.busybox.net>;
 Sat, 13 Apr 2024 19:44:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A3E14405A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3E14405A6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3E14405A6
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 19:44:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8B15F13F880;
 Sat, 13 Apr 2024 21:43:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 Apr 2024 21:43:56 +0200
Date: Sat, 13 Apr 2024 21:43:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZhrgfO4MqypDjkOK@landeda>
References: <20240413131757.3627575-1-dario.binacchi@amarulasolutions.com>
 <20240413131757.3627575-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240413131757.3627575-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713037440;
 bh=/cokIoiADzKCa3LVV0Zc+d5pVClxQcTAlxkDRQ9p9cw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jmcXCCb8yBAQ+l0We4TP8a9uOrBVB0VGj5iKOibHhj6/HmM7FOFVwTQQU+wcGzagT
 qQ45HPWkl0I5jMxL+DFXtcQ2ArXk6+8UYO+ImsKbkYNX51K2RowRQbbi2Irh7bNKTG
 m4F9EcKUKXHlA5T3MBhsS06QZQJ0zn+PRexzl+UeAhTFvmHKoY/8WVaT2Egk4wJUk1
 ECrdiBiWYfW/D0qqrgMbcZqykOIMK7nKS11i8/C7N8CRT4NUcZsoaMdFHgchAwRAy8
 XNUWF7kh9E/xU8IEWXK0/ty1ujIeHTT7RetZipwfaQEa4eOfu+ATWOjLgNRdRmfxWN
 iInaWlFEcp6ZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jmcXCCb8
Subject: Re: [Buildroot] [PATCH 2/3] package/bmap-tools: rename to bmaptool
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
Cc: linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-04-13 15:17 +0200, Dario Binacchi spake thusly:
> The patch aligns the package name in Buildroot with the current one on
> GitHub.
> The bmaptool (previously bmap-tools) has been moved under the Yocto Project
> umbrella and is now hosted at https://github.com/yoctoproject/bmaptool.

This rename is a bit of churn, just to get rid of a dash. Maybe just
drop it in the package prompt, with a comment explaining it, lie so:

    +# Historically, the package was named bmap-tools, and that's the name
    +# under which it was introduced in Buildroot. Since then, it has moved
    +# to a new home, and got renamed to bmaptool. To avoid useless churn,
    +# we keep the old symbols, and just refer to bmaptools in the prompt.
     config BR2_PACKAGE_BMAP_TOOLS
    -       bool "bmap-tools"
    +       bool "bmaptool (formerly bmap-tools)"
            depends on BR2_PACKAGE_PYTHON3
            select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
            select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime, pkg_resources

Note that the description on the github reprository is still:

    BMAP Tools

Also note that, even before the move to the yocto umbrella, the tol
itself was already "bmaptool".

So I don't think a full rename is waranted...

Regards,
Yann E. MORIN.

> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  Config.in.legacy                                     |  7 +++++++
>  DEVELOPERS                                           |  8 ++++----
>  package/Config.in                                    |  2 +-
>  package/Config.in.host                               |  2 +-
>  package/{bmap-tools => bmaptool}/Config.in           |  4 ++--
>  package/{bmap-tools => bmaptool}/Config.in.host      |  4 ++--
>  .../bmap-tools.hash => bmaptool/bmaptool.hash}       |  2 +-
>  .../bmap-tools.mk => bmaptool/bmaptool.mk}           | 12 ++++++------
>  .../{sample_bmap_tools.sh => sample_bmaptool.sh}     |  0
>  .../package/{test_bmap_tools.py => test_bmaptool.py} |  6 +++---
>  10 files changed, 27 insertions(+), 20 deletions(-)
>  rename package/{bmap-tools => bmaptool}/Config.in (96%)
>  rename package/{bmap-tools => bmaptool}/Config.in.host (88%)
>  rename package/{bmap-tools/bmap-tools.hash => bmaptool/bmaptool.hash} (51%)
>  rename package/{bmap-tools/bmap-tools.mk => bmaptool/bmaptool.mk} (51%)
>  rename support/testing/tests/package/{sample_bmap_tools.sh => sample_bmaptool.sh} (100%)
>  rename support/testing/tests/package/{test_bmap_tools.py => test_bmaptool.py} (95%)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 76af1da3488f..ced76d072b79 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2024.05"
>  
> +config BR2_PACKAGE_BMAP_TOOLS
> +	bool "bmap_tools has been renamed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_BMAPTOOL
> +	help
> +	  The bmap-tools package has been renamed to bmaptool.
> +
>  config BR2_TARGET_TI_K3_IMAGE_GEN
>  	bool "ti-k3-image-gen removed"
>  	select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 399b2931ff3d..8e3b7a464c26 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2316,7 +2316,7 @@ F:	board/intel/galileo/
>  F:	configs/galileo_defconfig
>  
>  N:	Nicolas Carrier <nicolas.carrier@orolia.com>
> -F:	package/bmap-tools/
> +F:	package/bmaptool/
>  F:	package/composer/
>  F:	package/libdbi/
>  F:	package/libdbi-drivers/
> @@ -2331,12 +2331,12 @@ F:	package/python-augeas/
>  F:	package/python-flask-expects-json/
>  F:	package/python-git/
>  F:	package/python-unittest-xml-reporting/
> -F:	support/testing/tests/package/sample_bmap_tools.sh
> +F:	support/testing/tests/package/sample_bmaptool.sh
>  F:	support/testing/tests/package/sample_python_augeas.py
>  F:	support/testing/tests/package/sample_python_flask_expects_json.py
>  F:	support/testing/tests/package/sample_python_git.py
>  F:	support/testing/tests/package/sample_python_unittest_xml_reporting.py
> -F:	support/testing/tests/package/test_bmap_tools.py
> +F:	support/testing/tests/package/test_bmaptool.py
>  F:	support/testing/tests/package/test_lua_augeas.py
>  F:	support/testing/tests/package/test_php_apcu.py
>  F:	support/testing/tests/package/test_php_pecl_dbus.py
> @@ -2992,7 +2992,7 @@ F:	configs/stm32mp157c_dk2_defconfig
>  F:	package/android-tools/
>  F:	package/b43-firmware/
>  F:	package/b43-fwcutter/
> -F:	package/bmap-tools/
> +F:	package/bmaptool/
>  F:	package/c-periphery/
>  F:	package/cdrkit/
>  F:	package/cifs-utils/
> diff --git a/package/Config.in b/package/Config.in
> index 1935077f0f45..a47a75331014 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -213,7 +213,7 @@ menu "Filesystem and flash utilities"
>  	source "package/aufs/Config.in"
>  	source "package/aufs-util/Config.in"
>  	source "package/autofs/Config.in"
> -	source "package/bmap-tools/Config.in"
> +	source "package/bmaptool/Config.in"
>  	source "package/btrfs-progs/Config.in"
>  	source "package/cifs-utils/Config.in"
>  	source "package/cpio/Config.in"
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 9543a22ffc6a..2f8a95933b3b 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -7,7 +7,7 @@ menu "Host utilities"
>  	source "package/android-tools/Config.in.host"
>  	source "package/asn1c/Config.in.host"
>  	source "package/babeltrace2/Config.in.host"
> -	source "package/bmap-tools/Config.in.host"
> +	source "package/bmaptool/Config.in.host"
>  	source "package/bootgen/Config.in.host"
>  	source "package/btrfs-progs/Config.in.host"
>  	source "package/cbootimage/Config.in.host"
> diff --git a/package/bmap-tools/Config.in b/package/bmaptool/Config.in
> similarity index 96%
> rename from package/bmap-tools/Config.in
> rename to package/bmaptool/Config.in
> index 425b7dfb9e07..821508b35665 100644
> --- a/package/bmap-tools/Config.in
> +++ b/package/bmaptool/Config.in
> @@ -1,5 +1,5 @@
> -config BR2_PACKAGE_BMAP_TOOLS
> -	bool "bmap-tools"
> +config BR2_PACKAGE_BMAPTOOL
> +	bool "bmaptool"
>  	depends on BR2_PACKAGE_PYTHON3
>  	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
>  	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime, pkg_resources
> diff --git a/package/bmap-tools/Config.in.host b/package/bmaptool/Config.in.host
> similarity index 88%
> rename from package/bmap-tools/Config.in.host
> rename to package/bmaptool/Config.in.host
> index cb4d35a437fa..9a341d38775a 100644
> --- a/package/bmap-tools/Config.in.host
> +++ b/package/bmaptool/Config.in.host
> @@ -1,5 +1,5 @@
> -config BR2_PACKAGE_HOST_BMAP_TOOLS
> -	bool "host bmap-tools"
> +config BR2_PACKAGE_HOST_BMAPTOOL
> +	bool "host bmaptool"
>  	select BR2_PACKAGE_HOST_PYTHON_SIX # runtime
>  	help
>  	  Tool to flash image files to block devices using the block map
> diff --git a/package/bmap-tools/bmap-tools.hash b/package/bmaptool/bmaptool.hash
> similarity index 51%
> rename from package/bmap-tools/bmap-tools.hash
> rename to package/bmaptool/bmaptool.hash
> index 82a570ecacdb..9d621e76a52a 100644
> --- a/package/bmap-tools/bmap-tools.hash
> +++ b/package/bmaptool/bmaptool.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  0658afb972e7221aa16fece3f84e29e5102e901c929253d7fb6040bde28243f7  bmap-tools-3.6.tar.gz
> +sha256  7a2e1305bf7e06bc4a580cc719f0facf9d99af8d41659b57c0acae4ad93ff45a  bmaptool-3.6.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmaptool/bmaptool.mk
> similarity index 51%
> rename from package/bmap-tools/bmap-tools.mk
> rename to package/bmaptool/bmaptool.mk
> index 69a22c4745ab..34664d13b37f 100644
> --- a/package/bmap-tools/bmap-tools.mk
> +++ b/package/bmaptool/bmaptool.mk
> @@ -1,14 +1,14 @@
>  ################################################################################
>  #
> -# bmap-tools
> +# bmaptool
>  #
>  ################################################################################
>  
> -BMAP_TOOLS_VERSION = 3.6
> -BMAP_TOOLS_SITE = $(call github,yoctoproject,bmaptool,v$(BMAP_TOOLS_VERSION))
> -BMAP_TOOLS_LICENSE = GPL-2.0
> -BMAP_TOOLS_LICENSE_FILES = COPYING
> -BMAP_TOOLS_SETUP_TYPE = setuptools
> +BMAPTOOL_VERSION = 3.6
> +BMAPTOOL_SITE = $(call github,yoctoproject,bmaptool,v$(BMAPTOOL_VERSION))
> +BMAPTOOL_LICENSE = GPL-2.0
> +BMAPTOOL_LICENSE_FILES = COPYING
> +BMAPTOOL_SETUP_TYPE = setuptools
>  
>  $(eval $(python-package))
>  $(eval $(host-python-package))
> diff --git a/support/testing/tests/package/sample_bmap_tools.sh b/support/testing/tests/package/sample_bmaptool.sh
> similarity index 100%
> rename from support/testing/tests/package/sample_bmap_tools.sh
> rename to support/testing/tests/package/sample_bmaptool.sh
> diff --git a/support/testing/tests/package/test_bmap_tools.py b/support/testing/tests/package/test_bmaptool.py
> similarity index 95%
> rename from support/testing/tests/package/test_bmap_tools.py
> rename to support/testing/tests/package/test_bmaptool.py
> index a179027633df..f88239ecf81e 100644
> --- a/support/testing/tests/package/test_bmap_tools.py
> +++ b/support/testing/tests/package/test_bmaptool.py
> @@ -7,7 +7,7 @@ from infra.basetest import BRTest
>  
>  class TestBmapTools(BRTest):
>      __test__ = False
> -    sample_script = "tests/package/sample_bmap_tools.sh"
> +    sample_script = "tests/package/sample_bmaptool.sh"
>      copy_script = 'tests/package/copy-sample-script-to-target.sh'
>      config = \
>          """
> @@ -15,7 +15,7 @@ class TestBmapTools(BRTest):
>          BR2_cortex_a8=y
>          BR2_TOOLCHAIN_EXTERNAL=y
>          BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> -        BR2_PACKAGE_BMAP_TOOLS=y
> +        BR2_PACKAGE_BMAPTOOL=y
>          BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
>          BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
>          BR2_TARGET_ROOTFS_EXT2=y
> @@ -56,7 +56,7 @@ class TestPy3BmapTools(TestBmapTools):
>  class TestHostBmapTools(BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
>          """
> -        BR2_PACKAGE_HOST_BMAP_TOOLS=y
> +        BR2_PACKAGE_HOST_BMAPTOOL=y
>          # BR2_TARGET_ROOTFS_TAR is not set
>          BR2_TARGET_ROOTFS_EXT2=y
>          """
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
