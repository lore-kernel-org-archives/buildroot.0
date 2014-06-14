From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:05:38 +0200
Subject: [Buildroot] [git commit] libdrm: Add menu option to install the
	test programs
Message-ID: <20140614170553.9FF5E9CFE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6e14a71b74f16902ff0a073c44b4f00a4e5c06a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libdrm has a bunch of useful test programs. Add an option to pass
the configure option to install them.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/Config.in |    5 +++++
 package/libdrm/libdrm.mk |    4 ++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index e6a7a42..9acc908 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -10,6 +10,11 @@ config BR2_PACKAGE_LIBDRM
 
 if BR2_PACKAGE_LIBDRM
 
+config BR2_PACKAGE_LIBDRM_INSTALL_TESTS
+	bool "Install test programs"
+	help
+	  This option allows to install the libdrm test programs.
+
 menu "DRM Drivers"
 
 config BR2_PACKAGE_LIBDRM_INTEL
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index b3e4d7a..d912d6d 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -69,4 +69,8 @@ else
 LIBDRM_CONF_OPT += --disable-udev
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM_INSTALL_TESTS),y)
+LIBDRM_CONF_OPT += --enable-install-test-programs
+endif
+
 $(eval $(autotools-package))
