From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 May 2021 22:10:10 +0200
Subject: [Buildroot] [git commit] package/coremark-pro: disable parallel
 build
Message-ID: <20210505194227.9C60E881AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eec72d3a943ff74c9cb0194ad5d0c72f4f6cce95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable parallel build as it seems to be totally broken:

/bin/bash: line 0: cd: /home/buildroot/autobuild/instance-2/output-1/build/coremark-pro-1.1.2743/builds/linux64/gcc64/obj/bench/core: No such file or directory

/bin/sh: 1: cd: can't cd to /home/buildroot/autobuild/instance-1/output-1/build/coremark-pro-1.1.2743/builds/linux/gcc/obj/bench/fp/loops/SP

Fixes:
 - http://autobuild.buildroot.org/results/7ba5e209772af7037fc735ea174d3fc3eaf46f4b
 - http://autobuild.buildroot.org/results/32b51bb9eda7899b6cc331f10a860644bd6004fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/coremark-pro/coremark-pro.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/coremark-pro/coremark-pro.mk b/package/coremark-pro/coremark-pro.mk
index 515b8eafbd..e797f66840 100644
--- a/package/coremark-pro/coremark-pro.mk
+++ b/package/coremark-pro/coremark-pro.mk
@@ -40,7 +40,7 @@ COREMARK_PRO_MAKE_OPTS += \
 	EXE=
 
 define COREMARK_PRO_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC)" LD="$(TARGET_CC)" -C $(@D) \
 		$(COREMARK_PRO_MAKE_OPTS) build
 endef
 
