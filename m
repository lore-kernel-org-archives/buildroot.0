From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  5 Mar 2021 23:27:44 +0100
Subject: [Buildroot] [PATCH 3/3] package: drop _CPE_ID_VALID,
 use _CPE_ID_VENDOR
In-Reply-To: <cover.1614983175.git.yann.morin.1998@free.fr>
References: <cover.1614983175.git.yann.morin.1998@free.fr>
Message-ID: <857cc5e31466bd9ebecb87d7ad3849715c56e2d6.1614983175.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FOO_CPE_ID_VALID really ought to be an internal implementaion detail.
Packages that really want to trigger their CPE defintitions really
should set one of the actual variables to a meaningful value.

There are two CPE-related variables that we could chose to set to
replace FOO_CPE_ID_VALID: FOO_CPE_ID_VENDOR and FOO_CPE_ID_PRODUCT.
Between those two, _VENDOR more often diverges from the default than
_PRODUCT does, so that's what we use.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

    ---8<------8<------8<------8<------8<---
    #!/bin/bash
    # Replace FOO_CPE_ID_VALID = YES with FOO_CPE_ID_VENDOR = foo_project
    for i in $(git grep -l -E '[^)]_CPE_ID_VALID = YES' package support); do
        pkg="$(basename "${i%/*}")"
        sed -r -i -e "s/_CPE_ID_VALID = YES/_CPE_ID_VENDOR = ${pkg}_project/" "${i}"
    done
    ---8<------8<------8<------8<------8<---
---
 package/asn1c/asn1c.mk                                          | 2 +-
 package/atftp/atftp.mk                                          | 2 +-
 package/atop/atop.mk                                            | 2 +-
 package/attr/attr.mk                                            | 2 +-
 package/axel/axel.mk                                            | 2 +-
 package/bdwgc/bdwgc.mk                                          | 2 +-
 package/beecrypt/beecrypt.mk                                    | 2 +-
 package/botan/botan.mk                                          | 2 +-
 package/c-icap/c-icap.mk                                        | 2 +-
 package/civetweb/civetweb.mk                                    | 2 +-
 package/cjson/cjson.mk                                          | 2 +-
 package/cryptsetup/cryptsetup.mk                                | 2 +-
 package/dosfstools/dosfstools.mk                                | 2 +-
 package/e2fsprogs/e2fsprogs.mk                                  | 2 +-
 package/elfutils/elfutils.mk                                    | 2 +-
 package/file/file.mk                                            | 2 +-
 package/flac/flac.mk                                            | 2 +-
 package/flex/flex.mk                                            | 2 +-
 package/fontconfig/fontconfig.mk                                | 2 +-
 package/giflib/giflib.mk                                        | 2 +-
 package/gnuplot/gnuplot.mk                                      | 2 +-
 package/harfbuzz/harfbuzz.mk                                    | 2 +-
 package/heimdal/heimdal.mk                                      | 2 +-
 package/ipmitool/ipmitool.mk                                    | 2 +-
 package/iucode-tool/iucode-tool.mk                              | 2 +-
 package/jansson/jansson.mk                                      | 2 +-
 package/jasper/jasper.mk                                        | 2 +-
 package/jhead/jhead.mk                                          | 2 +-
 package/jq/jq.mk                                                | 2 +-
 package/json-c/json-c.mk                                        | 2 +-
 package/jsoncpp/jsoncpp.mk                                      | 2 +-
 package/lame/lame.mk                                            | 2 +-
 package/lftp/lftp.mk                                            | 2 +-
 package/libass/libass.mk                                        | 2 +-
 package/libcap-ng/libcap-ng.mk                                  | 2 +-
 package/libconfuse/libconfuse.mk                                | 2 +-
 package/libesmtp/libesmtp.mk                                    | 2 +-
 package/libevent/libevent.mk                                    | 2 +-
 package/libexif/libexif.mk                                      | 2 +-
 package/libgit2/libgit2.mk                                      | 2 +-
 package/libksba/libksba.mk                                      | 2 +-
 package/librsync/librsync.mk                                    | 2 +-
 package/libseccomp/libseccomp.mk                                | 2 +-
 package/libsndfile/libsndfile.mk                                | 2 +-
 package/libtirpc/libtirpc.mk                                    | 2 +-
 package/libupnp/libupnp.mk                                      | 2 +-
 package/libvncserver/libvncserver.mk                            | 2 +-
 package/logrotate/logrotate.mk                                  | 2 +-
 package/lzo/lzo.mk                                              | 2 +-
 package/matio/matio.mk                                          | 2 +-
 package/minicom/minicom.mk                                      | 2 +-
 package/ncmpc/ncmpc.mk                                          | 2 +-
 package/netatalk/netatalk.mk                                    | 2 +-
 package/netcat/netcat.mk                                        | 2 +-
 package/nettle/nettle.mk                                        | 2 +-
 package/oniguruma/oniguruma.mk                                  | 2 +-
 package/openrc/openrc.mk                                        | 2 +-
 package/p11-kit/p11-kit.mk                                      | 2 +-
 package/polkit/polkit.mk                                        | 2 +-
 package/powerpc-utils/powerpc-utils.mk                          | 2 +-
 package/procps-ng/procps-ng.mk                                  | 2 +-
 package/rabbitmq-c/rabbitmq-c.mk                                | 2 +-
 package/rhash/rhash.mk                                          | 2 +-
 package/rpcbind/rpcbind.mk                                      | 2 +-
 package/rtmpdump/rtmpdump.mk                                    | 2 +-
 package/sane-backends/sane-backends.mk                          | 2 +-
 package/spice/spice.mk                                          | 2 +-
 package/squashfs/squashfs.mk                                    | 2 +-
 package/strace/strace.mk                                        | 2 +-
 package/sysklogd/sysklogd.mk                                    | 2 +-
 package/tmux/tmux.mk                                            | 2 +-
 package/unzip/unzip.mk                                          | 2 +-
 package/upx/upx.mk                                              | 2 +-
 package/valijson/valijson.mk                                    | 2 +-
 package/vsftpd/vsftpd.mk                                        | 2 +-
 package/x11vnc/x11vnc.mk                                        | 2 +-
 package/xscreensaver/xscreensaver.mk                            | 2 +-
 package/yaml-cpp/yaml-cpp.mk                                    | 2 +-
 package/zziplib/zziplib.mk                                      | 2 +-
 .../core/cpeid-br2-external/package/cpe-id-pkg3/cpe-id-pkg3.mk  | 2 +-
 80 files changed, 80 insertions(+), 80 deletions(-)

diff --git a/package/asn1c/asn1c.mk b/package/asn1c/asn1c.mk
index e76a9f84fd..a5fb9ccf1b 100644
--- a/package/asn1c/asn1c.mk
+++ b/package/asn1c/asn1c.mk
@@ -8,6 +8,6 @@ ASN1C_VERSION = 0.9.28
 ASN1C_SITE = https://github.com/vlm/asn1c/releases/download/v$(ASN1C_VERSION)
 ASN1C_LICENSE = BSD-2-Clause
 ASN1C_LICENSE_FILES = LICENSE
-ASN1C_CPE_ID_VALID = YES
+ASN1C_CPE_ID_VENDOR = asn1c_project
 
 $(eval $(host-autotools-package))
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index de67a4c680..a2df4af056 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -8,7 +8,7 @@ ATFTP_VERSION = 0.7.4
 ATFTP_SITE = http://sourceforge.net/projects/atftp/files
 ATFTP_LICENSE = GPL-2.0+
 ATFTP_LICENSE_FILES = LICENSE
-ATFTP_CPE_ID_VALID = YES
+ATFTP_CPE_ID_VENDOR = atftp_project
 ATFTP_CONF_OPTS = --disable-libwrap --disable-mtftp
 # For static we need to explicitly link against libpthread
 ATFTP_LIBS = -lpthread
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index acbaf2995a..88f292b6b3 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -8,7 +8,7 @@ ATOP_VERSION = 2.6.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
-ATOP_CPE_ID_VALID = YES
+ATOP_CPE_ID_VENDOR = atop_project
 ATOP_DEPENDENCIES = ncurses zlib
 
 ATOP_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 13f3f0db3d..b6b46453c7 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -8,7 +8,7 @@ ATTR_VERSION = 2.4.48
 ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
-ATTR_CPE_ID_VALID = YES
+ATTR_CPE_ID_VENDOR = attr_project
 
 ATTR_INSTALL_STAGING = YES
 
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 8dbf277b88..8e3d7679e7 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -9,7 +9,7 @@ AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
 AXEL_LICENSE = GPL-2.0+
 AXEL_LICENSE_FILES = COPYING
-AXEL_CPE_ID_VALID = YES
+AXEL_CPE_ID_VENDOR = axel_project
 AXEL_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 4a720dbfd8..57dd82cab4 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -10,7 +10,7 @@ BDWGC_SITE = http://www.hboehm.info/gc/gc_source
 BDWGC_INSTALL_STAGING = YES
 BDWGC_LICENSE = bdwgc license
 BDWGC_LICENSE_FILES = README.QUICK
-BDWGC_CPE_ID_VALID = YES
+BDWGC_CPE_ID_VENDOR = bdwgc_project
 BDWGC_DEPENDENCIES = libatomic_ops host-pkgconf
 HOST_BDWGC_DEPENDENCIES = host-libatomic_ops host-pkgconf
 
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index 20e1a122d0..78c3c2ebb1 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -10,7 +10,7 @@ BEECRYPT_AUTORECONF = YES
 BEECRYPT_INSTALL_STAGING = YES
 BEECRYPT_LICENSE = LGPL-2.1+
 BEECRYPT_LICENSE_FILES = COPYING.LIB
-BEECRYPT_CPE_ID_VALID = YES
+BEECRYPT_CPE_ID_VENDOR = beecrypt_project
 
 BEECRYPT_CONF_OPTS = \
 	--disable-expert-mode \
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index c3af4a45d8..2e3f99b49b 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -9,7 +9,7 @@ BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
 BOTAN_LICENSE_FILES = license.txt
-BOTAN_CPE_ID_VALID = YES
+BOTAN_CPE_ID_VENDOR = botan_project
 
 BOTAN_INSTALL_STAGING = YES
 
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 5548fb4b97..fb66c75e61 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -9,7 +9,7 @@ C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
 C_ICAP_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_LICENSE = LGPL-2.1+
 C_ICAP_LICENSE_FILES = COPYING
-C_ICAP_CPE_ID_VALID = YES
+C_ICAP_CPE_ID_VENDOR = c-icap_project
 C_ICAP_INSTALL_STAGING = YES
 C_ICAP_CONFIG_SCRIPTS = c-icap-config c-icap-libicapapi-config
 C_ICAP_CONF_OPTS = \
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 2cabee3736..94fbb4f9d8 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -8,7 +8,7 @@ CIVETWEB_VERSION = 1.13
 CIVETWEB_SITE = $(call github,civetweb,civetweb,v$(CIVETWEB_VERSION))
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
-CIVETWEB_CPE_ID_VALID = YES
+CIVETWEB_CPE_ID_VENDOR = civetweb_project
 
 CIVETWEB_CONF_OPTS = TARGET_OS=LINUX WITH_IPV6=1 \
 	$(if $(BR2_INSTALL_LIBSTDCPP),WITH_CPP=1)
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 4bfab3b646..47f8ecfd15 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -9,7 +9,7 @@ CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
 CJSON_LICENSE_FILES = LICENSE
-CJSON_CPE_ID_VALID = YES
+CJSON_CPE_ID_VENDOR = cjson_project
 # Set ENABLE_CUSTOM_COMPILER_FLAGS to OFF in particular to disable
 # -fstack-protector-strong which depends on BR2_TOOLCHAIN_HAS_SSP
 CJSON_CONF_OPTS += \
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 34981282b2..719885b59c 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -15,7 +15,7 @@ CRYPTSETUP_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES)
 CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
-CRYPTSETUP_CPE_ID_VALID = YES
+CRYPTSETUP_CPE_ID_VENDOR = cryptsetup_project
 CRYPTSETUP_INSTALL_STAGING = YES
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index b876649b90..b5da490dbd 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -9,7 +9,7 @@ DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.xz
 DOSFSTOOLS_SITE = https://github.com/dosfstools/dosfstools/releases/download/v$(DOSFSTOOLS_VERSION)
 DOSFSTOOLS_LICENSE = GPL-3.0+
 DOSFSTOOLS_LICENSE_FILES = COPYING
-DOSFSTOOLS_CPE_ID_VALID = YES
+DOSFSTOOLS_CPE_ID_VENDOR = dosfstools_project
 DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks --exec-prefix=/
 HOST_DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks
 
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index e2d6263c4e..eb127b42d3 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -9,7 +9,7 @@ E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
 E2FSPROGS_LICENSE_FILES = NOTICE lib/ss/mit-sipb-copyright.h lib/et/internal.h
-E2FSPROGS_CPE_ID_VALID = YES
+E2FSPROGS_CPE_ID_VENDOR = e2fsprogs_project
 E2FSPROGS_INSTALL_STAGING = YES
 
 # Use libblkid and libuuid from util-linux for host and target packages.
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index e52e38b16e..b76b06bcb3 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -10,7 +10,7 @@ ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
 ELFUTILS_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3
-ELFUTILS_CPE_ID_VALID = YES
+ELFUTILS_CPE_ID_VENDOR = elfutils_project
 ELFUTILS_DEPENDENCIES = host-pkgconf zlib $(TARGET_NLS_DEPENDENCIES)
 HOST_ELFUTILS_DEPENDENCIES = host-pkgconf host-zlib host-bzip2 host-xz
 
diff --git a/package/file/file.mk b/package/file/file.mk
index fa7daa8e07..c41a8eb3a4 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -12,7 +12,7 @@ FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 FILE_INSTALL_STAGING = YES
 FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
-FILE_CPE_ID_VALID = YES
+FILE_CPE_ID_VENDOR = file_project
 # We're patching configure.ac
 FILE_AUTORECONF = YES
 HOST_FILE_CONF_OPTS = --disable-libseccomp
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 15d4eefb37..880c176f6e 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -11,7 +11,7 @@ FLAC_INSTALL_STAGING = YES
 FLAC_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 FLAC_LICENSE = Xiph BSD-like (libFLAC), GPL-2.0+ (tools), LGPL-2.1+ (other libraries)
 FLAC_LICENSE_FILES = COPYING.Xiph COPYING.GPL COPYING.LGPL
-FLAC_CPE_ID_VALID = YES
+FLAC_CPE_ID_VENDOR = flac_project
 
 # patch touching configure.ac
 FLAC_AUTORECONF = YES
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 52a15ca497..2d00969662 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -9,7 +9,7 @@ FLEX_SITE = https://github.com/westes/flex/files/981163
 FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
-FLEX_CPE_ID_VALID = YES
+FLEX_CPE_ID_VENDOR = flex_project
 FLEX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-m4
 HOST_FLEX_DEPENDENCIES = host-m4
 
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 0c15e89313..33218ed639 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -15,7 +15,7 @@ HOST_FONTCONFIG_DEPENDENCIES = \
 	host-freetype host-expat host-pkgconf host-gperf host-util-linux
 FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
-FONTCONFIG_CPE_ID_VALID = YES
+FONTCONFIG_CPE_ID_VENDOR = fontconfig_project
 
 FONTCONFIG_CONF_OPTS = \
 	--with-arch=$(GNU_TARGET_NAME) \
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index 9b4f602db6..d47edfaa8b 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -9,7 +9,7 @@ GIFLIB_SITE = http://downloads.sourceforge.net/project/giflib
 GIFLIB_INSTALL_STAGING = YES
 GIFLIB_LICENSE = MIT
 GIFLIB_LICENSE_FILES = COPYING
-GIFLIB_CPE_ID_VALID = YES
+GIFLIB_CPE_ID_VENDOR = giflib_project
 
 ifeq ($(BR2_STATIC_LIBS),y)
 GIFLIB_BUILD_LIBS = static-lib
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 8d096c6102..9a72a47144 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -8,7 +8,7 @@ GNUPLOT_VERSION = 5.4.1
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
-GNUPLOT_CPE_ID_VALID = YES
+GNUPLOT_CPE_ID_VENDOR = gnuplot_project
 
 GNUPLOT_AUTORECONF = YES
 
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 28771118a1..f1ef7ee953 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -9,7 +9,7 @@ HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZ
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
 HARFBUZZ_LICENSE_FILES = COPYING
-HARFBUZZ_CPE_ID_VALID = YES
+HARFBUZZ_CPE_ID_VENDOR = harfbuzz_project
 HARFBUZZ_INSTALL_STAGING = YES
 HARFBUZZ_CONF_OPTS = \
 	-Dfontconfig=disabled \
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index b72778f396..9a1a68f046 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -31,7 +31,7 @@ HOST_HEIMDAL_CONF_OPTS = \
 HOST_HEIMDAL_CONF_ENV = MAKEINFO=true
 HEIMDAL_LICENSE = BSD-3-Clause
 HEIMDAL_LICENSE_FILES = LICENSE
-HEIMDAL_CPE_ID_VALID = YES
+HEIMDAL_CPE_ID_VENDOR = heimdal_project
 
 # We need asn1_compile in the PATH for samba4
 define HOST_HEIMDAL_MAKE_SYMLINK
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 29a0476589..facd97a0b8 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -9,7 +9,7 @@ IPMITOOL_SOURCE = ipmitool-$(IPMITOOL_VERSION).tar.bz2
 IPMITOOL_SITE = http://downloads.sourceforge.net/project/ipmitool/ipmitool/$(IPMITOOL_VERSION)
 IPMITOOL_LICENSE = BSD-3-Clause
 IPMITOOL_LICENSE_FILES = COPYING
-IPMITOOL_CPE_ID_VALID = YES
+IPMITOOL_CPE_ID_VENDOR = ipmitool_project
 
 # 0008-fru-Fix-buffer-overflow-vulnerabilities.patch
 # 0009-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index 64229ccc0f..568692c46c 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -12,7 +12,7 @@ IUCODE_TOOL_DEPENDENCIES = argp-standalone
 endif
 IUCODE_TOOL_LICENSE = GPL-2.0+
 IUCODE_TOOL_LICENSE_FILES = COPYING
-IUCODE_TOOL_CPE_ID_VALID = YES
+IUCODE_TOOL_CPE_ID_VENDOR = iucode-tool_project
 
 define IUCODE_TOOL_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/iucode-tool/S00iucode-tool \
diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index 4ac64b69ef..2761ce9b16 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -8,7 +8,7 @@ JANSSON_VERSION = 2.13.1
 JANSSON_SITE = http://www.digip.org/jansson/releases
 JANSSON_LICENSE = MIT
 JANSSON_LICENSE_FILES = LICENSE
-JANSSON_CPE_ID_VALID = YES
+JANSSON_CPE_ID_VENDOR = jansson_project
 JANSSON_INSTALL_STAGING = YES
 JANSSON_CONF_ENV = LIBS="-lm"
 
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index d487e8e2d6..3f78b45e17 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -9,7 +9,7 @@ JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
 JASPER_LICENSE_FILES = LICENSE
-JASPER_CPE_ID_VALID = YES
+JASPER_CPE_ID_VENDOR = jasper_project
 JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
 JASPER_CONF_OPTS = \
 	-DCMAKE_DISABLE_FIND_PACKAGE_DOXYGEN=TRUE \
diff --git a/package/jhead/jhead.mk b/package/jhead/jhead.mk
index 9c0d4d1237..49cb03da61 100644
--- a/package/jhead/jhead.mk
+++ b/package/jhead/jhead.mk
@@ -8,7 +8,7 @@ JHEAD_VERSION = 3.04
 JHEAD_SITE = http://www.sentex.net/~mwandel/jhead
 JHEAD_LICENSE = Public Domain
 JHEAD_LICENSE_FILES = readme.txt
-JHEAD_CPE_ID_VALID = YES
+JHEAD_CPE_ID_VENDOR = jhead_project
 
 define JHEAD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index 0aab55d089..7f890f8998 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -8,7 +8,7 @@ JQ_VERSION = a17dd3248a666d01be75f6b16be37e80e20b0954
 JQ_SITE = $(call github,stedolan,jq,$(JQ_VERSION))
 JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
-JQ_CPE_ID_VALID = YES
+JQ_CPE_ID_VENDOR = jq_project
 JQ_INSTALL_STAGING = YES
 
 # currently using git version directly
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index a55831432a..3639bad25a 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -9,7 +9,7 @@ JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
-JSON_C_CPE_ID_VALID = YES
+JSON_C_CPE_ID_VENDOR = json-c_project
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index a8d863a3ed..829459df4d 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -8,7 +8,7 @@ JSONCPP_VERSION = 1.9.4
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
-JSONCPP_CPE_ID_VALID = YES
+JSONCPP_CPE_ID_VENDOR = jsoncpp_project
 JSONCPP_INSTALL_STAGING = YES
 JSONCPP_CONF_OPTS = -Dtests=false
 
diff --git a/package/lame/lame.mk b/package/lame/lame.mk
index 206e4407c9..3a57cffe3d 100644
--- a/package/lame/lame.mk
+++ b/package/lame/lame.mk
@@ -12,7 +12,7 @@ LAME_CONF_ENV = GTK_CONFIG=/bin/false
 LAME_CONF_OPTS = --enable-dynamic-frontends
 LAME_LICENSE = LGPL-2.0+
 LAME_LICENSE_FILES = COPYING
-LAME_CPE_ID_VALID = YES
+LAME_CPE_ID_VENDOR = lame_project
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LAME_DEPENDENCIES += libsndfile
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 483ca298cd..00b33b91fb 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -9,7 +9,7 @@ LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPL-3.0+
 LFTP_LICENSE_FILES = COPYING
-LFTP_CPE_ID_VALID = YES
+LFTP_CPE_ID_VENDOR = lftp_project
 LFTP_DEPENDENCIES = readline zlib host-pkgconf
 
 # Help lftp finding readline and zlib
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 8bdfd9dd40..48e70a52c5 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -12,7 +12,7 @@ LIBASS_SITE = https://github.com/libass/libass/releases/download/$(LIBASS_VERSIO
 LIBASS_INSTALL_STAGING = YES
 LIBASS_LICENSE = ISC
 LIBASS_LICENSE_FILES = COPYING
-LIBASS_CPE_ID_VALID = YES
+LIBASS_CPE_ID_VENDOR = libass_project
 LIBASS_DEPENDENCIES = \
 	host-pkgconf \
 	freetype \
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index d4c9336e2b..4fb0cf4777 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -8,7 +8,7 @@ LIBCAP_NG_VERSION = 0.8.2
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
-LIBCAP_NG_CPE_ID_VALID = YES
+LIBCAP_NG_CPE_ID_VENDOR = libcap-ng_project
 LIBCAP_NG_INSTALL_STAGING = YES
 
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index b4523d069c..2beb0e4fbf 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -11,7 +11,7 @@ LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPTS = --disable-rpath
 LIBCONFUSE_LICENSE = ISC
 LIBCONFUSE_LICENSE_FILES = LICENSE
-LIBCONFUSE_CPE_ID_VALID = YES
+LIBCONFUSE_CPE_ID_VENDOR = libconfuse_project
 LIBCONFUSE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 $(eval $(autotools-package))
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index ad896fc943..dcffaceddc 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -12,6 +12,6 @@ LIBESMTP_CONFIG_SCRIPTS = libesmtp-config
 LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
 LIBESMTP_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
 LIBESMTP_LICENSE_FILES = COPYING COPYING.LIB
-LIBESMTP_CPE_ID_VALID = YES
+LIBESMTP_CPE_ID_VENDOR = libesmtp_project
 
 $(eval $(autotools-package))
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 1e34094e25..93ba88ca88 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -10,7 +10,7 @@ LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_INSTALL_STAGING = YES
 LIBEVENT_LICENSE = BSD-3-Clause, OpenBSD
 LIBEVENT_LICENSE_FILES = LICENSE
-LIBEVENT_CPE_ID_VALID = YES
+LIBEVENT_CPE_ID_VENDOR = libevent_project
 LIBEVENT_CONF_OPTS = \
 	--disable-libevent-regress \
 	--disable-samples
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 9d29cbf590..9a25e90d26 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -12,7 +12,7 @@ LIBEXIF_INSTALL_STAGING = YES
 LIBEXIF_DEPENDENCIES = host-pkgconf
 LIBEXIF_LICENSE = LGPL-2.1+
 LIBEXIF_LICENSE_FILES = COPYING
-LIBEXIF_CPE_ID_VALID = YES
+LIBEXIF_CPE_ID_VENDOR = libexif_project
 # 0001-fixed-another-unsigned-integer-overflow.patch
 LIBEXIF_IGNORE_CVES += CVE-2020-0198
 # 0002-fixed-a-incorrect-overflow-check.patch
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 14709a0939..e5d17fa3dd 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -8,7 +8,7 @@ LIBGIT2_VERSION = 1.1.0
 LIBGIT2_SITE = https://github.com/libgit2/libgit2/releases/download/v$(LIBGIT2_VERSION)
 LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch)
 LIBGIT2_LICENSE_FILES = COPYING
-LIBGIT2_CPE_ID_VALID = YES
+LIBGIT2_CPE_ID_VENDOR = libgit2_project
 LIBGIT2_INSTALL_STAGING = YES
 
 LIBGIT2_CONF_OPTS = \
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 2ad9bee06d..bb02391a38 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -9,7 +9,7 @@ LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
 LIBKSBA_LICENSE_FILES = AUTHORS COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv3
-LIBKSBA_CPE_ID_VALID = YES
+LIBKSBA_CPE_ID_VENDOR = libksba_project
 LIBKSBA_INSTALL_STAGING = YES
 LIBKSBA_DEPENDENCIES = libgpg-error
 LIBKSBA_CONF_OPTS = --with-gpg-error-prefix=$(STAGING_DIR)/usr
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index fd9eefe129..bb36cb657c 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -8,7 +8,7 @@ LIBRSYNC_VERSION = 2.3.1
 LIBRSYNC_SITE = $(call github,librsync,librsync,v$(LIBRSYNC_VERSION))
 LIBRSYNC_LICENSE = LGPL-2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
-LIBRSYNC_CPE_ID_VALID = YES
+LIBRSYNC_CPE_ID_VENDOR = librsync_project
 LIBRSYNC_INSTALL_STAGING = YES
 LIBRSYNC_DEPENDENCIES = host-pkgconf zlib bzip2 popt
 
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 33ef14a3d8..e7512730d5 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -8,7 +8,7 @@ LIBSECCOMP_VERSION = 2.4.4
 LIBSECCOMP_SITE = https://github.com/seccomp/libseccomp/releases/download/v$(LIBSECCOMP_VERSION)
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
-LIBSECCOMP_CPE_ID_VALID = YES
+LIBSECCOMP_CPE_ID_VENDOR = libseccomp_project
 LIBSECCOMP_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index cdaa01de35..eb15426146 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -9,7 +9,7 @@ LIBSNDFILE_SITE = http://www.mega-nerd.com/libsndfile/files
 LIBSNDFILE_INSTALL_STAGING = YES
 LIBSNDFILE_LICENSE = LGPL-2.1+
 LIBSNDFILE_LICENSE_FILES = COPYING
-LIBSNDFILE_CPE_ID_VALID = YES
+LIBSNDFILE_CPE_ID_VENDOR = libsndfile_project
 
 # 0001-double64_init-Check-psf-sf.channels-against-upper-bo.patch
 LIBSNDFILE_IGNORE_CVES += CVE-2017-14634
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index e0c3d0e3f2..0f44aaffb6 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -9,7 +9,7 @@ LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
 LIBTIRPC_LICENSE_FILES = COPYING
-LIBTIRPC_CPE_ID_VALID = YES
+LIBTIRPC_CPE_ID_VENDOR = libtirpc_project
 
 LIBTIRPC_DEPENDENCIES = host-nfs-utils
 LIBTIRPC_INSTALL_STAGING = YES
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index ebc5e83765..0b36881e16 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -12,7 +12,7 @@ LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP_INSTALL_STAGING = YES
 LIBUPNP_LICENSE = BSD-3-Clause
 LIBUPNP_LICENSE_FILES = COPYING
-LIBUPNP_CPE_ID_VALID = YES
+LIBUPNP_CPE_ID_VENDOR = libupnp_project
 LIBUPNP_DEPENDENCIES = host-pkgconf
 
 # Bind the internal miniserver socket with reuseaddr to allow clean restarts.
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index db38e7d3cb..ead809d19c 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -9,7 +9,7 @@ LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
 LIBVNCSERVER_SITE = https://github.com/LibVNC/libvncserver/archive
 LIBVNCSERVER_LICENSE = GPL-2.0+
 LIBVNCSERVER_LICENSE_FILES = COPYING
-LIBVNCSERVER_CPE_ID_VALID = YES
+LIBVNCSERVER_CPE_ID_VENDOR = libvncserver_project
 LIBVNCSERVER_INSTALL_STAGING = YES
 LIBVNCSERVER_DEPENDENCIES = host-pkgconf lzo
 LIBVNCSERVER_CONF_OPTS = -DWITH_LZO=ON
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index ee2ab75095..df79da677e 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -9,7 +9,7 @@ LOGROTATE_SOURCE = logrotate-3.18.0.tar.xz
 LOGROTATE_SITE = https://github.com/logrotate/logrotate/releases/download/$(LOGROTATE_VERSION)
 LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
-LOGROTATE_CPE_ID_VALID = YES
+LOGROTATE_CPE_ID_VENDOR = logrotate_project
 LOGROTATE_DEPENDENCIES = popt host-pkgconf
 LOGROTATE_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
 
diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 76c00615d5..0682d8d0ff 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -8,7 +8,7 @@ LZO_VERSION = 2.10
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_LICENSE = GPL-2.0+
 LZO_LICENSE_FILES = COPYING
-LZO_CPE_ID_VALID = YES
+LZO_CPE_ID_VENDOR = lzo_project
 LZO_INSTALL_STAGING = YES
 LZO_SUPPORTS_IN_SOURCE_BUILD = NO
 
diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index eb83632746..0ebba13435 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -8,7 +8,7 @@ MATIO_VERSION = 1.5.18
 MATIO_SITE = http://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
 MATIO_LICENSE = BSD-2-Clause
 MATIO_LICENSE_FILES = COPYING
-MATIO_CPE_ID_VALID = YES
+MATIO_CPE_ID_VENDOR = matio_project
 MATIO_DEPENDENCIES = zlib
 MATIO_INSTALL_STAGING = YES
 
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 7a8b2ef369..b81ee52120 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -10,7 +10,7 @@ MINICOM_SITE = \
 	https://salsa.debian.org/minicom-team/minicom/-/archive/$(MINICOM_VERSION)
 MINICOM_LICENSE = GPL-2.0+
 MINICOM_LICENSE_FILES = COPYING
-MINICOM_CPE_ID_VALID = YES
+MINICOM_CPE_ID_VENDOR = minicom_project
 MINICOM_AUTORECONF = YES
 
 MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv) \
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index c229fd298c..0cc9765642 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -16,7 +16,7 @@ NCMPC_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES)
 NCMPC_LICENSE = GPL-2.0+
 NCMPC_LICENSE_FILES = COPYING
-NCMPC_CPE_ID_VALID = YES
+NCMPC_CPE_ID_VENDOR = ncmpc_project
 
 NCMPC_CONF_OPTS = \
 	-Dcurses=ncurses \
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index afe87bb409..0c219a2316 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -14,7 +14,7 @@ NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error \
 	libevent
 NETATALK_LICENSE = GPL-2.0+, LGPL-3.0+, MIT-like
 NETATALK_LICENSE_FILES = COPYING COPYRIGHT
-NETATALK_CPE_ID_VALID = YES
+NETATALK_CPE_ID_VENDOR = netatalk_project
 
 # Don't run ldconfig!
 NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" \
diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index c9d7952e59..939c9fa9fb 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -8,6 +8,6 @@ NETCAT_VERSION = 0.7.1
 NETCAT_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VERSION)
 NETCAT_LICENSE = GPL-2.0+
 NETCAT_LICENSE_FILES = COPYING
-NETCAT_CPE_ID_VALID = YES
+NETCAT_CPE_ID_VENDOR = netcat_project
 
 $(eval $(autotools-package))
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 68844976ea..fef68375db 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -10,7 +10,7 @@ NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
 NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
 NETTLE_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
-NETTLE_CPE_ID_VALID = YES
+NETTLE_CPE_ID_VENDOR = nettle_project
 # don't include openssl support for (unused) examples as it has problems
 # with static linking
 NETTLE_CONF_OPTS = --disable-openssl
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index ef63a5e8a7..6ea5e1e691 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -10,7 +10,7 @@ ONIGURUMA_SITE = \
 ONIGURUMA_SOURCE = onig-$(ONIGURUMA_VERSION).tar.gz
 ONIGURUMA_LICENSE = BSD-2-Clause
 ONIGURUMA_LICENSE_FILES = COPYING
-ONIGURUMA_CPE_ID_VALID = YES
+ONIGURUMA_CPE_ID_VENDOR = oniguruma_project
 ONIGURUMA_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index e9e35c4d13..d9010a60be 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -8,7 +8,7 @@ OPENRC_VERSION = 0.42.1
 OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
 OPENRC_LICENSE = BSD-2-Clause
 OPENRC_LICENSE_FILES = LICENSE
-OPENRC_CPE_ID_VALID = YES
+OPENRC_CPE_ID_VENDOR = openrc_project
 
 # 0007-checkpath-fix-CVE-2018-21269.patch
 OPENRC_IGNORE_CVES += CVE-2018-21269
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 977150f571..284eb0fa35 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -13,7 +13,7 @@ P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
 	ac_cv_have_decl___progname=no
 P11_KIT_LICENSE = BSD-3-Clause
 P11_KIT_LICENSE_FILES = COPYING
-P11_KIT_CPE_ID_VALID = YES
+P11_KIT_CPE_ID_VENDOR = p11-kit_project
 
 ifeq ($(BR2_PACKAGE_LIBFFI),y)
 P11_KIT_DEPENDENCIES += host-pkgconf libffi
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index e3fad53183..bf9b5a7112 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -8,7 +8,7 @@ POLKIT_VERSION = 0.116
 POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
-POLKIT_CPE_ID_VALID = YES
+POLKIT_CPE_ID_VENDOR = polkit_project
 POLKIT_AUTORECONF = YES
 POLKIT_INSTALL_STAGING = YES
 
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index 2f8b7d3b96..b12194ae8e 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -10,7 +10,7 @@ POWERPC_UTILS_DEPENDENCIES = zlib
 POWERPC_UTILS_AUTORECONF = YES
 POWERPC_UTILS_LICENSE = GPL-2.0+
 POWERPC_UTILS_LICENSE_FILES = COPYING
-POWERPC_UTILS_CPE_ID_VALID = YES
+POWERPC_UTILS_CPE_ID_VENDOR = powerpc-utils_project
 
 POWERPC_UTILS_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 1f99ac3e55..84ada1b133 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -9,7 +9,7 @@ PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPL-2.0+, LGPL-2.0+ (libproc and libps)
 PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
-PROCPS_NG_CPE_ID_VALID = YES
+PROCPS_NG_CPE_ID_VENDOR = procps-ng_project
 PROCPS_NG_INSTALL_STAGING = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index 2c7d15c0ad..e6ac52fd87 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -8,7 +8,7 @@ RABBITMQ_C_VERSION = 0.10.0
 RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,v$(RABBITMQ_C_VERSION))
 RABBITMQ_C_LICENSE = MIT
 RABBITMQ_C_LICENSE_FILES = LICENSE-MIT
-RABBITMQ_C_CPE_ID_VALID = YES
+RABBITMQ_C_CPE_ID_VENDOR = rabbitmq-c_project
 RABBITMQ_C_INSTALL_STAGING = YES
 RABBITMQ_C_CONF_OPTS = \
 	-DBUILD_API_DOCS=OFF \
diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 4438112f3f..92abcd29b0 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -9,7 +9,7 @@ RHASH_SOURCE = rhash-$(RHASH_VERSION)-src.tar.gz
 RHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(RHASH_VERSION)
 RHASH_LICENSE = 0BSD
 RHASH_LICENSE_FILES = COPYING
-RHASH_CPE_ID_VALID = YES
+RHASH_CPE_ID_VENDOR = rhash_project
 RHASH_INSTALL_STAGING = YES
 RHASH_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 RHASH_ADDLDFLAGS = $(TARGET_NLS_LIBS)
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index abeca2d247..25916f0b56 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -9,7 +9,7 @@ RPCBIND_SITE = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIN
 RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3-Clause
 RPCBIND_LICENSE_FILES = COPYING
-RPCBIND_CPE_ID_VALID = YES
+RPCBIND_CPE_ID_VENDOR = rpcbind_project
 
 RPCBIND_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 35b3ec1846..db79a796dc 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -11,7 +11,7 @@ RTMPDUMP_INSTALL_STAGING = YES
 # care about librtmp, it's LGPL-2.1+
 RTMPDUMP_LICENSE = LGPL-2.1+
 RTMPDUMP_LICENSE_FILES = librtmp/COPYING
-RTMPDUMP_CPE_ID_VALID = YES
+RTMPDUMP_CPE_ID_VENDOR = rtmpdump_project
 RTMPDUMP_DEPENDENCIES = zlib
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 9c4494f096..3c93ceaaae 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -10,7 +10,7 @@ SANE_BACKENDS_SITE = \
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 SANE_BACKENDS_LICENSE = GPL-2.0+
 SANE_BACKENDS_LICENSE_FILES = COPYING
-SANE_BACKENDS_CPE_ID_VALID = YES
+SANE_BACKENDS_CPE_ID_VENDOR = sane-backends_project
 SANE_BACKENDS_INSTALL_STAGING = YES
 
 SANE_BACKENDS_CONF_OPTS = \
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index db05bd67f0..b515431cf1 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -9,7 +9,7 @@ SPICE_SOURCE = spice-$(SPICE_VERSION).tar.bz2
 SPICE_SITE = http://www.spice-space.org/download/releases/spice-server
 SPICE_LICENSE = LGPL-2.1+
 SPICE_LICENSE_FILES = COPYING
-SPICE_CPE_ID_VALID = YES
+SPICE_CPE_ID_VENDOR = spice_project
 SPICE_INSTALL_STAGING = YES
 SPICE_DEPENDENCIES = \
 	host-pkgconf \
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 026c0a46cc..cbc3c906d8 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -8,7 +8,7 @@ SQUASHFS_VERSION = 4.4
 SQUASHFS_SITE = $(call github,plougher,squashfs-tools,$(SQUASHFS_VERSION))
 SQUASHFS_LICENSE = GPL-2.0+
 SQUASHFS_LICENSE_FILES = COPYING
-SQUASHFS_CPE_ID_VALID = YES
+SQUASHFS_CPE_ID_VENDOR = squashfs_project
 SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1
 
 ifeq ($(BR2_PACKAGE_SQUASHFS_LZ4),y)
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 646be41e5b..0ae622ec5a 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -9,7 +9,7 @@ STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
 STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
-STRACE_CPE_ID_VALID = YES
+STRACE_CPE_ID_VENDOR = strace_project
 STRACE_CONF_OPTS = --enable-mpers=no
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index ff181372b6..ea7b869d7b 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -8,7 +8,7 @@ SYSKLOGD_VERSION = 2.2.1
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
-SYSKLOGD_CPE_ID_VALID = YES
+SYSKLOGD_CPE_ID_VENDOR = sysklogd_project
 
 # Busybox install logger in /usr/bin, and syslogd in /sbin, so install in
 # the same locations so that busybox does not install its applets in there.
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 17570520c3..281b7d8ee6 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -8,7 +8,7 @@ TMUX_VERSION = 3.1c
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = COPYING
-TMUX_CPE_ID_VALID = YES
+TMUX_CPE_ID_VENDOR = tmux_project
 TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
 
 # Add /usr/bin/tmux to /etc/shells otherwise some login tools like dropbear
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 2997d33a28..e8c9366a1b 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -10,7 +10,7 @@ UNZIP_PATCH = unzip_$(UNZIP_VERSION)-26.debian.tar.xz
 UNZIP_SITE = https://snapshot.debian.org/archive/debian/20210110T204103Z/pool/main/u/unzip
 UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
-UNZIP_CPE_ID_VALID = YES
+UNZIP_CPE_ID_VENDOR = unzip_project
 
 # unzip_$(UNZIP_VERSION)-26.debian.tar.xz has patches to fix:
 UNZIP_IGNORE_CVES = \
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index 2449fa643b..bdf5dd4c0e 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -9,7 +9,7 @@ UPX_SITE = https://github.com/upx/upx/releases/download/v$(UPX_VERSION)
 UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.xz
 UPX_LICENSE = GPL-2.0+
 UPX_LICENSE_FILES = COPYING
-UPX_CPE_ID_VALID = YES
+UPX_CPE_ID_VENDOR = upx_project
 
 HOST_UPX_DEPENDENCIES = host-ucl host-zlib
 
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index 29e6342a68..e425757d26 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -8,7 +8,7 @@ VALIJSON_VERSION = 0.3
 VALIJSON_SITE = $(call github,tristanpenman,valijson,v$(VALIJSON_VERSION))
 VALIJSON_LICENSE = BSD-2-Clause
 VALIJSON_LICENSE_FILES = LICENSE
-VALIJSON_CPE_ID_VALID = YES
+VALIJSON_CPE_ID_VENDOR = valijson_project
 VALIJSON_INSTALL_STAGING = YES
 VALIJSON_INSTALL_TARGET = NO
 VALIJSON_DEPENDENCIES = boost
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 2804a3a39d..49b9b1917f 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -9,7 +9,7 @@ VSFTPD_SITE = https://security.appspot.com/downloads
 VSFTPD_LIBS = -lcrypt
 VSFTPD_LICENSE = GPL-2.0
 VSFTPD_LICENSE_FILES = COPYING
-VSFTPD_CPE_ID_VALID = YES
+VSFTPD_CPE_ID_VENDOR = vsftpd_project
 
 define VSFTPD_DISABLE_UTMPX
 	$(SED) 's/.*VSF_BUILD_UTMPX/#undef VSF_BUILD_UTMPX/' $(@D)/builddefs.h
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index aa0f14c456..1eda717c68 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -12,7 +12,7 @@ X11VNC_CONF_OPTS = --without-sdl
 X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst libvncserver
 X11VNC_LICENSE = GPL-2.0+
 X11VNC_LICENSE_FILES = COPYING
-X11VNC_CPE_ID_VALID = YES
+X11VNC_CPE_ID_VENDOR = x11vnc_project
 # 0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
 X11VNC_IGNORE_CVES += CVE-2020-29074
 
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index cb1e440ea1..c3c9ec89c3 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -10,7 +10,7 @@ XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 # N.B. GPL-2.0+ code (in the hacks/glx subdirectory) is not currently built.
 XSCREENSAVER_LICENSE = MIT-like, GPL-2.0+
 XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
-XSCREENSAVER_CPE_ID_VALID = YES
+XSCREENSAVER_CPE_ID_VENDOR = xscreensaver_project
 
 XSCREENSAVER_DEPENDENCIES = \
 	gdk-pixbuf \
diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index d95380e621..895072ec45 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -9,7 +9,7 @@ YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,yaml-cpp-$(YAML_CPP_VERSION))
 YAML_CPP_INSTALL_STAGING = YES
 YAML_CPP_LICENSE = MIT
 YAML_CPP_LICENSE_FILES = LICENSE
-YAML_CPP_CPE_ID_VALID = YES
+YAML_CPP_CPE_ID_VENDOR = yaml-cpp_project
 
 # Disable testing and parse tools
 YAML_CPP_CONF_OPTS += \
diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
index 6cb9dedce8..6b7b64cacc 100644
--- a/package/zziplib/zziplib.mk
+++ b/package/zziplib/zziplib.mk
@@ -8,7 +8,7 @@ ZZIPLIB_VERSION = 0.13.72
 ZZIPLIB_SITE = $(call github,gdraheim,zziplib,v$(ZZIPLIB_VERSION))
 ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
 ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm
-ZZIPLIB_CPE_ID_VALID = YES
+ZZIPLIB_CPE_ID_VENDOR = zziplib_project
 ZZIPLIB_INSTALL_STAGING = YES
 ZZIPLIB_CONF_OPTS += \
 	-DZZIPDOCS=OFF \
diff --git a/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg3/cpe-id-pkg3.mk b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg3/cpe-id-pkg3.mk
index 5added78df..7f539ad584 100644
--- a/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg3/cpe-id-pkg3.mk
+++ b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg3/cpe-id-pkg3.mk
@@ -1,5 +1,5 @@
 CPE_ID_PKG3_VERSION = 67
-CPE_ID_PKG3_CPE_ID_VALID = YES
+CPE_ID_PKG3_CPE_ID_VENDOR = cpe-id-pkg3_project
 
 $(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
2.25.1
