Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD821C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Mar 2023 18:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08EAE410C9;
	Sat, 11 Mar 2023 18:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08EAE410C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZnPBzn-WZ8LH; Sat, 11 Mar 2023 18:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87A80410CF;
	Sat, 11 Mar 2023 18:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87A80410CF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4828C1BF42C
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 18:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C4D4410CF
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 18:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C4D4410CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PMYM9OhpdPiE for <buildroot@lists.busybox.net>;
 Sat, 11 Mar 2023 18:42:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30439410C9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30439410C9
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 18:42:12 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.4.130])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9F2A1B00539;
 Sat, 11 Mar 2023 19:42:05 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Mar 2023 19:41:48 +0100
Message-Id: <20230311184148.183739-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1678560129;
 bh=L7YeqWnn/NHKgx7uXyQtyXcYhdsgl5uPzbh3CClMwTA=;
 h=From:To:Cc:Subject:Date:From;
 b=kGXzdUPDACKItnvkAm2y3hu9ruih8v8t8a2CdzkaqJQOSXlrzQKs3JCbfyPQS5/XX
 mpCXdL+4VuWCgys5owLrX9KjeqQvyfTsaYiORs1trze8g2H+xPwx3mn8oIcBq8vmuC
 SeAUPMlL7cmy2OQFY4h/D+5Vkb8R1us2h0AHcfu58zuV/nNoYJmnNAU8h8ks71XqiR
 OwDPwIB6qH7BXpczMzjjPyfLQDyIbxKcF+C2t3cf/eUSWVYLeeTn51Unh6plzbhvdq
 JCgFNccLQjx5bQQMU+46/9Ay6JyCuUStIWbPBo3kanTs8Bc1OvxJhkbvPmuWPlM/u/
 k9Pv55zFLsbSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kGXzdUPD
Subject: [Buildroot] [PATCH next 1/1] package/python-hwdata: new package
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
Cc: Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Provides python interface to database stored in hwdata
package. It allows you to get human readable description of
USB and PCI devices.

https://github.com/xsuchy/python-hwdata

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit b793f3a with commands:

    make check-package
    ...
    0 warnings generated

    python3 -m flake8 \
        support/testing/tests/package/sample_python_hwdata.py \
        support/testing/tests/package/test_python_hwdata.py
    [no-output]

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_python_hwdata
    ...
    OK
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 package/python-hwdata/Config.in               | 12 ++++++
 package/python-hwdata/python-hwdata.hash      |  3 ++
 package/python-hwdata/python-hwdata.mk        | 14 +++++++
 .../tests/package/sample_python_hwdata.py     | 40 +++++++++++++++++++
 .../tests/package/test_python_hwdata.py       | 12 ++++++
 7 files changed, 85 insertions(+)
 create mode 100644 package/python-hwdata/Config.in
 create mode 100644 package/python-hwdata/python-hwdata.hash
 create mode 100644 package/python-hwdata/python-hwdata.mk
 create mode 100644 support/testing/tests/package/sample_python_hwdata.py
 create mode 100644 support/testing/tests/package/test_python_hwdata.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d052e59122..c7ca204c05 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1701,6 +1701,7 @@ F:	package/ptm2human/
 F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-hkdf/
+F:	package/python-hwdata/
 F:	package/python-magic-wormhole/
 F:	package/python-magic-wormhole-mailbox-server/
 F:	package/python-magic-wormhole-transit-relay/
@@ -1713,6 +1714,7 @@ F:	package/z3/
 F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
+F:	support/testing/tests/package/sample_python_hwdata.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_gnupg2.py
@@ -1727,6 +1729,7 @@ F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_hkdf.py
+F:	support/testing/tests/package/test_python_hwdata.py
 F:	support/testing/tests/package/test_python_magic_wormhole.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
diff --git a/package/Config.in b/package/Config.in
index 7c32305129..d5b17b9716 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1083,6 +1083,7 @@ menu "External python modules"
 	source "package/python-httplib2/Config.in"
 	source "package/python-huepy/Config.in"
 	source "package/python-humanize/Config.in"
+	source "package/python-hwdata/Config.in"
 	source "package/python-hyperframe/Config.in"
 	source "package/python-hyperlink/Config.in"
 	source "package/python-ibmiotf/Config.in"
diff --git a/package/python-hwdata/Config.in b/package/python-hwdata/Config.in
new file mode 100644
index 0000000000..923d0a7d8a
--- /dev/null
+++ b/package/python-hwdata/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_HWDATA
+	bool "python-hwdata"
+	select BR2_PACKAGE_HWDATA # runtime
+	select BR2_PACKAGE_HWDATA_PCI_IDS
+	select BR2_PACKAGE_HWDATA_PNP_IDS
+	select BR2_PACKAGE_HWDATA_USB_IDS
+	help
+	  Provides python interface to database stored in hwdata
+	  package. It allows you to get human readable description of
+	  USB and PCI devices.
+
+	  https://github.com/xsuchy/python-hwdata
diff --git a/package/python-hwdata/python-hwdata.hash b/package/python-hwdata/python-hwdata.hash
new file mode 100644
index 0000000000..90d546dafc
--- /dev/null
+++ b/package/python-hwdata/python-hwdata.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/hwdata/json
+md5  dccf3b28d06fb9c6f56875e148356c24  hwdata-2.3.7.tar.gz
+sha256  9e5c96be38d9218ffde40834d4ca03344b8dfaed29c8c5afe0030125ea03db03  hwdata-2.3.7.tar.gz
diff --git a/package/python-hwdata/python-hwdata.mk b/package/python-hwdata/python-hwdata.mk
new file mode 100644
index 0000000000..acc0378d38
--- /dev/null
+++ b/package/python-hwdata/python-hwdata.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-hwdata
+#
+################################################################################
+
+PYTHON_HWDATA_VERSION = 2.3.7
+PYTHON_HWDATA_SOURCE = hwdata-$(PYTHON_HWDATA_VERSION).tar.gz
+PYTHON_HWDATA_SITE = https://files.pythonhosted.org/packages/15/26/f5bc1b42129fbcbd1c99c29714af1685fc89e2cf37680a9930d4fcac1808
+PYTHON_HWDATA_SETUP_TYPE = distutils
+PYTHON_HWDATA_LICENSE = GPL-2.0+
+PYTHON_HWDATA_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_hwdata.py b/support/testing/tests/package/sample_python_hwdata.py
new file mode 100644
index 0000000000..9209f07925
--- /dev/null
+++ b/support/testing/tests/package/sample_python_hwdata.py
@@ -0,0 +1,40 @@
+#! /usr/bin/env python3
+
+from hwdata import PCI, USB, PNP
+
+# Test PCI IDs
+pci_vendor_id = '1af4'
+pci_device_id = '1003'
+
+pci = PCI()
+
+pci_vendor = pci.get_vendor(pci_vendor_id)
+print("PCI Vendor: %s" % pci_vendor)
+assert(pci_vendor == "Red Hat, Inc.")
+
+pci_device = pci.get_device(pci_vendor_id, pci_device_id)
+print("PCI Device: %s" % pci_device)
+assert(pci_device == "Virtio console")
+
+# Test USB IDs
+usb_vendor_id = '1d6b'
+usb_device_id = '0001'
+
+usb = USB()
+
+usb_vendor = usb.get_vendor(usb_vendor_id)
+print("USB Vendor: %s" % usb_vendor)
+assert(usb_vendor == "Linux Foundation")
+
+usb_device = usb.get_device(usb_vendor_id, usb_device_id)
+print("USB Device: %s" % usb_device)
+assert(usb_device == "1.1 root hub")
+
+# Test PNP IDs
+pnp_id = 'RHT'
+
+pnp = PNP()
+
+pnp_vendor = pnp.get_vendor(pnp_id)
+print("PNP Vendor: %s" % pnp_vendor)
+assert(pnp_vendor == "Red Hat, Inc.")
diff --git a/support/testing/tests/package/test_python_hwdata.py b/support/testing/tests/package/test_python_hwdata.py
new file mode 100644
index 0000000000..7028d1dd59
--- /dev/null
+++ b/support/testing/tests/package/test_python_hwdata.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonHwdata(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_HWDATA=y
+        """
+    sample_scripts = ["tests/package/sample_python_hwdata.py"]
+    timeout = 10
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
