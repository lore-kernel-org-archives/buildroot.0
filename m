From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 10:43:43 +0100
Subject: [Buildroot] [git commit] mpg123: needs host-pkgconf
Message-ID: <20141128094513.B7A697FF73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43f86236969f028a9009d6558c25dd612a1d4f16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SDL detection is done using pkg-config.

Fixes http://autobuild.buildroot.net/results/437/437f408122d7f21420a7cdc9758caf0ab1ba877d/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index de21ec0..0341ed9 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -11,6 +11,7 @@ MPG123_CONF_OPTS = --disable-lfs-alias
 MPG123_INSTALL_STAGING = YES
 MPG123_LICENSE = LGPLv2.1
 MPG123_LICENSE_FILES = COPYING
+MPG123_DEPENDENCIES = host-pkgconf
 
 MPG123_CPU = $(if $(BR2_SOFT_FLOAT),generic_nofpu,generic_fpu)
 
