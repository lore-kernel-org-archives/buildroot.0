From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Sep 2014 17:50:38 -0300
Subject: [Buildroot] [PATCH 3/7] wireshark: bump to version 1.12.0
In-Reply-To: <1409863842-24226-1-git-send-email-gustavo@zacarias.com.ar>
References: <1409863842-24226-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1409863842-24226-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...001-fix-wrong-cflags-for-build-assumption.patch | 52 +++++++++++-----------
 package/wireshark/wireshark.mk                     |  3 +-
 2 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/package/wireshark/wireshark-0001-fix-wrong-cflags-for-build-assumption.patch b/package/wireshark/wireshark-0001-fix-wrong-cflags-for-build-assumption.patch
index de30c81..14cb957 100644
--- a/package/wireshark/wireshark-0001-fix-wrong-cflags-for-build-assumption.patch
+++ b/package/wireshark/wireshark-0001-fix-wrong-cflags-for-build-assumption.patch
@@ -11,30 +11,28 @@ http://autobuild.buildroot.net/results/2b1/2b1a0654b649618422d65edf370b82476ba84
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura wireshark-1.10.3.orig/acinclude.m4 wireshark-1.10.3/acinclude.m4
---- wireshark-1.10.3.orig/acinclude.m4	2013-12-04 14:06:44.986074426 -0300
-+++ wireshark-1.10.3/acinclude.m4	2013-12-04 14:25:36.496356791 -0300
-@@ -1664,11 +1664,6 @@
-                             # the saved value plus just the new option.
-                             #
-                             CFLAGS="$CFLAGS_saved $GCC_OPTION"
--                            #
--                            # Add it to the flags we use when building
--                            # build tools.
--                            #
--                            CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD $GCC_OPTION"
-                             if test "$2" != C ; then
-                               #
-                               # Add it to the C++ flags as well.
-@@ -1687,11 +1682,6 @@
-                         # the saved value plus just the new option.
-                         #
-                         CFLAGS="$CFLAGS_saved $GCC_OPTION"
--                        #
--                        # Add it to the flags we use when building
--                        # build tools.
--                        #
--                        CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD $GCC_OPTION"
-                         if test "$2" != C ; then
-                           #
-                           # Add it to the C++ flags as well.
+diff -Nura wireshark-1.12.0.orig/acinclude.m4 wireshark-1.12.0/acinclude.m4
+--- wireshark-1.12.0.orig/acinclude.m4	2014-09-04 15:45:38.365255309 -0300
++++ wireshark-1.12.0/acinclude.m4	2014-09-04 15:46:23.349810353 -0300
+@@ -1755,10 +1755,6 @@
+               # just the new option.
+               #
+               CFLAGS="$CFLAGS_saved $GCC_OPTION"
+-              #
+-              # Add it to the flags we use when building build tools.
+-              #
+-              CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD $GCC_OPTION"
+             ],
+             [
+               AC_MSG_RESULT(yes)
+@@ -1771,10 +1767,6 @@
+           # just the new option.
+           #
+           CFLAGS="$CFLAGS_saved $GCC_OPTION"
+-          #
+-          # Add it to the flags we use when building build tools.
+-          #
+-          CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD $GCC_OPTION"
+         fi
+       ],
+       [
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index da76e37..0bbf34d 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 1.10.9
+WIRESHARK_VERSION = 1.12.0
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
 WIRESHARK_LICENSE_FILES = COPYING
 WIRESHARK_DEPENDENCIES = libpcap libgcrypt libglib2
+# For wrong cflags patch
 WIRESHARK_AUTORECONF = YES
 WIRESHARK_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
 			ac_cv_path_PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
-- 
1.8.5.5
