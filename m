From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 23:28:25 +0200
Subject: [Buildroot] [git commit] python-pytablewriter: bump to 0.24.0
Message-ID: <20170906212107.8A8D8800CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06a2d82de741cf4e03c0d2f96634958a51bfe8bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reorder and fix dependencies.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pytablewriter/Config.in                 | 8 ++++++--
 package/python-pytablewriter/python-pytablewriter.hash | 4 ++--
 package/python-pytablewriter/python-pytablewriter.mk   | 4 ++--
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/python-pytablewriter/Config.in b/package/python-pytablewriter/Config.in
index f270d0d..1ef27be 100644
--- a/package/python-pytablewriter/Config.in
+++ b/package/python-pytablewriter/Config.in
@@ -2,12 +2,16 @@ config BR2_PACKAGE_PYTHON_PYTABLEWRITER
 	bool "python-pytablewriter"
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_DOMINATE # runtime
+	select BR2_PACKAGE_PYTHON_LOGBOOK # runtime
+	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
 	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
+	select BR2_PACKAGE_PYTHON_PYTABLEREADER # runtime
+	select BR2_PACKAGE_PYTHON_SIMPLESQLITE # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_TOML # runtime
+	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	select BR2_PACKAGE_PYTHON_XLSXWRITER # runtime
 	select BR2_PACKAGE_PYTHON_XLWT # runtime
-	select BR2_PACKAGE_PYTHON_TOML # runtime
-	select BR2_PACKAGE_PYTHON_PYTABLEREADER # runtime
 	help
 	  pytablewriter is a python library to write a table in various
 	  formats: CSV, HTML, JavaScript, JSON, Markdown, Excel, Pandas,
diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index 2987a08..abe5ad0 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pytablewriter/json, sha256 locally computed
-md5 f45f065cad97c00aaeb72db6768ff6e5  pytablewriter-0.19.9.tar.gz
-sha256 00f657b656267945d565488f1676d91f22d90748a0a06dd94d513a551e4c12d9  pytablewriter-0.19.9.tar.gz
+md5	f7655aaf8d3b2496e08a36bce4c38b91  pytablewriter-0.24.0.tar.gz
+sha256	94741a1837502fb8172bf6b2f4410a42804efaeffdf34660c375ed0a9424df4e  pytablewriter-0.24.0.tar.gz
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index 1602526..ac1480c 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 0.19.9
+PYTHON_PYTABLEWRITER_VERSION = 0.24.0
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/e9/82/0dcdbb1d8386aabda488edc2aa566c1e3c5eaac4415c02f731019be2d0df
+PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/65/b0/efafdd9e4d5b08069371530e46acde684ac7fb18bffa09b635e2af091d82
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
