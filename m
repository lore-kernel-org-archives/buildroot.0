From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 09:46:59 +0100
Subject: [Buildroot] [git commit] package/binutils: switch to use 2.29.x as
 the default version
Message-ID: <20180130085057.67FB685FC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37e1e6cf6d133afeed1be98c5d5542cd00664efb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that binutils 2.30 has been released, it is time to move to
binutils 2.29.x as the default binutils version, instead of 2.28.1.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 1ab3257f46..fd8a7fa981 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -2,7 +2,7 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_28_X if !BR2_arc
+	default BR2_BINUTILS_VERSION_2_29_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
 	  Select the version of binutils you wish to use.
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index e12fb86c93..0f7ff0048a 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2017.09-release
 else
-BINUTILS_VERSION = 2.28.1
+BINUTILS_VERSION = 2.29.1
 endif
 endif # BINUTILS_VERSION
 
