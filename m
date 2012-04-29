From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Apr 2012 10:03:52 -0300
Subject: [Buildroot] [PATCH 2/2] busybox 1.20.0: add buildsys patch
In-Reply-To: <1335704632-23164-1-git-send-email-gustavo@zacarias.com.ar>
References: <1335704632-23164-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1335704632-23164-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../busybox-1.20.0/busybox-1.20.0-buildsys.patch   |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.20.0/busybox-1.20.0-buildsys.patch

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
-- 
1.7.3.4
