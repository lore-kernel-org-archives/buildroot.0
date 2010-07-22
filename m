From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 13:08:24 +0200
Subject: [Buildroot] [git commit master 1/1] wsapi: needs largefile support
	(for luafilesystem)
Message-ID: <20100722110847.2A7F582DFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5af328d2dd289736670ecde6f4515ca953859b83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wsapi/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/wsapi/Config.in b/package/wsapi/Config.in
index 3621648..472bbfc 100644
--- a/package/wsapi/Config.in
+++ b/package/wsapi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WSAPI
 	bool "wsapi"
+	depends on BR2_LARGEFILE # luafilesystem
 	select BR2_PACKAGE_COXPCALL
 	select BR2_PACKAGE_LUAFILESYSTEM
 	select BR2_PACKAGE_RINGS
@@ -7,3 +8,6 @@ config BR2_PACKAGE_WSAPI
 	  API that abstracts the web server from Lua web applications.
 
 	  http://keplerproject.github.com/wsapi/
+
+comment "wsapi requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
-- 
1.7.1
