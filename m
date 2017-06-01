From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:43:00 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/hans: fix build
	failures with high 'make -j' values
Message-ID: <20170601144624.92D3F8296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15391f30f7b302b2cf8263d9f132814cfb56f563
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The top-level doesn't handle correctly the build dependencies
between .o files.

Since hans doesn't take too many time to build, just use MAKE1.

Fixes:
http://autobuild.buildroot.net/results/d14/d142f4a439d4d5fcc89865abde3e593c45ad5d96
http://autobuild.buildroot.net/results/28e/28ed230e40cc154db9274f9765085cd7f0eee85a
http://autobuild.buildroot.net/results/900/9008c3be3bcf46f0fc21a34f48e3cf9da1397d9a

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 17aa47fa2cf1cd60809aa70500e8611b6f3abebf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hans/hans.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hans/hans.mk b/package/hans/hans.mk
index 5111d46..c10ae65 100644
--- a/package/hans/hans.mk
+++ b/package/hans/hans.mk
@@ -10,7 +10,7 @@ HANS_LICENSE = GPLv3+
 HANS_LICENSE_FILES = LICENSE
 
 define HANS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) GCC="$(TARGET_CC)" GPP="$(TARGET_CXX)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE1) GCC="$(TARGET_CC)" GPP="$(TARGET_CXX)" -C $(@D)
 endef
 
 define HANS_INSTALL_TARGET_CMDS
