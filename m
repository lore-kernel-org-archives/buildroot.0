From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 16:29:55 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/expect: bump to
 version 5.45.4
Message-ID: <20190820142655.B9CE68218A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4727fe8d9beeecc2b302fc109b47ca7ea9613cb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

* exp_inter.c: [https://sourceforge.net/p/expect/patches/22/]
Fix interact bug - handle reads of 0 length on
non-blocking channels by explicitly checking if the channel
is non-blocking. Fix by Jack Bates.

* expect.c: [https://sourceforge.net/p/expect/patches/21/]
Fix eof bug introduced with previous bug fix - ensure that data
received just before an eof is processed. Fix by Sergei Golovan.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6fffbffb6f61435c359dfe94b7f5a60c5579c041)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expect/expect.hash | 4 ++--
 package/expect/expect.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expect/expect.hash b/package/expect/expect.hash
index c89f323906..c4815abb07 100644
--- a/package/expect/expect.hash
+++ b/package/expect/expect.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/projects/expect/files/Expect/5.45.3/expect5.45.3.tar.gz.SHA256
-sha256  c520717b7195944a69ce1492ec82ca0ac3f3baf060804e6c5ee6d505ea512be9  expect5.45.3.tar.gz
+# From https://sourceforge.net/projects/expect/files/Expect/5.45.4/expect5.45.4.tar.gz.SHA256
+sha256  49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34  expect5.45.4.tar.gz
 # Locally calculated
 sha256  b2415b17dc8d9a287f4509047ef5ac3436baef7ba7c50faef5222dcdf61a2bab  README
diff --git a/package/expect/expect.mk b/package/expect/expect.mk
index ccde33a71b..37b4ce7065 100644
--- a/package/expect/expect.mk
+++ b/package/expect/expect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPECT_VERSION = 5.45.3
+EXPECT_VERSION = 5.45.4
 EXPECT_SITE = https://sourceforge.net/projects/expect/files/Expect/$(EXPECT_VERSION)
 EXPECT_SOURCE = expect$(EXPECT_VERSION).tar.gz
 EXPECT_LICENSE = Public domain
