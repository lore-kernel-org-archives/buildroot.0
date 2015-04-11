From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 09:59:23 +0200
Subject: [Buildroot] [PATCH 2/2] package/jsoncpp: bump version to 1.6.1
In-Reply-To: <1428739163-3413-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428739163-3413-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1428739163-3413-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch |    2 +-
 package/jsoncpp/jsoncpp.mk                                       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch b/package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch
index 6c6ae2d..7935849 100644
--- a/package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch
+++ b/package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch
@@ -29,7 +29,7 @@ index 83102fd2bb86..f7ad1e21bbc0 100644
  
  #if defined(_MSC_VER) && _MSC_VER < 1500 // VC++ 8.0 and below
  #define snprintf _snprintf
--#else
+-#elif __cplusplus >= 201103L
 -#define snprintf std::snprintf
  #endif
  
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 3044be1..63b18e6 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.6.0
+JSONCPP_VERSION = 1.6.1
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
-- 
1.7.10.4
