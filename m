From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Nov 2016 19:59:14 -0300
Subject: [Buildroot] [PATCH] bind: security bump to version 9.11.0-P1
Message-ID: <1478041154-5037-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-8864 - denial-of-service vector which can potentially be
exploited against BIND 9 servers.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/bind.hash | 2 +-
 package/bind/bind.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index bc46604..a8846f7 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
 # Verified from ftp://ftp.isc.org/isc/bind9/9.11.0/bind-9.11.0.tar.gz.sha256.asc
-sha256 6f0b403036e0281b272a0fbdd0dc3417f3050b625cb059c5409432611418058b  bind-9.11.0.tar.gz
+sha256 094cd3134ba1b44f0910de1334f05a7dca68d583da038de40a8ad7a0cb1592c6  bind-9.11.0-P1.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 9b5d8c5..ee50acf 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.0
+BIND_VERSION = 9.11.0-P1
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
-- 
2.7.3
