From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 11:39:50 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/lldpd: security
 bump to version 1.0.9
Message-ID: <20210404092634.60AD7814D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62485fec9dda62287717b36a8686dde2ea6b9e56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- Out-of-bound read access when parsing LLDP-MED civic address in
  liblldpctl for malformed fields.
- Fix memory leak when receiving LLDPU with duplicate fields.
  CVE-2020-27827.
- More memory leak fixes on duplicate TLVs in LLDP, CDP and EDP
  (related to CVE-2020-27827).

https://github.com/lldpd/lldpd/blob/1.0.9/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5522b7526be9a81e7b44ed0ec603e05d8435381d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lldpd/lldpd.hash | 4 ++--
 package/lldpd/lldpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index ee6e72ba55..6e809b2796 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking gpg key
-# https://media.luffy.cx/files/lldpd/lldpd-1.0.7.tar.gz.gpg
+# https://media.luffy.cx/files/lldpd/lldpd-1.0.9.tar.gz.gpg
 # using key AEF2348766F371C689A7360095A42FE8353525F9
-sha256  1df79179d489c841b49265f2ab5ff05f284a647e95862d2f3c02b3fb079a87e1  lldpd-1.0.7.tar.gz
+sha256  6b64eb3125952b1e33472198b054e8aa0dee45f45d3d4be22789090a474949f5  lldpd-1.0.9.tar.gz
 sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 7860b70c39..19efc788d7 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.7
+LLDPD_VERSION = 1.0.9
 LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \
