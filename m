From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 27 Sep 2016 07:10:20 -0300
Subject: [Buildroot] [PATCH] mpg123: security bump to version 1.23.8
Message-ID: <1474971020-10240-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes an out-of-bounds memory read in the ID3v2 parser for tags that
claim an unrealistically small length. This crashes mpg123 or any
application using libmpg123 with activated ID3v2 parsing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpg123/mpg123.hash | 2 +-
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 66a80ac..fa55809 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	934047120953159e364c790e059684b681d7e670884fe179e1954d17d1c6334b	mpg123-1.23.7.tar.bz2
+sha256	de2303c8ecb65593e39815c0a2f2f2d91f708c43b85a55fdd1934c82e677cf8e	mpg123-1.23.8.tar.bz2
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index b14efe7..27c46dc 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.23.7
+MPG123_VERSION = 1.23.8
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
-- 
2.7.3
