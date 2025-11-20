Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31499CF884F
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 12:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1D51843CE;
	Thu, 20 Nov 2025 12:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yizMK4YguG6; Thu, 20 Nov 2025 12:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6FB2843D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6FB2843D3;
	Thu, 20 Nov 2025 12:22:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F37192A9
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5C8C41183
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k75bH8iF6l6K for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 12:22:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC49A41189
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC49A41189
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC49A41189
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:22:47 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id D13002C8315C;
 Thu, 20 Nov 2025 13:22:45 +0100 (CET)
Message-ID: <6b1e1df6-4b02-4044-accd-003ef2547c8e@bubu1.eu>
Date: Thu, 20 Nov 2025 13:22:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
References: <20251120121739.1365133-1-buildroot@bubu1.eu>
Content-Language: en-US
In-Reply-To: <20251120121739.1365133-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763641366; bh=leSHRsrWcjnSwJDsUDPtmTtOdLCDLffrAzVTRLS6lus=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To;
 b=IRRfBKP6mCE1hU1oBF+oY8yDj2IckVuLQhJdSQY71B2nOwK+4ilQ2zg3TAVCXP9Xs
 d4WA12p9xLcPkl8cxGB9A9uKFOEGMn1iZxAm9dLGB8o3tnA/DK7kKFfuG5ZHxzrKhb
 QqupX0UTjS8/FeYbA1ky4pJDd9sOShMYCPQAS0ToXsSyfja9Z1YXc0LsVy8z2caGvX
 ElZ+lWxsHnL4+aoq/WQqve7b/8d2kRB2c0YJDgEJMICpAB1ROv1lZvV8ZfLCFEhhah
 SvM6Q9OAX5P1CrPd6IR431QwLHHj+bmpIly2rQd88i8keaC23M5ya4J/JRmsxIf5PD
 nepnWOyQ5WJsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=IRRfBKP6
Subject: Re: [Buildroot] [PATCH 1/3] package/python-sdbus-systemd: new
 package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Forgot the sign-off. So adding that here for the whole series:

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

On 11/20/25 13:17, Marcus Hoffmann wrote:
> ---
>   DEVELOPERS                                         |  3 +++
>   package/Config.in                                  |  1 +
>   package/python-sdbus-systemd/Config.in             | 11 +++++++++++
>   .../python-sdbus-systemd/python-sdbus-systemd.hash |  5 +++++
>   .../python-sdbus-systemd/python-sdbus-systemd.mk   | 14 ++++++++++++++
>   .../tests/package/sample_python_sdbus_systemd.py   | 11 +++++++++++
>   .../tests/package/test_python_sdbus_systemd.py     | 14 ++++++++++++++
>   7 files changed, 59 insertions(+)
>   create mode 100644 package/python-sdbus-systemd/Config.in
>   create mode 100644 package/python-sdbus-systemd/python-sdbus-systemd.hash
>   create mode 100644 package/python-sdbus-systemd/python-sdbus-systemd.mk
>   create mode 100644 support/testing/tests/package/sample_python_sdbus_systemd.py
>   create mode 100644 support/testing/tests/package/test_python_sdbus_systemd.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 0272b4ba33..b9e7e12a86 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2273,6 +2273,7 @@ F:	package/python-ruamel-yaml-clib/
>   F:	package/python-typing-inspection/
>   F:	package/python-tzlocal/
>   F:	package/python-sdbus-modemmanager/
> +F:	package/python-sdbus-systemd/
>   F:	package/python-waitress/
>   F:	package/python-whitenoise/
>   F:	support/testing/tests/package/test_python_apscheduler.py
> @@ -2283,6 +2284,7 @@ F:	support/testing/tests/package/test_python_pydantic.py
>   F:	support/testing/tests/package/test_python_pydantic_settings.py
>   F:	support/testing/tests/package/test_python_ruamel_yaml.py
>   F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
> +F:	support/testing/tests/package/test_python_sdbus_systemd.py
>   F:	support/testing/tests/package/test_python_tzlocal.py
>   F:	support/testing/tests/package/test_python_waitress.py
>   F:	support/testing/tests/package/test_python_whitenoise.py
> @@ -2294,6 +2296,7 @@ F:	support/testing/tests/package/sample_python_pydantic.py
>   F:	support/testing/tests/package/sample_python_pydantic_settings.py
>   F:	support/testing/tests/package/sample_python_ruamel_yaml.py
>   F:	support/testing/tests/package/sample_python_sdbus_modemmanager.py
> +F:	support/testing/tests/package/sample_python_sdbus_systemd.py
>   
>   N:	Marek Belisko <marek.belisko@open-nandra.com>
>   F:	package/libatasmart/
> diff --git a/package/Config.in b/package/Config.in
> index 12f327cb27..1cd4a64290 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1385,6 +1385,7 @@ menu "External python modules"
>   	source "package/python-sdbus/Config.in"
>   	source "package/python-sdbus-modemmanager/Config.in"
>   	source "package/python-sdbus-networkmanager/Config.in"
> +	source "package/python-sdbus-systemd/Config.in"
>   	source "package/python-sdnotify/Config.in"
>   	source "package/python-secretstorage/Config.in"
>   	source "package/python-see/Config.in"
> diff --git a/package/python-sdbus-systemd/Config.in b/package/python-sdbus-systemd/Config.in
> new file mode 100644
> index 0000000000..0244f4dc0f
> --- /dev/null
> +++ b/package/python-sdbus-systemd/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_SDBUS_SYSTEMD
> +	bool "python-sdbus-systemd"
> +	depends on BR2_PACKAGE_SYSTEMD
> +	select BR2_PACKAGE_PYTHON_SDBUS # runtime
> +	help
> +	  Systemd bindings for python-sdbus.
> +
> +	  https://github.com/bernhardkaindl/python-sdbus-systemd
> +
> +comment "python-sdbus-systemd needs systemd"
> +	depends on !BR2_PACKAGE_SYSTEMD
> diff --git a/package/python-sdbus-systemd/python-sdbus-systemd.hash b/package/python-sdbus-systemd/python-sdbus-systemd.hash
> new file mode 100644
> index 0000000000..31eb2a0c64
> --- /dev/null
> +++ b/package/python-sdbus-systemd/python-sdbus-systemd.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/sdbus-modemmanager/json
> +md5  726a016b518e3ac47fde0e51b751b6b0  sdbus-systemd-1.0.0.tar.gz
> +sha256  80aef69a69685ac7807ba1cc7db48e10e59104260beda1deef6cd5f81e1ad297  sdbus-systemd-1.0.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
> diff --git a/package/python-sdbus-systemd/python-sdbus-systemd.mk b/package/python-sdbus-systemd/python-sdbus-systemd.mk
> new file mode 100644
> index 0000000000..0599d2794a
> --- /dev/null
> +++ b/package/python-sdbus-systemd/python-sdbus-systemd.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-sdbus-systemd
> +#
> +################################################################################
> +
> +PYTHON_SDBUS_SYSTEMD_VERSION = 1.0.0
> +PYTHON_SDBUS_SYSTEMD_SOURCE = sdbus-systemd-$(PYTHON_SDBUS_SYSTEMD_VERSION).tar.gz
> +PYTHON_SDBUS_SYSTEMD_SITE = https://files.pythonhosted.org/packages/e1/84/911de0ea63a0dab814dc94f73e7b916bfd4675e1e983b58a725a26a65db4
> +PYTHON_SDBUS_SYSTEMD_SETUP_TYPE = setuptools
> +PYTHON_SDBUS_SYSTEMD_LICENSE = LGPL-2.1+
> +PYTHON_SDBUS_SYSTEMD_LICENSE_FILES = COPYING.LESSER
> +
> +$(eval $(python-package))
> diff --git a/support/testing/tests/package/sample_python_sdbus_systemd.py b/support/testing/tests/package/sample_python_sdbus_systemd.py
> new file mode 100644
> index 0000000000..6cb1925ac3
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_sdbus_systemd.py
> @@ -0,0 +1,11 @@
> +#!/usr/bin/env python3
> +
> +import sdbus
> +
> +from sdbus_block.systemd.objects import Systemd, SystemdUnit
> +
> +sdbus.set_default_bus(sdbus.sd_bus_open_system())
> +unit_object_path = Systemd().load_unit("systemd-journald.service")
> +unit = SystemdUnit(unit_object_path)
> +
> +assert unit.active_enter_timestamp != None
> diff --git a/support/testing/tests/package/test_python_sdbus_systemd.py b/support/testing/tests/package/test_python_sdbus_systemd.py
> new file mode 100644
> index 0000000000..9e97df6465
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_sdbus_systemd.py
> @@ -0,0 +1,14 @@
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3SdbusSystemd(TestPythonPackageBase):
> +    __test__ = True
> +    config = (
> +        TestPythonPackageBase.config
> +        + """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_INIT_SYSTEMD=y
> +        BR2_PACKAGE_PYTHON_SDBUS_SYSTEMD=y
> +        """
> +    )
> +    sample_scripts = ["tests/package/sample_python_sdbus_systemd.py"]

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
