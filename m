From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Oct 2009 10:18:51 +0200
Subject: [Buildroot] [git commit master] busybox: invert hide option
Message-ID: <20091015081937.A71FE7779A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=524b203588b82ad16221d8397678bf90ca6ad2f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Invert the BR2_PACKAGE_BUSYBOX_HIDE_OTHERS option to use positive logic,
renaming it to _SHOW_OTHERS.

Positive logic is simpler to understand, and it makes all{,package}config
do the right thing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/at91rm9200df_defconfig       |    2 +-
 configs/at91rm9200df_ext_defconfig   |    2 +-
 configs/at91sam9260dfc_defconfig     |    2 +-
 configs/at91sam9260dfc_ext_defconfig |    2 +-
 configs/at91sam9260pf_defconfig      |    2 +-
 configs/at91sam9261ek_defconfig      |    2 +-
 configs/at91sam9261ek_ext_defconfig  |    2 +-
 configs/at91sam9263ek_defconfig      |    2 +-
 configs/at91sam9263ek_ext_defconfig  |    2 +-
 configs/at91sam9g20dfc_defconfig     |    2 +-
 configs/at91sam9g20dfc_ext_defconfig |    2 +-
 configs/atngw100-base_defconfig      |    2 +-
 configs/atngw100_defconfig           |    2 +-
 configs/atstk1005_defconfig          |    2 +-
 configs/atstk100x_defconfig          |    2 +-
 configs/i386_defconfig               |    2 +-
 configs/i686_defconfig               |    2 +-
 configs/integrator926_defconfig      |    2 +-
 configs/integrator926_huge_defconfig |    2 +-
 configs/kb9202_defconfig             |    2 +-
 configs/v100sc2_defconfig            |    2 +-
 docs/buildroot.html                  |    2 -
 package/Config.in                    |   50 +++++++++++++++++-----------------
 package/busybox/Config.in            |    7 ++---
 target/xtensa/defconfig              |    2 +-
 25 files changed, 50 insertions(+), 53 deletions(-)

diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 0f584fc..81ebc8e 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -343,7 +343,7 @@ BR2_BUSYBOX_VERSION_1_13_X=y
 BR2_BUSYBOX_VERSION="1.13.2"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
 #
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 33174ae..078956f 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -268,7 +268,7 @@ BR2_BUSYBOX_VERSION_1_13_X=y
 BR2_BUSYBOX_VERSION="1.13.2"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
 #
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 1d7e10f..4eb59fe 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -355,7 +355,7 @@ BR2_BUSYBOX_VERSION_1_13_X=y
 BR2_BUSYBOX_VERSION="1.13.2"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
 #
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 4579b46..6d1a281 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -276,7 +276,7 @@ BR2_BUSYBOX_VERSION_1_13_X=y
 BR2_BUSYBOX_VERSION="1.13.2"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
 #
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index d9fadb7..3cf6324 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -241,7 +241,7 @@ BR2_BUSYBOX_VERSION_1_13_X=y
 BR2_BUSYBOX_VERSION="1.13.4"
 BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-# BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is not set
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
 #
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index ef1e44d..eb0732f 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -349,7 +349,7 @@ BR2_BUSYBOX_VERSION_1_13_X=y
 BR2_BUSYBOX_VERSION="1.13.2"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
 #
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 1bd143c..6cdd8e9 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -307,7 +307,7 @@ BR2_BUSYBOX_VERSION_1_13_X=y
 BR2_BUSYBOX_VERSION="1.13.2"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
 #
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 7ea6a99..62a2698 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -348,7 +348,7 @@ BR2_BUSYBOX_VERSION_1_13_X=y
 BR2_BUSYBOX_VERSION="1.13.2"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
 #
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 3fd7a36..99cf3c5 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -269,7 +269,7 @@ BR2_BUSYBOX_VERSION_1_13_X=y
 BR2_BUSYBOX_VERSION="1.13.2"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
 #
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 30a2e4c..51e2b83 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -348,7 +348,7 @@ BR2_BUSYBOX_VERSION_1_13_X=y
 BR2_BUSYBOX_VERSION="1.13.2"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
 #
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 19ab324..d674160 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -276,7 +276,7 @@ BR2_BUSYBOX_VERSION_1_13_X=y
 BR2_BUSYBOX_VERSION="1.13.2"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
 #
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 0e0b78d..b6337ff 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -277,7 +277,7 @@ BR2_BUSYBOX_VERSION_1_14_X=y
 BR2_BUSYBOX_VERSION="1.14.0"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 BR2_PACKAGE_BUSYBOX_SKELETON=y
 
 #
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index ba30c13..952028d 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -288,7 +288,7 @@ BR2_BUSYBOX_VERSION_1_14_X=y
 BR2_BUSYBOX_VERSION="1.14.0"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 BR2_PACKAGE_BUSYBOX_SKELETON=y
 
 #
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 99b740a..55e23f6 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -296,7 +296,7 @@ BR2_BUSYBOX_VERSION_1_13_X=y
 BR2_BUSYBOX_VERSION="1.13.4"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 BR2_PACKAGE_BUSYBOX_SKELETON=y
 
 #
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 32de940..4a47d0d 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -289,7 +289,7 @@ BR2_BUSYBOX_VERSION_1_14_X=y
 BR2_BUSYBOX_VERSION="1.14.0"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="target/device/Atmel/atstk100x/busybox-1.9.1.config"
-# BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is not set
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 BR2_PACKAGE_BUSYBOX_SKELETON=y
 
 #
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 2df16ef..afc1075 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -276,7 +276,7 @@ BR2_BUSYBOX_VERSION_1_14_X=y
 BR2_BUSYBOX_VERSION="1.14.0"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
 #
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index af0cc15..1e1da21 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -276,7 +276,7 @@ BR2_BUSYBOX_VERSION_1_14_X=y
 BR2_BUSYBOX_VERSION="1.14.0"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
 #
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 9531f1c..a53d8c3 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -273,7 +273,7 @@ BR2_BUSYBOX_VERSION_1_13_X=y
 BR2_BUSYBOX_VERSION="1.13.4"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 BR2_PACKAGE_BUSYBOX_SKELETON=y
 
 #
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 805ac0f..b379e9f 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -274,7 +274,7 @@ BR2_BUSYBOX_VERSION_1_13_X=y
 BR2_BUSYBOX_VERSION="1.13.4"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 BR2_PACKAGE_BUSYBOX_SKELETON=y
 
 #
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index ce50f2c..b8ca087 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -268,7 +268,7 @@ BR2_BUSYBOX_VERSION_1_13_X=y
 BR2_BUSYBOX_VERSION="1.13.4"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
-# BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is not set
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
 #
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index 799931b..61e4c8a 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -258,7 +258,7 @@ BR2_BUSYBOX_VERSION_1_12_X=y
 BR2_BUSYBOX_VERSION="1.12.1"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="target/device/valka/v100sc2/busybox.config"
-# BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is not set
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 BR2_PACKAGE_BUSYBOX_SKELETON=y
 
 #
diff --git a/docs/buildroot.html b/docs/buildroot.html
index 2fc7528..e61e05f 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -794,9 +794,7 @@ config BR2_PACKAGE_FOO
     <em>sorted alphabetically</em> per category and are <em>NOT</em>
     supposed to contain anything but the <em>bare</em> name of the package.</p>
 <pre>
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/procps/Config.in"
-endif
 </pre>
    <p><strong>Note:</strong><br>
    Generally all packages should live <em>directly</em> in the
diff --git a/package/Config.in b/package/Config.in
index c78fd31..ff7fc3d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -4,7 +4,7 @@ source "package/busybox/Config.in"
 
 comment "The minimum needed to build a uClibc development system"
 
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bash/Config.in"
 source "package/bzip2/Config.in"
 source "package/coreutils/Config.in"
@@ -12,15 +12,15 @@ source "package/diffutils/Config.in"
 source "package/findutils/Config.in"
 endif
 source "package/flex/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/gawk/Config.in"
 endif
 source "toolchain/gcc/Config.in.2"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/grep/Config.in"
 endif
 source "package/make/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/patch/Config.in"
 source "package/sed/Config.in"
 source "package/tar/Config.in"
@@ -52,12 +52,12 @@ source "package/at/Config.in"
 source "package/beecrypt/Config.in"
 source "package/berkeleydb/Config.in"
 source "package/bsdiff/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
 endif
 source "package/cups/Config.in"
 source "package/customize/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dash/Config.in"
 endif
 source "package/enchant/Config.in"
@@ -65,7 +65,7 @@ source "package/file/Config.in"
 source "package/gamin/Config.in"
 source "package/icu/Config.in"
 source "package/kexec/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/less/Config.in"
 endif
 source "package/libconfig/Config.in"
@@ -87,16 +87,16 @@ source "package/lsof/Config.in"
 source "package/ltp-testsuite/Config.in"
 source "package/ltrace/Config.in"
 source "package/memstat/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
 source "package/modutils/Config.in"
 endif
 source "package/ng-spice-rework/Config.in"
 source "package/popt/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/procps/Config.in"
 endif
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/psmisc/Config.in"
 endif
 source "package/screen/Config.in"
@@ -104,7 +104,7 @@ source "package/shared-mime-info/Config.in"
 source "package/startup-notification/Config.in"
 source "package/strace/Config.in"
 source "package/sudo/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sysklogd/Config.in"
 # busybox has init and the runit stuff
 source "package/sysvinit/Config.in"
@@ -114,7 +114,7 @@ endif
 
 source "package/database/Config.in"
 
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 # busybox has an editor
 
 # text editors
@@ -128,14 +128,14 @@ comment "Networking applications"
 source "package/argus/Config.in"
 source "package/avahi/Config.in"
 source "package/axel/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/boa/Config.in"
 endif
 source "package/bind/Config.in"
 source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
 source "package/ctorrent/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
 endif
 source "package/dnsmasq/Config.in"
@@ -163,12 +163,12 @@ source "package/libosip2/Config.in"
 source "package/libpcap/Config.in"
 source "package/libsoup/Config.in"
 source "package/libupnp/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/lighttpd/Config.in"
 endif
 source "package/links/Config.in"
 source "package/lrzsz/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/microcom/Config.in"
 endif
 source "package/mii-diag/Config.in"
@@ -177,7 +177,7 @@ source "package/mutt/Config.in"
 source "package/nbd/Config.in"
 source "package/ncftp/Config.in"
 source "package/neon/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/netcat/Config.in"
 source "package/netkitbase/Config.in"
 source "package/netkittelnet/Config.in"
@@ -206,7 +206,7 @@ source "package/socat/Config.in"
 source "package/spawn-fcgi/Config.in"
 source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/tftpd/Config.in"
 source "package/thttpd/Config.in"
 source "package/tinyhttpd/Config.in"
@@ -218,7 +218,7 @@ source "package/vpnc/Config.in"
 source "package/vsftpd/Config.in"
 source "package/vtun/Config.in"
 source "package/webif/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/wget/Config.in"
 endif
 source "package/wireless-tools/Config.in"
@@ -231,7 +231,7 @@ source "package/acpid/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
 source "package/dbus-python/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/devmem2/Config.in"
 endif
 source "package/dmraid/Config.in"
@@ -244,7 +244,7 @@ source "package/fuse/Config.in"
 source "package/gadgetfs-test/Config.in"
 source "package/gvfs/Config.in"
 source "package/hal/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/hdparm/Config.in"
 source "package/hotplug/Config.in"
 endif
@@ -265,12 +265,12 @@ source "package/ntfsprogs/Config.in"
 source "package/pciutils/Config.in"
 source "package/pcmcia/Config.in"
 source "package/setserial/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 # busybox has fdisk
 source "package/sfdisk/Config.in"
 endif
 source "package/smartmontools/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 # mdev
 source "package/udev/Config.in"
 endif
@@ -377,7 +377,7 @@ endmenu
 
 menu "Compressors / decompressors"
 
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/gzip/Config.in"
 endif
 source "package/libarchive/Config.in"
@@ -391,7 +391,7 @@ menu "Package managers"
 
 source "package/ipkg/Config.in"
 source "package/portage/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/rpm/Config.in"
 endif
 endmenu
diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 4961a8d..ca7264f 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -70,12 +70,11 @@ config BR2_PACKAGE_BUSYBOX_CONFIG
 
 	  Most people will just use the default BusyBox configuration file.
 
-config BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
-	bool "Hide applications that are provided by busybox"
+config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	bool "Show packages that are also provided by busybox"
 	depends on BR2_PACKAGE_BUSYBOX
-	default y
 	help
-	  Do not show packages in menuconfig that are potentially provided
+	  Show packages in menuconfig that are potentially also provided
 	  by busybox.
 
 config BR2_PACKAGE_BUSYBOX_SKELETON
diff --git a/target/xtensa/defconfig b/target/xtensa/defconfig
index 4127f53..f7a5741 100644
--- a/target/xtensa/defconfig
+++ b/target/xtensa/defconfig
@@ -90,7 +90,7 @@ BR2_TOOLCHAIN_BUILDROOT=y
 BR2_TOOLCHAIN_SOURCE=y
 
 
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 
 #
 # Other development stuff
-- 
1.6.3.3
