From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Dec 2020 18:29:33 +0100
Subject: [Buildroot] [PATCH 5/9 v2] WIP: boot+packages: update hash to new
 git-tarballs format
In-Reply-To: <cover.1607966969.git.yann.morin.1998@free.fr>
References: <cover.1607966969.git.yann.morin.1998@free.fr>
Message-ID: <cb94c7e951f0523fe2dc602d142af65520e65cf8.1607966969.git.yann.morin.1998@free.fr>
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
Cc: Vincent Fazio <vfazio@xes-inc.com>
---
 boot/vexpress-firmware/vexpress-firmware.hash               | 2 +-
 package/aer-inject/aer-inject.hash                          | 2 +-
 package/am33x-cm3/am33x-cm3.hash                            | 2 +-
 package/armbian-firmware/armbian-firmware.hash              | 2 +-
 package/at/at.hash                                          | 6 +++---
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
 package/qt-webkit-kiosk/qt-webkit-kiosk.hash                | 2 +-
 package/qt5/qt5coap/qt5coap.hash                            | 2 +-
 package/qt5/qt5knx/qt5knx.hash                              | 2 +-
 package/qt5/qt5mqtt/qt5mqtt.hash                            | 2 +-
 package/rcw/rcw.hash                                        | 4 ++--
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
 package/uemacs/uemacs.hash                                  | 4 ++--
 package/uhttpd/uhttpd.hash                                  | 2 +-
 package/ustream-ssl/ustream-ssl.hash                        | 4 ++--
 package/vboot-utils/vboot-utils.hash                        | 2 +-
 package/wilink-bt-firmware/wilink-bt-firmware.hash          | 4 ++--
 .../xdriver_xf86-video-imx-viv.hash                         | 2 +-
 .../xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash  | 2 +-
 69 files changed, 99 insertions(+), 99 deletions(-)

diff --git a/boot/vexpress-firmware/vexpress-firmware.hash b/boot/vexpress-firmware/vexpress-firmware.hash
index 40f64c7528..6d6c62a703 100644
--- a/boot/vexpress-firmware/vexpress-firmware.hash
+++ b/boot/vexpress-firmware/vexpress-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 def599c86ab3606f7f67c0190e9b237fbc0cf934a951ffb1c5fb0c47d8a8f3d2	vexpress-firmware-901f81977c3b367a2e0bf3d6444be302822d97a3.tar.gz
+sha256  6ac672584c4b4b4980597f799a000e753d2f515054dc0564f6f93183788291c1  vexpress-firmware-901f81977c3b367a2e0bf3d6444be302822d97a3_br1.tar.xz
diff --git a/package/aer-inject/aer-inject.hash b/package/aer-inject/aer-inject.hash
index ee097c873a..5ce79f5c76 100644
--- a/package/aer-inject/aer-inject.hash
+++ b/package/aer-inject/aer-inject.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  49a44b7a9e3983dc15fdc5bacd0e095df650296024f43f9d6c080ad54de0b07f  aer-inject-9bd5e2c7886fca72f139cd8402488a2235957d41.tar.gz
+sha256  92333be36da0106fa26fb3d4f5fe95f6a16e769eb105cafcba8c2d8ac57cadcd  aer-inject-9bd5e2c7886fca72f139cd8402488a2235957d41_br1.tar.xz
 sha256  659a191d8775e05c6c6a9a4ba66b3577c577342bb83f20d393135eb6633c8973  README
diff --git a/package/am33x-cm3/am33x-cm3.hash b/package/am33x-cm3/am33x-cm3.hash
index a63ba64a3c..3f41ac683f 100644
--- a/package/am33x-cm3/am33x-cm3.hash
+++ b/package/am33x-cm3/am33x-cm3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a722098b362f58f4dfb2a7c30afd604424d435b3d5ebe6ebf5d76ad942f796d0  am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365.tar.gz
+sha256  fb1826b5320c3b9fe969386f8ec7ca439e093be77fb57cfea19a1d09b8c39a2f  am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365_br1.tar.xz
 sha256  e136e6949a1d3ca144374375af8b9387faa11d2eee7debff8cf22ca8fe7bf7e9  License.txt
diff --git a/package/armbian-firmware/armbian-firmware.hash b/package/armbian-firmware/armbian-firmware.hash
index edbc9c8282..df130acd73 100644
--- a/package/armbian-firmware/armbian-firmware.hash
+++ b/package/armbian-firmware/armbian-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  975bc377728496006f058317cccc88e2d3c4ab172ee3df08cfd085cf13221752  armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e.tar.gz
+sha256  578f97ae308c5fbf4f7af43b69fe31dcfd465491386c57d5f25c39c5aaaf3441  armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e_br1.tar.xz
diff --git a/package/at/at.hash b/package/at/at.hash
index e20c00b3cd..bcbbee05d4 100644
--- a/package/at/at.hash
+++ b/package/at/at.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 9ae5761a1fb897cda3a6f14439bed33cda33c0eedfcee6866e3d2ebad67fbd2f  at-7c74fa1aece6bc6db351763dc012193d5d634b7e.tar.gz
+sha256  6ba9130735e1ab2a8483e5c0d4184b10193df871757d1d86191b45089d90789f  at-7c74fa1aece6bc6db351763dc012193d5d634b7e_br1.tar.xz
 
-sha256 01dccc0975aa9ba1a9f83e7c5e04f16077353d3c72a0a759b8846ee7a5b2b616  Copyright
-sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
+sha256  01dccc0975aa9ba1a9f83e7c5e04f16077353d3c72a0a759b8846ee7a5b2b616  Copyright
+sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index 8e547963e2..9471e39415 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  6f5ce8a81ed941e525a0265844082e4c641e9ac5cdac8b00bc92492700512a43  azure-iot-sdk-c-LTS_07_2020_Ref01.tar.gz
+sha256  4992d3acf7f7c111a6e2a7d7550b4febc89b86722d0332f087a97c82d374a689  azure-iot-sdk-c-LTS_07_2020_Ref01_br1.tar.xz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.hash b/package/bayer2rgb-neon/bayer2rgb-neon.hash
index 1f4f5f33b3..67b09cb2be 100644
--- a/package/bayer2rgb-neon/bayer2rgb-neon.hash
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1a84dcf6557c2017ebe258502f60575e0971511c548fc88aee5ab68ca0bb268a bayer2rgb-neon-bef3ecafe290d61a50fd27da3e5d0df6f4b88045.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
+sha256  b6be54da895880ffef3535505982c0b2462307ff5ce616777545e8a46aef0ad6  bayer2rgb-neon-bef3ecafe290d61a50fd27da3e5d0df6f4b88045_br1.tar.xz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/brickd/brickd.hash b/package/brickd/brickd.hash
index 8de57a9b82..3ae0d89186 100644
--- a/package/brickd/brickd.hash
+++ b/package/brickd/brickd.hash
@@ -1,5 +1,5 @@
 # Locally computed hash
-sha256 0b79f1ccd6fa644d7ecb2e17b19f9ffbf6374702ae9ac536b2c4a0b8b2cfe160 brickd-ev3dev-stretch_1.2.1.tar.gz
+sha256  820ba722ce0d5aa1423754e8519d38659620bb336f0bed82e81cb556c5ebb975  brickd-ev3dev-stretch_1.2.1_br1.tar.xz
 
 # Hashes for license files:
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
diff --git a/package/c-capnproto/c-capnproto.hash b/package/c-capnproto/c-capnproto.hash
index 75edaebf91..2491f24be3 100644
--- a/package/c-capnproto/c-capnproto.hash
+++ b/package/c-capnproto/c-capnproto.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  88c454f4f4bad87c9b60cd739c7da5605c1085c0e92b317dd72d547bbb804279  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d.tar.gz
+sha256  4734c2ca73c9a91ff735755ac1e72aa934d2281abb713f2d1f99f3da16c51f92  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d_br1.tar.xz
 sha256  27797e6c7dce96675d79ed250584d157b7a86405db6eb6fba9644e6d96d42c57  COPYING
diff --git a/package/dbus-triggerd/dbus-triggerd.hash b/package/dbus-triggerd/dbus-triggerd.hash
index b7ed89abf7..8294f9726b 100644
--- a/package/dbus-triggerd/dbus-triggerd.hash
+++ b/package/dbus-triggerd/dbus-triggerd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3c6d865427bf1b93b16323c796ed6957ce6b2b6fd53f518b1b082d03b939102c  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09.tar.gz
+sha256  cdabfc8bb252640ca2b5690201246cee3b071e7209cfd17b11e7f2533cade963  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09_br1.tar.xz
 sha256  30d135650639af9019633690fc1aecbfc150aeeef9446347d4286a58338d10b0  dbus-triggerd.c
diff --git a/package/dt-utils/dt-utils.hash b/package/dt-utils/dt-utils.hash
index 3610fe164f..62d0e75f31 100644
--- a/package/dt-utils/dt-utils.hash
+++ b/package/dt-utils/dt-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 61440ab222543268923175eb5c7425076d2b8bce4c1dfc177f2eb3873449af7c  dt-utils-v2019.01.0.tar.gz
-sha256 a45932c79317d15116eadbf1c9c6fc59117ec3c4621db3a876066defa723963b  COPYING
+sha256  bc7d28c53bf2f5eae5dd1d367fa2d0bf40788ba4b24e9b7ecae6182edc1c759a  dt-utils-v2019.01.0_br1.tar.xz
+sha256  a45932c79317d15116eadbf1c9c6fc59117ec3c4621db3a876066defa723963b  COPYING
diff --git a/package/dtv-scan-tables/dtv-scan-tables.hash b/package/dtv-scan-tables/dtv-scan-tables.hash
index 73e0e7d19a..208e33a1bc 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.hash
+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 76cb6131df1b35ed71b0f6c87cfafc188d614cfbd9973e7832a65ba63e85c504  dtv-scan-tables-6d019038cd04e837d9dd58701202c15924c1c654.tar.gz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-sha256 4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
+sha256  688a4b7517e7864304c7862dbe8698769d44c9abd883a11bed288dbf8bb59bb8  dtv-scan-tables-6d019038cd04e837d9dd58701202c15924c1c654_br1.tar.xz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
index 3d7e945406..a77498c773 100644
--- a/package/edid-decode/edid-decode.hash
+++ b/package/edid-decode/edid-decode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  327fe14531ddebe74a730efc30209e68efbd86c11375b5576cbe23af3d691150  edid-decode-188950472c19492547e298b27f9da0d72cf826df.tar.gz
+sha256  45ea4023e5c97cedc848e38bd79c8a944c827c117ee3678864e065be8422cab0  edid-decode-188950472c19492547e298b27f9da0d72cf826df_br1.tar.xz
 sha256  9bc7ab961e9a07dc84eaa0210af388def56d024357e79671fb89fe27d073eed7  LICENSE
diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index b93c43a49d..da8e924eb4 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  3f17aaaec2ad8eb8471ff2b18cc8d1bf48e55086bd95d22f327f06fde7c1c277  ell-0.35.tar.gz
+sha256  9fcf65add8f5aa6be458cb231670d168e64aef41f95a08ffe74d9e88e8f49a12  ell-0.35_br1.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/flashbench/flashbench.hash b/package/flashbench/flashbench.hash
index f82d7f0eed..3395070148 100644
--- a/package/flashbench/flashbench.hash
+++ b/package/flashbench/flashbench.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  12e2dcb6f041ef1a303fc5bc84642ed637c24d77ed6c667a2187f21d54555731  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0.tar.gz
+sha256  cc7e6ec0ecef12aa647dde2853e8352ae95a8f31a29a86bd7f1b1d65b486d432  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0_br1.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index d31bb5e794..74e2b04ec8 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a91e0c9b7c7f238634c64a755c05671f33f2acdb6ae2d09cad4d683b364ee8e4  fmc-fsl-sdk-v2.0.tar.gz
+sha256  e1feb3d7cd985b64d9b91f104844c454a9c7304f00f6738637eaf8c35a5ed245  fmc-fsl-sdk-v2.0_br1.tar.xz
 sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  COPYING
diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
index 9143ac2c37..f8899364a5 100644
--- a/package/fmlib/fmlib.hash
+++ b/package/fmlib/fmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e5870756c7432b15f7a48b860625808f3c95d5f7fa5e251552eb2324ca51b0fa  fmlib-fsl-sdk-v2.0.tar.gz
+sha256  5b83c3070ef362b5fdfe106c9d60decf4d79f562432052fc16cc288b5b121a65  fmlib-fsl-sdk-v2.0_br1.tar.xz
 sha256  837559e20d83910a005e7883b876cc5c42805fe4abcf7e5c5b3c8d036b7f61c8  COPYING
diff --git a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
index b0f47080ce..3786a4e81c 100644
--- a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
+++ b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  e76a71e9166fbedeaa535fd7ebc07edc30a1e87f529ab2aa733e3603d3183ed0  imx-alsa-plugins-rel_imx_4.9.x_1.0.0_ga.tar.gz
+sha256  606d7f6d5a1d340ea02022b9188f60a62c4b25f35a4011b7e3ace3421a5d35e6  imx-alsa-plugins-rel_imx_4.9.x_1.0.0_ga_br1.tar.xz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING.GPL
diff --git a/package/freescale-imx/imx-lib/imx-lib.hash b/package/freescale-imx/imx-lib/imx-lib.hash
index c16dc7f9a9..d9a7be1629 100644
--- a/package/freescale-imx/imx-lib/imx-lib.hash
+++ b/package/freescale-imx/imx-lib/imx-lib.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  ced5ad0a179887ef1dd93e8103a9ab7372017cc1c241d28cded164cdece4b918  imx-lib-3f777974c0c146817e2ff5cb0340ca66a1f99e57.tar.gz
+sha256  c61a047e05b49013e94cabeb2da5e490a90bd222675ca534d15f463e7461dd52  imx-lib-3f777974c0c146817e2ff5cb0340ca66a1f99e57_br1.tar.xz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING-LGPL-2.1
diff --git a/package/google-breakpad/google-breakpad.hash b/package/google-breakpad/google-breakpad.hash
index 81715ec573..5dca1be953 100644
--- a/package/google-breakpad/google-breakpad.hash
+++ b/package/google-breakpad/google-breakpad.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6f444233e88957c30cc2d5497ee9d72d104122ce2c25a7ef7f6be3af1b3f7353  google-breakpad-7515ab13768c7edc09f0f2ec2354dc6c928239a6.tar.gz
+sha256  8b9b37d733e0c0faab2e64e2c68c5e6121682ae14f5cfe92327fe639087b3d85  google-breakpad-7515ab13768c7edc09f0f2ec2354dc6c928239a6_br1.tar.xz
 sha256  f9752a0a4ac5215eaa3a4f0ec29cd52563c883de5d7870525cc0bc3a21cb8e15  LICENSE
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index ec93e4e752..2bc1ddac39 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  2fc8dcbe84f3968ee31d724f8a44e078bb5338682d97e4b5ddfc4bfa2d04ab5f  gst1-interpipe-v1.1.3.tar.gz
+sha256  c4763caef3bf617ec1f677afec3f84dc0fe2ae37839d205699d14697a178b15d  gst1-interpipe-v1.1.3_br1.tar.xz
 
 # Hashes for license files:
 sha256  16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5  COPYING
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.hash b/package/gstreamer1/gst1-shark/gst1-shark.hash
index 6b4d59f07e..b8d5310628 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.hash
+++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  24d910c2e7b4c66c804e53e9f3fc18fb61b0d3b82d8580f0fa9c2b1c563e5ab3  gst1-shark-v0.7.2.tar.gz
+sha256  f1a0c76016f944ad17a7aec44ebae85ae96f79bde87a13033ae47795fe692c7e  gst1-shark-v0.7.2_br1.tar.xz
 
 # Hashes for license files:
 sha256  6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index 6d5a329ed5..f363a9617e 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a7e4c1c45b0d36e088bd7891335aa3c726682750984b7ca072e3c6329def92cf  imx-mkimage-rel_imx_4.19.35_1.1.0.tar.gz
-sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  10f81ab895534aecbbebcd053ec613886b26367240d22ac69cf1ecb311c6dbdf  imx-mkimage-rel_imx_4.19.35_1.1.0_br1.tar.xz
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 77a84f156e..ff8b480226 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  4f0007fb7594fe59baed71fb72c8390c472ff11c38b75d1f673375d4129ba5e2  iwd-1.10.tar.gz
+sha256  7e2c802f10745190310eae32c04152cbe4c8f97a6f16c02b78aaf043a69b17d4  iwd-1.10_br1.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
index 3458778937..b765067b80 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.hash
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  346c543de9e953db283072e1c591cab9d0eb775f7fb1fff3d7560f38bdf6bdf2  kvm-unit-tests-kvm-unit-tests-20171020.tar.gz
+sha256  c2f2f2159c77a10c7f40c163865aac123145d1951b008359c9d668644a0f8d56  kvm-unit-tests-kvm-unit-tests-20171020_br1.tar.xz
 sha256  d9bbb60891710d248f01c8bdac50ef7ad39188de512610437872e83112b38a1b  COPYRIGHT
diff --git a/package/kvmtool/kvmtool.hash b/package/kvmtool/kvmtool.hash
index fd841c354c..08166a910e 100644
--- a/package/kvmtool/kvmtool.hash
+++ b/package/kvmtool/kvmtool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2d55e4521ac040b870db015e1f075d69b89f940242d7ce5708f7d7060d62c0cc  kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e.tar.gz
+sha256  6feebce002ca573f83ef59134d5f8a454c49fde1509f9724f2c7def7696a5f7f  kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e_br1.tar.xz
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
diff --git a/package/libbroadvoice/libbroadvoice.hash b/package/libbroadvoice/libbroadvoice.hash
index 6d5afa8dbe..a6ef30b69e 100644
--- a/package/libbroadvoice/libbroadvoice.hash
+++ b/package/libbroadvoice/libbroadvoice.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b68c91d5af6e493c3d4fc3be04825e109a7593fe4de8c18ec75546004eeb4749  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564.tar.gz
-sha256 2550586c993ce4a8c23c8b11968ea36192116a896a2504799cc65307d769c094  COPYING
+sha256  925207e16e5f8b4c0ea228a4e69277c546fb1f7776312e2573ba886c906cd1de  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564_br1.tar.xz
+sha256  2550586c993ce4a8c23c8b11968ea36192116a896a2504799cc65307d769c094  COPYING
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 41416da712..f6a4dcdbb6 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  a7800b54584dee321874610ef70b1b7690c79d8340c5b134ea35176657681e29  libcamera-e59713c68678f3eb6b6ebe97cabdc88c7042567f.tar.gz
+sha256  93671efdb0260fc00d875186307d4e2eee75e49eff48318307e8c2ed0bbc6621  libcamera-e59713c68678f3eb6b6ebe97cabdc88c7042567f_br1.tar.xz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libclc/libclc.hash b/package/libclc/libclc.hash
index 29728fbc76..1745b994e3 100644
--- a/package/libclc/libclc.hash
+++ b/package/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 5ea2cd2fa7fa1474d3e0580064e7a22014ef8d64dbbd7c546277fa4beb5acf86 libclc-d1cbc92e2ceee59963f5c3a576382e5bba31f060.tar.gz
-sha256 3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479 LICENSE.TXT
+sha256  4aa8cf492b0a6820e6b180dcfddccde12afb5c2d3758fc55b6d74568de1f0a3a  libclc-d1cbc92e2ceee59963f5c3a576382e5bba31f060_br1.tar.xz
+sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/libg7221/libg7221.hash b/package/libg7221/libg7221.hash
index 09023f9543..9e940337e6 100644
--- a/package/libg7221/libg7221.hash
+++ b/package/libg7221/libg7221.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 330dafa58d37a585a866167bc33f8fbe06dbcfc9a69cad43fab0b6702ebf2393  libg7221-dbfc29d4806ecdace50379a2f4d68a992a6fec34.tar.gz
-sha256 26cc5f718279b45dbe34e25a2d29b2c8ca487bd9ab11b2d68c9318ff59d5c645  COPYING
+sha256  c0d694f65316b903b747d6d9778c82eb5210c462193ab283404f3f803d1732f4  libg7221-dbfc29d4806ecdace50379a2f4d68a992a6fec34_br1.tar.xz
+sha256  26cc5f718279b45dbe34e25a2d29b2c8ca487bd9ab11b2d68c9318ff59d5c645  COPYING
diff --git a/package/libilbc/libilbc.hash b/package/libilbc/libilbc.hash
index 81a0c4e037..e7a5367df2 100644
--- a/package/libilbc/libilbc.hash
+++ b/package/libilbc/libilbc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 70cd6a4f6bbe6dcebfc4293eea7b6200f883d1bf0affa1efba819d44d274e35f  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07.tar.gz
-sha256 b7f4cbb4a12cd11a3d1aeda9bd17c99f59b054de4b3ee53045531cd2fa74dd2a  gips_iLBClicense.pdf
+sha256  ee2cf4ed5bced153c797928c54bc8b021bc10178b13c18605bb557658ea1cd5c  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07_br1.tar.xz
+sha256  b7f4cbb4a12cd11a3d1aeda9bd17c99f59b054de4b3ee53045531cd2fa74dd2a  gips_iLBClicense.pdf
diff --git a/package/libsilk/libsilk.hash b/package/libsilk/libsilk.hash
index 6042096d82..fac557bfd1 100644
--- a/package/libsilk/libsilk.hash
+++ b/package/libsilk/libsilk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 01de52aa123f7bd20e500a076046f6b30d55f8e98c4029ab424bc51c46d7083d  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45.tar.gz
-sha256 62a5963f034024665641f4a9888b208f1e39aa7e29e87c9634fdcf07d3073baf  COPYING
+sha256  c5666f8360673ce894540da576741f24ca2d6ee9a3b6e9bf21252517d3f938be  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45_br1.tar.xz
+sha256  62a5963f034024665641f4a9888b208f1e39aa7e29e87c9634fdcf07d3073baf  COPYING
diff --git a/package/libsvgtiny/libsvgtiny.hash b/package/libsvgtiny/libsvgtiny.hash
index 86096cef3b..779b301dc1 100644
--- a/package/libsvgtiny/libsvgtiny.hash
+++ b/package/libsvgtiny/libsvgtiny.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 082a2e8849f05e2364a942eec51a798d637c6eca44db8c73350a038ebd1fd268  libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06.tar.gz
-sha256 92b965c77be71661cae51425a6b40a5ca274f44cc13c723c90fb471a9a26a828  README
+sha256  680a0a5d9200f69ad13b0cfe41e69be2e2b29f0b4f9c51e5314e0e5e7d3a59dc  libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06_br1.tar.xz
+sha256  92b965c77be71661cae51425a6b40a5ca274f44cc13c723c90fb471a9a26a828  README
diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
index d4c839eb80..1290e26c5b 100644
--- a/package/libuci/libuci.hash
+++ b/package/libuci/libuci.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 bb9827863c6b7b6cf986a3de42b5716edb8a280e44b3ce39541de18062c3c00e  libuci-49ec6efbdac4819033d34f08927d795f83a3932d.tar.gz
+sha256  c2513eb46b9d6b6c9130d9eeaa164d70983d18dc61596062a1bde293945521d4  libuci-49ec6efbdac4819033d34f08927d795f83a3932d_br1.tar.xz
diff --git a/package/libyuv/libyuv.hash b/package/libyuv/libyuv.hash
index e0d4e57e1a..119a6e0b4f 100644
--- a/package/libyuv/libyuv.hash
+++ b/package/libyuv/libyuv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 395075bed7e048f5f7d4fe9cb9255ce0afcee3f8f093741a7af1a2b1c579d089  libyuv-413a8d8041f1cc5a350a47c0d81cc721e64f9fd0.tar.gz
-sha256 2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  LICENSE
+sha256  545853a2c936135b3ef333e03bfa26f9ccb282c351671d78ad23c55e465e19b3  libyuv-413a8d8041f1cc5a350a47c0d81cc721e64f9fd0_br1.tar.xz
+sha256  2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  LICENSE
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 1c1f3bd116..3067cdc1f8 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ba045512bb782ba8efc82651a85679684fb0fec7a7a094971031be665d6c82d6  linux-firmware-20201022.tar.gz
+sha256  81bf5b333a0b39655da9b664c3bdf3fb1514a7b2a4711734e27ed6edf1862187  linux-firmware-20201022_br1.tar.xz
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
 sha256  8d5847d2971241d4d6a51c16e206379de53a6d4e203fa6f8e1c1e9279c7c4ad0  LICENSE.amdgpu
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
diff --git a/package/linux-syscall-support/linux-syscall-support.hash b/package/linux-syscall-support/linux-syscall-support.hash
index 2371dffb12..4e47332a8c 100644
--- a/package/linux-syscall-support/linux-syscall-support.hash
+++ b/package/linux-syscall-support/linux-syscall-support.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e5088b81011e30b567b6bde6bb7c22ad529c4ee8890cc5e93d58b21f2c4df56a  linux-syscall-support-3f6478ac95edf86cd3da300c2c0d34a438f5dbeb.tar.gz
+sha256  ed59aa0b6851c91eadb669c5536333f3232360db08e3a7ac75743ab576d8b735  linux-syscall-support-3f6478ac95edf86cd3da300c2c0d34a438f5dbeb_br1.tar.xz
 sha256  4c1fc9acc9f3867e5c81b5d5f57c52fb9a932662bd4e2e5e43b3fe95390035f5  linux_syscall_support.h
diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index 0b8b1d0745..142cbf6c76 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c0a72a099bea13abdf5a315f56a87a75a92000b71e36193188487cdad063b540  minicom-79ef3185df5ae9cdc8307f9b9ba17463743f22f0.tar.gz
+sha256  5abf66a053e7b4d5ab727234a9a0c12943254a10c8eac15eb75abac386df5749  minicom-79ef3185df5ae9cdc8307f9b9ba17463743f22f0_br1.tar.xz
 sha256  cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 86c644f774..832bd7c9a4 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 df8876e0e671f502bb8872cecca3cc6d1055253fa314f3544d22829e129e024e  mmc-utils-d40ec535b9d4e4c974e8c2fbfb422cd0348cc5e8.tar.gz
-sha256 c3165393bcd710624e2909327a6fbeb736c47bdbe66de1c1a364ac7324d3e4d6  mmc.h
+sha256  2cbcc2eb76e9f8a4c377b7aa66d3733e9145eef13e9d61727f4401a4ece5b807  mmc-utils-d40ec535b9d4e4c974e8c2fbfb422cd0348cc5e8_br1.tar.xz
+sha256  c3165393bcd710624e2909327a6fbeb736c47bdbe66de1c1a364ac7324d3e4d6  mmc.h
diff --git a/package/net-tools/net-tools.hash b/package/net-tools/net-tools.hash
index 510cac3659..27d8445c2a 100644
--- a/package/net-tools/net-tools.hash
+++ b/package/net-tools/net-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f7cfe9e73825bac9ab1a6f99d1fc7f54bfd9d33a6f62ba58d28a566905c4e86c  net-tools-479bb4a7e11a4084e2935c0a576388f92469225b.tar.gz
+sha256  c23fba7f3bbdd0f5b3eee578bba8d73314bc273466eb648b2b731e65359b844f  net-tools-479bb4a7e11a4084e2935c0a576388f92469225b_br1.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/netcat-openbsd/netcat-openbsd.hash b/package/netcat-openbsd/netcat-openbsd.hash
index cfa65ee24b..056bc49ebc 100644
--- a/package/netcat-openbsd/netcat-openbsd.hash
+++ b/package/netcat-openbsd/netcat-openbsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b46c11f83f66c41ad8f413e842c51a9fb2c495e9a2ed836e6ee75bc314545c30 netcat-openbsd-debian_1.195-2.tar.gz
-sha256 e2e86d58c38f044a49f51e45515747585db58a2305419c73323eaad88fcaef5c debian/copyright
+sha256  38e95b4b786fff7e83fe4ac11642f1eadcdd15339e06033a525d05556179accc  netcat-openbsd-debian_1.195-2_br1.tar.xz
+sha256  e2e86d58c38f044a49f51e45515747585db58a2305419c73323eaad88fcaef5c  debian/copyright
diff --git a/package/netsurf-buildsystem/netsurf-buildsystem.hash b/package/netsurf-buildsystem/netsurf-buildsystem.hash
index 8e3bbabf05..8e4908d9b1 100644
--- a/package/netsurf-buildsystem/netsurf-buildsystem.hash
+++ b/package/netsurf-buildsystem/netsurf-buildsystem.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2e2d93e25623761c5de39c8c94750c982335acc1c2da4439b1a2088ecd4455c9  netsurf-buildsystem-7574b41345968b5f7e9ca5875faccb1478ce0555.tar.gz
+sha256  839d0f169ab5b50c7fc824aee8ed900880cc51ef551dbfb5c2914554702cae02  netsurf-buildsystem-7574b41345968b5f7e9ca5875faccb1478ce0555_br1.tar.xz
 sha256  b2ddc1d607332423f6cf415b2ac619a1c03dd565facdc39a571282a520929a65  llvm/LICENSE.TXT
diff --git a/package/odhcp6c/odhcp6c.hash b/package/odhcp6c/odhcp6c.hash
index 2ac4a68219..1d2224d637 100644
--- a/package/odhcp6c/odhcp6c.hash
+++ b/package/odhcp6c/odhcp6c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e715c1408982152306c65f1c3ce7c58fb6f15fa8f9626c266819119239f32418  odhcp6c-f575351cbb3defc0bf52680c9082912a6c264374.tar.gz
+sha256  7f8b51028c3b931f2c0f71e76ef259af0e1c9039122c2f0b5d89bf681277b61c  odhcp6c-f575351cbb3defc0bf52680c9082912a6c264374_br1.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/opkg-utils/opkg-utils.hash b/package/opkg-utils/opkg-utils.hash
index 471ce4c2fa..bee1f66fb5 100644
--- a/package/opkg-utils/opkg-utils.hash
+++ b/package/opkg-utils/opkg-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  acb208fe32f93f7fc0f7fdf9f870c07e40a016bcb7fa07ada6c99503e033dafd  opkg-utils-0.4.3.tar.gz
+sha256  1413c6408b66fea158ab1f78a5bbc21b08078d0a5a51c55a7144e96e9ae57ac5  opkg-utils-0.4.3_br1.tar.xz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index 1a0011850e..6480132662 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0d42dc46295a6b3ecfeb379887bd78128ce7938242ae56d58d5e9b3dea8c98b6  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0.tar.gz
+sha256  9d1737e9bdf9264c132c8cfa9b742de4eb73e067825aaf2a3a8ebea8eb9c6ed5  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0_br1.tar.xz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
index 3ac33ac3d0..1f592aed91 100644
--- a/package/prelink-cross/prelink-cross.hash
+++ b/package/prelink-cross/prelink-cross.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cb3f5d833cd74b7e90e38465c9c948b0f4138c017509cb91e391b0931063429e  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2.tar.gz
+sha256  cac595b68980c684f8c81065ce4789aa588c5b86fa7fa351293b39d147b81592  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2_br1.tar.xz
 sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/psplash/psplash.hash b/package/psplash/psplash.hash
index 46d5e12ceb..b54980d67c 100644
--- a/package/psplash/psplash.hash
+++ b/package/psplash/psplash.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0042192bf94be4f5792d9ff6b7a2ddff77c79e51274745180d14be5815b3a0f4  psplash-fd33a9b3d68c89fa22ff6873f4f9fd28bd85830c.tar.gz
-sha256 f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
+sha256  c9d99a2a4bc0aceb958dfa166b41bae62aa591d050f55e45bf17ef4bdadc3cb6  psplash-fd33a9b3d68c89fa22ff6873f4f9fd28bd85830c_br1.tar.xz
+sha256  f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
index 1e56b4eba7..1714a42842 100644
--- a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  07fbc3f5053f55e4ef6566a15b42b74895314b48a0dfd46f0984f96f0fbb3e02  qt-webkit-kiosk-a7720e50f2bd70aad99e0b465f5c4a57aca48127.tar.gz
+sha256  6110c3c4982fcd1d14d24e0f218a77685160364e3dcc2375ae6544016dc5753d  qt-webkit-kiosk-a7720e50f2bd70aad99e0b465f5c4a57aca48127_br1.tar.xz
 sha256  de59ec6c939f4c4def79c0a996b3bd5626895fcbd1ae108e7bddb1dac8218381  doc/lgpl.html
diff --git a/package/qt5/qt5coap/qt5coap.hash b/package/qt5/qt5coap/qt5coap.hash
index 54e78023dc..7d7c4f24dc 100644
--- a/package/qt5/qt5coap/qt5coap.hash
+++ b/package/qt5/qt5coap/qt5coap.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  44c4782a40a29ccee3241d8cf08f368230dff5b1bed9ca0d58bc8e70c38f5003  qt5coap-5.15.2.tar.gz
+sha256  a6f842cef6eb7bc6aa316e2449aed457fbbc2b9460ddcadf5f1dc46538c3f4a4  qt5coap-5.15.2_br1.tar.xz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
index 0cb964134a..4ec355b730 100644
--- a/package/qt5/qt5knx/qt5knx.hash
+++ b/package/qt5/qt5knx/qt5knx.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  e246de9d7c5103edd6c3b735d2ed1f13f7ff86d32cb08521abb5718538353daf  qt5knx-5.15.2.tar.gz
+sha256  f0192b723b7eb392184408a5984e25247490cd506b212e6dda89ac5365109b66  qt5knx-5.15.2_br1.tar.xz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5mqtt/qt5mqtt.hash b/package/qt5/qt5mqtt/qt5mqtt.hash
index 3ac10f78a8..25b8a459cf 100644
--- a/package/qt5/qt5mqtt/qt5mqtt.hash
+++ b/package/qt5/qt5mqtt/qt5mqtt.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  bd00180ed88ae890952fe7a8ad29645d4b890c7774e9a9bdcb8e83be3c5cf69d  qt5mqtt-5.15.2.tar.gz
+sha256  46431e92d4bd4882e1742cf1e31aae9aed0b57d07b1fd610133f6edecd71983e  qt5mqtt-5.15.2_br1.tar.xz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/rcw/rcw.hash b/package/rcw/rcw.hash
index 76b6373942..b619e25add 100644
--- a/package/rcw/rcw.hash
+++ b/package/rcw/rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b69a6a8b187ba794e0af716a509ced2bbac83da0f6e94b5c7331a34619db21b1 rcw-LSDK-19.09.tar.gz
-sha256 a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd LICENSE
+sha256  b1fcd5485872264b989dad175ca003eb6dbaf46c8bf08bd2ebb4438adfc10cdd  rcw-LSDK-19.09_br1.tar.xz
+sha256  a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd  LICENSE
diff --git a/package/rtc-tools/rtc-tools.hash b/package/rtc-tools/rtc-tools.hash
index 81be1afe4e..12a71e0d62 100644
--- a/package/rtc-tools/rtc-tools.hash
+++ b/package/rtc-tools/rtc-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 152d8455bae5ad672e99bb91dfbed5b8b4bd8b0325146d1cf1c4d80b6e0d8a16 rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7.tar.gz
-sha256 7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a COPYING
+sha256  d9d7422eb487f7576212785e5c41ea056bc2027c1d0028cbdeb3176a9e0cf44d  rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7_br1.tar.xz
+sha256  7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a  COPYING
diff --git a/package/rtmpdump/rtmpdump.hash b/package/rtmpdump/rtmpdump.hash
index 6e85a58419..76abe3dae6 100644
--- a/package/rtmpdump/rtmpdump.hash
+++ b/package/rtmpdump/rtmpdump.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b98fceba5155c5a1ee3f26550ea94144c72d8b8c5a050c213bb55dab330ad6ff  rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3.tar.gz
-sha256 03fe7ca91cc28e99b4003d5b3bd4ce3b084d4c475fdf9975cf0e7fdf4dc739cd  librtmp/COPYING
+sha256  1268ae69525486eb6d2e8eea100f291fe64c620b10944b458dbc14aeb5afa53b  rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3_br1.tar.xz
+sha256  03fe7ca91cc28e99b4003d5b3bd4ce3b084d4c475fdf9975cf0e7fdf4dc739cd  librtmp/COPYING
diff --git a/package/speexdsp/speexdsp.hash b/package/speexdsp/speexdsp.hash
index 955c4c0a0c..924d65e355 100644
--- a/package/speexdsp/speexdsp.hash
+++ b/package/speexdsp/speexdsp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 3f3997997f3af3e7382b44abc9d2a55db5bd8754b22e798e2d16ac309cd6474a  speexdsp-SpeexDSP-1.2.0.tar.gz
-sha256 671bb5d8fd3c6b05a2e831d90f978ac27965c92bd8ea6d16b3df76e3440c0e9f  COPYING
+sha256  b15f098f58aa6787e270b69aac66e8e25fd1597e05cce8fc53c27f288e095906  speexdsp-SpeexDSP-1.2.0_br1.tar.xz
+sha256  671bb5d8fd3c6b05a2e831d90f978ac27965c92bd8ea6d16b3df76e3440c0e9f  COPYING
diff --git a/package/stm32flash/stm32flash.hash b/package/stm32flash/stm32flash.hash
index 3adcb96d31..3533ac6e2e 100644
--- a/package/stm32flash/stm32flash.hash
+++ b/package/stm32flash/stm32flash.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 58788826b80f16f2084632299340f9a3155b326936210e5f7a58f9dbd1b18bdd stm32flash-3cebf121f7b32b9edfcb0d49f0fb43ccf33e5650.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 gpl-2.0.txt
+sha256  c79d3e6b177ba0fa481f3eaf2ee0d9236be316c2f8c0d6a37fe9719836fe96a6  stm32flash-3cebf121f7b32b9edfcb0d49f0fb43ccf33e5650_br1.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/ti-sgx-demos/ti-sgx-demos.hash b/package/ti-sgx-demos/ti-sgx-demos.hash
index 31044e9e3f..cc83e725dd 100644
--- a/package/ti-sgx-demos/ti-sgx-demos.hash
+++ b/package/ti-sgx-demos/ti-sgx-demos.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 1324115da376bc8108923c596a3c4d8df24a968395461df11e0b715764a942d4  ti-sgx-demos-bb8b74cdd1323e76697b3eb2258f863b15fee287.tar.gz
-sha256 052741ea66a4a48e0ef8cab259d2dc136e7cf52fda694af8d1fe9bd28abe333b  LegalNotice.txt
+sha256  d0fec2304114fc99692f48ccc6520b9554b32a83ae4461c7f8616365a7e3012e  ti-sgx-demos-bb8b74cdd1323e76697b3eb2258f863b15fee287_br1.tar.xz
+sha256  052741ea66a4a48e0ef8cab259d2dc136e7cf52fda694af8d1fe9bd28abe333b  LegalNotice.txt
diff --git a/package/ti-sgx-km/ti-sgx-km.hash b/package/ti-sgx-km/ti-sgx-km.hash
index 2fd3b56b1e..8c7e3e3c7d 100644
--- a/package/ti-sgx-km/ti-sgx-km.hash
+++ b/package/ti-sgx-km/ti-sgx-km.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ea70356dd0fd7f904f6d6046c4090c7d6d0126e13039db746c75bb6e666864d8  ti-sgx-km-cf7f48cb30abfd5df7a60c9bf4bbb1dde0d496d9.tar.gz
+sha256  00f4e093d882c561dcbdb1f93607330b68cc1361a7e05553288c22305cce4e04  ti-sgx-km-cf7f48cb30abfd5df7a60c9bf4bbb1dde0d496d9_br1.tar.xz
 sha256  e9d660547691b2a9232850fd43aac16d40fd063023166fd27162020c30dc2bd4  eurasia_km/GPL-COPYING
diff --git a/package/ti-sgx-um/ti-sgx-um.hash b/package/ti-sgx-um/ti-sgx-um.hash
index 8e8c5ff328..b94c192732 100644
--- a/package/ti-sgx-um/ti-sgx-um.hash
+++ b/package/ti-sgx-um/ti-sgx-um.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  4d293a4170e2fd28852680830dacd8f575b12037f3e15bcf599232f6ccbf6deb  ti-sgx-um-909e237baf47d0bde006ff25552f5403fd7e359d.tar.gz
+sha256  c1a9d09313a5d0c3ebd1c552b05642c7f55f718175630fd62b6e4816aee16dbb  ti-sgx-um-909e237baf47d0bde006ff25552f5403fd7e359d_br1.tar.xz
 sha256  368c306246c9130b5c90a6fef2f80085f70b6225b3f552654a288c0f39fc1531  TI-Linux-Graphics-DDK-UM-Manifest.doc
diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index c6447f34d4..a0ac78476e 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 3b3f564cc6ee30341051ccb7589b42f3abe4e676a21c029c7c127c7edf5bdcf0  trace-cmd-trace-cmd-v2.7.tar.gz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-sha256 70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
+sha256  61790975f1ddf0c9d6fd977da6696274daa48fca7f7b8790d41f9caee0d3c105  trace-cmd-trace-cmd-v2.7_br1.tar.xz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
diff --git a/package/tremor/tremor.hash b/package/tremor/tremor.hash
index 89661a64cd..64939bafda 100644
--- a/package/tremor/tremor.hash
+++ b/package/tremor/tremor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 ba94cfdf886399c550f76908285bfa9e322f24085de6f1810c2abea565c13a15  tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8.tar.gz
-sha256 d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814  COPYING
+sha256  29ea1a5d39b4ed0565934282140fa07a02f5bab05226571d6f6d72f134211c0f  tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8_br1.tar.xz
+sha256  d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814  COPYING
diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index bda58bc30c..d1cb74be27 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  93ef2612853641ca8d16d07527115c72ed03f8eaa1c727a01b069a4e814247c0  ubus-34c6e818e431cc53478a0f7c7c1eca07d194d692.tar.gz
+sha256  b769bf502f178e4da4f63148975fd52288e8b78d55bb95fee038058b1053c885  ubus-34c6e818e431cc53478a0f7c7c1eca07d194d692_br1.tar.xz
 sha256  f53187f011575f6ec6c529136fd4658d67e674227c80b7b72c99b3654454ae7f  ubusd_acl.h
diff --git a/package/uemacs/uemacs.hash b/package/uemacs/uemacs.hash
index 7dcbba926e..07c07cbe74 100644
--- a/package/uemacs/uemacs.hash
+++ b/package/uemacs/uemacs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 9b4a849f65edb482f59bc40f646e7cd79915b3030ea9bd825868347217db3c96  uemacs-1cdcf9df88144049750116e36fe20c8c39fa2517.tar.gz
-sha256 6e2a4cf41ec8d4379c154923349733bc0d3935c6fa72c4337cf1bc137b98b90a  README
+sha256  731e2703af6777739f1902d31d9fbac01bba1f40a84042c55454fdcacde650ad  uemacs-1cdcf9df88144049750116e36fe20c8c39fa2517_br1.tar.xz
+sha256  6e2a4cf41ec8d4379c154923349733bc0d3935c6fa72c4337cf1bc137b98b90a  README
diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
index e8bdb0bb6b..768829d864 100644
--- a/package/uhttpd/uhttpd.hash
+++ b/package/uhttpd/uhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9325c95c9bb1c51bf135700a65738884fa9cd548ff8166c8b61fdbf99825cd6d  uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82.tar.gz
+sha256  8efd4f8adb01c728a7e4322c30369181ef0946f303f93b1a76c13556634e7a01  uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82_br1.tar.xz
 sha256  2a61a8a690e7646a4bfe4261bf77c49f47588db5fc234b3cc66809dcc0cb3985  uhttpd.h
diff --git a/package/ustream-ssl/ustream-ssl.hash b/package/ustream-ssl/ustream-ssl.hash
index ba315f88dc..e0f01dc80f 100644
--- a/package/ustream-ssl/ustream-ssl.hash
+++ b/package/ustream-ssl/ustream-ssl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 63ecc9d78ef83020a4539a89c8a3690657e7bbe7580ae02cc0e7b4267ffea5cd  ustream-ssl-23a3f2830341acd1db149175baf7315a33bd0edb.tar.gz
-sha256 90dd1590cf400a548438e2575e1ff46d8fb8cebae7d09f544aae7e059e30b6c5  ustream-ssl.h
+sha256  a5400aa8f8d4eaa14db3ab4d91d2a8e98c10593f71c7149db68e1fb1fb0e3f2a  ustream-ssl-23a3f2830341acd1db149175baf7315a33bd0edb_br1.tar.xz
+sha256  90dd1590cf400a548438e2575e1ff46d8fb8cebae7d09f544aae7e059e30b6c5  ustream-ssl.h
diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
index e2ddf77734..17a9846e2c 100644
--- a/package/vboot-utils/vboot-utils.hash
+++ b/package/vboot-utils/vboot-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d95b64b1f1de4a3ffa5c2e446d7c8e92aa197aee10de24206b2ea2deb5a8b947  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656.tar.gz
+sha256  1dd1142509bd3fd911758fdbd824d234c75b01475d1a3a1384f19ef36e37b3ed  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656_br1.tar.xz
 sha256  cb9dc8e96aedf9120b6757a60387db10f3c1a8e3fd97bb9d0f11327be5a7ed4d  LICENSE
diff --git a/package/wilink-bt-firmware/wilink-bt-firmware.hash b/package/wilink-bt-firmware/wilink-bt-firmware.hash
index 7adcc86037..48f3cf9d48 100644
--- a/package/wilink-bt-firmware/wilink-bt-firmware.hash
+++ b/package/wilink-bt-firmware/wilink-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9e3c3e8aa19e6cf59a72f235391a095d6d953c325b669d8a7815e32616c232df wilink-bt-firmware-43fca73c6a98c63fcb98f82af5bf83761778e005.tar.gz
-sha256 21fd99ce784dc33b39ec0b4a383a9a9b8dafea261d73ad4548683c4eecd87f37 LICENSE
+sha256  27bbfa58fdc9bdb9d87469fcc857d83f91612f8c493ab810335db8f4c22c2f85  wilink-bt-firmware-43fca73c6a98c63fcb98f82af5bf83761778e005_br1.tar.xz
+sha256  21fd99ce784dc33b39ec0b4a383a9a9b8dafea261d73ad4548683c4eecd87f37  LICENSE
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
index e5d46c86f3..39999a8121 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	61b3a7a22f80d1cbc797c329615e1699f3906c9261de7eabcf0de2bf2399de55  xdriver_xf86-video-imx-viv-rel_imx_4.9.x_1.0.0_ga.tar.gz
+sha256  3b92ea930e24d514f39d61fa289bb332c26ac2595122c16b3994c050c417fe6c  xdriver_xf86-video-imx-viv-rel_imx_4.9.x_1.0.0_ga_br1.tar.xz
 sha256  9d3e373f0440cc0c58853e963636a7c1ffda9308ec5f30ebe9adfb9c16a8a1e4  COPYING-MIT
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
index 321ae5b606..7c654b72dd 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  029afa61e785f6e0fb18d2c2f1619e97af8b6f19c7fa0ba9923eea03ccf78626  xdriver_xf86-video-intel-5ca3ac1a90af177eb111a965e9b4dd8a27cc58fc.tar.gz
+sha256  a253d5bd5686dcbae273921298c13e6ddd01b6612a6d9293e3ffe24a4f0d9c53  xdriver_xf86-video-intel-5ca3ac1a90af177eb111a965e9b4dd8a27cc58fc_br1.tar.xz
 sha256  5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
-- 
2.25.1
