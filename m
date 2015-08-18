From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 22:43:43 +0200
Subject: [Buildroot] [git commit branch/next] mtd: drop unconditional non
	LFS build
Message-ID: <20150818204412.AA81F81E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81cfbee3410e236a3e6c7a64c9bfbed821706482
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Buildroot removed non LFS support in the 2015.05 release. We now pass
-D_FILE_OFFSET_BITS=64 unconditionally, so the mtd WITHOUT_LARGEFILE make
variable has no effect.

[Thomas: keep using += for other assigments of MTD_MAKE_OPTS.]

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtd/mtd.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index edf6e08..42a8c1d 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -24,8 +24,6 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 MTD_DEPENDENCIES += busybox
 endif
 
-MTD_MAKE_OPTS = WITHOUT_LARGEFILE=1
-
 # If extended attributes are required, the acl package must
 # also be enabled which will also include the attr package.
 ifeq ($(BR2_PACKAGE_ACL),y)
