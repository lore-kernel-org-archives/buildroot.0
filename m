From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 27 Nov 2010 22:36:28 +0100
Subject: [Buildroot] [git commit master 1/1] package/Makefile.in: Add
	OBJDUMP=$(TARGET_OBJDUMP) to TARGET_CONFIGURE_OPTS
Message-ID: <20101127214030.64EE98CA80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1fbd9ef8132c250d3f4c2e575cdc99a08f73d090
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2857

The OBJDUMP was missing from TARGET_CONFIGURE_OPTS, this patch adds it
to the proper place in package/Makefile.in.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES             |    6 +++++-
 package/Makefile.in |    1 +
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index cb1daff..87056ed 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,9 +1,13 @@
 2010.11, Not yet released:
 
-	 Fixes all over the tree.
+	Fixes all over the tree.
 
 	Updated/fixed packages: qt, xserver-xorg
 
+	Issues resolved (http://bugs.uclibc.org):
+
+	#2857: OBJDUMP definition is missing from TARGET_CONFIGURE_OPTS
+
 2010.11-rc2, Released November 25th, 2010:
 
 	Fixes all over the tree.
diff --git a/package/Makefile.in b/package/Makefile.in
index 971a7ed..a39dbbc 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -192,6 +192,7 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		RANLIB="$(TARGET_RANLIB)" \
 		STRIP="$(TARGET_STRIP)" \
 		OBJCOPY="$(TARGET_OBJCOPY)" \
+		OBJDUMP="$(TARGET_OBJDUMP)" \
 		AR_FOR_BUILD="$(HOSTAR)" \
 		AS_FOR_BUILD="$(HOSTAS)" \
 		CC_FOR_BUILD="$(HOSTCC)" \
-- 
1.7.2.2
