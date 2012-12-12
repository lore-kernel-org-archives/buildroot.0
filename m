From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Dec 2012 17:11:05 +0100
Subject: [Buildroot] [git commit] boa: needs MMU
Message-ID: <20121212181633.B23789A1B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64c3ce4d886bea18f24231d09914c3be2ede144d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/0909856aea5ea5d13206c9a46b8b5174661239b4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/boa/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/boa/Config.in b/package/boa/Config.in
index 48943ff..982833a 100644
--- a/package/boa/Config.in
+++ b/package/boa/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BOA
 	bool "boa"
+	depends on BR2_USE_MMU # uses fork()
 	help
 	  A very small and very fast http daemon.  Not intended as
 	  a feature-packed server.
