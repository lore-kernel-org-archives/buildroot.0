From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 19:30:58 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/oniguruma:
 security bump to version 6.9.4
Message-ID: <20191205185717.293B287FAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f32ba907fbdb6e3006ffcd83f8aa5d64355c1392
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

- Retrieve official tarball to drop autoreconf
- Fixed CVE-2019-19012
- Fixed CVE-2019-19203 (Does not affect UTF-8, UTF-16 and UTF-32
  encodings)
- Fixed CVE-2019-19204 (Affects only PosixBasic, Emacs and Grep
  syntaxes)
- Fixed CVE-2019-19246

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 79bcd1770af0866f9953ffbb1493c36400a01aea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/oniguruma/oniguruma.hash | 2 +-
 package/oniguruma/oniguruma.mk   | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
index de75df5473..b0764ab1fc 100644
--- a/package/oniguruma/oniguruma.hash
+++ b/package/oniguruma/oniguruma.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dc6dec742941e24b761cea1b9a2f12e750879107ae69fd80ae1046459d4fb1db  oniguruma-6.9.3.tar.gz
+sha256  4669d22ff7e0992a7e93e116161cac9c0949cd8960d1c562982026726f0e6d53  onig-6.9.4.tar.gz
 sha256  ae266a1ad1c2ef50baf14a1a2993e926cd46d09c6cc8b0b3a8498e44da2746b8  COPYING
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index 2b48dadc0a..2126ff9120 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-ONIGURUMA_VERSION = 6.9.3
-ONIGURUMA_SITE = $(call github,kkos,oniguruma,v$(ONIGURUMA_VERSION))
+ONIGURUMA_VERSION = 6.9.4
+ONIGURUMA_SITE = \
+	https://github.com/kkos/oniguruma/releases/download/v$(ONIGURUMA_VERSION)
+ONIGURUMA_SOURCE = onig-$(ONIGURUMA_VERSION).tar.gz
 ONIGURUMA_LICENSE = BSD-2-Clause
 ONIGURUMA_LICENSE_FILES = COPYING
-# From git
-ONIGURUMA_AUTORECONF = YES
 ONIGURUMA_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
