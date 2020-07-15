From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 21:40:42 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/tcpreplay:
 security bump to version 4.3.3
Message-ID: <20200715195254.57E4C87400@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f032777e0af7173a8852a181aef5b90fa7f5380
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- Fix CVE-2020-12740: tcprewrite in Tcpreplay through 4.3.2 has a
  heap-based buffer over-read during a get_c operation. The issue is
  being triggered in the function get_ipv6_next() at common/get.c.
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 25168d220a29915a92bd213c062a8505bc0ec623)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpreplay/tcpreplay.hash | 6 +++---
 package/tcpreplay/tcpreplay.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index cc00bc09b1..e83efd78b1 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://github.com/appneta/tcpreplay/releases/download/v4.3.2/tcpreplay-4.3.2.tar.xz.asc
+# https://github.com/appneta/tcpreplay/releases/download/v4.3.3/tcpreplay-4.3.3.tar.xz.asc
 # using key 84E4FA215C934A7D97DC76D5E9E2149793BDE17E
-sha256 955aed6a40f49a5b8c1234fd0a928edc5c665d94b7755ab5769c30938e33f380  tcpreplay-4.3.2.tar.xz
-sha256 5971b0c544622f4b210a9cc56436a970685d3b0666e373c09e3cf9304db15d05  docs/LICENSE
+sha256  5e960e2a4432f583adbd11fa0855d17b73d9e0f2d6453b749f27aacaee53bab5  tcpreplay-4.3.3.tar.xz
+sha256  5971b0c544622f4b210a9cc56436a970685d3b0666e373c09e3cf9304db15d05  docs/LICENSE
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 39d0f44343..8b395b4962 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.3.2
+TCPREPLAY_VERSION = 4.3.3
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
