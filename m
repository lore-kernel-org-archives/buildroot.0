From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Mar 2012 23:03:08 +0100
Subject: [Buildroot] [git commit] debug: do not force installation of
	gdbserver
Message-ID: <20120315221627.7487E90DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c85f7f4082e480485e8a0f1549615b5b680d96ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_ENABLE_DEBUG option selects the compilation and installation
of gdbserver on the target. This is a bit restrictive, especially for
external toolchains, which may already contain a gdbserver on the
target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index 2002996..e07e52f 100644
--- a/Config.in
+++ b/Config.in
@@ -205,7 +205,6 @@ config BR2_DEPRECATED
 
 config BR2_ENABLE_DEBUG
 	bool "build packages with debugging symbols"
-	select BR2_PACKAGE_GDB_SERVER
 	help
 	  Build packages with debugging symbols
 	  enabled
