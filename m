From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat,  8 Aug 2020 17:14:11 -0600
Subject: [Buildroot] [PATCH 1/1] linux: set default aufs series and version
 based on kernel version
Message-ID: <20200808231411.105185-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set default commits for aufs to the latest available commit in each
version specific branch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 linux/Config.ext.in | 53 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 734a52a533..ce58de238e 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -99,6 +99,9 @@ if BR2_LINUX_KERNEL_EXT_AUFS
 
 choice
 	bool "aufs-standalone series"
+	default BR2_LINUX_KERNEL_EXT_AUFS_SERIES_5 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+	default BR2_LINUX_KERNEL_EXT_AUFS_SERIES_4 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	default BR2_LINUX_KERNEL_EXT_AUFS_SERIES_3 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	help
 	  Select the major series of this version. This must match the
 	  major version of your kernel (e.g. for kernels 3.x, select
@@ -127,7 +130,55 @@ config BR2_LINUX_KERNEL_EXT_AUFS_SERIES
 
 config BR2_LINUX_KERNEL_EXT_AUFS_VERSION
 	string "aufs-standalone version"
-	default ""
+	default "ac34d21c4044d0232f5ff74e5543e3793071c671" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
+	default "2ab5ec25767c8acf116ef7f8d3a896d0c357593e" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
+	default "9ba4e2c61e93f74711fe858f49bd255f5d829fb4" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
+	default "caffea77e5b1141c844a8a5fce066bfba42736cd" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	default "26428f642dce5b1c1455fa73ac77c3b51bafdd85" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
+	default "45f6f8eb62d2208316ad09bf9cce7d88537270f4" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
+	default "d051ff358d1072d71103b076ca2d7d163a17a3f8" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+	default "25f304c2c8c866b551ba7dc0c26b8fc1bbac95fa" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+	default "13c40c206b7a50bcc116bb512682ef588e0c985c" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+	default "0f5cf9757022f1dc050623455a196140e4f63eaa" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	default "c0cdacc30e85486a06a3b0d0a4c91accfd62e95d" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+	default "4662af5e51c2191aac6bea3fd1f1bc853e33bb12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
+	default "425ecd2b0837d5d7c12a0aae7c6c05910ead5cef" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
+	default "05375f52cab37d77602dd8cdb4a6b34a45de7689" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
+	default "105ac5581e1792f80f4520d4ab4072dfb863c818" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
+	default "78cbc7ffc120b21092a984808865f226764eed3b" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
+	default "31266c01bd88e0053f53f4580adcca03175947b2" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+	default "7a4d033447c622911653ff190dd5296b831468e1" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
+	default "aa5ef5e7a628817b6c2c89acddfc7976bb758bb6" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+	default "34be418bd4f0bb069e3971c76f5a8d8a6038558a" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	default "f1590cdde901ad19fa9800b1a35b557270f29fc0" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+	default "0228f4bae07367afbcccc7b1c98ec438c35fb60e" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
+	default "058f6e23530e4b38f60725537ad151098ee74437" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+	default "655770239032bc4dec1e591016e1a3a5307c9f6c" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
+	default "7b00655846641e84c87f9af94985f48e4bb0f2df" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
+	default "09faae00f970d044ccd90ea8cc9a34545b3ac24d" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
+	default "7696ae969ebcef1b7a74d0d0aeae8857dfb972c1" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+	default "779216b4d28c295a6f52787dc35962e6dedcdc8c" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
+	default "f3daf663294ae51cde1105450705a83d7f0abf84" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	default "2a2a3ee407810b4a3e19c3d5cfdb7f371d5df835" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
+	default "b5a25205ee21187e20e1d998f98763d09f442c26" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+	default "a511fd5b5b4a311c906e200ef8abc42d1387b94d" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+	default "cb287d372de85fad6a15afa198d7526383037381" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
+	default "19702ee73cdc4a102593969537938f3183d4b841" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+	default "b279b0bb265eb0c71c0420becd127c90f09b0003" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+	default "b8ca8d15cf8e635d310acab5e571e31399a842b2" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	default "fcc197ae3a575b6f1b2aa1e51fe250eaadd4292b" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	default "35fd8e89d9cbd3b665dd11c3ae901ac52b07bcbb" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
+	default "4a8ee1833947c5aba704bf09fad612f4c4ecd827" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	default "f88513f985e153aaf3e2950622c2a2329c3c3f8f" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+	default "e98c69e26250b411e51cc92bf73df2f0829d0759" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+	default "27b5f7469fe5259aa489e92fdb6d88900ec8c0a4" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	default "82d56105d0bdbdf5959b16f788fed4f6a530373f" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
+	default "3e310a136e71bb284a959d95c77f5b7af132280b" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+	default "bfbe10165cbfc0cd7b1d7e9c878f1a3f2b6872f1" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	default "df60b373c5f6c22835fdb8521b12973e9d6e06df" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+	default "5809bf47aeb6e8257691287f9a218660c110acc5" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	default "269a613efab1718fd587c2bfc945d095b57f56e2" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+	default "aa3d7447003abd5e3c437de52d8da2e6203390ac" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	help
 	  The version you choose must match that of your kernel.
 	  Usually, the sha1 of the cset you want to use; avoid using a
-- 
2.25.1
