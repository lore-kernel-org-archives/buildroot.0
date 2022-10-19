Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EB3C433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 12:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66083611C2;
	Wed, 19 Oct 2022 12:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66083611C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOoTOfN53dsO; Wed, 19 Oct 2022 12:57:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B9D06119F;
	Wed, 19 Oct 2022 12:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B9D06119F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1377E1BF46D
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 12:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEEFF4195B
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 12:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEEFF4195B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MiwlDmBtVHyA for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 12:56:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 932CD41938
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 932CD41938
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 12:56:56 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4MsrN40t26z9ts1;
 Wed, 19 Oct 2022 14:56:52 +0200 (CEST)
Message-ID: <83402c3a-a873-7b1d-5f21-519c8d97ec35@othermo.de>
Date: Wed, 19 Oct 2022 14:56:50 +0200
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org, Angelo Compagnucci <angelo@amarulasolutions.com>
References: <20221019090309.1410432-1-angelo@amarulasolutions.com>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <20221019090309.1410432-1-angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1666184212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXZxZ1Yeo9L1jbAU36wUFi3weuRXWTrHeK6YNbMO2ZA=;
 b=iwcZ8xnVdhltA9B0IB/DvUzGuDz9cMw1x9X3KwDamBDP00Qo9pO40N11EAxW4bfcUSUBJD
 XKadxTk1GiMeWrQsxqzpwmaApAh90MAhq6tVlNROW0hZqRevV6gxO+zVb0tVsNOB3dDc9b
 Hf/oUhCix/icMAP8+7MV5utDDit31g3c7wKQ3nO0BOLF7b846BViSwAU9sK3o3D563M9BF
 yHyCYE2lqbcerFfIVFj2+3W6fc6qqe2scS7lEvXX8Y9dIirPF8qc35okuceezE7Oe0MNwS
 3q43BSp77n0ApVbpjKmu23AO4bNYnIN886dEzS8OhbLJt6LjnlQEezqyVNalhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=iwcZ8xnV
Subject: Re: [Buildroot] [PATCH v2] package/python-minimalmodbus: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thanks,

I've been meaning to submit this as well but didn't get around to it yet.

On 19.10.22 11:03, Angelo Compagnucci wrote:
> Easy-to-use Modbus RTU and Modbus ASCII implementation for Python.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

One somewhat general question below, but otherwise this looks all good.

Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

> ---
> V2:
> * Adding me to DEVELOPERS
> 
>   DEVELOPERS                                         |  1 +
>   package/Config.in                                  |  1 +
>   package/python-minimalmodbus/Config.in             |  7 +++++++
>   .../python-minimalmodbus/python-minimalmodbus.hash |  4 ++++
>   .../python-minimalmodbus/python-minimalmodbus.mk   | 14 ++++++++++++++
>   5 files changed, 27 insertions(+)
>   create mode 100644 package/python-minimalmodbus/Config.in
>   create mode 100644 package/python-minimalmodbus/python-minimalmodbus.hash
>   create mode 100644 package/python-minimalmodbus/python-minimalmodbus.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c0e6f8bbef..9eb5400999 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -173,6 +173,7 @@ F:	package/mono-gtksharp3/
>   F:	package/monolite/
>   F:	package/openjpeg/
>   F:	package/python-can/
> +F:	package/python-minimalmodbus/
>   F:	package/python-pillow/
>   F:	package/python-pydal/
>   F:	package/python-spidev/
> diff --git a/package/Config.in b/package/Config.in
> index e3a34d6e97..08574931f8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1112,6 +1112,7 @@ menu "External python modules"
>   	source "package/python-mbstrdecoder/Config.in"
>   	source "package/python-memory-profiler/Config.in"
>   	source "package/python-mimeparse/Config.in"
> +	source "package/python-minimalmodbus/Config.in"
>   	source "package/python-mistune/Config.in"
>   	source "package/python-modbus-tk/Config.in"
>   	source "package/python-more-itertools/Config.in"
> diff --git a/package/python-minimalmodbus/Config.in b/package/python-minimalmodbus/Config.in
> new file mode 100644
> index 0000000000..fd0f33e0d4
> --- /dev/null
> +++ b/package/python-minimalmodbus/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_MINIMALMODBUS
> +	bool "python-minimalmodbus"
> +	select BR2_PACKAGE_PYTHON_SERIAL # runtime
> +	help
> +	  Easy-to-use Modbus RTU and Modbus ASCII implementation.
> +
> +	  https://minimalmodbus.readthedocs.io/
> diff --git a/package/python-minimalmodbus/python-minimalmodbus.hash b/package/python-minimalmodbus/python-minimalmodbus.hash
> new file mode 100644
> index 0000000000..56af3d426b
> --- /dev/null
> +++ b/package/python-minimalmodbus/python-minimalmodbus.hash
> @@ -0,0 +1,4 @@
> +# sha256 locally computed
> +sha256  aa7e3989074d4efba0013c3c50263aec01afae368bd5bd234008b50aea1b7ab4  minimalmodbus-2.0.1.tar.gz
> +# Hash for license file
> +sha256  abe787d472ae2069e935c84eb13fd770518dfb08b92d5f190f3cd7ff6d1f6f32  LICENSE
> diff --git a/package/python-minimalmodbus/python-minimalmodbus.mk b/package/python-minimalmodbus/python-minimalmodbus.mk
> new file mode 100644
> index 0000000000..e4e93b4c31
> --- /dev/null
> +++ b/package/python-minimalmodbus/python-minimalmodbus.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-minimalmodbus
> +#
> +################################################################################
> +
> +PYTHON_MINIMALMODBUS_VERSION = 2.0.1
> +PYTHON_MINIMALMODBUS_SOURCE = minimalmodbus-$(PYTHON_MINIMALMODBUS_VERSION).tar.gz
> +PYTHON_MINIMALMODBUS_SITE = $(call github,pyhys,minimalmodbus,$(PYTHON_MINIMALMODBUS_VERSION))

I used ./utils/scanpypi and thus have https://files.pythonhosted.org as 
a site. Does buildroot have any preference for which upstream version of 
python packages to prefer if both work?

> +PYTHON_MINIMALMODBUS_SETUP_TYPE = setuptools
> +PYTHON_MINIMALMODBUS_LICENSE = Apache License 2.0
> +PYTHON_MINIMALMODBUS_LICENSE_FILES = LICENSE
> + > +$(eval $(python-package))

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
