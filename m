From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 11:00:04 +0200
Subject: [Buildroot] [git commit] monit: needs threads support in toolchain
Message-ID: <20130605090358.A5DEB9A95D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=46ae86b3df6092cb29d647eaa6464400609d247b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/0b5/0b5838f3d11b45244f27bd2bcb092dd6a88fd39d

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/monit/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/monit/Config.in b/package/monit/Config.in
index 6933aaf..3127da9 100644
--- a/package/monit/Config.in
+++ b/package/monit/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MONIT
 	bool "monit"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Monit is a free open source utility for managing and
 	  monitoring, processes, programs, files, directories and
@@ -8,3 +9,6 @@ config BR2_PACKAGE_MONIT
 	  actions in error situations.
 
 	  http://mmonit.com/monit/
+
+comment "monit requires a toolchain with threads support"
+       depends on !BR2_TOOLCHAIN_HAS_THREADS
