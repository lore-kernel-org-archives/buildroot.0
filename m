From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 18 Dec 2012 14:27:48 +0100
Subject: [Buildroot] [git commit] libseccomp: Fix install option order
Message-ID: <20121218132915.9ADA79A389@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12a7f9971a21df925ddab85b059e7d43f09159d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ca0e5152 introduced a bad option order, leading to another build
failure.

Fixes
http://autobuild.buildroot.org/results/0e7de5e7c792b5ef195ee98fe1e7bb1c6b220bfb/build-end.log

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...eccomp-0002-Remove-the-dependency-on-proc.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libseccomp/libseccomp-0002-Remove-the-dependency-on-proc.patch b/package/libseccomp/libseccomp-0002-Remove-the-dependency-on-proc.patch
index 82ae44a..081bca7 100644
--- a/package/libseccomp/libseccomp-0002-Remove-the-dependency-on-proc.patch
+++ b/package/libseccomp/libseccomp-0002-Remove-the-dependency-on-proc.patch
@@ -32,7 +32,7 @@ index 6162900..eb61ead 100644
 -		$(INSTALL) -o $(INSTALL_OWNER) -g $(INSTALL_GROUP) -m 0644 \
 -			"$$(cat /proc/$$$$/cmdline | awk '{print $$(NF)}')" \
 -			"$(INSTALL_LIB_DIR)/pkgconfig"; \#
-+		$(INSTALL) -t -o $(INSTALL_OWNER) -g $(INSTALL_GROUP) -m 0644 \
++		$(INSTALL) -o $(INSTALL_OWNER) -g $(INSTALL_GROUP) -m 0644 -t \
 +			"$(INSTALL_LIB_DIR)/pkgconfig"
  
  ifeq ($(V),0)
