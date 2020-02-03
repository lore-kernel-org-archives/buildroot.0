From: titouan.christophe at railnova.eu <titouan.christophe@railnova.eu>
Date: Mon,  3 Feb 2020 12:18:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/python: re-enable hashlib
Message-ID: <20200203111837.13376-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Titouan Christophe <titouan.christophe@railnova.eu>

In commit e5cfb319f9493d677f059ca72b80f7fa22fc9f0f,
the committer did add the flag `--disable-hashlib` to python,
even though this was not part of the original patch
(https://patchwork.ozlabs.org/patch/1231905/).

This unexpected modification break the builds of waf-based
packages, such as jack2, mpv or aubio. This commit therefore

Fixes: http://autobuild.buildroot.net/results/2b3/2b377bcfda6e7ae4d6bb894664e3a4cb13a70b6d/
Fixes: http://autobuild.buildroot.net/results/cd5/cd5da8cb3da8479ebee60d011ce0c5dc0e59aab7/

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/python/python.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 9e3c32687c..41a981e3d3 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -60,7 +60,7 @@ HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
 ifeq ($(BR2_PACKAGE_HOST_PYTHON_SSL),y)
 HOST_PYTHON_DEPENDENCIES += host-openssl
 else
-HOST_PYTHON_CONF_OPTS += --disable-ssl --disable-hashlib
+HOST_PYTHON_CONF_OPTS += --disable-ssl
 endif
 
 PYTHON_INSTALL_STAGING = YES
-- 
2.24.1
