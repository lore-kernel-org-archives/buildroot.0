From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Nov 2011 19:58:38 +0100
Subject: [Buildroot] [git commit] oprofile: fix mipsel build
Message-ID: <20111111185934.32BB48F46A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd3177cc1a3b8b3925f71ee36e62e24b2dd0cb02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3709

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    1 +
 package/oprofile/oprofile.mk |    3 +++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0800c1f..3fed3d0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -73,6 +73,7 @@
 	#3343: Add file:// download SITE_METHOD
 	#3391: Add support for specifying an external kernel tree
 	#3631: Error while compiling with Xorg
+	#3709: oprofile doesn't build for mipsel
 	#3925: midori not getting compile
 	#4045: Add support for downloading i386 toolchains from codesourcery
 	#4165: lrzsz-fix-symlink-at-rebuild.patch
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 734839f..5da794b 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -12,6 +12,9 @@ OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled
 ifeq ($(BR2_i386),y)
 OPROFILE_ARCH = i386
 endif
+ifeq ($(BR2_mipsel),y)
+OPROFILE_ARCH = mips
+endif
 ifeq ($(BR2_powerpc),y)
 OPROFILE_ARCH = ppc
 endif
