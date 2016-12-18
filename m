From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 15:58:30 +0100
Subject: [Buildroot] [git commit] xfsprogs: remove comment about uClibc
	specific options
Message-ID: <20161218150018.07DA581772@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ddd7c9fbcd31059b387aa47c39e239e5d32b6bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xfsprogs now builds fine with Buildroot default uClibc configuration, so
there is no point in having a specific comment: we don't have this for
any other package, and it's basically impossible to maintain.

UCLIBC_SV4_DEPRECATED is still disabled in the Buildroot default uClibc
configuration, but xfsprogs builds fine without it.

UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is now enabled in the Buildroot default
uClibc configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xfsprogs/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 2c24cbb..6e1a935 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -1,7 +1,3 @@
-
-comment "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED and UCLIBC_HAS_OBSOLETE_BSD_SIGNAL enabled"
-	depends on BR2_PACKAGE_XFSPROGS
-
 comment "xfsprogs needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
