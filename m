From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 14:09:10 +0200
Subject: [Buildroot] [git commit] nut: needs mmu
Message-ID: <20140406120931.7B82E9C550@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af9ff258f8fbfad8b9b9b281df6d4d75630f05c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While investigating on build failure [1], I realized that nut needs mmu since fork() is used.
So, conditions of this build failure are no longer encountered.

[1] http://autobuild.buildroot.net/results/961/96193e18782697c2af8813a7714b66b4ba1f3d1c//build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nut/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/nut/Config.in b/package/nut/Config.in
index 5b47e8b..7045787 100644
--- a/package/nut/Config.in
+++ b/package/nut/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NUT
 	bool "nut"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Network UPS tools
 
