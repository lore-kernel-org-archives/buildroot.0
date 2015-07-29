From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 29 Jul 2015 11:48:56 +0200
Subject: [Buildroot] [PATCH] quota: fix build with libtirpc
Message-ID: <1438163336-26928-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/bba8faf210414d956cc07629b8ba99ceed0ebdf6/
  http://autobuild.buildroot.net/results/f525b48e2982adc4987cb772be92eeda30569c13/
  http://autobuild.buildroot.net/results/0d2c2cd0bda1dd3c1e137117df535d8e02d67e8b/
  http://autobuild.buildroot.net/results/a815a4f943e6a07f87f8f6bbf9910459575db311/
  http://autobuild.buildroot.net/results/1b72769e65444322de4bfcb02200b7d999f9f5c1/
  http://autobuild.buildroot.net/results/195f6c34904b8185d44611c3d56084cb7d3e8a14/
  http://autobuild.buildroot.net/results/aac02dd6c5ea04ea70cfa6921a04b5558a9bbe7f/
  http://autobuild.buildroot.net/results/fbaec431108bec088ff543771c52f2bc20e15b31/
  [...]

QUOTA_CFLAGS / QUOTA_LIBS shouldn't be quoted since QUOTA_MAKE_OPTS and
QUOTA_CONF_ENV already add quotes.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/quota/quota.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 5e5e637..a6b0322 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -20,8 +20,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 QUOTA_DEPENDENCIES += libtirpc host-pkgconf
-QUOTA_CFLAGS += "`$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
-QUOTA_LIBS += "`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
+QUOTA_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
+QUOTA_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
 endif
 
 QUOTA_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LIBS="$(QUOTA_LIBS)"
-- 
2.1.4
