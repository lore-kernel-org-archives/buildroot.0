From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2014 21:16:09 +0200
Subject: [Buildroot] [git commit] openvmtools: remove unnecessary C flag
Message-ID: <20141006192628.843C4B0CAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7349af1bc4ed941d59c0c9971007479881379d3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 8bec0a1af57165081dc275f813c8c5c74ff12c14
the -Wno-unused-local-typedefs CFLAG in not needed.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openvmtools/openvmtools.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 598107c..7aa04af 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -41,7 +41,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PAM),y)
 OPENVMTOOLS_CONF_OPTS += --with-pam
-OPENVMTOOLS_MAKE_OPTS += CFLAGS+="-Wno-unused-local-typedefs"
 OPENVMTOOLS_DEPENDENCIES += linux-pam
 else
 OPENVMTOOLS_CONF_OPTS += --without-pam
