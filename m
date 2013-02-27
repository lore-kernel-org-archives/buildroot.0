From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Feb 2013 08:45:44 +0100
Subject: [Buildroot] [git commit] flashbench: force gnu99 dialect on sh2a
Message-ID: <20130227074643.B1FC19AD9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba5ba0a279a9ed5dbc1d29f930d4183a34db1acf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/33880036054c39cb04dad71bc8c0a9eece16fac6

CodeSourcery toolchains for sh2a only provide LLONG_MAX when
used with the gnu99 dialect.

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/flashbench/flashbench.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
index faf8ae6..45d0540 100644
--- a/package/flashbench/flashbench.mk
+++ b/package/flashbench/flashbench.mk
@@ -11,8 +11,8 @@ FLASHBENCH_LICENSE_FILES = COPYING
 
 FLASHBENCH_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_microblaze),y)
-# microblaze toolchain only provides LLONG_MAX when used with gnu99 dialect
+ifeq ($(BR2_microblaze)$(BR2_sh2a),y)
+# microblaze and sh2a toolchains only provide LLONG_MAX when used with gnu99 dialect
 FLASHBENCH_CFLAGS += -std=gnu99
 endif
 
