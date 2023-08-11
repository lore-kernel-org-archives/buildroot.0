Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE72C0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 07:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D610A60AAE;
	Fri, 11 Aug 2023 07:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D610A60AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JU6rccEwIU7X; Fri, 11 Aug 2023 07:23:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15F5A607DE;
	Fri, 11 Aug 2023 07:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15F5A607DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BD531BF228
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 07:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E45BE41BBF
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 07:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E45BE41BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gb778qnSdnVC for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 07:23:37 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B25941BBD
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 07:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B25941BBD
Received: by mail.gandi.net (Postfix) with ESMTPSA id D391B24000B;
 Fri, 11 Aug 2023 07:23:32 +0000 (UTC)
Date: Fri, 11 Aug 2023 09:23:31 +0200
To: Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>
Message-ID: <20230811092331.36236311@windsurf>
In-Reply-To: <20220929181350.1026033-1-thomas.ballasi@savoirfairelinux.com>
References: <20220922214512.2098221-1-thomas.ballasi@savoirfairelinux.com>
 <20220929181350.1026033-1-thomas.ballasi@savoirfairelinux.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691738614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSwzoy1AsxU5GIKd46yYMrfiUtJtbc1nzljReppEI7o=;
 b=lE3jf/WpjKa/0zEXeiV+l6TVnlbJ8vE62aPYv5b6XMHNEuqE37Y867t7SgOhi+R1vfzZ8S
 zjYr1wx6ZBPTqyL3vqb08rXV9oZ908ABstaMPtj9H65k6WZ4I/spSI+//Jk8JbREJtUI/C
 4mxJMaeD8d5X+jszAUw1SbgMYyLE+HfF2JO6o+xesXZ3oMqGliRYdhWPBUNdvTd9OzryTZ
 hnDTiAiyaSDvj3CiVWjkQppuFodlC52BgEn/kW3HmtCNOUiR7Fp1rG8mw234l2kt5f9sSd
 fghy6gmuTEufGXsE8G3bmlAk0ygX1/jihbRJotYRvn54BPvrV2wNeH1HN75/Lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lE3jf/Wp
Subject: Re: [Buildroot] [PATCH v2] package/qt5/qt5webkit: fix generated
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

As part of an effort to clear up our backlog, I stumbled across this
patch of yours, which has never been applied.

However, looking at the issue, I see that both qt-webkit-kiosk and
python-pyqt5 were indeed failing to build until November/December 2022,
being unable to find the "webkit" Qt module. But since then, we haven't
had any further build failure for those two packages:

 http://autobuild.buildroot.net/?reason=qt-webkit-kiosk%
 http://autobuild.buildroot.net/?reason=python-pyqt5%

I don't immediately see what has changed in qt5webkit that could have
fixed the issue.

Does this issue still exists in the current Buildroot master?

Thanks for your feedback,

Thomas

On Thu, 29 Sep 2022 14:13:50 -0400
Thomas Ballasi <thomas.ballasi@savoirfairelinux.com> wrote:

> Generated artifacts of the installation process were wrongly located,
> causing packages using qt5webkit (qt-webkit-kiosk and python-pyqt5) to
> fail at build time.
> 
> Firstly, *.h files are wrongly located a directory below where supposed
> (inside qt5/ directory). This is caused by using DATADIR which assumed
> include files were to be located in sysroot/usr/include/. Disabling this
> variable by removing it from build options leads to a correct behavior.
> 
> Secondly, in order to locate *.pri artifacts correctly, we set the conf
> option CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT on, which in turn
> sets the variable KDE_INSTALL_USE_QT_SYS_PATHS on, for the following
> reasons:
> 
> 1. *.pri files are wrongly located in the host's and target's sysroot
>    directores while buildroot implements its own mkspecs directory.
>    By setting KDE_INSTALL_USE_QT_SYS_PATHS on, mkspecs modules are now
>    being installed in host's data dir (ECM_MKSPECS_INSTALL_DIR is set
>    accordingly @ line 102 in Source/cmake/ECMGeneratePriFile.cmake).
>    This also required to prevent using the CMake package's default
>    DATADIR variable, as done previously, as it enforced to install
>    artifacts under the sysroot directory.
> 
> 2. *.pri files' content have hardcoded include and library paths. This
>    has been corrected by setting on KDE_INSTALL_USE_QT_SYS_PATHS as
>    their content is written according to this value (see line 514 and
>    739 in file Source/WebKit/PlatformQt.cmake).
> 
> Regression happened when qt5webkit started using cmake-package at commit
> df0b0fe6919c0d0f3750f439a3cfa765232bd569.
> 
> Fixes:
> https://bugs.buildroot.org/show_bug.cgi?id=14606
> 
> Signed-off-by: Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>
> ---
>  package/qt5/qt5webkit/qt5webkit.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
> index 6912359674..8310ef20c8 100644
> --- a/package/qt5/qt5webkit/qt5webkit.mk
> +++ b/package/qt5/qt5webkit/qt5webkit.mk
> @@ -51,10 +51,18 @@ QT5WEBKIT_CONF_OPTS += -DENABLE_SAMPLING_PROFILER=OFF
>  endif
>  
>  QT5WEBKIT_CONF_OPTS += \
> +	-DCMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT=ON \
>  	-DENABLE_TOOLS=OFF \
>  	-DPORT=Qt \
>  	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
>  	-DSHARED_CORE=ON \
>  	-DUSE_LIBHYPHEN=OFF
>  
> +QT5WEBKIT_INSTALL_STAGING_OPTS = install/fast
> +
> +define QT5WEBKIT_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT5WEBKIT_BUILDDIR) \
> +		--prefix $(TARGET_DIR)/usr
> +endef
> +
>  $(eval $(cmake-package))



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
