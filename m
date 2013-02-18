From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Feb 2013 13:07:21 +0100
Subject: [Buildroot] [git commit] ntfs-3g: needs mmu
Message-ID: <20130218120904.D9BA19AB0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b88c0e4510457fefc6603243d4ff16a2d7a90fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The internal libfuse-lite implementation uses it, and since the external
full-blown libfuse also requires it there's no other choice.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ntfs-3g/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index 1d3e2fb..be19a57 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_NTFS_3G
 	bool "ntfs-3g"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU
 	help
 	  The NTFS-3G driver is an open source, freely available
 	  read/write NTFS driver for Linux, FreeBSD, Mac OS X, NetBSD,
