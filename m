From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Apr 2012 17:06:10 +0200
Subject: [Buildroot] [git commit] busybox: 1.20.0 buildsys fix
Message-ID: <20120429171458.975AF96BFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=308e476a73771daee0dfb38ae1c918341a0d8955
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.20.0/busybox-1.20.0-buildsys.patch   |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox-1.20.0/busybox-1.20.0-buildsys.patch b/package/busybox/busybox-1.20.0/busybox-1.20.0-buildsys.patch
new file mode 100644
index 0000000..b9d2a5e
--- /dev/null
+++ b/package/busybox/busybox-1.20.0/busybox-1.20.0-buildsys.patch
@@ -0,0 +1,11 @@
+--- busybox-1.20.0/archival/libarchive/Kbuild.src
++++ busybox-1.20.0-buildsys/archival/libarchive/Kbuild.src
+@@ -60,7 +60,7 @@ lib-$(CONFIG_FEATURE_SEAMLESS_GZ)
+ lib-$(CONFIG_FEATURE_SEAMLESS_BZ2)      += open_transformer.o decompress_bunzip2.o
+ lib-$(CONFIG_FEATURE_SEAMLESS_LZMA)     += open_transformer.o decompress_unlzma.o
+ lib-$(CONFIG_FEATURE_SEAMLESS_XZ)       += open_transformer.o decompress_unxz.o
+-lib-$(CONFIG_FEATURE_COMPRESS_USAGE)    += decompress_bunzip2.o
++lib-$(CONFIG_FEATURE_COMPRESS_USAGE)    += open_transformer.o decompress_bunzip2.o
+ lib-$(CONFIG_FEATURE_COMPRESS_BBCONFIG) += decompress_bunzip2.o
+ lib-$(CONFIG_FEATURE_TAR_TO_COMMAND)    += data_extract_to_command.o
+ 
