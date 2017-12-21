From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 21 Dec 2017 17:48:17 +0100
Subject: [Buildroot] [PATCH] package/libcue: is not parallel-safe
Message-ID: <20171221164817.32302-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The last commit before the 1.4.0 release was to disable parallel build [1]

[1] https://github.com/lipnitsk/libcue/commit/bebbc18a8c00a0b8c26bc6191af68c6a83629b40

Fixes:
http://autobuild.buildroot.net/results/f25/f256037ca3d49f96add8ca2e2f9c980f5f9d764e
http://autobuild.buildroot.net/results/d84/d84c7d0cb9cf5fa9996c42149eda5295700516f5

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/libcue/libcue.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index 3aa3b4815f..7f8e45ecec 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -12,6 +12,8 @@ LIBCUE_DEPENDENCIES = host-bison host-flex flex
 LIBCUE_INSTALL_STAGING = YES
 LIBCUE_AUTORECONF = YES
 
+LIBCUE_MAKE = $(MAKE1)
+
 # Needed for autoreconf
 define LIBCUE_MAKE_CONFIG_DIR
 	mkdir $(@D)/config
-- 
2.14.3
