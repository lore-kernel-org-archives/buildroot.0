Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FF9C433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 10:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CCC0812A8;
	Thu, 29 Sep 2022 10:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CCC0812A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uP9J7zRJrmwh; Thu, 29 Sep 2022 10:43:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50B2B80F59;
	Thu, 29 Sep 2022 10:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50B2B80F59
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 69D781BF5A2
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 10:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4390E4195B
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 10:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4390E4195B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AYShvfuv3NDe for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 10:43:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B07984181D
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp4.osuosl.org (Postfix) with ESMTP id B07984181D
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 10:43:25 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.15.171])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dr0konI5fSmRKdr0kou3HI; Thu, 29 Sep 2022 12:43:22 +0200
Message-ID: <ec9bdbc9-3958-21f1-bfc0-82c29138f17f@benettiengineering.com>
Date: Thu, 29 Sep 2022 12:43:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>,
 buildroot@buildroot.org
References: <20220922214512.2098221-1-thomas.ballasi@savoirfairelinux.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220922214512.2098221-1-thomas.ballasi@savoirfairelinux.com>
X-CMAE-Envelope: MS4xfPlFPqzirRjfJ5p2Pqty6n/RidIIP8XebRv6n0CIAyo7E4+B2P+AGt16GVC2+unmaaFzRgrP9govNfKOB3rK3pG+ytB2EyV9BFX65FF1AbqdRn9+/CGS
 fm+XwUlD9O+LedRJZvApbHWbngR4peLDSS+rQZB0sH+2zpofiGSeA/fGPy+vjiUqVRrgpRIV4AB/By4uFp5dJ8ByKu1dNXi8RFvXgbs4Ns+yzXvdZzQzFdlu
 PcseIB8HTWkP9kwbLHvO95XNnbxei/CAALz9l3BCzuogfM1b++Dhho2shiz3hi9Z9Ac7/5l1Ka7bqHxnKDtg7MKFxdXQE0KmdYPyWoO5iTk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1664448202; bh=usJRVnSEbdWm0qqaCNdjiyd41LGzu0Q8kxWmCtmGCB8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=F80HwTWf+1EzkyjyglCatx6NJYVM2sQHpE/DTtXmBLB5MkZceiXGTqnJehp3ixl4e
 dp68vG52iRqnQAJ4MNPb/SvTcIissWB3hOntx2pNzG/j6LQ76OFAy+F5Yh0rFmBmmw
 qv0c+xnuvRXiO2k6IIwhbqwWvgPbJAOeTzyig+dWUkXC7QXgShCWqy9f86YkCkDWaw
 RYjpyzd8tX+ew0A7CP0TJITQ1TL96ezaf7/AWynrMo/yE/olGyKtWqx4nr28nTtHbd
 BuLkdKxjJQQAZJkqZulkyl/l72CeQa4irgW4yJKWaGyTjGfyEqZU9i1iU+i58iqUQg
 wP0FtSz7rKuwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=F80HwTWf
Subject: Re: [Buildroot] [PATCH] package/qt5/qt5webkit: fix generated
 artifacts
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 22/09/22 23:45, Thomas Ballasi wrote:
> Generated artifacts of the installation process were wrongly located,
> causing packages using qt5webkit (qt-webkit-kiosk and python-pyqt5) to
> fail at build time. The changes aims at fixing this issue.

"The changes aims at fixing this issue." should be:
"Let's add a patch that:"

and then you list the points below using the present verb

> There were three main issues occuring during the build:
> 
> 1. *.pri files were wrongly located in the host's and target's sysroot
>     directores while buildroot implements its own mkspecs directory.
>     By setting KDE_INSTALL_USE_QT_SYS_PATHS on, mkspecs modules are now
>     being installed in host's data dir (ECM_MKSPECS_INSTALL_DIR is set
>     accordingly @ line 102 in Source/cmake/ECMGeneratePriFile.cmake).
>     This also required to prevent using the CMake package's default
>     DATADIR variable as it enforces to install under the sysroot
>     directory.
> 
> 2. *.pri files' content had hardcoded include and library paths which
>     has been corrected by setting on KDE_INSTALL_USE_QT_SYS_PATHS as
>     their content is written according to this value (see line 514 and
>     739 in file Source/WebKit/PlatformQt.cmake).
> 
> 3. *.h files were located a directory below where supposed (inside qt5/
>     directory). This was caused by using DATADIR which assumed include
>     files were to be located in sysroot/usr/include/.
>     Disabling this variable by removing it from build options leads to a
>     correct behavior.
> 
> Regression happened when qt5webkit started using cmake-package at commit
> df0b0fe6919c0d0f3750f439a3cfa765232bd569.

What is the upstream status of this patch? Can you point here the URL
of the pending patch?

> More info @ https://bugs.buildroot.org/show_bug.cgi?id=14606

Here ^^^ it should be:
Fixes:
https://bugs.buildroot.org/show_bug.cgi?id=14606

> Signed-off-by: Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>
> ---
>   ...-set-KDE_INSTALL_USE_QT_SYS_PATHS-on.patch | 42 +++++++++++++++++++
>   package/qt5/qt5webkit/qt5webkit.mk            |  7 ++++
>   2 files changed, 49 insertions(+)
>   create mode 100644 package/qt5/qt5webkit/0007-cmake-set-KDE_INSTALL_USE_QT_SYS_PATHS-on.patch
> 
> diff --git a/package/qt5/qt5webkit/0007-cmake-set-KDE_INSTALL_USE_QT_SYS_PATHS-on.patch b/package/qt5/qt5webkit/0007-cmake-set-KDE_INSTALL_USE_QT_SYS_PATHS-on.patch
> new file mode 100644
> index 0000000000..b65eb305b4
> --- /dev/null
> +++ b/package/qt5/qt5webkit/0007-cmake-set-KDE_INSTALL_USE_QT_SYS_PATHS-on.patch
> @@ -0,0 +1,42 @@
> +From f4950219005b487c18d41ce4e6bc11c4b0e3a20d Mon Sep 17 00:00:00 2001
> +From: Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>
> +Date: Wed, 21 Sep 2022 14:46:40 -0400
> +Subject: [PATCH] cmake: set KDE_INSTALL_USE_QT_SYS_PATHS on
> +
> +This variable is used to save .pri files to directories relative to the
> +host (output/host/mkspecs/modules/) rather than relative to the target
> +itself, which is unwanted behavior.
> +
> +The changes also enables .pri files not to hardcode include and library
> +paths and to use $$QT_MODULE_INCLUDE_BASE and $$QT_MODULE_LIB_BASE.
> +
> +Signed-off-by: Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>

Also here please add:
'[Upstream status: URL of this pending patch]

> +---
> + Source/cmake/OptionsQt.cmake | 8 +-------
> + 1 file changed, 1 insertion(+), 7 deletions(-)
> +
> +diff --git a/Source/cmake/OptionsQt.cmake b/Source/cmake/OptionsQt.cmake
> +index 1ee60b777106..607c69bd38fe 100644
> +--- a/Source/cmake/OptionsQt.cmake
> ++++ b/Source/cmake/OptionsQt.cmake
> +@@ -998,16 +998,10 @@ feature_summary(WHAT ALL FATAL_ON_MISSING_REQUIRED_PACKAGES)
> + include(ECMQueryQmake)
> +
> + query_qmake(qt_install_prefix_dir QT_INSTALL_PREFIX)
> +-if (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
> +-    set(CMAKE_INSTALL_PREFIX "${qt_install_prefix_dir}" CACHE PATH "Install path prefix, prepended onto install directories." FORCE)
> +-endif ()
> ++set(CMAKE_INSTALL_PREFIX "${qt_install_prefix_dir}")
> +
> + include(KDEInstallDirs)
> +
> +-if (NOT qt_install_prefix_dir STREQUAL "${CMAKE_INSTALL_PREFIX}")
> +-    set(KDE_INSTALL_USE_QT_SYS_PATHS OFF)
> +-endif ()
> +-
> + # We split all installed files into 2 components: Code and Data. This is different from
> + # traditional approach with Runtime and Devel, but we need it to fix concurrent installation of
> + # debug and release builds in qmake-based build
> +--
> +2.25.1
> +
> diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
> index 6912359674..607c022568 100644
> --- a/package/qt5/qt5webkit/qt5webkit.mk
> +++ b/package/qt5/qt5webkit/qt5webkit.mk
> @@ -57,4 +57,11 @@ QT5WEBKIT_CONF_OPTS += \
>   	-DSHARED_CORE=ON \
>   	-DUSE_LIBHYPHEN=OFF
>   
> +QT5WEBKIT_INSTALL_STAGING_OPTS = install/fast
> +
> +define QT5WEBKIT_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT5WEBKIT_BUILDDIR) \
> +		--prefix $(TARGET_DIR)/usr
> +endef
> +
>   $(eval $(cmake-package))

The patch works correctly, so with commit log improve and the local 
patch with Upstream status pointed:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks for contributing!

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
