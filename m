Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42786C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 21:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF94F4099E;
	Thu, 30 Dec 2021 21:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vT5AC4G02KfE; Thu, 30 Dec 2021 21:51:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FFB840988;
	Thu, 30 Dec 2021 21:51:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E49FD1BF3C4
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 21:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D30D86080A
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 21:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4MeJTvxancBt for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 21:51:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A831060590
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 21:51:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id AF07120005;
 Thu, 30 Dec 2021 21:51:17 +0000 (UTC)
Date: Thu, 30 Dec 2021 22:51:16 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20211230225116.4c94c814@windsurf>
In-Reply-To: <20211230204103.282138-1-aduskett@gmail.com>
References: <20211230204103.282138-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/3] package/python-setuptools: bump to
 version 59.8.0 and split python2 version
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Thu, 30 Dec 2021 12:41:01 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> -# Please keep in sync with
> -# package/python3-setuptools/python3-setuptools.mk

I kept this comment, inside the ifeq ($(BR2_PACKAGE_PYTHON3),y) condition.

> +# For the target variant, we adapt the version depending on whether
> +# Python 3.x or 2.x is selected for the target.
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +PYTHON_SETUPTOOLS_VERSION = 59.8.0
> +PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
> +PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ef/75/2bc7bef4d668f9caa9c6ed3f3187989922765403198243040d08d2a52725
> +else # Python
>  PYTHON_SETUPTOOLS_VERSION = 44.0.0
>  PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
>  PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
> +endif
> +
> +# The host variant is only for Python 2.x, so we need to use 44.0.0.
> +HOST_PYTHON_SETUPTOOLS_VERSION = 44.0.0
> +HOST_PYTHON_SETUPTOOLS_SOURCE = setuptools-$(HOST_PYTHON_SETUPTOOLS_VERSION).zip
> +HOST_PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
> +HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON = python2
> +
>  PYTHON_SETUPTOOLS_LICENSE = MIT
>  PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
>  PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
>  PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
>  PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
> -HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON = python2

This was still needed.


>  # Please keep in sync with
>  # package/python-setuptools/python-setuptools.mk
> -PYTHON3_SETUPTOOLS_VERSION = 44.0.0
> -PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).zip
> -PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
> +PYTHON3_SETUPTOOLS_VERSION = 59.8.0
> +PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
> +PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ef/75/2bc7bef4d668f9caa9c6ed3f3187989922765403198243040d08d2a52725
>  PYTHON3_SETUPTOOLS_LICENSE = MIT
>  PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
>  PYTHON3_SETUPTOOLS_CPE_ID_VENDOR = python
>  PYTHON3_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
>  PYTHON3_SETUPTOOLS_SETUP_TYPE = setuptools
> -HOST_PYTHON3_SETUPTOOLS_DL_SUBDIR = python-setuptools
>  HOST_PYTHON3_SETUPTOOLS_NEEDS_HOST_PYTHON = python3

The re-ordering of options here caused some useless noise in the patch,
so I put them back in the original order.

With that, all my test cases passed, so I pushed to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
