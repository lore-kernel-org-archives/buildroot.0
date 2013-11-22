From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 12:04:01 +0100
Subject: [Buildroot] [git commit] mdadm: needs mmu
Message-ID: <20131122145920.D48849BD8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2f11a9286e69d946c147e4a2cc5a96642ac8f8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/52c/52cc56df2aa278d92141918de74833d7e4fd3d47/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mdadm/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/mdadm/Config.in b/package/mdadm/Config.in
index c513348..e0d606b 100644
--- a/package/mdadm/Config.in
+++ b/package/mdadm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MDADM
 	bool "mdadm"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Utility for managing Linux Software RAID arrays.
 
