From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 18:42:33 +0200
Subject: [Buildroot] [git commit] util-linux: add optional dependency on
	readline
Message-ID: <20160916164322.DB68D8045A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8252fdebb59424b2d4d65c9ea7ed2a6cd960e24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fdisk and sfdisk tools can be built with readline support. This patch
adds optional dependency on readline if it is already selected.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/util-linux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index aa6f994..7b16ca4 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -146,6 +146,13 @@ else
 UTIL_LINUX_CONF_OPTS += --without-python
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+UTIL_LINUX_CONF_OPTS += --with-readline
+UTIL_LINUX_DEPENDENCIES += readline
+else
+UTIL_LINUX_CONF_OPTS += --without-readline
+endif
+
 # Install PAM configuration files
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),y)
 define UTIL_LINUX_INSTALL_PAMFILES
