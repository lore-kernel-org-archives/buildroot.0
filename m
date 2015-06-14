From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 14:50:07 +0200
Subject: [Buildroot] [git commit] uclibc: use uClibc-ng by default
Message-ID: <20150614125125.B6D5E807EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68d4a3b5a6a6d03d67418e0b637628ecf9cbf192
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the uClibc project is not making any release since about 3
years, and the uClibc-ng project is now alive and delivering regular
releases based on uClibc master plus a number of fixes, let's make
uClibc-ng the default uClibc version used by Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/uclibc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index dd23853..9b29ae5 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -18,7 +18,7 @@ config BR2_UCLIBC_VERSION_SUPPORTS_NPTL
 
 choice
 	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_0_9_33
+	default BR2_UCLIBC_VERSION_NG
 	help
 	  Select the version of uClibc you wish to use.
 
