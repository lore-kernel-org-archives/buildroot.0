Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C1EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 22:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 426A1611C2;
	Thu, 29 Sep 2022 22:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 426A1611C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YHBgk3urq0GX; Thu, 29 Sep 2022 22:02:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D79B60BEB;
	Thu, 29 Sep 2022 22:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D79B60BEB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A6EE1BF3D1
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 22:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF76541C40
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 22:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF76541C40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PssDAROJA4cs for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 22:02:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41DA441C3F
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41DA441C3F
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 22:02:30 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.15.171])
 by Aruba Outgoing Smtp  with ESMTPSA
 id e1bvotH7NRFZ1e1bvoNFVm; Fri, 30 Sep 2022 00:02:28 +0200
Message-ID: <36fcb3d3-c3ad-82ce-4618-edfac37305ab@benettiengineering.com>
Date: Fri, 30 Sep 2022 00:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>,
 buildroot@buildroot.org
References: <20220922214512.2098221-1-thomas.ballasi@savoirfairelinux.com>
 <20220929181350.1026033-1-thomas.ballasi@savoirfairelinux.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220929181350.1026033-1-thomas.ballasi@savoirfairelinux.com>
X-CMAE-Envelope: MS4xfL0LX2ImpZPiX4KO/6KmA8u6O9ctUWlOXJgSEkfWRgNi9CVj7aARHGqRNXZq+L5UkQLl4h607cfFzlfzamPSrSoPYu2RLsfKeNW9Tpd7WZm+cgVuuc3o
 N1q/Gr/JbuEIC6fy3k8hfw2NXgylphWwS/9mfQFKlMIpzbl8wd5zjBcbLx6qW/D2FRVcGy14ufSMyzS0yj4KxDNjLf1Ev0clcI13fl3CVwF9GTB3i//Lm/ip
 y8ogoCOcnllUgQcciDBZvccqpFQHCd5qnVWKNJQOQ4a9q2Jex4ekElY+Dkaa4J1S3E1/XdIc2U51QAo1pjDzxYiCCqj2Rm8SzVvFlQQdY7Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1664488948; bh=9Tc3JcOa63vlyFomx4EYmRU3KdW+4/s4tpGBlTypwoE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=dr6+QyiRWvSr/X5p/LvWBU4646y1N18NDQtjZE9ib4bzvlCqluK8YNyjQw2fINnib
 n1wicg4LWrhG1Ie5h+f29Sf2GTvr6SewkaWujtGDS8EIiZivTq99pDw+QJD4tWGJU+
 hYLV/+dFgaPGZbmtxby3LlNvcrl/88DAEC2kNQGBWlap3V1x+jFk1XLPvS5fHEC4sV
 gJXKeX0Xk75FhGojZ7FTKxF/ifIEiWL/fJAf4o9WdoTdrghvX+5ZAQ9o0LnG6XX8CV
 uEeWLqWN0gdi0cuZLRASJ+2/jVGeF/slwi/EGD3IWFarrGSGLSfEtd2I0vfT/9bxXT
 GZaHpgKFE4NNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=dr6+QyiR
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 29/09/22 20:13, Thomas Ballasi wrote:
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
>     directores while buildroot implements its own mkspecs directory.
>     By setting KDE_INSTALL_USE_QT_SYS_PATHS on, mkspecs modules are now
>     being installed in host's data dir (ECM_MKSPECS_INSTALL_DIR is set
>     accordingly @ line 102 in Source/cmake/ECMGeneratePriFile.cmake).
>     This also required to prevent using the CMake package's default
>     DATADIR variable, as done previously, as it enforced to install
>     artifacts under the sysroot directory.
> 
> 2. *.pri files' content have hardcoded include and library paths. This
>     has been corrected by setting on KDE_INSTALL_USE_QT_SYS_PATHS as
>     their content is written according to this value (see line 514 and
>     739 in file Source/WebKit/PlatformQt.cmake).
> 
> Regression happened when qt5webkit started using cmake-package at commit
> df0b0fe6919c0d0f3750f439a3cfa765232bd569.
> 
> Fixes:
> https://bugs.buildroot.org/show_bug.cgi?id=14606
> 
> Signed-off-by: Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>
> ---
>   package/qt5/qt5webkit/qt5webkit.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
> index 6912359674..8310ef20c8 100644
> --- a/package/qt5/qt5webkit/qt5webkit.mk
> +++ b/package/qt5/qt5webkit/qt5webkit.mk
> @@ -51,10 +51,18 @@ QT5WEBKIT_CONF_OPTS += -DENABLE_SAMPLING_PROFILER=OFF
>   endif
>   
>   QT5WEBKIT_CONF_OPTS += \
> +	-DCMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT=ON \
>   	-DENABLE_TOOLS=OFF \
>   	-DPORT=Qt \
>   	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
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

Definitely a better solution, it builds fine here at me for both 
qt-webkit-kiosk and python-pyqt5 so:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thank you!

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
