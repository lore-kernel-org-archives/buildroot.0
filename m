From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 22:54:47 +0100
Subject: [Buildroot] [git commit] libenca: Move build host tool to
	PRE_BUILD_HOOKS
Message-ID: <20140307215451.E82E09BE0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0644378b51f1db66ee3a09ed236f675d40dbc9d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The make_hash host tool, should be built during a PRE_BUILD_HOOKS and
not a POST_CONFIGURE_HOOKS.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libenca/libenca.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libenca/libenca.mk b/package/libenca/libenca.mk
index d998c66..66fcfaa 100644
--- a/package/libenca/libenca.mk
+++ b/package/libenca/libenca.mk
@@ -21,6 +21,6 @@ define LIBENCA_MAKE_HOST_TOOL
 	$(MAKE) -C $(@D)/tools $(HOST_CONFIGURE_OPTS) make_hash
 endef
 
-LIBENCA_POST_CONFIGURE_HOOKS += LIBENCA_MAKE_HOST_TOOL
+LIBENCA_PRE_BUILD_HOOKS += LIBENCA_MAKE_HOST_TOOL
 
 $(eval $(autotools-package))
