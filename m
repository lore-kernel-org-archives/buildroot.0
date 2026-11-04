Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B66A606D81D
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BUmvP92g;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=KSUQqjAh
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B970408DF;
	Wed,  4 Nov 2026 21:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUvrRe0Xp6TB; Wed,  4 Nov 2026 21:07:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 655B1408ED
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826458;
	b=X4LpiczKq1ndmH/kyfoY9naOdSMXRcBKgx2y5G5sO3JmNBLf8nOqICbGTr1FKCnczk7X
	 274k8xvN7Z96mnAftJpur8ELkK50Vk6ASj07JTZ/oXwpliDmkCRWQXC9LR1Cr4MpoiEr3
	 0ncUmwgcfKQy0q4zoSZFSdYmkpLVjCfjFVDAkB0uBkxlo3p6uyGJvtqaDhnK5ZAmhg9Av
	 BY3O/DN9eoG1Sn4+fHujGqH2GevQPt4vzxjlRfNXq+jJZKgOLtS1Y5Sk1GJDmIkHd4PqP
	 6XqHjv92Pd/yxBb9cHJdLenlO20yiFLjdqd2Jt7hJeavYP9ZgxTK2KWkjuPMSGgLEsg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826458;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=P5VG6t5bdaQMfj2Ic7dYd35kJV9kVASvx8nTu9vTd3U=;
	b=q3uSRNJ7KkC6lcRGoqN0w4uRDgyBJO5nkE1jo6v8VJ5urJLYpP1RxlwssJBosKwXYj4B
	 vayzoSxQXUunoTdh9IFfXmHyEmFfLZSzCO3ZfB7XYgsTK23XIZBUMAR2Ps8ejgDtdZRLM
	 jQzojkcsUC836kJoxzUoHGA4EVZgHzAqvCyV7uSaArlROmD7VdHPgtM7jdqO8xVaxrHNg
	 0/t4zhdHZogZ9kke/T+Qix/omaLztx5S/feXnWfksKGpu9AMIStA6s4AeDkUDKedHUTWh
	 LHbehbalJmp6LvRBA35hNTdoWvSFsog4t19lADeuXTeTF1667Ri9uXdHycBRtiLkQQg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826458;
	bh=P5VG6t5bdaQMfj2Ic7dYd35kJV9kVASvx8nTu9vTd3U=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BUmvP92ghH2wKw6lY0riMulwhH2+UpmUGgfQ9k/oN75vGt47CCY4sqy35oNZ7cA8/
	 owpaAFTHvOe/jbPeS7wH/I6UxmW4zp4SqRzi6HJj529DL7CtWu3/dAZnvcx3R4Tt9O
	 hZSRXyNa/7la+cs8TGxBaSDjmf3Tj6SR8ySPqlSrFtd9KYhmIXmCWeW/jq0LKMaVca
	 nvgFfS5v+kuhvuVZ1KeB3Z1B6q9wxkHOBFAKbrNUlQWuB2dwMi0zVzazCdLz1F8b3J
	 33QqOKrHWYDXp3G12+J3PHRI0d6TuWLOkF8JY2boEsRl8DYSgRBVFklUdIZAWnghz7
	 zBTALsRDErOrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 655B1408ED;
	Wed,  4 Nov 2026 21:07:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 514D431F
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3721E80C8B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNXXVrR6pHXa for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:07:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E5AA680BCA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KSUQqjAh
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5AA680BCA
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793826450;
 bh=+5iMUEkGtQsQY1S10JVHbpyNHfzJlUa3KeKPGw4Io6M=;
 h=From:To:Cc:Subject:Date:From;
 b=KSUQqjAhWrebXew4t68dnQ+oKkQNs2ibdvxwDvmAbezYQ2uQXHAzKHrsKQvVPgzNk
 wHiZ9Ib1ma6AQbM+7x9r6ClVFuu49s4sN4RC6JKmgf6lxkdlUy9J68ZmiDPNaFLDow
 tL968X5ogv+ODJV5oArRzQhZ0CJLVMuvRQiIuWvlA8/lAbYzfv9+8wXUQ7vgraXJOw
 jU7iytAB+hL/ro8tepjKlOQ9WFwfsJjj6CFCv5wyNDUL8C0/YIQHkLeUEAq1AA3/6/
 0HkemmPX6aWwa69ln8HW48Z1AQZWBSokBPkkznsXU7gjIl9hJ7F+2YqF3+WksrJPa/
 TcaGtDKz477xw==
X-KAS-Sym: v3:f51bdf72230551df:pFrN3BqyUOOiO9x4ok3iF7wuD1T71UTb+w4zj1WhuF1fk
 6TLn03Z/5rTekCV8UC3g0K30w1uTu8hT/qDn0jJ4I4sOgWt/Y9dyvi4u2lUH8ODgmocRBITKpGj
 8ev+rbvU1T8oYcOfsUdZQntxP4NULrYpMnY99Iw8Wbovr/keVBAPD21aD1+qc8F8n8DYXd6pU1R
 z12leW1ehEYInv1VhTgbO4aFEB8d588n9PXhITOvWKoYmlE5qN4b87OLIeMUr2FstNlejsN5W6L
 WJKJT9uvQos+WAo3kdj42Ic8gaLV3lfhhoM2ztpVZql2aCW2RYi8QLrFzy2Uh7Zy7ZpRDPfQ==:
 qAS2bU3cf7UUzbgJAjWjvvcB+YDU8fQBCgx0l/SPugug8caFbMwPhDdcygJxWuxPjbTjRXdblTg
 2GiLTDRBjQ9RVlLP/soTs7xo7BMPupTQxJmBB1jYMHmRphg7e5ee1C6ayQhm3Mo3Bzx+QbRIGzE
 TzkroUcH/K2BA/x97OSHJz3zybc11RksPqLkf/TtmM0GoUzOUbpNnkrg3UBvFdCJPxTprCA9Vz+
 e596jwVAHERgmRUED4JGMiz9eBn72yzm3nA/uz9+x5zW36f2RSeZXhKc5DQSC/rLXrUdHvXm0L4
 7vUnF1A1Y+uk5QJc6/Kyt/GPs1JCly9LHtPCnu7nkpLKgvnjHc1Pn5//PVCEVLAJrbHFcQdQX1D
 1ggPnmg0plSFXGJvBxXfduLHcrhbH952qyZYJxAleuh1blv7TqAcz8kWFYnYoxh7cFuQ7KeWzmc
 JVZMMcO8MN9UIolMuvW3tm2BcTcoaJmXlyO0vXwPKmaWxLRA5GeFW55pSuuBrOgjVKoPbkSNZGx
 MahtSRAkyq3MFq7/GilQ1J16dM7yOk6tfZRvmUqh1BZHSzPYX+Hg4iXlqiAKF03TQe6yMT4szSX
 1Q2ghA==
Received: from fli4l.lan.fli4l (p54a1b33d.dip0.t-ipconnect.de [84.161.179.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A08CEA4C2EE3;
 Wed,  4 Nov 2026 22:07:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38802)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xOiCg-000000002bt-1X1R;
 Wed, 04 Nov 2026 21:07:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed,  4 Nov 2026 22:07:28 +0100
Message-ID: <20261104210728.3839438-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/python-dbus-next: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The package is incompatible with the upcoming bump of python3 to 3.15
and it is unmaintained upstream:
https://gitlab.com/buildroot.org/buildroot/-/work_items/193#note_4029177660
https://github.com/altdesktop/python-dbus-next/issues/168
https://github.com/alebastr/sway-systemd/issues/36

Gitlab pipeline failed:
https://gitlab.com/bkuhls/buildroot/-/commits/39c8bb9cb08820626e367a21fb146efa6c6b1750

ImportError: cannot import name 'no_type_check_decorator' from 'typing'
 (/usr/lib/python3.15/typing.pyc)

We select python-dbus-fast as replacement.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 Config.in.legacy                              |  9 ++++
 DEVELOPERS                                    |  3 --
 package/Config.in                             |  1 -
 package/python-dbus-next/Config.in            |  8 ----
 .../python-dbus-next/python-dbus-next.hash    |  5 ---
 package/python-dbus-next/python-dbus-next.mk  | 14 ------
 .../tests/package/sample_python_dbus_next.py  | 44 -------------------
 .../tests/package/test_python_dbus_next.py    | 40 -----------------
 8 files changed, 9 insertions(+), 115 deletions(-)
 delete mode 100644 package/python-dbus-next/Config.in
 delete mode 100644 package/python-dbus-next/python-dbus-next.hash
 delete mode 100644 package/python-dbus-next/python-dbus-next.mk
 delete mode 100644 support/testing/tests/package/sample_python_dbus_next.py
 delete mode 100644 support/testing/tests/package/test_python_dbus_next.py

diff --git a/Config.in.legacy b/Config.in.legacy
index a238369785..e093f24d7b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_PYTHON_DBUS_NEXT
+	bool "python-dbus-next has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_PYTHON_DBUS_FAST
+	help
+	  The python-dbus-next package has been removed, as it is no
+	  longer maintained upstream. python-dbus-fast, which provides a
+	  drop-in replacement, has been selected instead.
+
 config BR2_PACKAGE_HTPDATE
 	bool "htpdate has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 8f7552407e..d7aad0faac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2313,7 +2313,6 @@ F:	package/netdata/
 F:	package/python-ansicolors/
 F:	package/python-bleak/
 F:	package/python-dbus-fast/
-F:	package/python-dbus-next/
 F:	package/python-iniconfig/
 F:	package/python-intelhex/
 F:	package/python-packaging/
@@ -2325,13 +2324,11 @@ F:	package/python-xmodem/
 F:	package/rs485conf/
 F:	package/turbolua/
 F:	support/testing/tests/package/sample_python_dbus_fast.py
-F:	support/testing/tests/package/sample_python_dbus_next.py
 F:	support/testing/tests/package/sample_python_pytest.py
 F:	support/testing/tests/package/sample_python_pytest_asyncio.py
 F:	support/testing/tests/package/test_easydbus.py
 F:	support/testing/tests/package/test_easydbus/
 F:	support/testing/tests/package/test_netdata.py
-F:	support/testing/tests/package/test_python_dbus_next.py
 F:	support/testing/tests/package/test_python_pytest.py
 F:	support/testing/tests/package/test_python_pytest_asyncio.py
 
diff --git a/package/Config.in b/package/Config.in
index b79f4dcca1..2f0bc17b12 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1095,7 +1095,6 @@ menu "External python modules"
 	source "package/python-dataproperty/Config.in"
 	source "package/python-dateutil/Config.in"
 	source "package/python-dbus-fast/Config.in"
-	source "package/python-dbus-next/Config.in"
 	source "package/python-decorator/Config.in"
 	source "package/python-decouple/Config.in"
 	source "package/python-defusedxml/Config.in"
diff --git a/package/python-dbus-next/Config.in b/package/python-dbus-next/Config.in
deleted file mode 100644
index 6b00e70765..0000000000
--- a/package/python-dbus-next/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_DBUS_NEXT
-	bool "python-dbus-next"
-	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
-	help
-	  A zero-dependency DBus library for Python with asyncio
-	  support.
-
-	  https://github.com/altdesktop/python-dbus-next
diff --git a/package/python-dbus-next/python-dbus-next.hash b/package/python-dbus-next/python-dbus-next.hash
deleted file mode 100644
index 57bfaaf547..0000000000
--- a/package/python-dbus-next/python-dbus-next.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/dbus-next/json
-md5  0e31605bd90f3460aebcd0bb7fe0dc20  dbus_next-0.2.3.tar.gz
-sha256  f4eae26909332ada528c0a3549dda8d4f088f9b365153952a408e28023a626a5  dbus_next-0.2.3.tar.gz
-# Locally computed sha256 checksums
-sha256  c454ab6b8e0653a8eab828a8cbaaa368a1bbfba982178bb18b6177e311eae4cc  LICENSE
diff --git a/package/python-dbus-next/python-dbus-next.mk b/package/python-dbus-next/python-dbus-next.mk
deleted file mode 100644
index f35a32cb3a..0000000000
--- a/package/python-dbus-next/python-dbus-next.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-dbus-next
-#
-################################################################################
-
-PYTHON_DBUS_NEXT_VERSION = 0.2.3
-PYTHON_DBUS_NEXT_SOURCE = dbus_next-$(PYTHON_DBUS_NEXT_VERSION).tar.gz
-PYTHON_DBUS_NEXT_SITE = https://files.pythonhosted.org/packages/ce/45/6a40fbe886d60a8c26f480e7d12535502b5ba123814b3b9a0b002ebca198
-PYTHON_DBUS_NEXT_SETUP_TYPE = setuptools
-PYTHON_DBUS_NEXT_LICENSE = MIT
-PYTHON_DBUS_NEXT_LICENSE_FILES = LICENSE
-
-$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_dbus_next.py b/support/testing/tests/package/sample_python_dbus_next.py
deleted file mode 100644
index 710bfa8c04..0000000000
--- a/support/testing/tests/package/sample_python_dbus_next.py
+++ /dev/null
@@ -1,44 +0,0 @@
-import asyncio
-from dbus_next.aio import MessageBus
-from dbus_next.service import ServiceInterface, method
-import dbus_next.introspection as intr
-from dbus_next import BusType
-
-
-class SampleInterface(ServiceInterface):
-    def __init__(self):
-        super().__init__('test.interface')
-
-    @method()
-    def Ping(self):
-        pass
-
-    @method()
-    def ConcatStrings(self, what1: 's', what2: 's') -> 's':  # noqa: F821
-        return what1 + what2
-
-
-async def main():
-    bus_name = 'dbus.next.sample'
-
-    bus = await MessageBus(bus_type=BusType.SYSTEM).connect()
-    bus2 = await MessageBus(bus_type=BusType.SYSTEM).connect()
-
-    await bus.request_name(bus_name)
-
-    service_interface = SampleInterface()
-    bus.export('/test/path', service_interface)
-
-    introspection = await bus2.introspect(bus_name, '/test/path')
-    assert type(introspection) is intr.Node
-    obj = bus2.get_proxy_object(bus_name, '/test/path', introspection)
-    interface = obj.get_interface(service_interface.name)
-
-    result = await interface.call_ping()
-    assert result is None
-
-    result = await interface.call_concat_strings('hello ', 'world')
-    assert result == 'hello world'
-
-
-asyncio.run(main())
diff --git a/support/testing/tests/package/test_python_dbus_next.py b/support/testing/tests/package/test_python_dbus_next.py
deleted file mode 100644
index 3c597ad198..0000000000
--- a/support/testing/tests/package/test_python_dbus_next.py
+++ /dev/null
@@ -1,40 +0,0 @@
-import textwrap
-
-
-from tests.package.test_python import TestPythonPackageBase
-
-
-class TestPythonPy3DBusNext(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_DBUS=y
-        BR2_PACKAGE_PYTHON3=y
-        BR2_PACKAGE_PYTHON_DBUS_NEXT=y
-        """
-    sample_scripts = ["tests/package/sample_python_dbus_next.py"]
-
-    def run_sample_scripts(self):
-        config = \
-            """
-            <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
-             "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
-            <busconfig>
-              <policy user="root">
-                <allow own="dbus.next.sample"/>
-                <allow send_destination="dbus.next.sample"/>
-              </policy>
-            </busconfig>
-            """
-        config = textwrap.dedent(config)
-        config_dir = "/etc/dbus-1/system.d"
-        config_fn = "dbus.next.sample.conf"
-
-        # Setup and reload D-Bus configuration
-        self.emulator.run("mkdir -p " + config_dir)
-        self.emulator.run("cat > " + config_dir + "/" + config_fn +
-                          " <<EOF" + config + "EOF")
-        self.emulator.run("killall -SIGHUP dbus-daemon")
-
-        # Run test scripts
-        super().run_sample_scripts()
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
