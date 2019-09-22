From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Sep 2019 20:04:54 +0200
Subject: [Buildroot] [git commit] package/policycoreutils: drop host-setools
 dependency from host-policycoreutils
Message-ID: <20190922180710.9B7D08F0C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6136ecb0b0348d93cc762063daa224273352edb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no reason for host-policycoreutils to depend on host-setools,
it builds/works fine without it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/policycoreutils/policycoreutils.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 4f7176777c..ff606a7d17 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -60,8 +60,7 @@ define POLICYCOREUTILS_INSTALL_TARGET_CMDS
 	)
 endef
 
-HOST_POLICYCOREUTILS_DEPENDENCIES = \
-	host-libsemanage host-setools
+HOST_POLICYCOREUTILS_DEPENDENCIES = host-libsemanage
 
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 # large file support.
