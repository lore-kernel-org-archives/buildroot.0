From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 11:28:05 +0100
Subject: [Buildroot] [git commit] package/python-remi: bump to version
 2020.11.20
Message-ID: <20210130102237.B6BDF8380C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c36367e909eb110caa5390c16408b99ab7b46e18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add runtime dependencies to pythonX-ssl and python-setuptools.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-remi/Config.in        | 3 +++
 package/python-remi/python-remi.hash | 2 +-
 package/python-remi/python-remi.mk   | 4 ++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/python-remi/Config.in b/package/python-remi/Config.in
index 553c89c343..e0c5e9bfe1 100644
--- a/package/python-remi/Config.in
+++ b/package/python-remi/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_PYTHON_REMI
 	bool "python-remi"
+	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
 	  Remi is a GUI library for Python applications which transpiles
 	  an application's interface into HTML to be rendered in a web
diff --git a/package/python-remi/python-remi.hash b/package/python-remi/python-remi.hash
index 5788d7d923..832bf915ab 100644
--- a/package/python-remi/python-remi.hash
+++ b/package/python-remi/python-remi.hash
@@ -1,2 +1,2 @@
 # sha256 from https://pypi.org/pypi/remi/json
-sha256  2a1953747fd01bfda25381624f6b84d83586d247f6b47282dbafff348fd05d88  remi-2020.8.6.tar.gz
+sha256  2a32658146b63d33a88aff7362679873c9df9e42a9e651c9e6642da834b3cca1  remi-2020.11.20.tar.gz
diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
index 04f2e1abee..5666733986 100644
--- a/package/python-remi/python-remi.mk
+++ b/package/python-remi/python-remi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REMI_VERSION = 2020.8.6
+PYTHON_REMI_VERSION = 2020.11.20
 PYTHON_REMI_SOURCE = remi-$(PYTHON_REMI_VERSION).tar.gz
-PYTHON_REMI_SITE = https://files.pythonhosted.org/packages/d1/74/e2a1f5df4e57170369b221017c954ce9002901b9cc136365de0cf300e72a
+PYTHON_REMI_SITE = https://files.pythonhosted.org/packages/47/45/3110334859199be84d9b230fd31e2333b4c69832e15facc0868bed2aa3f3
 PYTHON_REMI_LICENSE = Apache-2.0
 PYTHON_REMI_SETUP_TYPE = setuptools
 
