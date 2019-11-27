From: Michael Vetter <jubalh@iodoru.org>
Date: Wed, 27 Nov 2019 13:52:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/libstrophe: bump to version 0.9.3
Message-ID: <20191127125245.30093-1-jubalh@iodoru.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes:

  * PLAIN mechanism is used only when no other mechanisms are supported
  * Legacy authentication is disabled by default, can be enabled with
    connection flag XMPP_CONN_FLAG_LEGACY_AUTH
  * Session is not established if it is optional
  * Fixed a bug causing a reused connection not to cleanup properly
  * Improved debug logging in OpenSSL module
  * Few memory leaks fixed

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 package/libstrophe/libstrophe.hash | 2 +-
 package/libstrophe/libstrophe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
index 72eb386520..1e46a82bc9 100644
--- a/package/libstrophe/libstrophe.hash
+++ b/package/libstrophe/libstrophe.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 158145bc1565a5fd0bbd7f57e3e15d768e58b8a460897ab5918a5a689d67ae6f  libstrophe-0.9.2.tar.gz
+sha256 8a3b79f62177ed59c01d4d4108357ff20bd933d53b845ee4e350d304c051a4fe  libstrophe-0.9.3.tar.gz
 sha256 82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index 7445caa67f..d5434f5033 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSTROPHE_VERSION = 0.9.2
+LIBSTROPHE_VERSION = 0.9.3
 LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
 LIBSTROPHE_DEPENDENCIES = openssl host-pkgconf
 # Doesn't ship configure
-- 
2.16.4
