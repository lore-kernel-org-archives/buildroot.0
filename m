From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:57:51 +0200
Subject: [Buildroot] [git commit branch/next] erlang-p1-iconv: bump to
	version 1.0.4
Message-ID: <20170530220258.2F1E382867@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=399a10bd1c5b10cf799f8336a22d4983c83099aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License changed to Apache-2.0.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-iconv/Config.in            | 1 +
 package/erlang-p1-iconv/erlang-p1-iconv.hash | 2 +-
 package/erlang-p1-iconv/erlang-p1-iconv.mk   | 9 +++++----
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/erlang-p1-iconv/Config.in b/package/erlang-p1-iconv/Config.in
index 98efb21..cec17d0 100644
--- a/package/erlang-p1-iconv/Config.in
+++ b/package/erlang-p1-iconv/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ERLANG_P1_ICONV
 	bool "erlang-p1-iconv"
+	select BR2_PACKAGE_ERLANG_P1_UTILS
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Erlang interface to libiconv
diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.hash b/package/erlang-p1-iconv/erlang-p1-iconv.hash
index a284189..883fd52 100644
--- a/package/erlang-p1-iconv/erlang-p1-iconv.hash
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 3ef1fb814fdf23e8ad8a210efb66681fa67cd42753be536521bf9686158880d3 erlang-p1-iconv-0.9.0.tar.gz
+sha256 ca20d58166a4fb38883977600aca61e02bfd1257b8bded8c8ddd82d2a96084e6 erlang-p1-iconv-1.0.4.tar.gz
diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.mk b/package/erlang-p1-iconv/erlang-p1-iconv.mk
index 64a6ad4..044361e 100644
--- a/package/erlang-p1-iconv/erlang-p1-iconv.mk
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-ERLANG_P1_ICONV_VERSION = 0.9.0
-ERLANG_P1_ICONV_SITE = $(call github,processone,eiconv,$(ERLANG_P1_ICONV_VERSION))
-ERLANG_P1_ICONV_LICENSE = GPL-2.0+
-ERLANG_P1_ICONV_LICENSE_FILES = COPYING
+ERLANG_P1_ICONV_VERSION = 1.0.4
+ERLANG_P1_ICONV_SITE = $(call github,processone,iconv,$(ERLANG_P1_ICONV_VERSION))
+ERLANG_P1_ICONV_LICENSE = Apache-2.0
+ERLANG_P1_ICONV_LICENSE_FILES = LICENSE.txt
+ERLANG_P1_ICONV_DEPENDENCIES = erlang-p1-utils
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 ERLANG_P1_ICONV_DEPENDENCIES += libiconv
