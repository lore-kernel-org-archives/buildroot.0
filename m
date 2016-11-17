From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 17 Nov 2016 15:55:08 +0000
Subject: [Buildroot] [PATCH v2] wireshark: bump version to 2.2.2 (security)
Message-ID: <20161117155508.37814-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
  https://www.wireshark.org/docs/relnotes/wireshark-2.2.2.html

Security fixes:
  wnpa-sec-2016-62. DTN infinite loop.
  wnpa-sec-2016-61. DCERPC crash.
  wnpa-sec-2016-60. OpenFlow crash.
  wnpa-sec-2016-59. AllJoyn crash.
  wnpa-sec-2016-58. Profinet I/O long loop.

  For more details: https://www.wireshark.org/security/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - rebase on top of master
 - specify this is a security update in commit log
 - add information regarding the security fixes in commit log
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 21c003f..c90f5bb 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,2 +1,2 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.1.txt
-sha256 900e22af04c8b35e0d02a25a360ab1fb7cfe5ac18fc48a9afd75a7103e569149  wireshark-2.2.1.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.2.txt
+sha256 f9acef5e9a9021a400b4244fafc06969f41ec594ec57fd7f0ff63bafca0055b3  wireshark-2.2.2.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 227ead6..6a40b8e 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.2.1
+WIRESHARK_VERSION = 2.2.2
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.10.1
