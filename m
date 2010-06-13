From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Jun 2010 23:46:26 +0200
Subject: [Buildroot] [git commit master 1/1] vpnc: remove unused legacy
	patches
Message-ID: <20100613214747.721DA80DA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5485120b474aebcfb924bc4b6aadc89d3f3671fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vpnc/vpnc-0.4.0.patch              |   12 ------------
 package/vpnc/vpnc-0.5.1-susv3-legacy.patch |   12 ------------
 2 files changed, 0 insertions(+), 24 deletions(-)
 delete mode 100644 package/vpnc/vpnc-0.4.0.patch
 delete mode 100644 package/vpnc/vpnc-0.5.1-susv3-legacy.patch

diff --git a/package/vpnc/vpnc-0.4.0.patch b/package/vpnc/vpnc-0.4.0.patch
deleted file mode 100644
index 9520c3f..0000000
--- a/package/vpnc/vpnc-0.4.0.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urN vpnc-0.4.0-0rig/Makefile vpnc-0.4.0/Makefile
---- vpnc-0.4.0-0rig/Makefile	2007-02-19 21:51:12.000000000 +0100
-+++ vpnc-0.4.0/Makefile	2007-07-17 19:59:53.000000000 +0200
-@@ -35,7 +35,7 @@
- RELEASE_VERSION := $(shell cat VERSION)
- 
- CC=gcc
--CFLAGS += -W -Wall -O3 -Wmissing-declarations -Wwrite-strings -g
-+CFLAGS += -W -Wall -O3 -Wmissing-declarations -Wwrite-strings -g -I$(INCLUDE)
- CPPFLAGS = -DVERSION=\"$(VERSION)\"
- LDFLAGS = -g $(shell libgcrypt-config --libs)
- CFLAGS +=  $(shell libgcrypt-config --cflags)
diff --git a/package/vpnc/vpnc-0.5.1-susv3-legacy.patch b/package/vpnc/vpnc-0.5.1-susv3-legacy.patch
deleted file mode 100644
index 2e577e3..0000000
--- a/package/vpnc/vpnc-0.5.1-susv3-legacy.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -rdup vpnc-0.5.1.oorig/config.c vpnc-0.5.1/config.c
---- vpnc-0.5.1.oorig/config.c	2007-09-10 22:39:48.000000000 +0200
-+++ vpnc-0.5.1/config.c	2007-09-19 14:19:46.000000000 +0200
-@@ -538,7 +538,7 @@ static char *get_config_filename(const c
- {
- 	char *realname;
- 	
--	asprintf(&realname, "%s%s%s", index(name, '/') ? "" : "/etc/vpnc/", name, add_dot_conf ? ".conf" : "");
-+	asprintf(&realname, "%s%s%s", strchr(name, '/') ? "" : "/etc/vpnc/", name, add_dot_conf ? ".conf" : "");
- 	return realname;
- }
- 
-- 
1.7.1
