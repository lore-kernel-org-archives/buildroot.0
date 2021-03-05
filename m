From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 13:31:22 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/imagemagick:
 security bump to version 7.0.10-62
Message-ID: <20210305120831.E0508873F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c2d002018829a9d760f36d14546a838ae79d9cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixes the following security issue:

CVE-2021-20176: A divide-by-zero flaw was found in ImageMagick 6.9.11-57 and
7.0.10-57 in gem.c.  This flaw allows an attacker who submits a crafted file
that is processed by ImageMagick to trigger undefined behavior through a
division by zero.  The highest threat from this vulnerability is to system
availability.

For more details, see the bugtracker:
https://github.com/ImageMagick/ImageMagick/issues/3077

- bump version to 7.0.10-62
- update license file hash (copyright year update)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Peter: mention security fix]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a11b6beab99c75dc955c436cd54c0e1f581762a8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 4 ++--
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 8a111edb15..c45caf6c52 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fa993169a06052267eaf81cf85bbf5a30c0bf243511017d986f47abbe65ff262  imagemagick-7.0.10-51.tar.gz
-sha256  7b43ee798e835f5e0dc03c92c52d288b46a771c4561d57ef2a9a8b2c76bf33cb  LICENSE
+sha256  84442158aea070095efa832cfe868fd99d6befdf609444f0c9e9f1b4f25480cd  imagemagick-7.0.10-62.tar.gz
+sha256  040badb77b659e751ea16113490a937e1e01f3f5d32181e966b8982413533fb2  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index f30d3dfc2b..73b6b3340e 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.10-51
+IMAGEMAGICK_VERSION = 7.0.10-62
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
