From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 20:09:38 +0200
Subject: [Buildroot] [git commit] libxml2: security bump to version 2.9.4
Message-ID: <20160523181404.B4E9D817B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=925f0897fecbd3d47c432fa6c41bfd0027e5ceb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a bunch of security issues including:

  CVE-2016-1762: Heap-based buffer overread in xmlNextChar

  CVE-2016-1834: heap-buffer-overflow in xmlStrncat

  CVE-2016-3705: Missing increments of recursion depth counter to XML parser

A few more security fixes are listed in the release announcement at
https://mail.gnome.org/archives/xml/2016-May/msg00023.html.

Also fixes:
http://autobuild.buildroot.net/results/6db/6db405a097b192876c0b1b8d59051d614563c617/
http://autobuild.buildroot.net/results/62a/62addf4abd2a0df8222a81a83c16b2b9a61c9481/
http://autobuild.buildroot.net/results/204/20402690ad05d10d456a219da5252a38badf1da0/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxml2/libxml2.hash | 2 +-
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 00fbf43..098121e 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	4de9e31f46b44d34871c22f54bfc54398ef124d6f7cafb1f4a5958fbcd3ba12d	libxml2-2.9.3.tar.gz
+sha256	ffb911191e509b966deb55de705387f14156e1a56b21824357cdf0053233633c	libxml2-2.9.4.tar.gz
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index ee9b2ca..ed6f9af 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXML2_VERSION = 2.9.3
+LIBXML2_VERSION = 2.9.4
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_LICENSE = MIT
