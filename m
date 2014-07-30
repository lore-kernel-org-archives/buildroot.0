From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 20:25:10 +0200
Subject: [Buildroot] [git commit] package infra: revert 0a4bd19f
Message-ID: <20140730213551.EDC5E9CDBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d764327a697a2572bba96878972c1a469f864f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Revert commit 0a4bd19f4a136930c611027942ce43124a81c5cb
Using --static is not documented and actually breaks static linking
according to my tests.
Fixes:
http://autobuild.buildroot.net/results/327/327c18db4e5d0ddc2c72a4684e103c19a1405e50/
...for external toolchains

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index fc55850..427c6d8 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -374,7 +374,7 @@ endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 SHARED_STATIC_LIBS_OPTS = --enable-static --disable-shared
-TARGET_LDFLAGS += --static
+TARGET_LDFLAGS += -static
 else
 SHARED_STATIC_LIBS_OPTS = --enable-static --enable-shared
 endif
