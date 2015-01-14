From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:27:41 +0100
Subject: [Buildroot] [git commit] rsyslog: doesn't need largefile/wchar
Message-ID: <20150114192851.43F1180DE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=435ae1e2b5f9437f6a1f85a232e8ef0d009bf36a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was added in 9b4696a4 but only partially removed in d89a2610
leading to a comment and the rsyslog option both being present in the
config menu if we're using a non-LFS toolchain.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsyslog/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index 69425f1..1f94104 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -11,6 +11,6 @@ config BR2_PACKAGE_RSYSLOG
 
 	  http://www.rsyslog.com
 
-comment "rsyslog needs a toolchain w/ largefile, wchar, threads"
+comment "rsyslog needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
