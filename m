From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 14:52:27 +0200
Subject: [Buildroot] [git commit] strace: unavailable for AArch64 and ARC
Message-ID: <20130511141123.69C349A095@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e040c6310eb0de6049d45563ba767c2c9b191d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

strace isn't available for the AArch64 and ARC architectures.
The patchset for AArch64 is somewhat big and complicated (needs updates
to other bits) so it'd probably be better to use a git version of strace
or wait for a new release.
http://autobuild.buildroot.net/results/506f4adec348f0b616ad09bddbcbc242e38253b8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/strace/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index 4b20377..153bcf6 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
-	depends on !BR2_xtensa
+	depends on !(BR2_xtensa || BR2_aarch64 || BR2_arc)
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
