From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Apr 2014 10:58:46 +0200
Subject: [Buildroot] [git commit] Revert "acpid: unavailable for external
	uClibc toolchains"
Message-ID: <20140425085923.C373A9C9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=201e133d4a9c4ff8ecea47cb6c442c6a8aa56a2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit ec6aaa4706d6826aca4e48ea65bbebbd893f76d6.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpid/Config.in |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/acpid/Config.in b/package/acpid/Config.in
index 205a6ae..5aec7f1 100644
--- a/package/acpid/Config.in
+++ b/package/acpid/Config.in
@@ -1,9 +1,6 @@
 config BR2_PACKAGE_ACPID
 	bool "acpid"
 	depends on BR2_x86_64 || BR2_i386
-	# Usually lacks MSG_CMSG_CLOEXEC
-	depends on !BR2_TOOLCHAIN_EXTERNAL_UCLIBC && \
-		!BR2_UCLIBC_VERSION_0_9_32
 	help
 	  Advanced Configuration and Power Interface event daemon.
 
