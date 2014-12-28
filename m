From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Dec 2014 12:24:46 +0100
Subject: [Buildroot] [git commit] binutils: default to 2.24
Message-ID: <20141228112515.44DC8800E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8973107464a8e17a21487a64fdf42a2d941e79c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

2.22 is getting quite old (Nov 2011) and we've recently added 2.25. 2.24 has
been used for the "new" architectures for a while and there's no known
issues going to 2.24 for the rest, so bump the default version.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index af046ae..6dac3c0 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -3,8 +3,7 @@ comment "Binutils Options"
 choice
 	prompt "Binutils Version"
 	depends on !BR2_arc
-	default BR2_BINUTILS_VERSION_2_24 if BR2_microblaze || BR2_powerpc64le
-	default BR2_BINUTILS_VERSION_2_22
+	default BR2_BINUTILS_VERSION_2_24
 	help
 	  Select the version of binutils you wish to use.
 
