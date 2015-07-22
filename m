From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:20:47 +0200
Subject: [Buildroot] [git commit] heimdal: disable parallel build
Message-ID: <20150722152059.02242807A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f71e388fdb4d96c6e5559f12b3aee5a78dec751
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It still seems to have issues, so disable it pending more patches and
testing. Fixes:
http://autobuild.buildroot.net/results/a07/a07198b3f7f8029d80863a998814877ec9994c60/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/heimdal/heimdal.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 8296448..626e68e 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -24,6 +24,7 @@ HOST_HEIMDAL_CONF_OPTS = \
 	--without-x \
 	--disable-heimdal-documentation
 HOST_HEIMDAL_CONF_ENV = MAKEINFO=true
+HEIMDAL_MAKE = $(MAKE1)
 HEIMDAL_LICENSE = BSD-3c
 HEIMDAL_LICENSE_FILES = LICENSE
 # 0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch
