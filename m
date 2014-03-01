From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 15:28:16 +0100
Subject: [Buildroot] [git commit] systemd: ditch autoreconf
Message-ID: <20140301142822.EE9AB9BC86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34291708d077e5626453378df133a683c9606bef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It needs AM_PATH_LIBGCRYPT and will bail out if ALL_EXTRAS (libgcrypt)
isn't around - and it doesn't seem to be used at all.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index bcdf95e..36ef704 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -23,8 +23,6 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 SYSTEMD_DEPENDENCIES += busybox
 endif
 
-SYSTEMD_AUTORECONF = YES
-
 SYSTEMD_CONF_OPT += \
 	--with-rootprefix= \
 	--with-rootlibdir=/lib \
