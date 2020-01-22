From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Jan 2020 19:56:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version to
 4.11.5
Message-ID: <20200122185659.336443-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.samba.org/samba/history/samba-4.11.5.html

This is a security release in order to address the following defects:

CVE-2019-14902: Replication of ACLs set to inherit down a subtree on AD
                Directory not automatic.
CVE-2019-14907: Crash after failed character conversion at log level 3
                or above.
CVE-2019-19344: Use after free during DNS zone scavenging in Samba AD
                DC.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index e8bd026a9e..47e251b38c 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.11.4.tar.asc
-sha256 b95471ba450757109dce65acfe75dafc719c5cc5d464fc65ee442433a461db24  samba-4.11.4.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.11.5.tar.asc
+sha256 f3e299ff62e424c0c259a2e60ca30979c8a65244d7ef6b54667902dac639d93f  samba-4.11.5.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 965d593bd1..d66fd5794d 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.11.4
+SAMBA4_VERSION = 4.11.5
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.20.1
