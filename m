From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 22:53:36 +0100
Subject: [Buildroot] [git commit] xtensa: disable package strace for Xtensa
Message-ID: <20130114215836.3CAB8999A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=413dcfdcf6d4df80626aebe6be13648773ace707
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current version of strace does not support the Xtensa architecture.

Signed-off-by: Chris Zankel <chris@zankel.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/strace/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index bbb582a..4b20377 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
+	depends on !BR2_xtensa
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
