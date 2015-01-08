From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  8 Jan 2015 14:32:07 -0300
Subject: [Buildroot] [PATCH] guile: needs autorecof
Message-ID: <1420738327-29085-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's patching configure.ac and triggering an automatic autoreconf which
doesn't end well. Fixes:
http://autobuild.buildroot.net/results/14f/14f502687f6344a85e67b37efe9b00b8c586a266/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/guile/guile.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index e57c917..fed79a6 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -8,6 +8,8 @@ GUILE_VERSION = 2.0.11
 GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
 GUILE_SITE = $(BR2_GNU_MIRROR)/guile
 GUILE_INSTALL_STAGING = YES
+# For 0002-calculate-csqrt_manually.patch
+GUILE_AUTORECONF = YES
 GUILE_LICENSE = LGPLv3+
 GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
 
-- 
2.0.5
