From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:49 -0000
Subject: [Buildroot] [git commit] python-twisted: bump to version 17.5.0
Message-ID: <20170902130617.E6F24818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1039cdfad847df75d44b13035bf37bd5f293ddc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also fix/add runtime dependencies: Automat and hyperlink modules.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-twisted/Config.in           | 2 ++
 package/python-twisted/python-twisted.hash | 4 ++--
 package/python-twisted/python-twisted.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 7fe4289..6b1a4fc 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_PYTHON_TWISTED
 	bool "python-twisted"
 	select BR2_PACKAGE_PYTHON_INCREMENTAL
+	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
 	select BR2_PACKAGE_PYTHON_CONSTANTLY # runtime
+	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
 	help
 	  Twisted is an event-driven networking engine written in Python.
diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 360e16d..c22f336 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/twisted/json, sha256 locally computed
-md5 5b4b9ea5a480bec9c1449ffb57b2052a Twisted-17.1.0.tar.bz2
-sha256 dbf211d70afe5b4442e3933ff01859533eba9f13d8b3e2e1b97dc2125e2d44dc Twisted-17.1.0.tar.bz2
+md5 cd5c287802dcbaf7be15cf937c922b71 Twisted-17.5.0.tar.bz2
+sha256 f198a494f0df2482f7c5f99d7f3eef33d22763ffc76641b36fec476b878002ea Twisted-17.5.0.tar.bz2
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 9b3ced5..fe276d6 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 17.1.0
+PYTHON_TWISTED_VERSION = 17.5.0
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
-PYTHON_TWISTED_SITE = https://pypi.python.org/packages/d2/5d/ed5071740be94da625535f4333793d6fd238f9012f0fee189d0c5d00bd74
+PYTHON_TWISTED_SITE = https://pypi.python.org/packages/31/bf/7f86a8f8b9778e90d8b2921e9f442a8c8aa33fd2489fc10f236bc8af1749
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
