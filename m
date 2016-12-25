From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Dec 2016 23:38:15 +0100
Subject: [Buildroot] [PATCH] exim: security bump to 4.87.1
Message-ID: <20161225223815.3970-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No features are added or removed. This release contains
just a fix for CVE-2016-9963

    - Fix CVE-2016-9963 - Info leak from DKIM.  When signing DKIM, if
      either LMTP or PRDR was used for delivery, the key could appear in
      logs.  Additionally, if the experimental feature "DSN_INFO" was used,
      it could appear in DSN messages (and be sent offsite).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.hash | 2 +-
 package/exim/exim.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 83be731..ef2d03b 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	74691e0dff4d1b5d387e9c33c86f96a8f6d2adbc781c0dec9d2061a847b07dc9	exim-4.87.tar.bz2
+sha256	d4b7994c89240d2f9a9fcd7a2dffa4b72f14379001a24266f4dbb0fbe5131514	exim-4.87.1.tar.bz2
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index ed7d169..a9f4685 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.87
+EXIM_VERSION = 4.87.1
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
-EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
+EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4/old
 EXIM_LICENSE = GPLv2+
 EXIM_LICENSE_FILES = LICENCE
 EXIM_DEPENDENCIES = pcre berkeleydb host-pkgconf
-- 
2.10.2
