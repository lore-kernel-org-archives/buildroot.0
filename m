From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  5 Mar 2016 21:40:51 +0100
Subject: [Buildroot] [PATCH] package/multicat: add missing dependency on
	bitstream
Message-ID: <1457210451-7436-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Multicat select bitstream package without adding it as build dependencies.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/multicat/multicat.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/multicat/multicat.mk b/package/multicat/multicat.mk
index 5909bc5..cc6eb78 100644
--- a/package/multicat/multicat.mk
+++ b/package/multicat/multicat.mk
@@ -10,6 +10,8 @@ MULTICAT_SITE = https://get.videolan.org/multicat/$(MULTICAT_VERSION)
 MULTICAT_LICENSE = GPLv2+
 MULTICAT_LICENSE_FILES = COPYING
 
+MULTICAT_DEPENDENCIES = bitstream
+
 MULTICAT_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS)
 
 define MULTICAT_BUILD_CMDS
-- 
2.5.0
