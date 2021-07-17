From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jul 2021 10:15:26 +0200
Subject: [Buildroot] [git commit] package/mpg123: remove --disable-lfs-alias
 option
Message-ID: <20210717074207.C08C59122E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=49e436f4823ed982a9a4fadeb00e1159d55f7939
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 56b28d3ee1e5 (mpg123: bump to version 1.13.1) added the
--disable-lfs-alias option, without explaining why it was needed.

However, this causes undefined references for apps that want to link
against mpg123.

The help for that option is pretty explicit that this is a dangerous
option to use:

    disable alias wrappers for largefile bitness (mpg123_seek_32 or
    mpg123_seek_64 in addition to mpg123_seek, or the other way around;
    It is a mess, do not play with this!)

The default is that it is enabled, so leave it at it.

Signed-off-by: Bruno Marie <gameblabla@protonmail.com>
[yann.morin.1998 at free.fr: rework commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mpg123/mpg123.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 9aa9cd1c10..fbb011c2c2 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -7,7 +7,6 @@
 MPG123_VERSION = 1.25.15
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
-MPG123_CONF_OPTS = --disable-lfs-alias
 MPG123_INSTALL_STAGING = YES
 MPG123_LICENSE = LGPL-2.1
 MPG123_LICENSE_FILES = COPYING
