From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 14:52:52 +0200
Subject: [Buildroot] [PATCH 1/2] binutils: use binutils 2.24 by default on
	the target
Message-ID: <1436619173-17434-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When binutils is not built for the host, binutils.mk decides of the
version to be used when building binutils for the target. We're still
using the old 2.22 binutils version, but it's time to bump up to 2.24,
which we already use as the default version for the host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 4ce11da..009a900 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2015.06-rc1
 else
-BINUTILS_VERSION = 2.22
+BINUTILS_VERSION = 2.24
 endif
 endif # BINUTILS_VERSION
 
-- 
2.4.5
