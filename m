From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 15 Aug 2014 16:39:09 +0200
Subject: [Buildroot] [PATCH 4/6] package/cdrkit: clean {HOST_,
	}CDRKIT_CONF_OPT
In-Reply-To: <1408113551-29932-1-git-send-email-s.martin49@gmail.com>
References: <1408113551-29932-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1408113551-29932-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extending {C,LD}FLAGS for both host and target cdrkit package is not needed
because it is already handled by the {host-,}cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/cdrkit/cdrkit.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index ee98013..3cb64b2 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -18,12 +18,5 @@ endif
 
 CDRKIT_CONF_OPT += $(CMAKE_ENDIAN_OPT)
 
-## cdrkit isn't completely re-rooted by CMAKE_FIND_ROOT_PATH, so add
-## some extra flags so it finds needed libs and headers.
-CDRKIT_CONF_OPT += -DCMAKE_C_FLAGS="-I$(STAGING_DIR)/usr/include"
-CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(TARGET_LDFLAGS)"
-HOST_CDRKIT_CONF_OPT += -DCMAKE_C_FLAGS="-I$(HOST_DIR)/usr/include"
-HOST_CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)"
-
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.0.4
