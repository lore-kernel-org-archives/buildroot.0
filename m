From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 21:51:41 +0100
Subject: [Buildroot] [git commit branch/next] libunistring: add wchar
	dependency
Message-ID: <20141126205154.9E4517FF25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8df26deab145425251fc3c6a0175a63e3fb10c0d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Even though libunistring itself builds fine, its library contains
undefined references to wchar related functions, which are causing
link failures when the library is actually linked into an application.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libunistring/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libunistring/Config.in b/package/libunistring/Config.in
index ebb37d9..88fc658 100644
--- a/package/libunistring/Config.in
+++ b/package/libunistring/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBUNISTRING
 	bool "libunistring"
+	depends on BR2_USE_WCHAR
 	help
 	  The libunistring library provides functions for manipulating
 	  Unicode strings and for manipulating C strings according to
 	  the Unicode standard.
 
 	  http://www.gnu.org/software/libunistring/
+
+comment "libunistring needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
