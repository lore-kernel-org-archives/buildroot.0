Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821B8C46467
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 21:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 166C160EDB;
	Mon,  2 Jan 2023 21:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 166C160EDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yb3el-d9PeNV; Mon,  2 Jan 2023 21:38:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C2C460C1F;
	Mon,  2 Jan 2023 21:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C2C460C1F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12A331BF2C3
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 21:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E222860C1F
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 21:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E222860C1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lp5xW429zqyd for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 21:37:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54E6160A97
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54E6160A97
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 21:37:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:3857:b2b8:1cc5:be09])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 682655FF7A;
 Mon,  2 Jan 2023 22:37:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Jan 2023 22:37:45 +0100
Date: Mon, 2 Jan 2023 22:37:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20230102213745.GY2498764@scaer>
References: <20221103102102.924370-1-m.niestroj@grinn-global.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221103102102.924370-1-m.niestroj@grinn-global.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672695472;
 bh=a6OdOHpliFTTBiYdwsNJEdaI3P2+8wKgB+v3RuNLWAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ot2nsvdQCh5aBZUpFvyRmZXJLM5wEz3Ejr91lo1iFP0WWWH2ooa3JMfAd/FYP/pKV
 HhiLWMPWNwGZDOwNXiJWVq+8BoWKSeD9sYthwq5LrY5F6XaCzhErBHgDBuTj0qT/TR
 F48mONS1fEIA5pu2BOkBKUhq9cHgk047vPppgU62fkdOZxaVY4t2SPF4yk8jy6B7GC
 DiYQxMqebXocMAgZZH/xR6rC6cLjtvD0p/MNWUlGUI4PPSDqTjdbHQWrKGqR7vXUVH
 pU/C6dghP6lew6DxYSIhvR7VpmfjdJFym3hKktAEycSsHNqIM0j29w7DwPSTHmxMPL
 vIBsf1x0SjsHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ot2nsvdQ
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-dbus-fast: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Narcin, All,

On 2022-11-03 11:21 +0100, Marcin Niestroj spake thusly:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
[--SNIP--]
> diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
> new file mode 100644
> index 0000000000..de7049ba22
> --- /dev/null
> +++ b/package/python-dbus-fast/python-dbus-fast.mk
> @@ -0,0 +1,16 @@
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
> +PYTHON_DBUS_FAST_ENV = REQUIRE_CYTHON=1
> +PYTHON_DBUS_FAST_DEPENDENCIES = host-python-cython

Since there is a Kconfig symbol for host-python-cython, I've added the
appropriate select in Config.in.

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

I've introduced obj_path = '/test/path', and...

> +
> +    bus = await MessageBus(bus_type=BusType.SYSTEM).connect()
> +    bus2 = await MessageBus(bus_type=BusType.SYSTEM).connect()
> +
> +    await bus.request_name(bus_name)
> +
> +    service_interface = SampleInterface()
> +    bus.export('/test/path', service_interface)

... used it here, and...

> +    introspection = await bus2.introspect(bus_name, '/test/path')

... here, and....

> +    assert type(introspection) is intr.Node
> +    obj = bus2.get_proxy_object(bus_name, '/test/path', introspection)

... here.

Applied to master, thanks.

Sorry for missing this patch when I got to apply python-bleak's bump a
few weeks ago; thanks for reminding me.

Regards,
Yann E. MORIN.

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

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
