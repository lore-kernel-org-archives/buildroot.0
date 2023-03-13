Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DCAC6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 21:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 614D980C68;
	Mon, 13 Mar 2023 21:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 614D980C68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DnNe5brtjbLO; Mon, 13 Mar 2023 21:55:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D4EA80C7B;
	Mon, 13 Mar 2023 21:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D4EA80C7B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DE621BF282
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 21:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44F5B417AA
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 21:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44F5B417AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id js25P7BRyljl for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 21:55:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3626417A8
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 21:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3626417A8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1520870BB; Mon, 13 Mar 2023 21:55:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 22:54:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2867fec00d68721158aad1991d4e85a7fa491e9
X-Git-Newrev: 7a99e1fa29f5dd7cb46186d07826debc519e1035
X-Patchwork-Hint: ignore
Message-Id: <20230313215553.D1520870BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hwdata: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7a99e1fa29f5dd7cb46186d07826debc519e1035
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Provides python interface to database stored in hwdata
package. It allows you to get human readable description of
USB and PCI devices.

https://github.com/xsuchy/python-hwdata

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 package/python-hwdata/Config.in                    | 12 +++++++
 package/python-hwdata/python-hwdata.hash           |  5 +++
 package/python-hwdata/python-hwdata.mk             | 23 +++++++++++++
 .../testing/tests/package/sample_python_hwdata.py  | 40 ++++++++++++++++++++++
 .../testing/tests/package/test_python_hwdata.py    | 12 +++++++
 7 files changed, 96 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 592c0e6b9c..b49491da7a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1715,6 +1715,7 @@ F:	package/ptm2human/
 F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-hkdf/
+F:	package/python-hwdata/
 F:	package/python-magic-wormhole/
 F:	package/python-magic-wormhole-mailbox-server/
 F:	package/python-magic-wormhole-transit-relay/
@@ -1727,6 +1728,7 @@ F:	package/z3/
 F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
+F:	support/testing/tests/package/sample_python_hwdata.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_ddrescue.py
@@ -1748,6 +1750,7 @@ F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_hkdf.py
+F:	support/testing/tests/package/test_python_hwdata.py
 F:	support/testing/tests/package/test_python_magic_wormhole.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
diff --git a/package/Config.in b/package/Config.in
index f8ce83365e..0f8dab3e71 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1082,6 +1082,7 @@ menu "External python modules"
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
index 0000000000..0c7ca31476
--- /dev/null
+++ b/package/python-hwdata/python-hwdata.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/hwdata/json
+md5  dccf3b28d06fb9c6f56875e148356c24  hwdata-2.3.7.tar.gz
+sha256  9e5c96be38d9218ffde40834d4ca03344b8dfaed29c8c5afe0030125ea03db03  hwdata-2.3.7.tar.gz
+# Locally computed
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/python-hwdata/python-hwdata.mk b/package/python-hwdata/python-hwdata.mk
new file mode 100644
index 0000000000..8eeec6efa8
--- /dev/null
+++ b/package/python-hwdata/python-hwdata.mk
@@ -0,0 +1,23 @@
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
+# There is no LICENSE file in the PyPi tarball, but it is available in
+# upstream git repository:
+PYTHON_HWDATA_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/xsuchy/python-hwdata/python-hwdata-$(PYTHON_HWDATA_VERSION)-1/LICENSE
+
+define PYTHON_HWDATA_ADD_LICENSE_FILE
+	cp $(PYTHON_HWDATA_DL_DIR)/LICENSE $(@D)
+endef
+PYTHON_HWDATA_POST_EXTRACT_HOOKS += PYTHON_HWDATA_ADD_LICENSE_FILE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_hwdata.py b/support/testing/tests/package/sample_python_hwdata.py
new file mode 100644
index 0000000000..a13c08b32e
--- /dev/null
+++ b/support/testing/tests/package/sample_python_hwdata.py
@@ -0,0 +1,40 @@
+#! /usr/bin/env python3
+
+from hwdata import PCI, PNP, USB
+
+# Test PCI IDs
+pci_vendor_id = '1af4'
+pci_device_id = '1003'
+
+pci = PCI()
+
+pci_vendor = pci.get_vendor(pci_vendor_id)
+print("PCI Vendor: %s" % pci_vendor)
+assert (pci_vendor == "Red Hat, Inc.")
+
+pci_device = pci.get_device(pci_vendor_id, pci_device_id)
+print("PCI Device: %s" % pci_device)
+assert (pci_device == "Virtio console")
+
+# Test USB IDs
+usb_vendor_id = '1d6b'
+usb_device_id = '0001'
+
+usb = USB()
+
+usb_vendor = usb.get_vendor(usb_vendor_id)
+print("USB Vendor: %s" % usb_vendor)
+assert (usb_vendor == "Linux Foundation")
+
+usb_device = usb.get_device(usb_vendor_id, usb_device_id)
+print("USB Device: %s" % usb_device)
+assert (usb_device == "1.1 root hub")
+
+# Test PNP IDs
+pnp_id = 'RHT'
+
+pnp = PNP()
+
+pnp_vendor = pnp.get_vendor(pnp_id)
+print("PNP Vendor: %s" % pnp_vendor)
+assert (pnp_vendor == "Red Hat, Inc.")
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
