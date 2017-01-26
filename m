From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jan 2017 20:58:41 +1300
Subject: [Buildroot] [git commit] ucl: Use -std=iso9899:1990 instead of
	-std=c90
Message-ID: <20170126075854.3C89B81EA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05a5866916f4c70249344aaed92292840e6eaaa8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The shorter alias, -std=c90, is not known by older versions of GCC.
See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=20631.

Signed-off-by: Alexey Neyman <stilor@att.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
