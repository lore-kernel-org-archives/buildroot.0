From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Jan 2021 20:58:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/nano: drop unrecognized option
Message-ID: <20210110195851.1199222-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wordbounds option has been removed since version 4.0 and
https://git.savannah.gnu.org/cgit/nano.git/commit?id=798695ff1ec0bec2605eb490008f2968a5e8c264

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nano/nano.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index a86474bfb4..bde287bb32 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -10,9 +10,7 @@ NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
 NANO_LICENSE_FILES = COPYING
-NANO_CONF_OPTS = \
-	--without-slang \
-	--with-wordbounds
+NANO_CONF_OPTS = --without-slang
 NANO_DEPENDENCIES = ncurses
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
-- 
2.29.2
