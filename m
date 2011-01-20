From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Jan 2011 09:57:56 +0100
Subject: [Buildroot] [git commit master 1/1] mpg123: install to staging
Message-ID: <20110120085838.D136E8B531@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5aac28441439c8f4e3a0414b71d12dc53b4a4f6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mpg123 also provides a shared library (libmpg123.so), so install into
staging so other programs can find it.

[Peter: reworded commit message]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpg123/mpg123.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index ddd891f..f6eaddb 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -8,6 +8,7 @@ MPG123_VERSION = 1.13.1
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mpg123
 MPG123_CONF_OPT = --with-optimization=0 --disable-lfs-alias
+MPG123_INSTALL_STAGING = YES
 MPG123_CPU = $(if $(BR2_SOFT_FLOAT),generic_nofpu,generic_fpu)
 
 ifeq ($(BR2_arm),y)
-- 
1.7.3.4
