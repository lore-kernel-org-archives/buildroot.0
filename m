Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF151C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E9294031E;
	Mon, 14 Nov 2022 22:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E9294031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AyJNEBT0AUvo; Mon, 14 Nov 2022 22:45:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB8AF401A2;
	Mon, 14 Nov 2022 22:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB8AF401A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 449C81BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CEC981343
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CEC981343
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WeU-Jlgg2gl9 for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:45:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDB2B8133C
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDB2B8133C
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:45:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1BBDB240003;
 Mon, 14 Nov 2022 22:45:33 +0000 (UTC)
Date: Mon, 14 Nov 2022 23:45:32 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221114234532.3aa355df@windsurf>
In-Reply-To: <20221107022458.3448020-2-james.hilliard1@gmail.com>
References: <20221107022458.3448020-1-james.hilliard1@gmail.com>
 <20221107022458.3448020-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668465933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9BOYnKfvSDD13lFEsSZHK+iA0ZSy292K7vkN4Bj1mjw=;
 b=ckJaHOa/eBI5c/E4VDGgCt1a0EgoZGPnF3kI/eA92y1q193NicEJ0R46uAbl5kDMi0jbcA
 tgKbaXO9AKf1ZY+nDrSHZaQatXIdg7/HIU5CVaXY3+HJOtJIVkyvLa4GZeIPSeV1E01MT8
 K87xZsm7bXEG35ZHrojdNCLoy25rOEOUabCZnaxu+jJefA6JciJE5w8DInBbyu+0zkmq+r
 WHftl+4uoS7VDDZcUemiA+lnHLR7hgfA6P+afQ83+cDryCWze6KAJGliARNkQ71bNlYUde
 sHDWliGJmNz4OIR0Z6BNO9X9fVDF1MkiXuaGZB/3zNgatp2pSTQXR6OeQ07b9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ckJaHOa/
Subject: Re: [Buildroot] [PATCH 2/3] package/zxing-cpp: bump to version 1.4.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Sun,  6 Nov 2022 19:24:57 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> -ifeq ($(BR2_PACKAGE_LIBICONV),y)
> -ZXING_CPP_DEPENDENCIES += libiconv
> +ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV4_LIB_HIGHGUI),y)
> +ifeq ($(BR2_PACKAGE_OPENCV3),y)
> +ZXING_CPP_DEPENDENCIES += opencv3
> +endif
> +ifeq ($(BR2_PACKAGE_OPENCV4),y)
> +ZXING_CPP_DEPENDENCIES += opencv4
> +endif
> +ZXING_CPP_CONF_OPTS += -DCMAKE_REQUIRE_FIND_PACKAGE_OpenCV=TRUE
> +else
> +ZXING_CPP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_OpenCV=TRUE
>  endif
>  
> -ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI),y)
> -ZXING_CPP_DEPENDENCIES += opencv3
> -ZXING_CPP_CONF_OPTS += -DBUILD_OPENCV=ON
> +ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),y)

Are you sure this is correct? I believe it should be:

ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),yy)

or:

ifeq ($(BR2_PACKAGE_PYTHON3),y)

since anyway pybind is guaranteed to be available when python3 is
enabled, since you select it.

> +ZXING_CPP_DEPENDENCIES += python3 python-pybind
> +ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=ON
> +else
> +ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5BASE),y)
> +ZXING_CPP_DEPENDENCIES += qt5base
> +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5MULTIMEDIA),yy)
> +ZXING_CPP_DEPENDENCIES += qt5declarative qt5multimedia
> +endif
> +ifeq ($(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5MULTIMEDIA),yyy)
> +ZXING_CPP_CONF_OPTS += -DCMAKE_REQUIRE_FIND_PACKAGE_Qt5=TRUE

it's a bit confusing what's happening here. Why are the dependencies
different than the condition used to enable Qt support?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
