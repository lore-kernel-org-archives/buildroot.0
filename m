From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 15:29:06 +0200
Subject: [Buildroot] [git commit] package/jsoncpp: bump version to 1.6.1
Message-ID: <20150411132914.3E91F80805@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e90f6350e047f856617399c31842ca34ea11ed5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...001-Revert-Use-std-namespace-for-snprintf.patch |    2 +-
 package/jsoncpp/jsoncpp.mk                         |    2 +-
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
