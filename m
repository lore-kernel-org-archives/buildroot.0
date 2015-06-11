From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jun 2015 22:08:35 +0200
Subject: [Buildroot] [git commit] gflags: define NO_THREADS if toolchain
	doesn't support threads
Message-ID: <20150611200926.83F6580D90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33d1e7cf0faf0f334f9c48c724d97d1051624c8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/a42/a4288ed5050ce0d14e589745bf26c0a95acf645e/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gflags/gflags.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gflags/gflags.mk b/package/gflags/gflags.mk
index 661dad8..9dc4e15 100644
--- a/package/gflags/gflags.mk
+++ b/package/gflags/gflags.mk
@@ -11,7 +11,7 @@ GFLAGS_LICENSE = BSD-3c
 GFLAGS_LICENSE_FILES = COPYING.txt
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-GFLAGS_CONF_OPTS = -DBUILD_gflags_LIB=OFF
+GFLAGS_CONF_OPTS = -DBUILD_gflags_LIB=OFF -DCMAKE_CXX_FLAGS=-DNO_THREADS
 endif
 
 $(eval $(cmake-package))
