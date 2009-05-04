From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon,  4 May 2009 21:24:26 +0200
Subject: [Buildroot] [PATCH] package: set CXX to false rather than "" if no
	C++ support is enabled
Message-ID: <1241465066-9795-1-git-send-email-jacmet@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Korsgaard <jacmet@sunsite.dk>

Some configure scripts seems to ignore CXX settings if it is set to
the empty string, and goes back to the default (<arch>-linux-g++),
so use false instead, as that will loudly break the build if the
C++ compiler is ever used.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 2605639..7daa3b4 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -371,7 +371,7 @@ DISABLE_IPV6= --disable-ipv6
 endif
 
 ifneq ($(BR2_GCC_CROSS_CXX),y)
-TARGET_CONFIGURE_OPTS+=CXX=""
+TARGET_CONFIGURE_OPTS+=CXX=false
 endif
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
-- 
1.6.2
