From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 20:25:10 +0200
Subject: [Buildroot] [git commit] package infra: add -static to C/CXXFLAGS
Message-ID: <20140730213552.0866E9D348@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d66a9b1fb67cf009fe4f15028c02a8386109dc5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Generic infra packages might not use LDFLAGS at all so add -static for
static builds to CFLAGS and CXXFLAGS too.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 427c6d8..02f6e3d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -374,6 +374,8 @@ endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 SHARED_STATIC_LIBS_OPTS = --enable-static --disable-shared
+TARGET_CFLAGS += -static
+TARGET_CXXFLAGS += -static
 TARGET_LDFLAGS += -static
 else
 SHARED_STATIC_LIBS_OPTS = --enable-static --enable-shared
