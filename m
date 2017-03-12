From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Mar 2017 13:12:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/git: fix pcre support
Message-ID: <20170312121203.8626-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current code contains some obvious typos.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/git/git.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 1d70924ae..ec606a415 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -19,8 +19,8 @@ else
 GIT_CONF_OPTS += --without-openssl
 endif
 
-ifeq ($(BR2_PACKAGE_PERL),y)
-GIT_DEPENDENCIES += perl
+ifeq ($(BR2_PACKAGE_PCRE),y)
+GIT_DEPENDENCIES += pcre
 GIT_CONF_OPTS += --with-libpcre
 else
 GIT_CONF_OPTS += --without-libpcre
-- 
2.11.0
