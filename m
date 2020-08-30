From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 30 Aug 2020 12:00:58 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/libcap: drop host-libcap
 dependency
In-Reply-To: <20200830100058.4180798-1-fontaine.fabrice@gmail.com>
References: <20200830100058.4180798-1-fontaine.fabrice@gmail.com>
Message-ID: <20200830100058.4180798-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-libcap was added as a dependency of libcap in commit
efae605c88deb15d9c50fd67bdd80f46a78b06c1 without any explanation in the
commit message. Drop this dependency that does seem to be needed.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcap/libcap.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 208f8eade1..ead5a17dcc 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -10,7 +10,6 @@ LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
 LIBCAP_LICENSE_FILES = License
 
-LIBCAP_DEPENDENCIES = host-libcap
 LIBCAP_INSTALL_STAGING = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.28.0
