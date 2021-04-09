From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  9 Apr 2021 23:12:58 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/python-gpiozero: bump version to
 1.6.2
In-Reply-To: <20210409211258.32652-1-ps.report@gmx.net>
References: <20210409211258.32652-1-ps.report@gmx.net>
Message-ID: <20210409211258.32652-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- change to python3 only (runtime dependency python-colorzero)

- update license file hash:
  @@ -1,3 +1,5 @@
  +SPDX-License-Identifier: BSD-3-Clause
  +

- add setuptools runtime dependency, fixes:

	$ pinout -r a020d3 -m
	Traceback (most recent call last):
	  File "/usr/bin/pinout", line 6, in <module>
	    from pkg_resources import load_entry_point
	ModuleNotFoundError: No module named 'pkg_resources'

For details see [1].

[1] https://gpiozero.readthedocs.io/en/stable/changelog.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/python-gpiozero/Config.in            | 2 ++
 package/python-gpiozero/python-gpiozero.hash | 4 ++--
 package/python-gpiozero/python-gpiozero.mk   | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/python-gpiozero/Config.in b/package/python-gpiozero/Config.in
index 1e2735be45..13506ae45f 100644
--- a/package/python-gpiozero/Config.in
+++ b/package/python-gpiozero/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_PYTHON_GPIOZERO
 	bool "python-gpiozero"
 	depends on BR2_arm
+	depends on BR2_PACKAGE_PYTHON3 # python-colorzero
 	select BR2_PACKAGE_PYTHON_COLORZERO # runtime
 	select BR2_PACKAGE_PYTHON_RPI_GPIO # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
 	  A simple interface to GPIO devices with Raspberry Pi.
 
diff --git a/package/python-gpiozero/python-gpiozero.hash b/package/python-gpiozero/python-gpiozero.hash
index 2302003561..7359f6405e 100644
--- a/package/python-gpiozero/python-gpiozero.hash
+++ b/package/python-gpiozero/python-gpiozero.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  8cb9824fe1b08e7935de03899455e20ce2c242e4cebb0c954c274c48059f6ea5  python-gpiozero-1.5.1.tar.gz
+sha256  7e6da923774437e24edc0c056e486415bace8c4ba4123c22ac4214147854ea6d  python-gpiozero-1.6.2.tar.gz
 # Locally computed
-sha256  b6e26763b79d7904d6eaa66f7f53ae374cf30431bb6ba8bcb0d9d5ff56dc69e3  LICENSE.rst
+sha256  b6fdd587f3dc3a9b8cc5adae00918e3ffa909b1092bd4decf7e8b1b08fa5d0fb  LICENSE.rst
diff --git a/package/python-gpiozero/python-gpiozero.mk b/package/python-gpiozero/python-gpiozero.mk
index 67e8067a8b..a68c39db1f 100644
--- a/package/python-gpiozero/python-gpiozero.mk
+++ b/package/python-gpiozero/python-gpiozero.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_GPIOZERO_VERSION = 1.5.1
+PYTHON_GPIOZERO_VERSION = 1.6.2
 PYTHON_GPIOZERO_SITE = $(call github,gpiozero,gpiozero,v$(PYTHON_GPIOZERO_VERSION))
 PYTHON_GPIOZERO_LICENSE = BSD-3-Clause
 PYTHON_GPIOZERO_LICENSE_FILES = LICENSE.rst
-- 
2.31.1
