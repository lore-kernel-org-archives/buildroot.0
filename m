From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:57:33 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libstrophe: bump
 to version 0.9.3
Message-ID: <20191203134920.472B584822@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5379994e383355f17b94efd892c3ce8fa023caef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Changes:

  * PLAIN mechanism is used only when no other mechanisms are supported
  * Legacy authentication is disabled by default, can be enabled with
    connection flag XMPP_CONN_FLAG_LEGACY_AUTH
  * Session is not established if it is optional
  * Fixed a bug causing a reused connection not to cleanup properly
  * Improved debug logging in OpenSSL module
  * Few memory leaks fixed

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 17bd85379a4c8a507231aba5546b4bb9042df7a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
