From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Apr 2014 14:07:57 +0200
Subject: [Buildroot] [git commit] util-linux: add missing dependency on
	libcap-ng
Message-ID: <20140408122105.D1DAB9C43C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=045f3f777fe5c1b41166e0dbdb998b0ac13a57db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d661447..f0ae3ae 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -40,6 +40,10 @@ UTIL_LINUX_DEPENDENCIES += gettext
 UTIL_LINUX_MAKE_OPT += LIBS=-lintl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
+UTIL_LINUX_DEPENDENCIES += libcap-ng
+endif
+
 # Used by cramfs utils
 UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 
