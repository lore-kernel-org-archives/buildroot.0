From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 11:54:33 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/imagemagick:
 security bump to version 7.10.51
Message-ID: <20201222103758.8FEA381841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2078446f6ccb371ac53d95b38b1b9800fc370222
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- Fix CVE-2020-29599: ImageMagick before 6.9.11-40 and 7.x before
  7.0.10-40 mishandles the -authenticate option, which allows setting a
  password for password-protected PDF files. The user-controlled password
  was not properly escaped/sanitized and it was therefore possible to
  inject additional shell commands via coders/pdf.c.
- Update license hash (correct wording to match Apache 2 license:
  https://github.com/ImageMagick/ImageMagick/commit/45e5d2493c08e7cb49f7268c01d847e88f78fd6c)

https://github.com/ImageMagick/ImageMagick/blob/7.0.10-51/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b898e80639988d2da9e4a432337e3c914dc0859c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 4 ++--
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 3380378fd7..8a111edb15 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9f2b8b131222354b196c640fca4e53eb0bbf62246621b9d467f223366272d7a7  imagemagick-7.0.10-28.tar.gz
-sha256  e2d364de83dd9e7c866bd99ee7dac2fe92071fb70e9b187293353fb285cf09ac  LICENSE
+sha256  fa993169a06052267eaf81cf85bbf5a30c0bf243511017d986f47abbe65ff262  imagemagick-7.0.10-51.tar.gz
+sha256  7b43ee798e835f5e0dc03c92c52d288b46a771c4561d57ef2a9a8b2c76bf33cb  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index d44b7d1d14..f30d3dfc2b 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.10-28
+IMAGEMAGICK_VERSION = 7.0.10-51
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
