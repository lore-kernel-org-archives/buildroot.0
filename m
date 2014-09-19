From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 18 Sep 2014 22:45:57 -0300
Subject: [Buildroot] [PATCH] wireshark: security bump to version 1.12.1
Message-ID: <1411091157-16541-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-6423 - MEGACO dissector infinite loop.
CVE-2014-6424 - Netflow dissector crash.
CVE-2014-6425 - CUPS dissector crash.
CVE-2014-6426 - HIP dissector infinite loop.
CVE-2014-6427 - RTSP dissector crash.
CVE-2014-6428 - SES dissector crash.
CVE-2014-6429, CVE-2014-6430, CVE-2014-6431, CVE-2014-6432 - Sniffer
file parser crash.

Added hashes as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireshark/wireshark.hash | 3 +++
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/wireshark/wireshark.hash

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
new file mode 100644
index 0000000..00d3861
--- /dev/null
+++ b/package/wireshark/wireshark.hash
@@ -0,0 +1,3 @@
+# From https://www.wireshark.org/download/SIGNATURES-1.12.1.txt
+md5	14b3e3d8979d1eb27ff085bb5f400e67	wireshark-1.12.1.tar.bz2
+sha1	e1508ea25ccf077c5a7fa2af3b88f3ae199f77fb	wireshark-1.12.1.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 0bbf34d..df6e76c 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 1.12.0
+WIRESHARK_VERSION = 1.12.1
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
1.8.5.5
