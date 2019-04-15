From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 21:40:05 +0200
Subject: [Buildroot] [git commit] package/wpewebkit: security bump to
 version 2.22.5
Message-ID: <20190415193637.A8E1B8E64C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7adf8da2fef4ebe8e81c01fdc96697eb70ed64c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2019-8518: Processing maliciously crafted web content may lead to
  arbitrary code execution.  Multiple memory corruption issues were
  addressed with improved memory handling.

- CVE-2019-8523: Processing maliciously crafted web content may lead to
  arbitrary code execution.  Multiple memory corruption issues were
  addressed with improved memory handling.

In addition, 2.22.5 contains a number of bugfixes.  From the announcement:

  - Fix rendering of glyphs in Hebrew (and possibly other languages) when
    Unicode NFC normalization is used.
  - Fix several crashes and race conditions.

Change SITE to https as the webserver uses HSTS.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 27c6cdf33e..cbf253d29c 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.22.4.tar.xz.sums
-md5 6e5c668473c57906bdec1c641bac4579 wpewebkit-2.22.4.tar.xz
-sha1 002b8b25f4fc26bfef68767b3ff1eba1aac53fa5 wpewebkit-2.22.4.tar.xz
-sha256 871e86b7e989de0c1224ac7ab8ed6d8b52756cf793a8c253b56ab8ba8d288c96 wpewebkit-2.22.4.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.22.5.tar.xz.sums
+md5 7b768bfae1295ebbc9a9038bf8fb6e6c wpewebkit-2.22.5.tar.xz
+sha1 c85f927e0f17f1e7045a5d33c683d310c7af24de wpewebkit-2.22.5.tar.xz
+sha256 d5e7b23e4f9e9f1b9d369faa4d527cdb59aef56b3e6a50a16dad243df5f699f3 wpewebkit-2.22.5.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 89df9b725c..73ad534acd 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.22.4
+WPEWEBKIT_VERSION = 2.22.5
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
