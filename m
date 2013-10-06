From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 23:48:31 +0200
Subject: [Buildroot] [git commit] binutils: default to 2.22
Message-ID: <20131006215147.D84959B94D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9777dbedb012f68e54e14f9567d9dc0187d53b17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

2.21.1 is getting quite old, the linker issues with 2.22 seems to be
(mostly?) sorted out by now and armhf needs 2.22+, so let's bump the
default version.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index c2d2495..8f19597 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -4,7 +4,7 @@ choice
 	prompt "Binutils Version"
 	depends on !BR2_arc
 	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
-	default BR2_BINUTILS_VERSION_2_21_1
+	default BR2_BINUTILS_VERSION_2_22
 	help
 	  Select the version of binutils you wish to use.
 
