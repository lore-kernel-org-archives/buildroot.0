From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  3 Jan 2021 23:53:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/dcron: bump to
 1ba33c3325df48de46263276a43ed76cf9d81518
Message-ID: <20210103225324.974773-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add upstream link to patch
- Use the new COPYING file
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ....c-add-newline-to-logfile-openning-error-message.patch | 1 +
 package/dcron/dcron.hash                                  | 3 ++-
 package/dcron/dcron.mk                                    | 8 ++++----
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch b/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch
index c838063e03..6abc3105e4 100644
--- a/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch
+++ b/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch
@@ -4,6 +4,7 @@ Date: Sat, 20 Jul 2019 00:27:31 -0300
 Subject: [PATCH] main.c: add newline to logfile openning error message
 
 Signed-off-by: Carlos Santos <unixmania@gmail.com>
+[Upstream status: https://github.com/dubiousjim/dcron/pull/22]
 ---
  main.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/dcron/dcron.hash b/package/dcron/dcron.hash
index 3e53ddc25f..35b02eb78b 100644
--- a/package/dcron/dcron.hash
+++ b/package/dcron/dcron.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	9e50edb6f5bd8153b16bad05087d985e5153ce45cc01ae77e7f842213fb4a824	dcron-4.5.tar.gz
+sha256  5a53930ba27b57c06c3b03635788cf569990283bde8ea9c1ee820e13f988288d  dcron-1ba33c3325df48de46263276a43ed76cf9d81518.tar.gz
+sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  COPYING
diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
index 51ebb18745..f0c3efbf8f 100644
--- a/package/dcron/dcron.mk
+++ b/package/dcron/dcron.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-DCRON_VERSION = 4.5
-DCRON_SITE = http://www.jimpryor.net/linux/releases
-# The source code does not specify the version of the GPL that is used.
-DCRON_LICENSE = GPL
+DCRON_VERSION = 1ba33c3325df48de46263276a43ed76cf9d81518
+DCRON_SITE = $(call github,dubiousjim,dcron,$(DCRON_VERSION))
+DCRON_LICENSE = GPL-2.0+
+DCRON_LICENSE_FILES = COPYING
 
 define DCRON_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
-- 
2.29.2
