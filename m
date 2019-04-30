From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Apr 2019 13:17:59 +0200
Subject: [Buildroot] [git commit] package/strace: disable build for nds32
Message-ID: <20190430111513.B052483D90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14c9b9ed27660ca57c1b3759d566b743b0f10323
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Current version of strace does not support nds32.

Fixes:
http://autobuild.buildroot.net/results/05ec776548c9bede4878d4c3c43040c5b0aac182
http://autobuild.buildroot.net/results/24023f2fa3dbf7c281726abdbfd4322badaffbfb

Cc: Nylon Chen <nylon7@andestech.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strace/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index c7649e5789..38b4ebe32a 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_STRACE
 	bool "strace"
 	# needs at least kernel headers 4.0 on nios2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0 || !BR2_nios2
+	depends on !BR2_nds32
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
