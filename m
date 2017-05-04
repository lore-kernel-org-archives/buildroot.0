From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:32:25 +0200
Subject: [Buildroot] [git commit] e2fsprogs: disable unneeded features for
	host
Message-ID: <20170504203649.155F980300@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a56b14d57b2326c9a3e8b9f53eddc17b541504a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't need e2initrd_helper or the test I/O manager for the host, just
like we don't need it for the target.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Arnout: don't add --disable-rpath, since we *do* need rpath for the
 host; otherwise we have to explicitly pass LD_LIBRARY_PATH to be able
 to run tools linked with util-linux' libuuid/libblkid]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/e2fsprogs.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index e0a7fa9..632fdc2 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -28,10 +28,12 @@ endif
 # Disable fuse2fs as well to avoid carrying over deps, and it's unused
 HOST_E2FSPROGS_CONF_OPTS = \
 	--disable-defrag \
+	--disable-e2initrd-helper \
 	--disable-fuse2fs \
 	--disable-libblkid \
 	--disable-libuuid \
-	--enable-symlink-install
+	--enable-symlink-install \
+	--disable-testio-debug
 
 # Set the binary directories to "/bin" and "/sbin" to override programs
 # installed by busybox.
