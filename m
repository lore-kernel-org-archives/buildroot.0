From: Martin Bark <martin@barkynet.com>
Date: Thu, 25 Feb 2016 13:23:35 +0000
Subject: [Buildroot] [PATCH 4/4] package/iptuils: bump version to
	3a86a2542c6fe29413c439bebeae11ec8a57ec7c
In-Reply-To: <1456406615-7324-1-git-send-email-martin@barkynet.com>
References: <1456406615-7324-1-git-send-email-martin@barkynet.com>
Message-ID: <1456406615-7324-4-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove 0001-ping-link-against-libm.patch as this has been fixed upstream.
See https://github.com/iputils/iputils/pull/42 and
https://github.com/iputils/iputils/commit/a5ddb78

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/iputils/0001-ping-link-against-libm.patch | 29 -----------------------
 package/iputils/iputils.hash                      |  2 +-
 package/iputils/iputils.mk                        |  2 +-
 3 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 package/iputils/0001-ping-link-against-libm.patch

diff --git a/package/iputils/0001-ping-link-against-libm.patch b/package/iputils/0001-ping-link-against-libm.patch
deleted file mode 100644
index d151c5b..0000000
--- a/package/iputils/0001-ping-link-against-libm.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8d189e73e660a637ae3f5a604448103ea42e397d Mon Sep 17 00:00:00 2001
-From: Martin Bark <martin@barkynet.com>
-Date: Fri, 12 Feb 2016 16:52:19 +0000
-Subject: [PATCH] ping: link against libm
-
-This commit links ping against libm because ping.c calls the math library
-function finite().
-
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 8b37c42..fb80f6f 100644
---- a/Makefile
-+++ b/Makefile
-@@ -156,7 +156,7 @@ LIB_clockdiff = $(LIB_CAP)
- DEF_ping_common = $(DEF_CAP) $(DEF_IDN)
- DEF_ping6_common = $(DEF_CAP) $(DEF_IDN)
- DEF_ping  = $(DEF_CAP) $(DEF_IDN) $(DEF_WITHOUT_IFADDRS)
--LIB_ping  = $(LIB_CAP) $(LIB_IDN) $(LIB_RESOLV)
-+LIB_ping  = $(LIB_CAP) $(LIB_IDN) $(LIB_RESOLV) -lm
- 
- ping: ping_common.o ping6_common.o
- ping.o ping_common.o ping6_common.o: ping.h in6_flowlabel.h
--- 
-2.7.0
-
diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index e32e134..1cd8ed3 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	0e98cb527fa175d1e08afb969c124e452b30968f10ec2c3b078f1440c8977a94	iputils-c8ff6feaf0442f8efd96ccb415770c54f9e84d47.tar.gz
+sha256	73de246aee1fd3cd69b1341a0c4e1b4acfa655fe6f7363fd9424824aa8bf5a57	iputils-3a86a2542c6fe29413c439bebeae11ec8a57ec7c.tar.gz
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 92e2bc9..522be9b 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -11,7 +11,7 @@
 # and IPv6 updates.
 # http://www.spinics.net/lists/netdev/msg279881.html
 
-IPUTILS_VERSION = c8ff6feaf0442f8efd96ccb415770c54f9e84d47
+IPUTILS_VERSION = 3a86a2542c6fe29413c439bebeae11ec8a57ec7c
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPLv2+, BSD-3c, BSD-4c
 # Only includes a license file for BSD
-- 
2.5.0
