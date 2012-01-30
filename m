From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Jan 2012 23:22:51 +0100
Subject: [Buildroot] [git commit] libevas: really fix x86 cpu optimization
	options handling
Message-ID: <20120130232839.106BF9094F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf96a9bec0c2ad40b820c6f465c2ac17d3bc4e03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable all options by default, and only enable the applicable one.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/libevas.mk |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 6ad1126..acb2f4b 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -94,6 +94,9 @@ endif
 
 # code options
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
+# defaults
+LIBEVAS_CONF_OPT += --disable-cpu-mmx --disable-cpu-sse --disable-cpu-sse3
+
 # enable if cpu variant has mmx support
 ifneq ($(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_i686)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
 LIBEVAS_CONF_OPT += --enable-cpu-mmx
@@ -103,14 +106,8 @@ LIBEVAS_CONF_OPT += --enable-cpu-sse
 
 ifneq ($(BR2_x86_pentium3)$(BR2_x86_pentium4)$(BR2_x86_prescott)$(BR2_x86_athlon_4)$(BR2_x86_opteron)$(BR2_x86_c32)$(BR2_x86_64_opteron),y)
 LIBEVAS_CONF_OPT += --enable-cpu-sse3
-else
-LIBEVAS_CONF_OPT += --disable-cpu-sse3
 endif # sse3
-else
-LIBEVAS_CONF_OPT += --disable-cpu-sse
 endif # sse
-else
-LIBEVAS_CONF_OPT += --disable-cpu-mmx
 endif # mmx
 endif # x86
 
