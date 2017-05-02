From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 14:46:23 +0200
Subject: [Buildroot] [git commit] package/v*/Config.in: fix ordering of
	statements
Message-ID: <20170502124643.3F58E80497@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=759fb83b46035ea48ec9e7d58f98eaa72d03ccc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter v in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vtun/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index c1f6d38..bb8919c 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_VTUN
 	bool "vtun"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_USE_MMU # fork()
 	help
 	  Tool for easily creating Virtual Tunnels over TCP/IP networks
 	  with traffic shaping, compression, and encryption.
