From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jun 2014 22:34:05 +0200
Subject: [Buildroot] [git commit] libwebsockets: needs mmu
Message-ID: <20140603213003.B012B9CE4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6b5bb518d28850e024b90db1129b7f86e9d416c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/92d/92d29c3f8ab0686c6de765c108937240a6649d18/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libwebsockets/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
index 1d927bb..2b350bf 100644
--- a/package/libwebsockets/Config.in
+++ b/package/libwebsockets/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBWEBSOCKETS
 	bool "libwebsockets"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ZLIB
 	help
 	  Libwebsockets is a lightweight pure C library built to use
