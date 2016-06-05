From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 21:39:31 +0200
Subject: [Buildroot] [git commit] package/janus-gateway: bump version to
	v0.1.0
Message-ID: <20160605200530.5BF3D81E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eed8c2e38e83de107dc3a1ae24815f43a59dfe1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/janus-gateway/0001-disable-ssp.patch                      | 6 ++++--
 .../0002-Add-test-for-Wunused-but-set-variable.patch              | 8 +++++---
 package/janus-gateway/janus-gateway.mk                            | 2 +-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/janus-gateway/0001-disable-ssp.patch b/package/janus-gateway/0001-disable-ssp.patch
index 9ef184a..f03b585 100644
--- a/package/janus-gateway/0001-disable-ssp.patch
+++ b/package/janus-gateway/0001-disable-ssp.patch
@@ -5,6 +5,8 @@ the package user pass the appropriate CFLAGS to enable SSP if needed.
 
 Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+(rebased against v0.1.0)
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 diff -rupN janus-gateway-master.orig/Makefile.am janus-gateway-master/Makefile.am
 --- janus-gateway-master.orig/Makefile.am	2014-11-27 14:36:31.000000000 +0000
@@ -13,8 +15,8 @@ diff -rupN janus-gateway-master.orig/Makefile.am janus-gateway-master/Makefile.a
  # some fairly big refactoring though, which can wait.
  # AM_CFLAGS += -Wshadow -Wstrict-aliasing=2
  
--AM_CFLAGS += -fstack-protector-all -g -ggdb -fPIC -rdynamic
-+AM_CFLAGS += -g -ggdb -fPIC -rdynamic
+-AM_CFLAGS += -fstack-protector-all -g -ggdb -fPIC -rdynamic -pthread
++AM_CFLAGS += -g -ggdb -fPIC -rdynamic -pthread
  
  # FIXME: make docs work with distcheck
  DISTCHECK_CONFIGURE_FLAGS = --disable-docs --enable-post-processing
diff --git a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
index 14acae5..13bc21e 100644
--- a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
+++ b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
@@ -14,6 +14,8 @@ and uses it to detect if the -Wunused-but-set-variable option is
 supported, and only uses it in this case.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+(rebased against v0.1.0)
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  Makefile.am                 |  2 +-
  configure.ac                |  3 ++
@@ -29,11 +31,11 @@ index 5d23e0b..0f51f6a 100644
  	-Wnested-externs -Wstrict-prototypes -Wunsafe-loop-optimizations \
  	-Wwrite-strings -Wno-missing-field-initializers -Wno-unused-parameter \
  	-Wcast-align -Wformat-nonliteral -Wformat-security -Wswitch-default \
--	-Wmissing-include-dirs -Waggregate-return -Wunused-but-set-variable \
-+	-Wmissing-include-dirs -Waggregate-return @GCC_WARN_UNUSED_BUT_SET@ \
+-	-Wmissing-include-dirs -Wno-aggregate-return -Wunused-but-set-variable \
++	-Wmissing-include-dirs -Wno-aggregate-return @GCC_WARN_UNUSED_BUT_SET@ \
  	-Warray-bounds -Wold-style-definition -Wsign-compare -Wlarger-than=65537
  AM_CFLAGS += -Wno-undef  # sophiasip is not -Wundef--safe
- AM_CFLAGS += -Wredundant-decls  # sophiasip also contains redundant declarations
+ AM_CFLAGS += -Wno-redundant-decls  # sophiasip also contains redundant declarations
 diff --git a/configure.ac b/configure.ac
 index 17870a7..f9bb1e4 100644
 --- a/configure.ac
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index e1361d3..206a855 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = c632c1e9da5ffd8c34df6086a1aa5a8511a2a02d
+JANUS_GATEWAY_VERSION = v0.1.0
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPLv3
 JANUS_GATEWAY_LICENSE_FILES = COPYING
