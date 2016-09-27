From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Sep 2016 16:59:40 +0200
Subject: [Buildroot] [git commit] mpg123: security bump to version 1.23.8
Message-ID: <20160927150051.0A55E820F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac5fa840df09cf532240df8ef4c773c4d84fa2f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes an out-of-bounds memory read in the ID3v2 parser for tags that
claim an unrealistically small length. This crashes mpg123 or any
application using libmpg123 with activated ID3v2 parsing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
