From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 22:55:57 +0100
Subject: [Buildroot] [git commit] toolchain/buildroot: default to eglibc for
	mips64
Message-ID: <20131201201520.919719BE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc044cdfe27d743e235fa8bffcdbafaabb63e297
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc only works well for O32 ABI on mips64, so default to eglibc that
works just fine with N32 & N64 ABIs as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 8b37127..f8dd3de 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -5,6 +5,7 @@ source "package/linux-headers/Config.in.host"
 
 choice
 	prompt "C library"
+	default BR2_TOOLCHAIN_BUILDROOT_EGLIBC if BR2_mips64 || BR2_mips64el
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc"
