From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 12:32:39 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/oniguruma:
 security bump to version 6.9.3
Message-ID: <20190902102839.13B4A88E4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cc3d4578109599cf999ccc51598ba86d01b2bd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes CVE-2019-13224: A use-after-free in onig_new_deluxe() in regext.c
in Oniguruma 6.9.2 allows attackers to potentially cause information
disclosure, denial of service, or possibly code execution by providing a
crafted regular expression. The attacker provides a pair of a regex
pattern and a string, with a multi-byte encoding that gets handled by
onig_new_deluxe().

Fixes CVE-2019-13225: A NULL Pointer Dereference in match_at() in
regexec.c in Oniguruma 6.9.2 allows attackers to potentially cause
denial of service by providing a crafted regular expression.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 281871e6b027c22669aef37f038e00b30ca8387d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/oniguruma/oniguruma.hash | 2 +-
 package/oniguruma/oniguruma.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
index b6f1cc549d..de75df5473 100644
--- a/package/oniguruma/oniguruma.hash
+++ b/package/oniguruma/oniguruma.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3b568a9050839e7828b2f2d5bc9cd3650979b6b54a080f54c515320dddda06b0  oniguruma-6.9.2.tar.gz
+sha256  dc6dec742941e24b761cea1b9a2f12e750879107ae69fd80ae1046459d4fb1db  oniguruma-6.9.3.tar.gz
 sha256  ae266a1ad1c2ef50baf14a1a2993e926cd46d09c6cc8b0b3a8498e44da2746b8  COPYING
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index 9e8858b618..2b48dadc0a 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONIGURUMA_VERSION = 6.9.2
+ONIGURUMA_VERSION = 6.9.3
 ONIGURUMA_SITE = $(call github,kkos,oniguruma,v$(ONIGURUMA_VERSION))
 ONIGURUMA_LICENSE = BSD-2-Clause
 ONIGURUMA_LICENSE_FILES = COPYING
