From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 May 2014 14:06:01 +0200
Subject: [Buildroot] [git commit] toolchain/buildroot: default to uClibc
Message-ID: <20140506120613.5849E9CB16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=493b1177b970565fb407ad121a297d8efc10def2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise we're getting musl for everything except those who have a
default (mips64*).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 1bd3f92..216f9db 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -22,6 +22,7 @@ source "package/linux-headers/Config.in.host"
 
 choice
 	prompt "C library"
+	default BR2_TOOLCHAIN_UCLIBC
 	default BR2_TOOLCHAIN_BUILDROOT_EGLIBC if BR2_mips64 || BR2_mips64el
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
