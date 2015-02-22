From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 12:10:32 +0100
Subject: [Buildroot] [git commit] package/freerdp: also install to staging
Message-ID: <20150302222722.450358177D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8143dfa8ed2a36c236244982e09b5ed7ef197609
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

freerdp installs a library that other packages may use, so
we must also install it to staging.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 33eacc2..e680e39 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -11,6 +11,8 @@ FREERDP_DEPENDENCIES = openssl zlib
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 
+FREERDP_INSTALL_STAGING = YES
+
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev
 
 ifeq ($(BR2_PACKAGE_GSTREAMER),y)
