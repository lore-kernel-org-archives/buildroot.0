From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 22:52:45 +0100
Subject: [Buildroot] [git commit branch/next]
 package/python-requests-oauthlib: new package
Message-ID: <20171123214634.A224D80DB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b281703dc4af2911a617010212d30a9e3241dbdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Needed for python-mwclient version bump to 0.8.6.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-requests-oauthlib/Config.in                 |  8 ++++++++
 .../python-requests-oauthlib/python-requests-oauthlib.hash |  4 ++++
 .../python-requests-oauthlib/python-requests-oauthlib.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2ff00c8..19a9f2d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -325,6 +325,7 @@ F:	package/python-mako/
 F:	package/python-oauthlib/
 F:	package/python-pyicu/
 F:	package/python-pylru/
+F:	package/python-requests-oauthlib/
 F:	package/python-slob/
 F:	package/rtmpdump/
 F:	package/softether/
diff --git a/package/Config.in b/package/Config.in
index 66a490d..a8f3f7c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -879,6 +879,7 @@ menu "External python modules"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-raven/Config.in"
 	source "package/python-requests/Config.in"
+	source "package/python-requests-oauthlib/Config.in"
 	source "package/python-requests-toolbelt/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rtslib-fb/Config.in"
diff --git a/package/python-requests-oauthlib/Config.in b/package/python-requests-oauthlib/Config.in
new file mode 100644
index 0000000..85283b2
--- /dev/null
+++ b/package/python-requests-oauthlib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_REQUESTS_OAUTHLIB
+	bool "python-requests-oauthlib"
+	select BR2_PACKAGE_PYTHON_OAUTHLIB # runtime
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	help
+	  OAuthlib authentication support for Requests.
+
+	  https://github.com/requests/requests-oauthlib
diff --git a/package/python-requests-oauthlib/python-requests-oauthlib.hash b/package/python-requests-oauthlib/python-requests-oauthlib.hash
new file mode 100644
index 0000000..be0f644
--- /dev/null
+++ b/package/python-requests-oauthlib/python-requests-oauthlib.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/requests_oauthlib/json, sha256 locally computed
+md5	4358a879a4377393bcfd37d0f9ae6d4d  requests-oauthlib-0.8.0.tar.gz
+sha256	883ac416757eada6d3d07054ec7092ac21c7f35cb1d2cf82faf205637081f468  requests-oauthlib-0.8.0.tar.gz
+sha256	ae01846afad8a8291fe6a08966f3015af9a8ff675d84b981f9793c122f7876e8  LICENSE
diff --git a/package/python-requests-oauthlib/python-requests-oauthlib.mk b/package/python-requests-oauthlib/python-requests-oauthlib.mk
new file mode 100644
index 0000000..02e3114
--- /dev/null
+++ b/package/python-requests-oauthlib/python-requests-oauthlib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-requests-oauthlib
+#
+################################################################################
+
+PYTHON_REQUESTS_OAUTHLIB_VERSION = 0.8.0
+PYTHON_REQUESTS_OAUTHLIB_SOURCE = requests-oauthlib-$(PYTHON_REQUESTS_OAUTHLIB_VERSION).tar.gz
+PYTHON_REQUESTS_OAUTHLIB_SITE = https://pypi.python.org/packages/80/14/ad120c720f86c547ba8988010d5186102030591f71f7099f23921ca47fe5
+PYTHON_REQUESTS_OAUTHLIB_SETUP_TYPE = setuptools
+PYTHON_REQUESTS_OAUTHLIB_LICENSE = ISC
+PYTHON_REQUESTS_OAUTHLIB_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
