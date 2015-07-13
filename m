From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:32:36 +0200
Subject: [Buildroot] [git commit] binutils: use binutils 2.24 by default on
	the target
Message-ID: <20150713153413.ADA3D8181F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc8d59ad4eac7b1e16ed21846415b3d79adbec99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When binutils is not built for the host, binutils.mk decides of the
version to be used when building binutils for the target. We're still
using the old 2.22 binutils version, but it's time to bump up to 2.24,
which we already use as the default version for the host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/binutils/binutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
