From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 20:51:53 +0200
Subject: [Buildroot] [git commit] ltris: needs MMU
Message-ID: <20140728202918.0FAF39D325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2ba4b2c4bd441269defdbd03d8b4b891416ae81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package needs MMU. Hence added dependency on BR2_USE_MMU

Fixes:
http://autobuild.buildroot.net/results/5cf/5cf2262460a72ce51b479a42fca61cea5f6e23fd//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltris/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ltris/Config.in b/package/ltris/Config.in
index b4e0ccf..bf5240d 100644
--- a/package/ltris/Config.in
+++ b/package/ltris/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LTRIS
 	bool "LTris"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_SDL
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
