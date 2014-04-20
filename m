From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 23:47:05 +0200
Subject: [Buildroot] [git commit] util-linux: do not install bash completion
	files
Message-ID: <20140420214751.9D1E19C172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95264cc0ca88944501f73b4b19f731003997251a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In most embedded systems, there is not much point in installing bash
completion files, especially since bash may not necessarily be present
on the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/util-linux.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index cc57088..4b8f731 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -18,7 +18,10 @@ UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf
 UTIL_LINUX_CONF_ENV = scanf_cv_type_modifier=no
-UTIL_LINUX_CONF_OPT += --disable-rpath --disable-makeinstall-chown
+UTIL_LINUX_CONF_OPT += \
+	--disable-rpath \
+	--disable-makeinstall-chown \
+	--disable-bash-completion
 
 # We don't want the host-busybox dependency to be added automatically
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
