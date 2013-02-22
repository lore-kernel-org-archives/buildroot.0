From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Feb 2013 14:20:35 +0100
Subject: [Buildroot] [git commit] keyutils: needs mmu
Message-ID: <20130222132447.7F5849AC4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3dc86ad93759ccd110541f4dc535257e8084c414
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/ff84ee5335e3302dbb47d881d9903db81884014c

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/keyutils/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/keyutils/Config.in b/package/keyutils/Config.in
index 9b9f9bc..6978687 100644
--- a/package/keyutils/Config.in
+++ b/package/keyutils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KEYUTILS
 	bool "keyutils"
 	depends on !BR2_avr32 && !BR2_microblaze
+	depends on BR2_USE_MMU # fork()
 	help
 	  These tools are used to control the key management system
 	  built into the Linux kernel.
