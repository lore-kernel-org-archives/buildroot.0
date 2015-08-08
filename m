From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:31 -0000
Subject: [Buildroot] [git commit branch/next] ntfs-3g: fix incorrect comment
	dependency
Message-ID: <20150808105631.81C9B7FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01d389191f461dc170b2dff7538520f83e33923d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The comment for ntfs-3g displays even when the package has met its
necessary dependencies.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntfs-3g/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index a860498..d6d1481 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -32,4 +32,4 @@ endif
 
 comment "ntfs-3g needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS && BR2_STATIC_LIBS)
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
