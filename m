From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 Jan 2017 10:44:51 -0300
Subject: [Buildroot] [PATCH] gd: security bump to version 2.2.4
Message-ID: <20170119134451.8799-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-9317 - gdImageCreate() doesn't check for oversized images and
as such is prone to DoS vulnerabilities.
CVE-2016-6912 - double-free in gdImageWebPtr()
(without CVE):
Potential unsigned underflow in gd_interpolation.c
DOS vulnerability in gdImageCreateFromGd2Ctx()
Signed Integer Overflow gd_io.c

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gd/gd.hash | 2 +-
 package/gd/gd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gd/gd.hash b/package/gd/gd.hash
index eb3da42..a1991b1 100644
--- a/package/gd/gd.hash
+++ b/package/gd/gd.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	746b6cbd6769a22ff3ba6f5756f3512a769bd4cdf4695dff17f4867f25fa7d3c	libgd-2.2.3.tar.xz
+sha256	137f13a7eb93ce72e32ccd7cebdab6874f8cf7ddf31d3a455a68e016ecd9e4e6	libgd-2.2.4.tar.xz
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 0777bdb..63d16eb 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GD_VERSION = 2.2.3
+GD_VERSION = 2.2.4
 GD_SOURCE = libgd-$(GD_VERSION).tar.xz
 GD_SITE = https://github.com/libgd/libgd/releases/download/gd-$(GD_VERSION)
 GD_INSTALL_STAGING = YES
-- 
2.10.2
