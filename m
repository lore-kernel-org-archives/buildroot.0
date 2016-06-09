From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  9 Jun 2016 19:04:14 -0300
Subject: [Buildroot] [PATCH] wget: security bump to version 1.18
Message-ID: <1465509854-25984-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-4971 - By default, on server redirects to a FTP resource, use
the original URL to get the local file name.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wget/wget.hash | 2 +-
 package/wget/wget.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 159cd51..6d26723 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  fe559b61eb9cc01635ac6206a14e02cb51591838c35fa83c7a4aacae0bdd97c9  wget-1.17.1.tar.xz
+sha256  b5b55b75726c04c06fe253daec9329a6f1a3c0c1878e3ea76ebfebc139ea9cc1  wget-1.18.tar.xz
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 2c6ccf2..9cda76b 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.17.1
+WGET_VERSION = 1.18
 WGET_SOURCE = wget-$(WGET_VERSION).tar.xz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
-- 
2.7.3
