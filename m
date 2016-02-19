From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 23:16:49 +0100
Subject: [Buildroot] [git commit] python-service-identity: new package
Message-ID: <20160302202753.538FD80203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4753063e2861659260e1d6927eb66ea96c98c9e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                          |  1 +
 package/python-service-identity/Config.in                  | 10 ++++++++++
 .../python-service-identity/python-service-identity.hash   |  3 +++
 package/python-service-identity/python-service-identity.mk | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 8637096..d9da232 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -711,6 +711,7 @@ menu "External python modules"
 	source "package/python-requests/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-serial/Config.in"
+	source "package/python-service-identity/Config.in"
 	source "package/python-setuptools/Config.in"
 	source "package/python-shutilwhich/Config.in"
 	source "package/python-simplejson/Config.in"
diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
new file mode 100644
index 0000000..e2200f6
--- /dev/null
+++ b/package/python-service-identity/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
+	bool "python-service-identity"
+	select BR2_PACKAGE_PYTHON_CHARACTERISTIC # runtime
+	select BR2_PACKAGE_PYTHON_PYASN # runtime
+	select BR2_PACKAGE_PYTHON_PYASN_MODULES # runtime
+	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	help
+	  Service identity verification for pyOpenSSL.
+
+	  https://pypi.python.org/pypi/service_identity
diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
new file mode 100644
index 0000000..caf29dc
--- /dev/null
+++ b/package/python-service-identity/python-service-identity.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=cea0b0156d73b025ecef660fb51f0d9a, sha256 locally computed.
+md5	cea0b0156d73b025ecef660fb51f0d9a  service_identity-14.0.0.tar.gz
+sha256	3105a319a7c558490666694f599be0c377ad54824eefb404cde4ce49e74a4f5a  service_identity-14.0.0.tar.gz
diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
new file mode 100644
index 0000000..9eca3c1
--- /dev/null
+++ b/package/python-service-identity/python-service-identity.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-service-identity
+#
+################################################################################
+
+PYTHON_SERVICE_IDENTITY_VERSION = 14.0.0
+PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
+PYTHON_SERVICE_IDENTITY_SITE = http://pypi.python.org/packages/source/s/service_identity
+PYTHON_SERVICE_IDENTITY_LICENSE = MIT
+PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
+PYTHON_SERVICE_IDENTITY_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
