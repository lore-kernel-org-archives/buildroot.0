From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 18:43:09 +0200
Subject: [Buildroot] [git commit] util-linux: add optional dependency on
	audit
Message-ID: <20160916164322.E6022802C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d9cad0d0585b99f804a1780d246b77825e20665
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

login and hwclock can be built with audit support. This patch adds
optional dependency on audit package if it is already selected.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/util-linux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 7b16ca4..82230bc 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -153,6 +153,13 @@ else
 UTIL_LINUX_CONF_OPTS += --without-readline
 endif
 
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+UTIL_LINUX_CONF_OPTS += --with-audit
+UTIL_LINUX_DEPENDENCIES += audit
+else
+UTIL_LINUX_CONF_OPTS += --without-audit
+endif
+
 # Install PAM configuration files
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),y)
 define UTIL_LINUX_INSTALL_PAMFILES
