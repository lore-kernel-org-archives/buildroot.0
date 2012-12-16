From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 14:30:40 +0100
Subject: [Buildroot] [git commit] dnsmasq: bump to version 2.65
Message-ID: <20121216133045.78952998E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ceffe9659ae4a98a4127812126379a263ab991e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../dnsmasq/dnsmasq-fix-parse-server-no-dhcp.patch |   37 --------------------
 package/dnsmasq/dnsmasq.mk                         |    2 +-
 2 files changed, 1 insertions(+), 38 deletions(-)

diff --git a/package/dnsmasq/dnsmasq-fix-parse-server-no-dhcp.patch b/package/dnsmasq/dnsmasq-fix-parse-server-no-dhcp.patch
deleted file mode 100644
index 817d3b2..0000000
--- a/package/dnsmasq/dnsmasq-fix-parse-server-no-dhcp.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From acd702292afebb8550acbfbe80638995545ccd10 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Mon, 10 Dec 2012 07:47:10 -0300
-Subject: [PATCH] Move parse_server outside the HAVE_DHCP ifdef
-
-Fixes build breakage when building without DHCP support.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- src/option.c |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/src/option.c b/src/option.c
-index c1643a1..d6e323b 100644
---- a/src/option.c
-+++ b/src/option.c
-@@ -641,6 +641,8 @@ static char *set_prefix(char *arg)
-    return arg;
- }
- 
-+#endif
-+
- char *parse_server(char *arg, union mysockaddr *addr, union mysockaddr *source_addr, char *interface, int *flags)
- {
-   int source_port = 0, serv_port = NAMESERVER_PORT;
-@@ -728,6 +730,8 @@ char *parse_server(char *arg, union mysockaddr *addr, union mysockaddr *source_a
-   return NULL;
- }
- 
-+#ifdef HAVE_DHCP
-+
- /* This is too insanely large to keep in-line in the switch */
- static int parse_dhcp_opt(char *errstr, char *arg, int flags)
- {
--- 
-1.7.8.6
-
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index afa51e2..fe75e7b 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DNSMASQ_VERSION = 2.64
+DNSMASQ_VERSION = 2.65
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)"
 DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
