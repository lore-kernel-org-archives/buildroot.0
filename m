From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 23:22:48 +0200
Subject: [Buildroot] [git commit] package/stella: bump to version 6.1.1
Message-ID: <20200419210827.05DD38F31C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7210c24e343a13e58d1d45b7e0c4bdb51854857
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch already applied upstream.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../stella/0002-Do-not-strip-when-installing.patch | 26 ----------------------
 ...-PAGE_SIZE.patch => 0002-undef-PAGE_SIZE.patch} |  0
 package/stella/stella.hash                         |  2 +-
 package/stella/stella.mk                           |  2 +-
 4 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/package/stella/0002-Do-not-strip-when-installing.patch b/package/stella/0002-Do-not-strip-when-installing.patch
deleted file mode 100644
index 8a95a81a5a..0000000000
--- a/package/stella/0002-Do-not-strip-when-installing.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d506a586b299682a425d3c3de68baefb7221fa9a Mon Sep 17 00:00:00 2001
-From: Sergio Prado <sergio.prado@e-labworks.com>
-Date: Sun, 30 Jul 2017 18:25:12 -0300
-Subject: [PATCH 2/2] Do not strip when installing
-
-Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 346640e53bea..fedaed05a4d6 100644
---- a/Makefile
-+++ b/Makefile
-@@ -173,7 +173,7 @@ config.mak: $(srcdir)/configure
- 
- install: all
- 	$(INSTALL) -d "$(DESTDIR)$(BINDIR)"
--	$(INSTALL) -c -s -m 755 "$(srcdir)/stella$(EXEEXT)" "$(DESTDIR)$(BINDIR)/stella$(EXEEXT)"
-+	$(INSTALL) -c -m 755 "$(srcdir)/stella$(EXEEXT)" "$(DESTDIR)$(BINDIR)/stella$(EXEEXT)"
- 	$(INSTALL) -d "$(DESTDIR)$(DOCDIR)"
- 	$(INSTALL) -c -m 644 "$(srcdir)/Announce.txt" "$(srcdir)/Changes.txt" "$(srcdir)/Copyright.txt" "$(srcdir)/License.txt" "$(srcdir)/README-SDL.txt" "$(srcdir)/Readme.txt" "$(srcdir)/Todo.txt" "$(srcdir)/docs/index.html" "$(srcdir)/docs/debugger.html" "$(DESTDIR)$(DOCDIR)/"
- 	$(INSTALL) -d "$(DESTDIR)$(DOCDIR)/graphics"
--- 
-1.9.1
-
diff --git a/package/stella/0003-undef-PAGE_SIZE.patch b/package/stella/0002-undef-PAGE_SIZE.patch
similarity index 100%
rename from package/stella/0003-undef-PAGE_SIZE.patch
rename to package/stella/0002-undef-PAGE_SIZE.patch
diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index 395ee18d35..dcc56aadf6 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 bcbd82294f97d00457fdb727e9b08ff73b685dc7f77704cea1eceb58d8967387  stella-6.0.2-src.tar.xz
+sha256 ddf53bb782c63c97c4e5d0fefa9eb256c62e0d5a328c78cc18f06eea45ba7369  stella-6.1.1-src.tar.xz
 sha256 062e708b8b88ea911b5c08000f1c4a5588235aa0c303bc893b5d92fb45cafd04  Copyright.txt
 sha256 58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 1295b75274..74c131e72d 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 6.0.2
+STELLA_VERSION = 6.1.1
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
