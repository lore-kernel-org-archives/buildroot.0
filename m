Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2512C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 11:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4956F4088F;
	Wed,  8 Feb 2023 11:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4956F4088F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wKAolDNHHrgP; Wed,  8 Feb 2023 11:18:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C09D406E0;
	Wed,  8 Feb 2023 11:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C09D406E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A3201BF3A4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 044E340BDE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 044E340BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MxpLT5STUkib for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 11:18:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15EEB40BD2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15EEB40BD2
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 11:18:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EF50C6000D;
 Wed,  8 Feb 2023 11:18:29 +0000 (UTC)
Date: Wed, 8 Feb 2023 12:18:29 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230208121829.126bc242@windsurf>
In-Reply-To: <20230207171721.2973997-14-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
 <20230207171721.2973997-14-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675855110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yOcK0g0hbFtF7LSRV7Gmcr4MEf3cfn4QWM2QJKvHyGU=;
 b=X1cPV5lIGsSo19vV5Zml0UBxkD84BADAOAwwAAIPeuCSjy8wZgkisM4WMrS+ap/g1+Wke4
 i4jY3WQqZX8jTsGFzAnESk7qgi4jk2YISdTfgRA2G88irqMvNRCVHzF+I5lmMI4lFUwuph
 wVVqdK4rt2GgI6C2FH39QmkB2hOvsI5nRpe7eDLTUFD5V1lZkJnvLXGks7HU5ocO+DdDRY
 +pcP4edKBOeSeOylf1IvKpIG2cIQhSZdyod327oSDYIUDqKEjk1YbkMXsBIU718CKotBF4
 RvAFAwUHxF10Sl3Vau7C7kiGj4x/Xst0IBBvey/AaDWOy42CZUpi9canpgOfIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X1cPV5lI
Subject: Re: [Buildroot] [PATCH v6 13/13] package/qt6: Add qmake
 functionality
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
Cc: jesseevg@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue,  7 Feb 2023 18:17:21 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> diff --git a/package/qt6/qt6base/qt.conf.in b/package/qt6/qt6base/qt.conf.in
> new file mode 100644
> index 0000000000..4842bcb462
> --- /dev/null
> +++ b/package/qt6/qt6base/qt.conf.in
> @@ -0,0 +1,7 @@
> +[Paths]
> +Prefix=/usr
> +HostPrefix=@@HOST_DIR@@
> +HostData=../target/usr

This looks very very odd, and most likely doesn't work. If I understand
correctly, this is a path that will be interpreted relatively to
$(HOST_DIR), so this value assumes that host/ and target/ are side by
side, but that's not true in the general case. Indeed, BR2_HOST_DIR
allows to customize where $(HOST_DIR) is located, and it can be
elsewhere than side by side to target/.

What is this trying to do exactly?



> +Sysroot=@@STAGING_DIR@@
> +SysrootifyPrefix=true
> +TargetSpec=devices/linux-buildroot-g++
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index ec1c65f827..f37b2bafce 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -54,6 +54,9 @@ QT6BASE_CONF_OPTS = \
>  	-DFEATURE_system_zlib=ON \
>  	-DFEATURE_system_libb2=ON
>  
> +QT6BASE_CFLAGS = $(TARGET_CFLAGS)
> +QT6BASE_CXXFLAGS = $(TARGET_CXXFLAGS)
> +
>  # x86 optimization options. While we have a BR2_X86_CPU_HAS_AVX512, it
>  # is not clear yet how it maps to all the avx512* options of Qt, so we
>  # for now keeps them disabled.
> @@ -384,5 +387,18 @@ else
>  QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
>  endif
>  
> +define QT6BASE_MAKE_BR_SPEC
> +	$(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qmake.conf.in \
> +		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
> +	$(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qplatformdefs.h \
> +		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
> +endef
> +
> +QT6BASE_CONF_OPTS += -DQT_QMAKE_DEVICE_OPTIONS=CROSS_COMPILE="$(TARGET_CROSS)";BR_COMPILER_CFLAGS="$(QT6BASE_CFLAGS)";BR_COMPILER_CXXFLAGS="$(QT6BASE_CXX_FLAGS)"
> +
> +QT6BASE_PRE_CONFIGURE_HOOKS += QT6BASE_MAKE_BR_SPEC
> +
> +QT6BASE_POST_INSTALL_STAGING_HOOKS += QT6_INSTALL_QT_CONF

Where is QT6_INSTALL_QT_CONF implemented ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
