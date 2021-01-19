From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Tue, 19 Jan 2021 19:09:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: security bump to 2.83
Message-ID: <20210119180908.18903-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the annoucement:
http://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2021q1/014599.html

"There are broadly two sets of problems. The first is subtle errors in
dnsmasq's protections against the chronic weakness of the DNS protocol
to cache-poisoning attacks; the Birthday attack, Kaminsky, etc. [...]

[...] the second set of errors is a good old fashioned buffer overflow
in dnsmasq's DNSSEC code."

Fixes CVE-2020-25681, CVE-2020-25682, CVE-2020-25683, CVE-2020-25684,
      CVE-2020-25685, CVE-2020-25686 and CVE-2020-25687

Details: https://www.jsof-tech.com/disclosures/dnspooq

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
Tested with test-pkg:

BR2_PACKAGE_DNSMASQ=y
BR2_PACKAGE_DNSMASQ_TFTP=y
BR2_PACKAGE_DNSMASQ_DHCP=y
BR2_PACKAGE_DNSMASQ_DNSSEC=y
BR2_PACKAGE_DNSMASQ_IDN=y
BR2_PACKAGE_DNSMASQ_LUA=y
BR2_PACKAGE_DNSMASQ_CONNTRACK=y
BR2_PACKAGE_LUA=y
BR2_PACKAGE_LUA_5_3=y
BR2_PACKAGE_LUA_32BITS=y
BR2_PACKAGE_HAS_LUAINTERPRETER=y
BR2_PACKAGE_LUA_EDITING_NONE=y
BR2_PACKAGE_LIBIDN2=y
BR2_PACKAGE_DBUS=y

                             andes-nds32 [ 1/45]: OK
                             arm-aarch64 [ 2/45]: OK
                    bootlin-x86-64-glibc [ 3/45]: OK
                        br-aarch64-glibc [ 4/45]: OK
                           br-arcle-hs38 [ 5/45]: OK
                            br-arm-basic [ 6/45]: OK
                  br-arm-cortex-a9-glibc [ 7/45]: OK
                   br-arm-cortex-a9-musl [ 8/45]: OK
                   br-arm-cortex-m4-full [ 9/45]: SKIPPED
                             br-arm-full [10/45]: OK
                    br-arm-full-nothread [11/45]: SKIPPED
                      br-arm-full-static [12/45]: OK
                   br-i386-pentium4-full [13/45]: OK
                br-i386-pentium-mmx-musl [14/45]: OK
                       br-m68k-5208-full [15/45]: SKIPPED
                      br-m68k-68040-full [16/45]: OK
                    br-microblazeel-full [17/45]: OK
                 br-mips32r6-el-hf-glibc [18/45]: OK
                      br-mips64-n64-full [19/45]: OK
                 br-mips64r6-el-hf-glibc [20/45]: OK
                      br-mipsel-o32-full [21/45]: OK
                          br-nios2-glibc [22/45]: OK
                      br-openrisc-uclibc [23/45]: OK
               br-powerpc-603e-basic-cpp [24/45]: OK
             br-powerpc64le-power8-glibc [25/45]: OK
               br-powerpc64-power7-glibc [26/45]: OK
                  br-powerpc-e500mc-full [27/45]: OK
                              br-riscv32 [28/45]: OK
                              br-riscv64 [29/45]: OK
                         br-riscv64-musl [30/45]: OK
                             br-sh4-full [31/45]: OK
                        br-sparc64-glibc [32/45]: OK
                         br-sparc-uclibc [33/45]: OK
                    br-x86-64-core2-full [34/45]: OK
                          br-x86-64-musl [35/45]: OK
                          br-xtensa-full [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: OK
                           sourcery-mips [44/45]: OK
                          sourcery-nios2 [45/45]: OK
45 builds, 3 skipped, 0 build failed, 0 legal-info failed
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 401f930baf..6c19dad791 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# http://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.82.tar.xz.asc
-sha256  84523646f3116bb5e1151efb66e645030f6e6a8256f29aab444777a343ebc132  dnsmasq-2.82.tar.xz
+# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.83.tar.xz.asc
+sha256  ffc1f7e8b05e22d910b9a71d09f1128197292766dc7c54cb7018a1b2c3af4aea  dnsmasq-2.83.tar.xz
 # Locally calculated
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index b7e924c2d8..fb21dc7ad0 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.82
+DNSMASQ_VERSION = 2.83
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
-- 
2.29.2
