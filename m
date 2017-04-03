From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 22:26:30 +0200
Subject: [Buildroot] [git commit] binutils: switch to 2.27 as the default
	version
Message-ID: <20170403203031.2BD7782574@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43dd61e2eaa1d1c84efa140906e825cec8729dd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that binutils 2.28 is available, switch to binutils 2.27 as the
default version, for both the host variant and the target variant. Note
that the target variant, when no host variant is built, was still
2.25.1: we forgot to update it to 2.26 when the host version was updated
to 2.26.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index a031ab5..a554cad 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -3,7 +3,7 @@ comment "Binutils Options"
 choice
 	prompt "Binutils Version"
 	depends on !BR2_arc
-	default BR2_BINUTILS_VERSION_2_26_X
+	default BR2_BINUTILS_VERSION_2_27_X
 	help
 	  Select the version of binutils you wish to use.
 
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index c4e696f..ecba965 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2017.03-eng008
 else
-BINUTILS_VERSION = 2.25.1
+BINUTILS_VERSION = 2.27
 endif
 endif # BINUTILS_VERSION
 
