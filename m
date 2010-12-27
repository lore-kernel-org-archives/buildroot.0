From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Dec 2010 22:50:18 +0100
Subject: [Buildroot] [git commit master 1/1] package infra: fix versioned
	patches for host packages
Message-ID: <20101227222051.152BB8EB81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6908149bec720e6bb4c2d1e8d03331bcd4e3343b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without this patch we'd need separate versioned patch directories for
target and host packages, thus having unwanted duplication.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index c4a1cf8..92ce4e2 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -267,7 +267,7 @@ $(BUILD_DIR)/%/.stamp_patched:
 	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
 	  else \
 	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME) $($(NOHOSTPKG)_NAME)\*.patch $($(NOHOSTPKG)_NAME)\*.patch.$(ARCH) || exit 1; \
-	    if test -d $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER); then \
+	    if test -d $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME)/$(NAMEVER); then \
 	      toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH) || exit 1; \
 	    fi; \
 	  fi; \
-- 
1.7.2.2
