From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 20:56:56 +0200
Subject: [Buildroot] [git commit] package/cdrkit: clean {HOST_,
	}CDRKIT_CONF_OPT
Message-ID: <20140928191300.338279D7A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=72d453cbfcbabcc1170713c5248d91aea4110925
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Extending {C,LD}FLAGS for both host and target cdrkit package is not needed
because it is already handled by the {host-,}cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cdrkit/cdrkit.mk |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index 7474fff..ff7bf4a 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -16,12 +16,5 @@ else
 CDRKIT_CONF_OPT += -DBITFIELDS_HTOL=0
 endif
 
-## cdrkit isn't completely re-rooted by CMAKE_FIND_ROOT_PATH, so add
-## some extra flags so it finds needed libs and headers.
-CDRKIT_CONF_OPT += -DCMAKE_C_FLAGS="-I$(STAGING_DIR)/usr/include"
-CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(TARGET_LDFLAGS)"
-HOST_CDRKIT_CONF_OPT += -DCMAKE_C_FLAGS="-I$(HOST_DIR)/usr/include"
-HOST_CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)"
-
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
