From: =?UTF-8?q?Daniel=20Nystr=C3=B6m?= <daniel.nystrom@timeterminal.se>
Date: Thu, 28 Nov 2013 18:53:57 +0100
Subject: [Buildroot] [PATCHv2] e2fsprogs: Install libraries to staging
Message-ID: <1385661237-13975-1-git-send-email-daniel.nystrom@timeterminal.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
---
 package/e2fsprogs/e2fsprogs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 0670c74..31e671b 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -8,6 +8,8 @@ E2FSPROGS_VERSION = 1.42.8
 E2FSPROGS_SITE = http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
 E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
+E2FSPROGS_INSTALL_STAGING = YES
+E2FSPROGS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-libs
 
 E2FSPROGS_CONF_OPT = \
 	--disable-tls \
-- 
1.8.3.2
