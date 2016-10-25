From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 21:35:55 +0200
Subject: [Buildroot] [git commit] swupdate: update lua check for libconfig
Message-ID: <20161025193623.C0BFE81E74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d55462df8495502738a3b7ffe1be56582ce79ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most probably this was missed in commit
65b2ae49feb310d3272a47c44cf3b406646b25c1 which removed pinning to Lua
5.2.

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/swupdate/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 5f5e1e7..d7217af 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_SWUPDATE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	# swupdate requires a parser and uses libconfig as default
-	select BR2_PACKAGE_LIBCONFIG if !BR2_PACKAGE_JSON_C && !BR2_PACKAGE_LUA_5_2
+	select BR2_PACKAGE_LIBCONFIG if !BR2_PACKAGE_JSON_C && \
+		!BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  swupdate provides a reliable way to update the software on an
 	  embedded system.
