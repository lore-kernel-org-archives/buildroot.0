From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Feb 2021 20:16:49 +0100
Subject: [Buildroot] [PATCH 1/2] package/webkitgtk: security bump to version
 2.30.5
Message-ID: <20210216191651.23256-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issue:

- CVE-2020-13558: Processing maliciously crafted web content may lead to
  arbitrary code execution.  Description: A use after free issue in the
  AudioSourceProviderGStreamer class was addressed with improved memory
  management

For more details, see the advisory:
https://webkitgtk.org/security/WSA-2021-0001.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 27f0e5a69d..3869058d75 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.30.4.tar.xz.sums
-md5  81c813d77a7b52ef655922f9b387f3a1  webkitgtk-2.30.4.tar.xz
-sha1  330f45d7badf944fb01a3238ebb2ceaad8c2a91f  webkitgtk-2.30.4.tar.xz
-sha256  d595a37c5001ff787266b155e303a5f2e5b48a6d466f2714c2f30c11392f7b24  webkitgtk-2.30.4.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.30.5.tar.xz.sums
+md5  c8291af0c5102fff1f73e67f0bff6c87  webkitgtk-2.30.5.tar.xz
+sha1  4fc8753786d7762a3c4ecdc7ea11fc38b5468d6f  webkitgtk-2.30.5.tar.xz
+sha256  7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f  webkitgtk-2.30.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index fbb082f51f..8a3be4c95e 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.30.4
+WEBKITGTK_VERSION = 2.30.5
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.20.1
