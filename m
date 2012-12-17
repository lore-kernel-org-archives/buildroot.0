From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Dec 2012 07:25:29 +0100
Subject: [Buildroot] [git commit] package/libseccomp: works only on x86
Message-ID: <20121217062523.189CA9A2DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3472e094a18147ab8deefbb8dd47d07c041cc222
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As it is, the libseccomp code explicitly checks for x86 (32- or 64-bit),
so it can't work on other architectures.

Reported-by: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libseccomp/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
index 1e524d2..9ee1697 100644
--- a/package/libseccomp/Config.in
+++ b/package/libseccomp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBSECCOMP
 	bool "libseccomp"
+	depends on BR2_i386 || BR2_x86_64
 	help
 	  High level interface to the Linux Kernel's seccomp filter
 	  
