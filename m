From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Mar 2017 00:00:28 +0100
Subject: [Buildroot] [PATCH 3/6] python: fix disabling the SSL module
In-Reply-To: <1488927631-21945-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488927631-21945-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1488927631-21945-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Python extension is _ssl, not ssl. Due to this mistake in the patch,
even with --disable-ssl passed on the command line, the _ssl.so Python
extension would still be built.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/0027-Add-an-option-to-disable-the-ssl-module.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python/0027-Add-an-option-to-disable-the-ssl-module.patch b/package/python/0027-Add-an-option-to-disable-the-ssl-module.patch
index 3cb823b..5f2fb87 100644
--- a/package/python/0027-Add-an-option-to-disable-the-ssl-module.patch
+++ b/package/python/0027-Add-an-option-to-disable-the-ssl-module.patch
@@ -1,4 +1,4 @@
-From 45fcf92ec1e89e0afd0bf2bbc7a1008b56135ba3 Mon Sep 17 00:00:00 2001
+From fc16ab40e3e6a5b4deed2fa7c5475fa216ff8d17 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:30:22 +0100
 Subject: [PATCH] Add an option to disable the ssl module
@@ -9,7 +9,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 524614c..743707a 100644
+index 524614c..cadac82 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2834,6 +2834,12 @@ AC_ARG_ENABLE(nis,
@@ -19,7 +19,7 @@ index 524614c..743707a 100644
 +AC_ARG_ENABLE(ssl,
 +	AS_HELP_STRING([--disable-ssl], [disable SSL]),
 +	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl"
++    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _ssl"
 +  	  fi])
 +
  AC_ARG_ENABLE(dbm,
-- 
2.7.4
