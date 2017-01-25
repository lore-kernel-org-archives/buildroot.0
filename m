From: Alexey Neyman <stilor@att.net>
Date: Wed, 25 Jan 2017 11:20:20 -0800
Subject: [Buildroot] [PATCH 1/1] ucl: Use -std=iso9899:1990 instead of
	-std=c90
Message-ID: <20170125192020.27140-1-stilor@att.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The shorter alias, -std=c90, is not known by older versions of GCC.
See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=20631.

Signed-off-by: Alexey Neyman <stilor@att.net>
---
 package/ucl/ucl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ucl/ucl.mk b/package/ucl/ucl.mk
index e4dc1b3..b183a13 100644
--- a/package/ucl/ucl.mk
+++ b/package/ucl/ucl.mk
@@ -10,6 +10,6 @@ UCL_LICENSE = GPLv2+
 UCL_LICENSE_FILES = COPYING
 
 # Fix ACC conformance test failure for host gcc 6.x
-HOST_UCL_CONF_ENV += CPPFLAGS="$(HOST_CPPFLAGS) -std=c90"
+HOST_UCL_CONF_ENV += CPPFLAGS="$(HOST_CPPFLAGS) -std=iso9899:1990"
 
 $(eval $(host-autotools-package))
-- 
2.9.3
