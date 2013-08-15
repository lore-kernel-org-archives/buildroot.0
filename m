From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Aug 2013 18:34:00 +0200
Subject: [Buildroot] [git commit] netatalk: requires threads
Message-ID: <20130815163539.262879B3BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a87a6ca27d935df4a30b3df8fb04793d5ebec33f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/e19/e191a9e0768b632b84c3a8a8201538bd5fbe3708/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netatalk/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index 26f14c3..e3deaef 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NETATALK
 	bool "netatalk"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_BERKELEYDB
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBGCRYPT
@@ -9,3 +10,6 @@ config BR2_PACKAGE_NETATALK
 	  high-performance and reliable file server for Macintosh computers.
 
 	  http://netatalk.sourceforge.net/
+
+comment "netatalk requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
