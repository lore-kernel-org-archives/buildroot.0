From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 10:43:13 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/libpcap: security
 bump version to 1.9.1
Message-ID: <20191028093834.EA4288B4D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6733ae2ad83fed3b5c2fdf860765706c670381a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Removed patch applied upstream.

Changelog: https://www.tcpdump.org/libpcap-changes.txt

Quoting changelog:
"Five CVE-2019-15161, CVE-2019-15162, CVE-2019-15163, CVE-2019-15164,
 CVE-2019-15165
 Fixes for CVE-2018-16301, errors in pcapng reading."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7df3dfee55ef26acf30b8845629714119fd51632)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...x.c-add-missing-limits.h-for-musl-systems.patch | 26 ----------------------
 package/libpcap/libpcap.hash                       |  2 +-
 package/libpcap/libpcap.mk                         |  2 +-
 3 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/package/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-systems.patch b/package/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-systems.patch
deleted file mode 100644
index aabaef3383..0000000000
--- a/package/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-systems.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From aafa3512b7b742f5e66a5543e41974cc5e7eebfa Mon Sep 17 00:00:00 2001
-From: maxice8 <thinkabit.ukim@gmail.com>
-Date: Sun, 22 Jul 2018 18:54:17 -0300
-Subject: [PATCH] pcap-usb-linux.c: add missing limits.h for musl systems.
-
-fix compilation on musl libc systems like Void Linux and Alpine.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/the-tcpdump-group/libpcap/commit/aafa3512b7b742f5e66a5543e41974cc5e7eebfa]
----
- pcap-usb-linux.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/pcap-usb-linux.c b/pcap-usb-linux.c
-index 6f8adf65e..b92c05ea1 100644
---- a/pcap-usb-linux.c
-+++ b/pcap-usb-linux.c
-@@ -50,6 +50,7 @@
- #include <stdlib.h>
- #include <unistd.h>
- #include <fcntl.h>
-+#include <limits.h>
- #include <string.h>
- #include <dirent.h>
- #include <byteswap.h>
diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index 19ce2adbe1..a24fba24de 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	2edb88808e5913fdaa8e9c1fcaf272e19b2485338742b5074b9fe44d68f37019	libpcap-1.9.0.tar.gz
+sha256	635237637c5b619bcceba91900666b64d56ecb7be63f298f601ec786ce087094	libpcap-1.9.1.tar.gz
 
 # Hash for license file:
 sha256	8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd	LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index ebceca5273..476183555a 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.9.0
+LIBPCAP_VERSION = 1.9.1
 LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
