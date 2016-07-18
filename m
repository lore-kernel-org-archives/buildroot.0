From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Mon, 18 Jul 2016 16:28:49 +0200
Subject: [Buildroot] [PATCH 1/2] fcgiwrap: Bump to
	99c942c90063c73734e56bacaa65f947772d9186.
In-Reply-To: <1468852130-1525-1-git-send-email-thomas.claveirole@green-communications.fr>
References: <1468852130-1525-1-git-send-email-thomas.claveirole@green-communications.fr>
Message-ID: <1468852130-1525-2-git-send-email-thomas.claveirole@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fcgiwrap was not updated since April 2015, but the last GitHub release
is from February 2013.  Therefore, bump fcgiwrap to the latest commit
as it features fixes and improvements, but is unlikely to be part of a
release soon.

Update as well:
* the license file (latest commit features a COPYING file),
* the Config.in URL, as the previous "official" URL now returns an
  HTTP 502 error.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/fcgiwrap/Config.in     | 2 +-
 package/fcgiwrap/fcgiwrap.hash | 2 +-
 package/fcgiwrap/fcgiwrap.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fcgiwrap/Config.in b/package/fcgiwrap/Config.in
index c3a31fc..b1dbd72 100644
--- a/package/fcgiwrap/Config.in
+++ b/package/fcgiwrap/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_FCGIWRAP
 	  over FastCGI. It hopes to provide clean CGI support to Nginx
 	  (and other web servers that may need it).
 
-	  https://nginx.localdomain.pl/wiki/FcgiWrap
+	  https://github.com/gnosek/fcgiwrap
diff --git a/package/fcgiwrap/fcgiwrap.hash b/package/fcgiwrap/fcgiwrap.hash
index 510e1ff..4ad8b0b 100644
--- a/package/fcgiwrap/fcgiwrap.hash
+++ b/package/fcgiwrap/fcgiwrap.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 4c7de0db2634c38297d5fcef61ab4a3e21856dd7247d49c33d9b19542bd1c61f  fcgiwrap-1.1.0.tar.gz
+sha256 c72f2933669ebd21605975c5a11f26b9739e32e4f9d324fb9e1a1925e9c2ae88  fcgiwrap-99c942c90063c73734e56bacaa65f947772d9186.tar.gz
diff --git a/package/fcgiwrap/fcgiwrap.mk b/package/fcgiwrap/fcgiwrap.mk
index 698a130..dd74c1e 100644
--- a/package/fcgiwrap/fcgiwrap.mk
+++ b/package/fcgiwrap/fcgiwrap.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-FCGIWRAP_VERSION = 1.1.0
+FCGIWRAP_VERSION = 99c942c90063c73734e56bacaa65f947772d9186
 FCGIWRAP_SITE = $(call github,gnosek,fcgiwrap,$(FCGIWRAP_VERSION))
 FCGIWRAP_DEPENDENCIES = host-pkgconf libfcgi
 FCGIWRAP_LICENSE = MIT
-FCGIWRAP_LICENSE_FILES = fcgiwrap.c
+FCGIWRAP_LICENSE_FILES = COPYING
 FCGIWRAP_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-- 
2.8.1
