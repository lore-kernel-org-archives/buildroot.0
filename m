From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Jun 2018 10:11:11 +0200
Subject: [Buildroot] [git commit] wiringpi: bump version to 2.46
Message-ID: <20180623080844.C466A81353@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e80e66cc083af519e3b447cad1ccf45c86ecec9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Atanas Palavrov <palavrov@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wiringpi/0001-Adjust-for-buildroot-build.patch | 16 ++++++++++------
 package/wiringpi/wiringpi.hash                         |  2 +-
 package/wiringpi/wiringpi.mk                           |  3 +--
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/package/wiringpi/0001-Adjust-for-buildroot-build.patch b/package/wiringpi/0001-Adjust-for-buildroot-build.patch
index 520555c8e8..2f4f0c1f0a 100644
--- a/package/wiringpi/0001-Adjust-for-buildroot-build.patch
+++ b/package/wiringpi/0001-Adjust-for-buildroot-build.patch
@@ -12,6 +12,10 @@ Subject: [PATCH] Adjust for buildroot build.
  - add gpio-static linking target
 
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+
+ - Rebased for wiringpi-8d188fa0e00bb8c6ff6eddd07bf92857e9bd533a
+
+Signed-off-by: Atanas Palavrov <palavrov@gmail.com>
 ---
  devLib/Makefile   |  9 +++++----
  gpio/Makefile     | 14 +++++++++-----
@@ -54,7 +58,7 @@ index cf665d6..3fb41e8 100644
  
  .PHONY:	install-static
 diff --git a/gpio/Makefile b/gpio/Makefile
-index f41a005..7095fa5 100644
+index 9ec160d..360d64c 100644
 --- a/gpio/Makefile
 +++ b/gpio/Makefile
 @@ -32,11 +32,11 @@ endif
@@ -89,7 +93,7 @@ index f41a005..7095fa5 100644
  	$Q echo [Compile] $<
  	$Q $(CC) -c $(CFLAGS) $< -o $@
 diff --git a/wiringPi/Makefile b/wiringPi/Makefile
-index e1868b9..68c950e 100644
+index 287fa58..81595d3 100644
 --- a/wiringPi/Makefile
 +++ b/wiringPi/Makefile
 @@ -36,10 +36,10 @@ DYNAMIC=libwiringPi.so.$(VERSION)
@@ -102,10 +106,10 @@ index e1868b9..68c950e 100644
  DEFS	= -D_GNU_SOURCE
 -CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Wextra -Winline $(INCLUDE) -pipe -fPIC
 +CFLAGS	+= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Wextra -Winline $(INCLUDE) -pipe -fPIC
+ #CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Wextra -Wconversion -Winline $(INCLUDE) -pipe -fPIC
  
  LIBS    = -lm -lpthread -lrt -lcrypt
- 
-@@ -79,6 +79,7 @@ $(STATIC):	$(OBJ)
+@@ -76,6 +76,7 @@ static:
  $(DYNAMIC):	$(OBJ)
  	$Q echo "[Link (Dynamic)]"
  	$Q $(CC) -shared -Wl,-soname,libwiringPi.so$(WIRINGPI_SONAME_SUFFIX) -o libwiringPi.so.$(VERSION) $(LIBS) $(OBJ)
@@ -113,7 +117,7 @@ index e1868b9..68c950e 100644
  
  .c.o:
  	$Q echo [Compile] $<
-@@ -104,7 +105,7 @@ install:	$(DYNAMIC)
+@@ -101,7 +102,7 @@ install:	$(DYNAMIC)
  	$Q echo "[Install Dynamic Lib]"
  	$Q install -m 0755 -d						$(DESTDIR)$(PREFIX)/lib
  	$Q install -m 0755 libwiringPi.so.$(VERSION)			$(DESTDIR)$(PREFIX)/lib/libwiringPi.so.$(VERSION)
@@ -121,7 +125,7 @@ index e1868b9..68c950e 100644
 +	$Q ln -sf libwiringPi.so.$(VERSION)				$(DESTDIR)$(PREFIX)/lib/libwiringPi.so
  	$Q $(LDCONFIG)
  
- .PHONY:	install-static
+ .PHONY:	install-deb
 -- 
 2.11.0
 
diff --git a/package/wiringpi/wiringpi.hash b/package/wiringpi/wiringpi.hash
index f4832e5fa8..9c4fe22f5f 100644
--- a/package/wiringpi/wiringpi.hash
+++ b/package/wiringpi/wiringpi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 4eae1d4f37f77534b1e2db4678a1003a5fd7ced4721c340527e3476d0bed1d9f wiringpi-96344ff7125182989f98d3be8d111952a8f74e15.tar.gz
+sha256 2455fc97d2b60ed169675dccbaabf55e1958c3c2499b246c96edfc8b036e9073 wiringpi-2.46.tar.gz
diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
index f2e9e246d9..497a5d1ebe 100644
--- a/package/wiringpi/wiringpi.mk
+++ b/package/wiringpi/wiringpi.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-# using git commit id instead of (wrong) 2.44 git tag (Bug 10391)
-WIRINGPI_VERSION = 96344ff7125182989f98d3be8d111952a8f74e15
+WIRINGPI_VERSION = 2.46
 WIRINGPI_SITE = git://git.drogon.net/wiringPi
 
 WIRINGPI_LICENSE = LGPL-3.0+
