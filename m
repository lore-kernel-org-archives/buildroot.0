Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA66C54E76
	for <buildroot@archiver.kernel.org>; Mon, 20 Nov 2023 10:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 128518175D;
	Mon, 20 Nov 2023 10:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 128518175D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d0KxlrUdrz6n; Mon, 20 Nov 2023 10:51:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5553F81755;
	Mon, 20 Nov 2023 10:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5553F81755
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B1D51BF35E
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 10:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53EAC60B20
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 10:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53EAC60B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xm0Zz7V6Uxtz for <buildroot@lists.busybox.net>;
 Mon, 20 Nov 2023 10:51:52 +0000 (UTC)
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EEF960B06
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 10:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EEF960B06
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id D299C44064C;
 Mon, 20 Nov 2023 12:50:38 +0200 (IST)
References: <20231120103304.89728-1-bstruempfel@ultratronik.de>
 <20231120103304.89728-2-bstruempfel@ultratronik.de>
User-agent: mu4e 1.10.7; emacs 29.1
To: Boerge Struempfel <boerge.struempfel@gmail.com>
Date: Mon, 20 Nov 2023 12:46:33 +0200
In-reply-to: <20231120103304.89728-2-bstruempfel@ultratronik.de>
Message-ID: <87a5r8zoho.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1700477438;
 bh=8/eCRlPVu1pkUMTUFu4AohFnKKBumepyPbOG/78BU2k=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=gZFVL1S7uJOzxxzNVFXtk1Y2vqSQJQGQ8SGHp6Y5LsiI/QEwrkN37naWdoef3FPwH
 6TNIfbR9wZ91opUCKZL8BjTTghr4d8B/SgpPuoJ7frHCWsMIg9ja8eXwaIKFVgi3w5
 GnHHOMhMyJPSGH3v9oOthrYXcWIQXkFILhfSUoPI/IHrvAK7nQ8nUrTr7oYZdBFtDL
 TVlK0zVrsD7znuaIAxC0uY1JPKPaYmcEzno4FowMkMFjo3JBPyjpgR6ik/4nhEQCud
 HeSGPuPUnUoeH5co8WwCWHJJUHjK1TmvmG7L2O9WttfNo2VjI8SVcCAdV5UqPRCF2V
 vfzoRGvgdQdxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=gZFVL1S7
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libgpiod2: new package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org, vfazio@xes-inc.com, bonet@grenoble.cnrs.fr,
 bstruempfel@ultratronik.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Boerge,

On Mon, Nov 20 2023, Boerge Struempfel wrote:
> diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
> new file mode 100644
> index 0000000000..e9e68339a8
> --- /dev/null
> +++ b/package/libgpiod2/libgpiod2.mk
> @@ -0,0 +1,44 @@
> +################################################################################
> +#
> +# libgpiod2
> +#
> +################################################################################
> +
> +# Be careful when bumping versions.
> +# Dependency on kernel header versions may change.
> +LIBGPIOD2_VERSION = 2.1
> +LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
> +LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
> +LIBGPIOD2_LICENSE = LGPL-2.1+
> +LIBGPIOD2_LICENSE_FILES = COPYING
> +LIBGPIOD2_INSTALL_STAGING = YES
> +LIBGPIOD2_DEPENDENCIES = host-pkgconf host-autoconf-archive
> +# We're patching configure.ac

Are we? I don't see patches here. It looks like the tar file includes a
generated configure script. Is autoreconf still necessary?

baruch

> +LIBGPIOD2_AUTORECONF = YES
> +LIBGPIOD2_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
> +LIBGPIOD2_CONF_OPTS = --disable-tests --disable-examples
> +
> +ifeq ($(BR2_PACKAGE_LIBGPIOD2_TOOLS),y)
> +LIBGPIOD2_CONF_OPTS += --enable-tools
> +else
> +LIBGPIOD2_CONF_OPTS += --disable-tools
> +endif
> +
> +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> +LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
> +else
> +LIBGPIOD2_CONF_OPTS += --disable-bindings-cxx
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +LIBGPIOD2_CONF_OPTS += --enable-bindings-python
> +LIBGPIOD2_DEPENDENCIES += python3
> +LIBGPIOD2_CONF_ENV += \
> +	PYTHON=$(HOST_DIR)/bin/python3 \
> +	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
> +	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
> +else
> +LIBGPIOD2_CONF_OPTS += --disable-bindings-python
> +endif
> +
> +$(eval $(autotools-package))


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
