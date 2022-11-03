Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB28C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 03:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB58C81E93;
	Thu,  3 Nov 2022 03:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB58C81E93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Xk_krBJYJbO; Thu,  3 Nov 2022 03:01:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B122C81E8E;
	Thu,  3 Nov 2022 03:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B122C81E8E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF6281BF966
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 03:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7BE360E6B
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 03:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7BE360E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sTegwL44A4BE for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 03:01:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93CB760E4C
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93CB760E4C
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 03:01:52 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id b21so662481plc.9
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 20:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Fa4AxTAl4Gji0WRxxB22Bl+3aU2e69aXQxYRn330+Y=;
 b=HYdogBIvVJYZp/+rBINA+UAREX1tCgvbjNrGNqZsoEgNyv8mUyTP4ZOOoQBFQUg6xr
 9SctJ/RZ1PMnrIeKbpXB1U0ZOOJXAV2HRuXYnVacvII2HBnMpShbBnpY1bhErO6X3f3n
 Xx+8af6ch55UxZKJ5AwHSRgX1suLZPoFwhQoyRedqtbrU+lCgGv7H6q3IRcN48kioDBr
 ypSa4Texas6vnLPhaQHut/QiSGOdQegcEkcQzSx7r0MwFM0L0jIxW7pLeMDxhbhTBb/4
 TuGFPtV9PCi8GsPXO5gnH03Avuxu/y/bUnZ7bVKbQJ7QBUw82I9FIAIIXsQqrZqLOGqh
 hY/g==
X-Gm-Message-State: ACrzQf3druty/3uW6i2z3aFF4J7XxtFhJQCvvbofARV5iTrVyWZcJuZ3
 xwguKeDfBg3yiXUx+QvauOqXwVBYyN9EliEZ8xY=
X-Google-Smtp-Source: AMsMyM7w0fhI+NEGWg9wFOJoXVdn0iHTrwD5MXoPB8NuCB7EFNqiyG02IUVtHwA5TySHs93luYHZJLO7OsVP7MTD4nk=
X-Received: by 2002:a17:90b:4c8a:b0:214:2ed8:6501 with SMTP id
 my10-20020a17090b4c8a00b002142ed86501mr6188861pjb.70.1667444511966; Wed, 02
 Nov 2022 20:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221103014156.791695-1-m.niestroj@grinn-global.com>
In-Reply-To: <20221103014156.791695-1-m.niestroj@grinn-global.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 2 Nov 2022 23:01:39 -0400
Message-ID: <CADvTj4pKWU2GDvmtrLqEX9MESebPS0Arpa+n3WbXD7d30wDP6w@mail.gmail.com>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6Fa4AxTAl4Gji0WRxxB22Bl+3aU2e69aXQxYRn330+Y=;
 b=pTwpvsHeVcWYwrcxant0KV7TEDyNAlkzuI7d+YIQWd9CVrNqjAUfdyBqI4SIL3QO/E
 A2RRAKmoxB0zH7NIGs94d+zskcnn+16++VWi/QaNaTL5VnEiaTo1ti6R0eygRBX8dqqD
 ZjmdGpeMVm9fqXNIiSBRxtIuFWHYGCFPE7jPN8462GTQtjSncDS/sYQU0K6Kz7wyjR0v
 4w5DxciNLACz/3BLBzx9FZM4DhJuR3wlMpBipC/8Ao2bYQUsWYpTgwVJ1SxxYhnlvxLQ
 ZNQZOTdKpVYThDBvxaMa+46J5VQ5fn+mcXxJ52gk0qrng16TrIt6oawuEX2yFG8lDMSD
 /jQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pTwpvsHe
Subject: Re: [Buildroot] [PATCH 1/2] package/python-dbus-fast: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Nov 2, 2022 at 9:48 PM Marcin Niestroj
<m.niestroj@grinn-global.com> wrote:
>
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  DEVELOPERS                                    |  2 +
>  package/Config.in                             |  1 +
>  package/python-dbus-fast/Config.in            |  9 ++++
>  .../python-dbus-fast/python-dbus-fast.hash    |  5 +++
>  package/python-dbus-fast/python-dbus-fast.mk  | 14 ++++++
>  .../tests/package/sample_python_dbus_fast.py  | 44 +++++++++++++++++++
>  .../tests/package/test_python_dbus_fast.py    | 40 +++++++++++++++++
>  7 files changed, 115 insertions(+)
>  create mode 100644 package/python-dbus-fast/Config.in
>  create mode 100644 package/python-dbus-fast/python-dbus-fast.hash
>  create mode 100644 package/python-dbus-fast/python-dbus-fast.mk
>  create mode 100644 support/testing/tests/package/sample_python_dbus_fast.py
>  create mode 100644 support/testing/tests/package/test_python_dbus_fast.py
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7d27936992..6d670ae21a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1881,6 +1881,7 @@ F:        package/murata-cyw-fw/
>  F:     package/netdata/
>  F:     package/python-ansicolors/
>  F:     package/python-bleak/
> +F:     package/python-dbus-fast/
>  F:     package/python-dbus-next/
>  F:     package/python-iniconfig/
>  F:     package/python-intelhex/
> @@ -1892,6 +1893,7 @@ F:        package/python-typing-extensions/
>  F:     package/python-xmodem/
>  F:     package/rs485conf/
>  F:     package/turbolua/
> +F:     support/testing/tests/package/sample_python_dbus_fast.py
>  F:     support/testing/tests/package/sample_python_dbus_next.py
>  F:     support/testing/tests/package/sample_python_pytest.py
>  F:     support/testing/tests/package/sample_python_pytest_asyncio.py
> diff --git a/package/Config.in b/package/Config.in
> index 238d7813f0..db9e94f357 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1015,6 +1015,7 @@ menu "External python modules"
>         source "package/python-daphne/Config.in"
>         source "package/python-dataproperty/Config.in"
>         source "package/python-dateutil/Config.in"
> +       source "package/python-dbus-fast/Config.in"
>         source "package/python-dbus-next/Config.in"
>         source "package/python-decorator/Config.in"
>         source "package/python-defusedxml/Config.in"
> diff --git a/package/python-dbus-fast/Config.in b/package/python-dbus-fast/Config.in
> new file mode 100644
> index 0000000000..2665bd1964
> --- /dev/null
> +++ b/package/python-dbus-fast/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_DBUS_FAST
> +       bool "python-dbus-fast"
> +       select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
> +       select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
> +       help
> +         A faster version of dbus-next, a DBus library for Python with
> +         asyncio support.
> +
> +         https://github.com/bluetooth-devices/dbus-fast
> diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
> new file mode 100644
> index 0000000000..f0dceeb43d
> --- /dev/null
> +++ b/package/python-dbus-fast/python-dbus-fast.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/dbus-fast/json
> +md5  eebf2c558dd1af0f8f32b361e91f2fa3  dbus_fast-1.61.1.tar.gz
> +sha256  bda4a7d559047b74f409eda278f68f610a418e86ad3efa0368fa2ed240daa6b6  dbus_fast-1.61.1.tar.gz
> +# Locally computed sha256 checksums
> +sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
> diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
> new file mode 100644
> index 0000000000..74a02eb5b9
> --- /dev/null
> +++ b/package/python-dbus-fast/python-dbus-fast.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-dbus-fast
> +#
> +################################################################################
> +
> +PYTHON_DBUS_FAST_VERSION = 1.61.1
> +PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
> +PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/dd/f4/a280d46b119d59f6a3d84abf474452ae76651558b0963ab8c48ae13b5a44
> +PYTHON_DBUS_FAST_SETUP_TYPE = setuptools
> +PYTHON_DBUS_FAST_LICENSE = MIT
> +PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE

Maybe just add this(to ensure we build with optimizations) and spin a
v2 to replace mine?:
PYTHON_DBUS_FAST_ENV = REQUIRE_CYTHON=1
PYTHON_DBUS_FAST_DEPENDENCIES = host-python-cython

> +
> +$(eval $(python-package))
> diff --git a/support/testing/tests/package/sample_python_dbus_fast.py b/support/testing/tests/package/sample_python_dbus_fast.py
> new file mode 100644
> index 0000000000..c2855464a1
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_dbus_fast.py
> @@ -0,0 +1,44 @@
> +import asyncio
> +from dbus_fast.aio import MessageBus
> +from dbus_fast.service import ServiceInterface, method
> +import dbus_fast.introspection as intr
> +from dbus_fast import BusType
> +
> +
> +class SampleInterface(ServiceInterface):
> +    def __init__(self):
> +        super().__init__('test.interface')
> +
> +    @method()
> +    def Ping(self):
> +        pass
> +
> +    @method()
> +    def ConcatStrings(self, what1: 's', what2: 's') -> 's':  # noqa: F821
> +        return what1 + what2
> +
> +
> +async def main():
> +    bus_name = 'dbus.fast.sample'
> +
> +    bus = await MessageBus(bus_type=BusType.SYSTEM).connect()
> +    bus2 = await MessageBus(bus_type=BusType.SYSTEM).connect()
> +
> +    await bus.request_name(bus_name)
> +
> +    service_interface = SampleInterface()
> +    bus.export('/test/path', service_interface)
> +
> +    introspection = await bus2.introspect(bus_name, '/test/path')
> +    assert type(introspection) is intr.Node
> +    obj = bus2.get_proxy_object(bus_name, '/test/path', introspection)
> +    interface = obj.get_interface(service_interface.name)
> +
> +    result = await interface.call_ping()
> +    assert result is None
> +
> +    result = await interface.call_concat_strings('hello ', 'world')
> +    assert result == 'hello world'
> +
> +
> +asyncio.run(main())
> diff --git a/support/testing/tests/package/test_python_dbus_fast.py b/support/testing/tests/package/test_python_dbus_fast.py
> new file mode 100644
> index 0000000000..5f67cfd8cc
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_dbus_fast.py
> @@ -0,0 +1,40 @@
> +import textwrap
> +
> +
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3DBusFast(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_DBUS=y
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_DBUS_FAST=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_dbus_fast.py"]
> +
> +    def run_sample_scripts(self):
> +        config = \
> +            """
> +            <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
> +             "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
> +            <busconfig>
> +              <policy user="root">
> +                <allow own="dbus.fast.sample"/>
> +                <allow send_destination="dbus.fast.sample"/>
> +              </policy>
> +            </busconfig>
> +            """
> +        config = textwrap.dedent(config)
> +        config_dir = "/etc/dbus-1/system.d"
> +        config_fn = "dbus.fast.sample.conf"
> +
> +        # Setup and reload D-Bus configuration
> +        self.emulator.run("mkdir -p " + config_dir)
> +        self.emulator.run("cat > " + config_dir + "/" + config_fn +
> +                          " <<EOF" + config + "EOF")
> +        self.emulator.run("killall -SIGHUP dbus-daemon")
> +
> +        # Run test scripts
> +        super().run_sample_scripts()
> --
> 2.38.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
