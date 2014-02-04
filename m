From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 22:46:07 +0100
Subject: [Buildroot] [git commit] libsigsegv: disable for xtensa
Message-ID: <20140204214638.7D3648C62C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=868c6cebe4cfa87178188e0bfde0a48135a6f814
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The xtensa uClibc port does not provide the ucontext.h context manipulation
routines that libsigsegv needs.

Fixes:
http://autobuild.buildroot.net/results/06d/06d091f2ea8d08a900dd7304bab5eeeeb85f7353/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigsegv/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
index c46bb92..563ca27 100644
--- a/package/libsigsegv/Config.in
+++ b/package/libsigsegv/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBSIGSEGV
 	bool "libsigsegv"
+	depends on !BR2_xtensa
 	help
 	  Library for handling page faults in user mode.
 
