From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 22 Apr 2017 13:59:52 +0200
Subject: [Buildroot] [PATCH v8 09/12] e2fsprogs: disable unneeded features
	for host
In-Reply-To: <20170422115955.22718-1-arnout@mind.be>
References: <20170422115955.22718-1-arnout@mind.be>
Message-ID: <20170422115955.22718-10-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <casantos@datacom.ind.br>

We don't need e2initrd_helper or the test I/O manager for the host, just
like we don't need it for the target.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Arnout: don't add --disable-rpath, since we *do* need rpath for the
 target; otherwise we have to explicitly pass LD_LIBRARY_PATH to be
 able to run tools linked with util-linux' libuuid/libblkid]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/e2fsprogs/e2fsprogs.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index e0a7fa9354..632fdc250c 100644
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
-- 
2.11.0
