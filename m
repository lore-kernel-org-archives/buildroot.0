From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  1 Nov 2014 21:16:17 -0300
Subject: [Buildroot] [PATCH] libcap: Revert
	57280c2f244500ac6616377b3b8eab458c1ead23
Message-ID: <1414887377-5478-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Down bump libcap back to version 2.22 since 2.24 (and 2.23 as well) have
issues. But keep the switch back to kernel.org and update the hash.
Fixes:
http://autobuild.buildroot.net/results/2ef/2efb25356bc87ba0e1be08214eaa28ac064ad6c3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcap/libcap.hash | 2 +-
 package/libcap/libcap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index 75822e5..5ce5cea 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,2 +1,2 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256	cee4568f78dc851d726fc93f25f4ed91cc223b1fe8259daa4a77158d174e6c65	libcap-2.24.tar.xz
+sha256	2f88deb4dc2fb1e73dd5232af7214c08604a5fb4ea0e3ec364a1a9a5a62664ed	libcap-2.22.tar.xz
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 43c3e7e..01ac284 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.24
+LIBCAP_VERSION = 2.22
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPLv2 or BSD-3c
-- 
2.0.4
