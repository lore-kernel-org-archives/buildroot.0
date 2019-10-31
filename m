From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 23:47:02 +0100
Subject: [Buildroot] [git commit] package/wolfssl: cleanup version/download
 logic
Message-ID: <20191031224138.972AA890BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc10561c7f9c8d7ad663b5546e5d33f409182a2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the github macro rather than manually downloading from github and
include -stable in the version number to match release-monitoring.org.

And update the .hash line to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index f2432390d5..c1b7972c5b 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 3562af485c26cd7abe94d9404fbfc0c5c9bceb4aab29b81ebf5e6c2467507e12 v4.2.0-stable.tar.gz
+sha256 3562af485c26cd7abe94d9404fbfc0c5c9bceb4aab29b81ebf5e6c2467507e12 wolfssl-4.2.0-stable.tar.gz
 
 # Hash for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index fd5fa35625..f8ec4bd1ba 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 4.2.0
-WOLFSSL_SITE = https://github.com/wolfSSL/wolfssl/archive
-WOLFSSL_SOURCE = v$(WOLFSSL_VERSION)-stable.tar.gz
+WOLFSSL_VERSION = 4.2.0-stable
+WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION))
 WOLFSSL_INSTALL_STAGING = YES
 
 WOLFSSL_LICENSE = GPL-2.0
