From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 25 Oct 2013 00:04:47 +0200
Subject: [Buildroot] [PATCH] libcgroup: depends on host-bison
Message-ID: <1382652287-13384-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/73d/73dddcc1aa68999ea496de148497f80bdb02c874

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libcgroup/libcgroup.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index c2392e0..339deb3 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -9,7 +9,7 @@ LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
 LIBCGROUP_SITE = http://downloads.sourceforge.net/project/libcg/libcgroup/v.038
 LIBCGROUP_LICENSE = LGPLv2.1
 LIBCGROUP_LICENSE_FILES = COPYING
-
+LIBCGROUP_DEPENDENCIES = host-bison
 LIBCGROUP_INSTALL_STAGING = YES
 
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
-- 
1.8.4.rc3
