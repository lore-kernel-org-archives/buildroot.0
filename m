From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 17:47:25 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libcurl: security
 bump to version 7.71.0
Message-ID: <20200716155439.8CE22876A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c91eb51f4b90d33a71c8de059c766a71db0dcc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

CVE-2020-8177: curl overwrite local file with -J.

CVE-2020-8169: Partial password leak over DNS on HTTP redirect.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8370769d4a5e62e7054872053eafdd99419fef36)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 2157f3d2d2..104d603f3e 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  db3c4a3b3695a0f317a0c5176acd2f656d18abc45b3ee78e50935a78eb1e132e  COPYING
-sha256  032f43f2674008c761af19bf536374128c16241fb234699a55f9fb603fcfbae7  curl-7.70.0.tar.xz
+sha256  cdf18794393d8bead915312708a9e5d819c6e9919de14b20d5c8e7987abd9772  curl-7.71.0.tar.xz
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 0d4c33bc6e..1341a8483b 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.70.0
+LIBCURL_VERSION = 7.71.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
