From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Jun 2020 21:20:33 +0200
Subject: [Buildroot] [PATCH 2/2] package/upx: security bump to version 3.96
In-Reply-To: <20200606192033.2763135-1-fontaine.fabrice@gmail.com>
References: <20200606192033.2763135-1-fontaine.fabrice@gmail.com>
Message-ID: <20200606192033.2763135-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch site to github to get latest release
- Fix CVE-2019-20805: p_lx_elf.cpp in UPX before 3.96 has an integer
  overflow during unpacking via crafted values in a PT_DYNAMIC segment.
- Fix CERT-FI Case 829767 UPX command line tools segfaults.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/upx/upx.hash | 2 +-
 package/upx/upx.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/upx/upx.hash b/package/upx/upx.hash
index cc7fb66c97..7f3698ca0d 100644
--- a/package/upx/upx.hash
+++ b/package/upx/upx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  527ce757429841f51675352b1f9f6fc8ad97b18002080d7bf8672c466d8c6a3c  upx-3.91-src.tar.bz2
+sha256  47774df5c958f2868ef550fb258b97c73272cb1f44fe776b798e393465993714  upx-3.96-src.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index c554553ce9..c577dfc2df 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-UPX_VERSION = 3.91
-UPX_SITE = http://upx.sourceforge.net/download
-UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.bz2
+UPX_VERSION = 3.96
+UPX_SITE = https://github.com/upx/upx/releases/download/v$(UPX_VERSION)
+UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.xz
 UPX_LICENSE = GPL-2.0+
 UPX_LICENSE_FILES = COPYING
 
-- 
2.26.2
