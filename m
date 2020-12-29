From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 12:01:13 +0100
Subject: [Buildroot] [PATCH 05/10 v3] WIP: boot+packages: update hash to new
 git-tarballs format
In-Reply-To: <cover.1609239666.git.yann.morin.1998@free.fr>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
Message-ID: <29b653935ed3ec38f7e0bb05445be7e99473aa5d.1609239666.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

** WIP: should be squashed with the commit that updates the git backend

Of all the bootloaders that have a git download method, vexpress-firmware
is the only one to have a hash. Others have no hash files, or they have
explicitly set BR_NO_CHECK_HASH_FOR.

For the packages, linux-headers is the special snowflake, as the git
download is only for custom git tree, so it is excluded from the hash
verification with BR_NO_CHECK_HASH_FOR.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
---
 boot/vexpress-firmware/vexpress-firmware.hash               | 2 +-
 package/aer-inject/aer-inject.hash                          | 2 +-
 package/am33x-cm3/am33x-cm3.hash                            | 2 +-
 package/armbian-firmware/armbian-firmware.hash              | 2 +-
 package/at/at.hash                                          | 2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash                | 2 +-
 package/bayer2rgb-neon/bayer2rgb-neon.hash                  | 4 ++--
 package/brickd/brickd.hash                                  | 4 ++--
 package/c-capnproto/c-capnproto.hash                        | 2 +-
 package/dbus-triggerd/dbus-triggerd.hash                    | 2 +-
 package/dt-utils/dt-utils.hash                              | 4 ++--
 package/dtv-scan-tables/dtv-scan-tables.hash                | 6 +++---
 package/edid-decode/edid-decode.hash                        | 2 +-
 package/ell/ell.hash                                        | 2 +-
 package/flashbench/flashbench.hash                          | 2 +-
 package/fmc/fmc.hash                                        | 2 +-
 package/fmlib/fmlib.hash                                    | 2 +-
 .../freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash    | 2 +-
 package/freescale-imx/imx-lib/imx-lib.hash                  | 2 +-
 package/google-breakpad/google-breakpad.hash                | 2 +-
 package/gstreamer1/gst1-interpipe/gst1-interpipe.hash       | 2 +-
 package/gstreamer1/gst1-shark/gst1-shark.hash               | 2 +-
 package/imx-mkimage/imx-mkimage.hash                        | 4 ++--
 package/iwd/iwd.hash                                        | 2 +-
 package/kvm-unit-tests/kvm-unit-tests.hash                  | 2 +-
 package/kvmtool/kvmtool.hash                                | 2 +-
 package/libbroadvoice/libbroadvoice.hash                    | 4 ++--
 package/libcamera/libcamera.hash                            | 2 +-
 package/libclc/libclc.hash                                  | 4 ++--
 package/libg7221/libg7221.hash                              | 4 ++--
 package/libilbc/libilbc.hash                                | 4 ++--
 package/libsilk/libsilk.hash                                | 4 ++--
 package/libsvgtiny/libsvgtiny.hash                          | 4 ++--
 package/libuci/libuci.hash                                  | 2 +-
 package/libyuv/libyuv.hash                                  | 4 ++--
 package/linux-firmware/linux-firmware.hash                  | 2 +-
 package/linux-syscall-support/linux-syscall-support.hash    | 2 +-
 package/minicom/minicom.hash                                | 2 +-
 package/mmc-utils/mmc-utils.hash                            | 4 ++--
 package/net-tools/net-tools.hash                            | 2 +-
 package/netcat-openbsd/netcat-openbsd.hash                  | 4 ++--
 package/netsurf-buildsystem/netsurf-buildsystem.hash        | 2 +-
 package/odhcp6c/odhcp6c.hash                                | 2 +-
 package/opkg-utils/opkg-utils.hash                          | 2 +-
 package/piglit/piglit.hash                                  | 2 +-
 package/prelink-cross/prelink-cross.hash                    | 2 +-
 package/psplash/psplash.hash                                | 4 ++--
 package/qoriq-rcw/qoriq-rcw.hash                            | 4 ++--
 package/qt-webkit-kiosk/qt-webkit-kiosk.hash                | 2 +-
 package/qt5/qt5coap/qt5coap.hash                            | 2 +-
 package/qt5/qt5knx/qt5knx.hash                              | 2 +-
 package/qt5/qt5mqtt/qt5mqtt.hash                            | 2 +-
 package/rtc-tools/rtc-tools.hash                            | 4 ++--
 package/rtmpdump/rtmpdump.hash                              | 4 ++--
 package/speexdsp/speexdsp.hash                              | 4 ++--
 package/stm32flash/stm32flash.hash                          | 4 ++--
 package/ti-sgx-demos/ti-sgx-demos.hash                      | 4 ++--
 package/ti-sgx-km/ti-sgx-km.hash                            | 2 +-
 package/ti-sgx-um/ti-sgx-um.hash                            | 2 +-
 package/trace-cmd/trace-cmd.hash                            | 6 +++---
 package/tremor/tremor.hash                                  | 4 ++--
 package/ubus/ubus.hash                                      | 2 +-
 package/uclibc-ng-test/uclibc-ng-test.hash                  | 2 +-
 package/uemacs/uemacs.hash                                  | 4 ++--
 package/uhttpd/uhttpd.hash                                  | 2 +-
 package/ustream-ssl/ustream-ssl.hash                        | 4 ++--
 package/vboot-utils/vboot-utils.hash                        | 2 +-
 package/wilink-bt-firmware/wilink-bt-firmware.hash          | 4 ++--
 .../xdriver_xf86-video-imx-viv.hash                         | 2 +-
 .../xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash  | 2 +-
 70 files changed, 98 insertions(+), 98 deletions(-)

diff --git a/boot/vexpress-firmware/vexpress-firmware.hash b/boot/vexpress-firmware/vexpress-firmware.hash
index 40f64c7528..565373e3f1 100644
--- a/boot/vexpress-firmware/vexpress-firmware.hash
+++ b/boot/vexpress-firmware/vexpress-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 def599c86ab3606f7f67c0190e9b237fbc0cf934a951ffb1c5fb0c47d8a8f3d2	vexpress-firmware-901f81977c3b367a2e0bf3d6444be302822d97a3.tar.gz
+sha256  ea92d686e6e211074fb0f62cb5e011f4cfc294c7f6ec9fb27b7d987db7bf51c5  vexpress-firmware-901f81977c3b367a2e0bf3d6444be302822d97a3_br1.tar.gz
diff --git a/package/aer-inject/aer-inject.hash b/package/aer-inject/aer-inject.hash
index ee097c873a..acccb23021 100644
--- a/package/aer-inject/aer-inject.hash
+++ b/package/aer-inject/aer-inject.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  49a44b7a9e3983dc15fdc5bacd0e095df650296024f43f9d6c080ad54de0b07f  aer-inject-9bd5e2c7886fca72f139cd8402488a2235957d41.tar.gz
+sha256  2dd2bd73aa738c1cc26ba04b6e502329778d18c2cc873c0bd00e6b2d38e9477c  aer-inject-9bd5e2c7886fca72f139cd8402488a2235957d41_br1.tar.gz
 sha256  659a191d8775e05c6c6a9a4ba66b3577c577342bb83f20d393135eb6633c8973  README
diff --git a/package/am33x-cm3/am33x-cm3.hash b/package/am33x-cm3/am33x-cm3.hash
index a63ba64a3c..3776f07641 100644
--- a/package/am33x-cm3/am33x-cm3.hash
+++ b/package/am33x-cm3/am33x-cm3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a722098b362f58f4dfb2a7c30afd604424d435b3d5ebe6ebf5d76ad942f796d0  am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365.tar.gz
+sha256  c0b11d7ed2300172354f2948e858ddb5cae19d084bd1ab6d48cfa7b6bfa13261  am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365_br1.tar.gz
 sha256  e136e6949a1d3ca144374375af8b9387faa11d2eee7debff8cf22ca8fe7bf7e9  License.txt
diff --git a/package/armbian-firmware/armbian-firmware.hash b/package/armbian-firmware/armbian-firmware.hash
index edbc9c8282..1bd3f55993 100644
--- a/package/armbian-firmware/armbian-firmware.hash
+++ b/package/armbian-firmware/armbian-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  975bc377728496006f058317cccc88e2d3c4ab172ee3df08cfd085cf13221752  armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e.tar.gz
+sha256  a370a6aeb30f12a17f8d47c81a4d81aa822b9408589305a4d6a67d544280520d  armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e_br1.tar.gz
diff --git a/package/at/at.hash b/package/at/at.hash
index 108a2c06ff..a8e028cffc 100644
--- a/package/at/at.hash
+++ b/package/at/at.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  9ae5761a1fb897cda3a6f14439bed33cda33c0eedfcee6866e3d2ebad67fbd2f  at-7c74fa1aece6bc6db351763dc012193d5d634b7e.tar.gz
+sha256  cf00bc31a595dcacec1fee817460c81a1e0fb046e5c0984a13ca13c0f8fb779c  at-7c74fa1aece6bc6db351763dc012193d5d634b7e_br1.tar.gz
 
 sha256  01dccc0975aa9ba1a9f83e7c5e04f16077353d3c72a0a759b8846ee7a5b2b616  Copyright
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index 1151dcc9ed..d91647c6b4 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  1139a469c0c097ef3b6ecfca4527ee5c8ff1cfcb16b5bd1739129c528cd53416  azure-iot-sdk-c-LTS_07_2020_Ref02.tar.gz
+sha256  61874790b66c7e120550fdffff88cb1e3cbfbfebcf324e41982f04461f8793a0  azure-iot-sdk-c-LTS_07_2020_Ref02_br1.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.hash b/package/bayer2rgb-neon/bayer2rgb-neon.hash
index 1f4f5f33b3..327744c328 100644
--- a/package/bayer2rgb-neon/bayer2rgb-neon.hash
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1a84dcf6557c2017ebe258502f60575e0971511c548fc88aee5ab68ca0bb268a bayer2rgb-neon-bef3ecafe290d61a50fd27da3e5d0df6f4b88045.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
+sha256  d2e3e97bb9da218f223c03b2f080c5da727224e6e4cb99979398971110dfae04  bayer2rgb-neon-bef3ecafe290d61a50fd27da3e5d0df6f4b88045_br1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/brickd/brickd.hash b/package/brickd/brickd.hash
index 8de57a9b82..48ca412abd 100644
--- a/package/brickd/brickd.hash
+++ b/package/brickd/brickd.hash
@@ -1,5 +1,5 @@
 # Locally computed hash
-sha256 0b79f1ccd6fa644d7ecb2e17b19f9ffbf6374702ae9ac536b2c4a0b8b2cfe160 brickd-ev3dev-stretch_1.2.1.tar.gz
+sha256  205f581103512599cb10992275da8c7207ed732e1a686600877c51b7a742de73  brickd-ev3dev-stretch_1.2.1_br1.tar.gz
 
 # Hashes for license files:
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
diff --git a/package/c-capnproto/c-capnproto.hash b/package/c-capnproto/c-capnproto.hash
index 75edaebf91..470ed758a6 100644
--- a/package/c-capnproto/c-capnproto.hash
+++ b/package/c-capnproto/c-capnproto.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  88c454f4f4bad87c9b60cd739c7da5605c1085c0e92b317dd72d547bbb804279  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d.tar.gz
+sha256  1e35ef786bd8e418ff04fccb20ac881a87fa2fa76df1cbddc4774e35423bafb8  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d_br1.tar.gz
 sha256  27797e6c7dce96675d79ed250584d157b7a86405db6eb6fba9644e6d96d42c57  COPYING
diff --git a/package/dbus-triggerd/dbus-triggerd.hash b/package/dbus-triggerd/dbus-triggerd.hash
index b7ed89abf7..ad8d544e1f 100644
--- a/package/dbus-triggerd/dbus-triggerd.hash
+++ b/package/dbus-triggerd/dbus-triggerd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3c6d865427bf1b93b16323c796ed6957ce6b2b6fd53f518b1b082d03b939102c  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09.tar.gz
+sha256  930cccfe8bdff98cab0cff003d90f9421858850d2d00143108191b62b4ef5e5a  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09_br1.tar.gz
 sha256  30d135650639af9019633690fc1aecbfc150aeeef9446347d4286a58338d10b0  dbus-triggerd.c
diff --git a/package/dt-utils/dt-utils.hash b/package/dt-utils/dt-utils.hash
index 3610fe164f..f60a5b38e0 100644
--- a/package/dt-utils/dt-utils.hash
+++ b/package/dt-utils/dt-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 61440ab222543268923175eb5c7425076d2b8bce4c1dfc177f2eb3873449af7c  dt-utils-v2019.01.0.tar.gz
-sha256 a45932c79317d15116eadbf1c9c6fc59117ec3c4621db3a876066defa723963b  COPYING
+sha256  737313719d7c04d7b9576fdc572d838c81ea22ea41a44c7646467018e67a0b97  dt-utils-v2019.01.0_br1.tar.gz
+sha256  a45932c79317d15116eadbf1c9c6fc59117ec3c4621db3a876066defa723963b  COPYING
diff --git a/package/dtv-scan-tables/dtv-scan-tables.hash b/package/dtv-scan-tables/dtv-scan-tables.hash
index 73e0e7d19a..ce75af66ea 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.hash
+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 76cb6131df1b35ed71b0f6c87cfafc188d614cfbd9973e7832a65ba63e85c504  dtv-scan-tables-6d019038cd04e837d9dd58701202c15924c1c654.tar.gz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-sha256 4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
+sha256  fc65b1f85195ab3d877f7ce802dc62b8c70b3a1815fa6e6a69de19a9d354c19a  dtv-scan-tables-6d019038cd04e837d9dd58701202c15924c1c654_br1.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
index 3d7e945406..97060526c7 100644
--- a/package/edid-decode/edid-decode.hash
+++ b/package/edid-decode/edid-decode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  327fe14531ddebe74a730efc30209e68efbd86c11375b5576cbe23af3d691150  edid-decode-188950472c19492547e298b27f9da0d72cf826df.tar.gz
+sha256  c1a6222083c59f0499b3e43c159aee7e4c6c07d33b790d490a13fd62942fa9b5  edid-decode-188950472c19492547e298b27f9da0d72cf826df_br1.tar.gz
 sha256  9bc7ab961e9a07dc84eaa0210af388def56d024357e79671fb89fe27d073eed7  LICENSE
diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index b93c43a49d..b56bd49277 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  3f17aaaec2ad8eb8471ff2b18cc8d1bf48e55086bd95d22f327f06fde7c1c277  ell-0.35.tar.gz
+sha256  c2b3848568c75bcf5a0e7d1f2efce4fdb2733d28226ed21c6a6542f0be05d784  ell-0.35_br1.tar.gz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/flashbench/flashbench.hash b/package/flashbench/flashbench.hash
index f82d7f0eed..3d740bf35f 100644
--- a/package/flashbench/flashbench.hash
+++ b/package/flashbench/flashbench.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  12e2dcb6f041ef1a303fc5bc84642ed637c24d77ed6c667a2187f21d54555731  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0.tar.gz
+sha256  422860966ad3528a7fd1dc88e4aa0b2bd91f11fa6429523b9acd21dc5beb6a19  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0_br1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index d31bb5e794..4316a21e82 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a91e0c9b7c7f238634c64a755c05671f33f2acdb6ae2d09cad4d683b364ee8e4  fmc-fsl-sdk-v2.0.tar.gz
+sha256  cb896ec1fac2fe9a3a9bb8be2221b79acf5f9b75841609a681db0d9e7bec02a0  fmc-fsl-sdk-v2.0_br1.tar.gz
 sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  COPYING
diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
index 9143ac2c37..d02e558cc9 100644
--- a/package/fmlib/fmlib.hash
+++ b/package/fmlib/fmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e5870756c7432b15f7a48b860625808f3c95d5f7fa5e251552eb2324ca51b0fa  fmlib-fsl-sdk-v2.0.tar.gz
+sha256  59415d346af1d22f510f2785be4c7e3606dc3181476a666e832270550f7d44a6  fmlib-fsl-sdk-v2.0_br1.tar.gz
 sha256  837559e20d83910a005e7883b876cc5c42805fe4abcf7e5c5b3c8d036b7f61c8  COPYING
diff --git a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
index b0f47080ce..71fd1cd125 100644
--- a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
+++ b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  e76a71e9166fbedeaa535fd7ebc07edc30a1e87f529ab2aa733e3603d3183ed0  imx-alsa-plugins-rel_imx_4.9.x_1.0.0_ga.tar.gz
+sha256  a9a5ef408a7329c2c5fa2a084ae7824afbfbebed68612bd72509488ccb0b94b3  imx-alsa-plugins-rel_imx_4.9.x_1.0.0_ga_br1.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING.GPL
diff --git a/package/freescale-imx/imx-lib/imx-lib.hash b/package/freescale-imx/imx-lib/imx-lib.hash
index c16dc7f9a9..bcbb6e7878 100644
--- a/package/freescale-imx/imx-lib/imx-lib.hash
+++ b/package/freescale-imx/imx-lib/imx-lib.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  ced5ad0a179887ef1dd93e8103a9ab7372017cc1c241d28cded164cdece4b918  imx-lib-3f777974c0c146817e2ff5cb0340ca66a1f99e57.tar.gz
+sha256  cad7823568cbd367ed8525e01c8c11a2393fc2dc481425273cb7919385367c61  imx-lib-3f777974c0c146817e2ff5cb0340ca66a1f99e57_br1.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING-LGPL-2.1
diff --git a/package/google-breakpad/google-breakpad.hash b/package/google-breakpad/google-breakpad.hash
index 81715ec573..7b4ff2141e 100644
--- a/package/google-breakpad/google-breakpad.hash
+++ b/package/google-breakpad/google-breakpad.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6f444233e88957c30cc2d5497ee9d72d104122ce2c25a7ef7f6be3af1b3f7353  google-breakpad-7515ab13768c7edc09f0f2ec2354dc6c928239a6.tar.gz
+sha256  3504639ee5d7536e7f7939b80520dfcb98863e9b50673dd577d0ab2a07105acb  google-breakpad-7515ab13768c7edc09f0f2ec2354dc6c928239a6_br1.tar.gz
 sha256  f9752a0a4ac5215eaa3a4f0ec29cd52563c883de5d7870525cc0bc3a21cb8e15  LICENSE
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index ec93e4e752..c43b44f1b3 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  2fc8dcbe84f3968ee31d724f8a44e078bb5338682d97e4b5ddfc4bfa2d04ab5f  gst1-interpipe-v1.1.3.tar.gz
+sha256  48ad146a57f3543b8c32985b042558bf1fe67abeac9532105ebde0b441564cba  gst1-interpipe-v1.1.3_br1.tar.gz
 
 # Hashes for license files:
 sha256  16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5  COPYING
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.hash b/package/gstreamer1/gst1-shark/gst1-shark.hash
index 6b4d59f07e..29d6edd078 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.hash
+++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  24d910c2e7b4c66c804e53e9f3fc18fb61b0d3b82d8580f0fa9c2b1c563e5ab3  gst1-shark-v0.7.2.tar.gz
+sha256  b141312603af82f600981dd7231e2ecc5a42b3550fadd2450965a0a85f62cbb2  gst1-shark-v0.7.2_br1.tar.gz
 
 # Hashes for license files:
 sha256  6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index e06706070d..c0c8f2e67f 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 19745a7b9d06a420e7574328de65e6f5f7e82c87beed926c8f0f6bd1512afbe6  imx-mkimage-rel_imx_5.4.47_2.2.0.tar.gz
-sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  482d10bf59dd9ae87ae5e29305e338a35f8fa3bc4ec40c61ada232f682f2358f  imx-mkimage-rel_imx_5.4.47_2.2.0_br1.tar.gz
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 77a84f156e..dd3e10da3d 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  4f0007fb7594fe59baed71fb72c8390c472ff11c38b75d1f673375d4129ba5e2  iwd-1.10.tar.gz
+sha256  c3ea43eccf27bb92d4e4482ff407cdabd2d1a1e4647d646241de87f2774e9a20  iwd-1.10_br1.tar.gz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
index 3458778937..c6de6afa71 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.hash
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  346c543de9e953db283072e1c591cab9d0eb775f7fb1fff3d7560f38bdf6bdf2  kvm-unit-tests-kvm-unit-tests-20171020.tar.gz
+sha256  e476443cd76c8f540734e075b419638b2f200ae002986d6fc14076d410f3751e  kvm-unit-tests-kvm-unit-tests-20171020_br1.tar.gz
 sha256  d9bbb60891710d248f01c8bdac50ef7ad39188de512610437872e83112b38a1b  COPYRIGHT
diff --git a/package/kvmtool/kvmtool.hash b/package/kvmtool/kvmtool.hash
index fd841c354c..183ca52dcb 100644
--- a/package/kvmtool/kvmtool.hash
+++ b/package/kvmtool/kvmtool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2d55e4521ac040b870db015e1f075d69b89f940242d7ce5708f7d7060d62c0cc  kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e.tar.gz
+sha256  e2eb2cd8b31d24484e3095923cfe8c36d4b92741b76965cafaed6be3835369c6  kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e_br1.tar.gz
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
diff --git a/package/libbroadvoice/libbroadvoice.hash b/package/libbroadvoice/libbroadvoice.hash
index 6d5afa8dbe..7a352ef9ad 100644
--- a/package/libbroadvoice/libbroadvoice.hash
+++ b/package/libbroadvoice/libbroadvoice.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b68c91d5af6e493c3d4fc3be04825e109a7593fe4de8c18ec75546004eeb4749  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564.tar.gz
-sha256 2550586c993ce4a8c23c8b11968ea36192116a896a2504799cc65307d769c094  COPYING
+sha256  777e5dccc3d189514b7f8e85b6c941d3b9d16d2d68d72cad055cbdfb571d3681  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564_br1.tar.gz
+sha256  2550586c993ce4a8c23c8b11968ea36192116a896a2504799cc65307d769c094  COPYING
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 41416da712..0f93eef186 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  a7800b54584dee321874610ef70b1b7690c79d8340c5b134ea35176657681e29  libcamera-e59713c68678f3eb6b6ebe97cabdc88c7042567f.tar.gz
+sha256  cea2bf375b12c13945f9888119a4eeb999d7aeb550ecadcb5f919517b0b83c09  libcamera-e59713c68678f3eb6b6ebe97cabdc88c7042567f_br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libclc/libclc.hash b/package/libclc/libclc.hash
index 29728fbc76..2aa03b1106 100644
--- a/package/libclc/libclc.hash
+++ b/package/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 5ea2cd2fa7fa1474d3e0580064e7a22014ef8d64dbbd7c546277fa4beb5acf86 libclc-d1cbc92e2ceee59963f5c3a576382e5bba31f060.tar.gz
-sha256 3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479 LICENSE.TXT
+sha256  54d7ae523aabf68d533011739d6c01546cae0c294442d0f44fd657c046cb707d  libclc-d1cbc92e2ceee59963f5c3a576382e5bba31f060_br1.tar.gz
+sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/libg7221/libg7221.hash b/package/libg7221/libg7221.hash
index 09023f9543..c643f71139 100644
--- a/package/libg7221/libg7221.hash
+++ b/package/libg7221/libg7221.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 330dafa58d37a585a866167bc33f8fbe06dbcfc9a69cad43fab0b6702ebf2393  libg7221-dbfc29d4806ecdace50379a2f4d68a992a6fec34.tar.gz
-sha256 26cc5f718279b45dbe34e25a2d29b2c8ca487bd9ab11b2d68c9318ff59d5c645  COPYING
+sha256  7f00d6a4f435a91ab3bc96e6c95aa1334bd416f80d98843b4f178067239ee832  libg7221-dbfc29d4806ecdace50379a2f4d68a992a6fec34_br1.tar.gz
+sha256  26cc5f718279b45dbe34e25a2d29b2c8ca487bd9ab11b2d68c9318ff59d5c645  COPYING
diff --git a/package/libilbc/libilbc.hash b/package/libilbc/libilbc.hash
index 81a0c4e037..9015b73047 100644
--- a/package/libilbc/libilbc.hash
+++ b/package/libilbc/libilbc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 70cd6a4f6bbe6dcebfc4293eea7b6200f883d1bf0affa1efba819d44d274e35f  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07.tar.gz
-sha256 b7f4cbb4a12cd11a3d1aeda9bd17c99f59b054de4b3ee53045531cd2fa74dd2a  gips_iLBClicense.pdf
+sha256  f97d8284776c95b31ed5d5441f13b519b8c7966b77a26aa06c29bb77e02cfe16  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07_br1.tar.gz
+sha256  b7f4cbb4a12cd11a3d1aeda9bd17c99f59b054de4b3ee53045531cd2fa74dd2a  gips_iLBClicense.pdf
diff --git a/package/libsilk/libsilk.hash b/package/libsilk/libsilk.hash
index 6042096d82..7e278dbf7c 100644
--- a/package/libsilk/libsilk.hash
+++ b/package/libsilk/libsilk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 01de52aa123f7bd20e500a076046f6b30d55f8e98c4029ab424bc51c46d7083d  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45.tar.gz
-sha256 62a5963f034024665641f4a9888b208f1e39aa7e29e87c9634fdcf07d3073baf  COPYING
+sha256  ac79eb4c154af25c0ab25e12d60d3b4165c399903fe88d82e066cf6d9827503e  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45_br1.tar.gz
+sha256  62a5963f034024665641f4a9888b208f1e39aa7e29e87c9634fdcf07d3073baf  COPYING
diff --git a/package/libsvgtiny/libsvgtiny.hash b/package/libsvgtiny/libsvgtiny.hash
index 86096cef3b..10aafcac88 100644
--- a/package/libsvgtiny/libsvgtiny.hash
+++ b/package/libsvgtiny/libsvgtiny.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 082a2e8849f05e2364a942eec51a798d637c6eca44db8c73350a038ebd1fd268  libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06.tar.gz
-sha256 92b965c77be71661cae51425a6b40a5ca274f44cc13c723c90fb471a9a26a828  README
+sha256  917850350d014c953f2af0fb92f0eeb25652619710922d467c98f8109fb92baf  libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06_br1.tar.gz
+sha256  92b965c77be71661cae51425a6b40a5ca274f44cc13c723c90fb471a9a26a828  README
diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
index d4c839eb80..2c6cb14502 100644
--- a/package/libuci/libuci.hash
+++ b/package/libuci/libuci.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 bb9827863c6b7b6cf986a3de42b5716edb8a280e44b3ce39541de18062c3c00e  libuci-49ec6efbdac4819033d34f08927d795f83a3932d.tar.gz
+sha256  1ee875910bdf751807f10d44f6b6b7f9ec71c12d4c407a80bae5cb654d2ba4cc  libuci-49ec6efbdac4819033d34f08927d795f83a3932d_br1.tar.gz
diff --git a/package/libyuv/libyuv.hash b/package/libyuv/libyuv.hash
index e0d4e57e1a..b904176379 100644
--- a/package/libyuv/libyuv.hash
+++ b/package/libyuv/libyuv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 395075bed7e048f5f7d4fe9cb9255ce0afcee3f8f093741a7af1a2b1c579d089  libyuv-413a8d8041f1cc5a350a47c0d81cc721e64f9fd0.tar.gz
-sha256 2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  LICENSE
+sha256  7bb4118ef050ca3e9a27f49b7d21e068922bf57cf973f2c7b1476cadf73ac66a  libyuv-413a8d8041f1cc5a350a47c0d81cc721e64f9fd0_br1.tar.gz
+sha256  2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  LICENSE
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 1c1f3bd116..fdfcb607f1 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ba045512bb782ba8efc82651a85679684fb0fec7a7a094971031be665d6c82d6  linux-firmware-20201022.tar.gz
+sha256  f97d6d884026c5e3641909946713dcfea580c307d47830d37d42bfcc9a93870a  linux-firmware-20201022_br1.tar.gz
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
 sha256  8d5847d2971241d4d6a51c16e206379de53a6d4e203fa6f8e1c1e9279c7c4ad0  LICENSE.amdgpu
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
diff --git a/package/linux-syscall-support/linux-syscall-support.hash b/package/linux-syscall-support/linux-syscall-support.hash
index 2371dffb12..8572df4c10 100644
--- a/package/linux-syscall-support/linux-syscall-support.hash
+++ b/package/linux-syscall-support/linux-syscall-support.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e5088b81011e30b567b6bde6bb7c22ad529c4ee8890cc5e93d58b21f2c4df56a  linux-syscall-support-3f6478ac95edf86cd3da300c2c0d34a438f5dbeb.tar.gz
+sha256  498efb6915ac6e65c82c712fadd3c30f9472764114c835849e02f2c092bacd2d  linux-syscall-support-3f6478ac95edf86cd3da300c2c0d34a438f5dbeb_br1.tar.gz
 sha256  4c1fc9acc9f3867e5c81b5d5f57c52fb9a932662bd4e2e5e43b3fe95390035f5  linux_syscall_support.h
diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index 0b8b1d0745..278f2f7d3c 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c0a72a099bea13abdf5a315f56a87a75a92000b71e36193188487cdad063b540  minicom-79ef3185df5ae9cdc8307f9b9ba17463743f22f0.tar.gz
+sha256  c1d17baeebba429b481bfb50d06db3afe68e662d2ddc35393eb21f6753457327  minicom-79ef3185df5ae9cdc8307f9b9ba17463743f22f0_br1.tar.gz
 sha256  cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 86c644f774..4ca2fe6fa4 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 df8876e0e671f502bb8872cecca3cc6d1055253fa314f3544d22829e129e024e  mmc-utils-d40ec535b9d4e4c974e8c2fbfb422cd0348cc5e8.tar.gz
-sha256 c3165393bcd710624e2909327a6fbeb736c47bdbe66de1c1a364ac7324d3e4d6  mmc.h
+sha256  ffc8f77233d1bd39ce4ec68835ad94aa6762624e4e96fb60102e87ba82db083e  mmc-utils-d40ec535b9d4e4c974e8c2fbfb422cd0348cc5e8_br1.tar.gz
+sha256  c3165393bcd710624e2909327a6fbeb736c47bdbe66de1c1a364ac7324d3e4d6  mmc.h
diff --git a/package/net-tools/net-tools.hash b/package/net-tools/net-tools.hash
index 510cac3659..d8c3c61a3d 100644
--- a/package/net-tools/net-tools.hash
+++ b/package/net-tools/net-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f7cfe9e73825bac9ab1a6f99d1fc7f54bfd9d33a6f62ba58d28a566905c4e86c  net-tools-479bb4a7e11a4084e2935c0a576388f92469225b.tar.gz
+sha256  4c68ef33d97cc807fe437fa64a801355c36d638774c0c8a4342742f6bdceea78  net-tools-479bb4a7e11a4084e2935c0a576388f92469225b_br1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/netcat-openbsd/netcat-openbsd.hash b/package/netcat-openbsd/netcat-openbsd.hash
index cfa65ee24b..dccf9d3dcb 100644
--- a/package/netcat-openbsd/netcat-openbsd.hash
+++ b/package/netcat-openbsd/netcat-openbsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b46c11f83f66c41ad8f413e842c51a9fb2c495e9a2ed836e6ee75bc314545c30 netcat-openbsd-debian_1.195-2.tar.gz
-sha256 e2e86d58c38f044a49f51e45515747585db58a2305419c73323eaad88fcaef5c debian/copyright
+sha256  55e578f652cbf6ffc95f75ea3e2645ab335fab63649568bd7cdb0a6331ca87de  netcat-openbsd-debian_1.195-2_br1.tar.gz
+sha256  e2e86d58c38f044a49f51e45515747585db58a2305419c73323eaad88fcaef5c  debian/copyright
diff --git a/package/netsurf-buildsystem/netsurf-buildsystem.hash b/package/netsurf-buildsystem/netsurf-buildsystem.hash
index 8e3bbabf05..61c7906e49 100644
--- a/package/netsurf-buildsystem/netsurf-buildsystem.hash
+++ b/package/netsurf-buildsystem/netsurf-buildsystem.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2e2d93e25623761c5de39c8c94750c982335acc1c2da4439b1a2088ecd4455c9  netsurf-buildsystem-7574b41345968b5f7e9ca5875faccb1478ce0555.tar.gz
+sha256  150a3a45c3f433a35451506b316a35c14630112fc557f9e1f02c9e08b50e0cce  netsurf-buildsystem-7574b41345968b5f7e9ca5875faccb1478ce0555_br1.tar.gz
 sha256  b2ddc1d607332423f6cf415b2ac619a1c03dd565facdc39a571282a520929a65  llvm/LICENSE.TXT
diff --git a/package/odhcp6c/odhcp6c.hash b/package/odhcp6c/odhcp6c.hash
index 2ac4a68219..991d0627d3 100644
--- a/package/odhcp6c/odhcp6c.hash
+++ b/package/odhcp6c/odhcp6c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e715c1408982152306c65f1c3ce7c58fb6f15fa8f9626c266819119239f32418  odhcp6c-f575351cbb3defc0bf52680c9082912a6c264374.tar.gz
+sha256  c3622120b5209d1c14d5ac92884240bf0e4f652633562355e70dbf482f6c37b4  odhcp6c-f575351cbb3defc0bf52680c9082912a6c264374_br1.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/opkg-utils/opkg-utils.hash b/package/opkg-utils/opkg-utils.hash
index 471ce4c2fa..1db27c9a31 100644
--- a/package/opkg-utils/opkg-utils.hash
+++ b/package/opkg-utils/opkg-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  acb208fe32f93f7fc0f7fdf9f870c07e40a016bcb7fa07ada6c99503e033dafd  opkg-utils-0.4.3.tar.gz
+sha256  552c074630b6d6b39a32a35243fb34d7c5888b8a4f18118abb4daf92d0e847f2  opkg-utils-0.4.3_br1.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index 1a0011850e..a6ad4ae692 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0d42dc46295a6b3ecfeb379887bd78128ce7938242ae56d58d5e9b3dea8c98b6  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0.tar.gz
+sha256  ec2a80c49f10761980334f1591be54ee6f365165d7ac637270b4ca15a12ad674  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0_br1.tar.gz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
index 3ac33ac3d0..638d9bc4f9 100644
--- a/package/prelink-cross/prelink-cross.hash
+++ b/package/prelink-cross/prelink-cross.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cb3f5d833cd74b7e90e38465c9c948b0f4138c017509cb91e391b0931063429e  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2.tar.gz
+sha256  d7c95e81993edead813accf417f6d5b05bcc84eea9ee2d711b9505ffb4f2865b  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2_br1.tar.gz
 sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/psplash/psplash.hash b/package/psplash/psplash.hash
index 46d5e12ceb..33ea9dac1a 100644
--- a/package/psplash/psplash.hash
+++ b/package/psplash/psplash.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0042192bf94be4f5792d9ff6b7a2ddff77c79e51274745180d14be5815b3a0f4  psplash-fd33a9b3d68c89fa22ff6873f4f9fd28bd85830c.tar.gz
-sha256 f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
+sha256  2c1344dd8414415d80a01484b1cc29e78f99c31d5266189540e5966a7dc6e10e  psplash-fd33a9b3d68c89fa22ff6873f4f9fd28bd85830c_br1.tar.gz
+sha256  f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index 88460716f9..2556e7f782 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 4a9ce5bb1733239bf1b740b705df20f90802b16114e24f3fd56c08a7ba4b56c2 qoriq-rcw-LSDK-19.09.tar.gz
-sha256 a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd LICENSE
+sha256  33fd492448a3ea3a29ee90d03544e437e32a0d1ea64a6c0a42b569e5864d4972  qoriq-rcw-LSDK-19.09_br1.tar.gz
+sha256  a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd  LICENSE
diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
index 1e56b4eba7..1371c6c982 100644
--- a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  07fbc3f5053f55e4ef6566a15b42b74895314b48a0dfd46f0984f96f0fbb3e02  qt-webkit-kiosk-a7720e50f2bd70aad99e0b465f5c4a57aca48127.tar.gz
+sha256  5c3992cc35260d165f9a16094bd224529f012f799e0bc21317a39480cedb1fd2  qt-webkit-kiosk-a7720e50f2bd70aad99e0b465f5c4a57aca48127_br1.tar.gz
 sha256  de59ec6c939f4c4def79c0a996b3bd5626895fcbd1ae108e7bddb1dac8218381  doc/lgpl.html
diff --git a/package/qt5/qt5coap/qt5coap.hash b/package/qt5/qt5coap/qt5coap.hash
index 54e78023dc..b548870d22 100644
--- a/package/qt5/qt5coap/qt5coap.hash
+++ b/package/qt5/qt5coap/qt5coap.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  44c4782a40a29ccee3241d8cf08f368230dff5b1bed9ca0d58bc8e70c38f5003  qt5coap-5.15.2.tar.gz
+sha256  0ad05a2305437b9b96a4322bfadaa26f043ba16845d5303e53c00c82b37b243f  qt5coap-5.15.2_br1.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
index 0cb964134a..cf95464102 100644
--- a/package/qt5/qt5knx/qt5knx.hash
+++ b/package/qt5/qt5knx/qt5knx.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  e246de9d7c5103edd6c3b735d2ed1f13f7ff86d32cb08521abb5718538353daf  qt5knx-5.15.2.tar.gz
+sha256  932ea512aa8ceb514ac40ce1fcbebe86c306caff1a0b11320d9a36fd84bae10c  qt5knx-5.15.2_br1.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5mqtt/qt5mqtt.hash b/package/qt5/qt5mqtt/qt5mqtt.hash
index 3ac10f78a8..2b5e41df16 100644
--- a/package/qt5/qt5mqtt/qt5mqtt.hash
+++ b/package/qt5/qt5mqtt/qt5mqtt.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  bd00180ed88ae890952fe7a8ad29645d4b890c7774e9a9bdcb8e83be3c5cf69d  qt5mqtt-5.15.2.tar.gz
+sha256  38f2bc1bcbdf76d30d78c86426c85f62a6c2091c997cad4b087039f795b2b406  qt5mqtt-5.15.2_br1.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/rtc-tools/rtc-tools.hash b/package/rtc-tools/rtc-tools.hash
index 81be1afe4e..b8914b363e 100644
--- a/package/rtc-tools/rtc-tools.hash
+++ b/package/rtc-tools/rtc-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 152d8455bae5ad672e99bb91dfbed5b8b4bd8b0325146d1cf1c4d80b6e0d8a16 rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7.tar.gz
-sha256 7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a COPYING
+sha256  8614e140b04da3dbb787760bdb0fe2ac5fe8907f5d3e9a74c6713e3d17fc3650  rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7_br1.tar.gz
+sha256  7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a  COPYING
diff --git a/package/rtmpdump/rtmpdump.hash b/package/rtmpdump/rtmpdump.hash
index 6e85a58419..ac3e5533eb 100644
--- a/package/rtmpdump/rtmpdump.hash
+++ b/package/rtmpdump/rtmpdump.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b98fceba5155c5a1ee3f26550ea94144c72d8b8c5a050c213bb55dab330ad6ff  rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3.tar.gz
-sha256 03fe7ca91cc28e99b4003d5b3bd4ce3b084d4c475fdf9975cf0e7fdf4dc739cd  librtmp/COPYING
+sha256  e362202d94b92632b17abc7ef909afc56de06a2cb40e308edfad901d799bbd9c  rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3_br1.tar.gz
+sha256  03fe7ca91cc28e99b4003d5b3bd4ce3b084d4c475fdf9975cf0e7fdf4dc739cd  librtmp/COPYING
diff --git a/package/speexdsp/speexdsp.hash b/package/speexdsp/speexdsp.hash
index 955c4c0a0c..534c5d6c09 100644
--- a/package/speexdsp/speexdsp.hash
+++ b/package/speexdsp/speexdsp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 3f3997997f3af3e7382b44abc9d2a55db5bd8754b22e798e2d16ac309cd6474a  speexdsp-SpeexDSP-1.2.0.tar.gz
-sha256 671bb5d8fd3c6b05a2e831d90f978ac27965c92bd8ea6d16b3df76e3440c0e9f  COPYING
+sha256  c92c7e428cb5ca11b4e6f13118ff288332f330b6fefc93cb39bf7b43b13cb1f7  speexdsp-SpeexDSP-1.2.0_br1.tar.gz
+sha256  671bb5d8fd3c6b05a2e831d90f978ac27965c92bd8ea6d16b3df76e3440c0e9f  COPYING
diff --git a/package/stm32flash/stm32flash.hash b/package/stm32flash/stm32flash.hash
index 3adcb96d31..064978fcc5 100644
--- a/package/stm32flash/stm32flash.hash
+++ b/package/stm32flash/stm32flash.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 58788826b80f16f2084632299340f9a3155b326936210e5f7a58f9dbd1b18bdd stm32flash-3cebf121f7b32b9edfcb0d49f0fb43ccf33e5650.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 gpl-2.0.txt
+sha256  42b7d63f6016bd75911cbb87fe85fbc4f98adf3ceecfe6d91f7956b31d18095f  stm32flash-3cebf121f7b32b9edfcb0d49f0fb43ccf33e5650_br1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/ti-sgx-demos/ti-sgx-demos.hash b/package/ti-sgx-demos/ti-sgx-demos.hash
index 31044e9e3f..df72496f36 100644
--- a/package/ti-sgx-demos/ti-sgx-demos.hash
+++ b/package/ti-sgx-demos/ti-sgx-demos.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 1324115da376bc8108923c596a3c4d8df24a968395461df11e0b715764a942d4  ti-sgx-demos-bb8b74cdd1323e76697b3eb2258f863b15fee287.tar.gz
-sha256 052741ea66a4a48e0ef8cab259d2dc136e7cf52fda694af8d1fe9bd28abe333b  LegalNotice.txt
+sha256  5564741d7669b6303e52f4c0d1eaa04aa2633c0c6ad8ff7c5295b7ef3764c719  ti-sgx-demos-bb8b74cdd1323e76697b3eb2258f863b15fee287_br1.tar.gz
+sha256  052741ea66a4a48e0ef8cab259d2dc136e7cf52fda694af8d1fe9bd28abe333b  LegalNotice.txt
diff --git a/package/ti-sgx-km/ti-sgx-km.hash b/package/ti-sgx-km/ti-sgx-km.hash
index 2fd3b56b1e..d083359318 100644
--- a/package/ti-sgx-km/ti-sgx-km.hash
+++ b/package/ti-sgx-km/ti-sgx-km.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ea70356dd0fd7f904f6d6046c4090c7d6d0126e13039db746c75bb6e666864d8  ti-sgx-km-cf7f48cb30abfd5df7a60c9bf4bbb1dde0d496d9.tar.gz
+sha256  213b4ff3893c74f026a06404dca185216809d062e54d17c2302d56ff7ede5181  ti-sgx-km-cf7f48cb30abfd5df7a60c9bf4bbb1dde0d496d9_br1.tar.gz
 sha256  e9d660547691b2a9232850fd43aac16d40fd063023166fd27162020c30dc2bd4  eurasia_km/GPL-COPYING
diff --git a/package/ti-sgx-um/ti-sgx-um.hash b/package/ti-sgx-um/ti-sgx-um.hash
index 8e8c5ff328..a6e0e751e6 100644
--- a/package/ti-sgx-um/ti-sgx-um.hash
+++ b/package/ti-sgx-um/ti-sgx-um.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  4d293a4170e2fd28852680830dacd8f575b12037f3e15bcf599232f6ccbf6deb  ti-sgx-um-909e237baf47d0bde006ff25552f5403fd7e359d.tar.gz
+sha256  e52c743194516fcc92d570bc5a26dfaa26d18c13d92d41640019f544ef25be3a  ti-sgx-um-909e237baf47d0bde006ff25552f5403fd7e359d_br1.tar.gz
 sha256  368c306246c9130b5c90a6fef2f80085f70b6225b3f552654a288c0f39fc1531  TI-Linux-Graphics-DDK-UM-Manifest.doc
diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index c6447f34d4..229332d11a 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 3b3f564cc6ee30341051ccb7589b42f3abe4e676a21c029c7c127c7edf5bdcf0  trace-cmd-trace-cmd-v2.7.tar.gz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-sha256 70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
+sha256  34646e442f62d53a93c10d5a119e8cf5a830940971b0fb6ba27d05e886d51037  trace-cmd-trace-cmd-v2.7_br1.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
diff --git a/package/tremor/tremor.hash b/package/tremor/tremor.hash
index 89661a64cd..cd1ca812cc 100644
--- a/package/tremor/tremor.hash
+++ b/package/tremor/tremor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 ba94cfdf886399c550f76908285bfa9e322f24085de6f1810c2abea565c13a15  tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8.tar.gz
-sha256 d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814  COPYING
+sha256  a387ebb4536ca98034eb91855616b971b0a85575943699b2a6d0be79b4a9f6a9  tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8_br1.tar.gz
+sha256  d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814  COPYING
diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index bda58bc30c..3b329c1dd7 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  93ef2612853641ca8d16d07527115c72ed03f8eaa1c727a01b069a4e814247c0  ubus-34c6e818e431cc53478a0f7c7c1eca07d194d692.tar.gz
+sha256  011566b2be426f572d397b44a7c12baa50a9b949232e5a6075eba613e1c3f7ae  ubus-34c6e818e431cc53478a0f7c7c1eca07d194d692_br1.tar.gz
 sha256  f53187f011575f6ec6c529136fd4658d67e674227c80b7b72c99b3654454ae7f  ubusd_acl.h
diff --git a/package/uclibc-ng-test/uclibc-ng-test.hash b/package/uclibc-ng-test/uclibc-ng-test.hash
index 2a73237f06..018b5f492f 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.hash
+++ b/package/uclibc-ng-test/uclibc-ng-test.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1f22e4143413550d64cbde193de388e8884eb7398cd41d3835e5d8a06a488423  uclibc-ng-test-c64d6ac77f0e745c70e76024212c72e4bbe2091a.tar.gz
+sha256  ece0cb910ce649601e4dec42572c2871c3c58cff1be5c94e8e91816dce5793ba  uclibc-ng-test-c64d6ac77f0e745c70e76024212c72e4bbe2091a_br1.tar.gz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uemacs/uemacs.hash b/package/uemacs/uemacs.hash
index 7dcbba926e..c9c4dbf4aa 100644
--- a/package/uemacs/uemacs.hash
+++ b/package/uemacs/uemacs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 9b4a849f65edb482f59bc40f646e7cd79915b3030ea9bd825868347217db3c96  uemacs-1cdcf9df88144049750116e36fe20c8c39fa2517.tar.gz
-sha256 6e2a4cf41ec8d4379c154923349733bc0d3935c6fa72c4337cf1bc137b98b90a  README
+sha256  96e30247365bb27bd74c550b637f5b2ffd2978379872a32a840f6667cec5fa2a  uemacs-1cdcf9df88144049750116e36fe20c8c39fa2517_br1.tar.gz
+sha256  6e2a4cf41ec8d4379c154923349733bc0d3935c6fa72c4337cf1bc137b98b90a  README
diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
index e8bdb0bb6b..4c7667cf79 100644
--- a/package/uhttpd/uhttpd.hash
+++ b/package/uhttpd/uhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9325c95c9bb1c51bf135700a65738884fa9cd548ff8166c8b61fdbf99825cd6d  uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82.tar.gz
+sha256  5b81ebf9e419c668de4181cce7b9f5fa358cabb2a4a0d1f1a3a24190eeb21f25  uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82_br1.tar.gz
 sha256  2a61a8a690e7646a4bfe4261bf77c49f47588db5fc234b3cc66809dcc0cb3985  uhttpd.h
diff --git a/package/ustream-ssl/ustream-ssl.hash b/package/ustream-ssl/ustream-ssl.hash
index ba315f88dc..986a48c397 100644
--- a/package/ustream-ssl/ustream-ssl.hash
+++ b/package/ustream-ssl/ustream-ssl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 63ecc9d78ef83020a4539a89c8a3690657e7bbe7580ae02cc0e7b4267ffea5cd  ustream-ssl-23a3f2830341acd1db149175baf7315a33bd0edb.tar.gz
-sha256 90dd1590cf400a548438e2575e1ff46d8fb8cebae7d09f544aae7e059e30b6c5  ustream-ssl.h
+sha256  f09474dbe4680b51cc0c6a088807102d64954764ef58c2a1e3231e3a77c4b01f  ustream-ssl-23a3f2830341acd1db149175baf7315a33bd0edb_br1.tar.gz
+sha256  90dd1590cf400a548438e2575e1ff46d8fb8cebae7d09f544aae7e059e30b6c5  ustream-ssl.h
diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
index e2ddf77734..ce885a892f 100644
--- a/package/vboot-utils/vboot-utils.hash
+++ b/package/vboot-utils/vboot-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d95b64b1f1de4a3ffa5c2e446d7c8e92aa197aee10de24206b2ea2deb5a8b947  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656.tar.gz
+sha256  9cdeaa2e4e1190c0cd200e1b07d394e5d24f57cc0efffdce861d5de934035bf7  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656_br1.tar.gz
 sha256  cb9dc8e96aedf9120b6757a60387db10f3c1a8e3fd97bb9d0f11327be5a7ed4d  LICENSE
diff --git a/package/wilink-bt-firmware/wilink-bt-firmware.hash b/package/wilink-bt-firmware/wilink-bt-firmware.hash
index 7adcc86037..2a7723861d 100644
--- a/package/wilink-bt-firmware/wilink-bt-firmware.hash
+++ b/package/wilink-bt-firmware/wilink-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9e3c3e8aa19e6cf59a72f235391a095d6d953c325b669d8a7815e32616c232df wilink-bt-firmware-43fca73c6a98c63fcb98f82af5bf83761778e005.tar.gz
-sha256 21fd99ce784dc33b39ec0b4a383a9a9b8dafea261d73ad4548683c4eecd87f37 LICENSE
+sha256  209e1a46a945e7d4d031e22fb7bd1e3fc96fa3b99d069051ce257c5e2e0843f4  wilink-bt-firmware-43fca73c6a98c63fcb98f82af5bf83761778e005_br1.tar.gz
+sha256  21fd99ce784dc33b39ec0b4a383a9a9b8dafea261d73ad4548683c4eecd87f37  LICENSE
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
index e5d46c86f3..7a970ef798 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	61b3a7a22f80d1cbc797c329615e1699f3906c9261de7eabcf0de2bf2399de55  xdriver_xf86-video-imx-viv-rel_imx_4.9.x_1.0.0_ga.tar.gz
+sha256  638a8aa8b64f860900d003527529689bc342d18ff5e41a9e1750884544898e67  xdriver_xf86-video-imx-viv-rel_imx_4.9.x_1.0.0_ga_br1.tar.gz
 sha256  9d3e373f0440cc0c58853e963636a7c1ffda9308ec5f30ebe9adfb9c16a8a1e4  COPYING-MIT
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
index 321ae5b606..23f7db54b6 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  029afa61e785f6e0fb18d2c2f1619e97af8b6f19c7fa0ba9923eea03ccf78626  xdriver_xf86-video-intel-5ca3ac1a90af177eb111a965e9b4dd8a27cc58fc.tar.gz
+sha256  e121871de0396caff0349d761033aa4c0618d27b1ad5d79dab6c8246d9fb50d1  xdriver_xf86-video-intel-5ca3ac1a90af177eb111a965e9b4dd8a27cc58fc_br1.tar.gz
 sha256  5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
-- 
2.25.1
