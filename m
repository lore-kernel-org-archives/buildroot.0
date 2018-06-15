From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Jun 2018 16:28:31 +0200
Subject: [Buildroot] [git commit] librtlsdr: fix typo in LIBRTLSDR_CONF_OPTS
 variable name
Message-ID: <20180615142716.2223488707@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8c3a902193552ae9b478bbd76e04f21bbce30b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9ff035839eef68eb16e90ae70c3e70dc7f57ca5e ("librtlsdr: fix
static build") introduced this obvious typo, which was spotted by
check-package:

package/librtlsdr/librtlsdr.mk:18: possible typo: LIBRTLSDRCONF_OPTS -> *LIBRTLSDR*

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/librtlsdr/librtlsdr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
index ba8a1af104..dd1feacc03 100644
--- a/package/librtlsdr/librtlsdr.mk
+++ b/package/librtlsdr/librtlsdr.mk
@@ -15,7 +15,7 @@ LIBRTLSDR_DEPENDENCIES = libusb
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBRTLSDR_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
 else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-LIBRTLSDRCONF_OPTS += -DBUILD_STATIC_LIBS=ON
+LIBRTLSDR_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
 else ifeq ($(BR2_SHARED_LIBS),y)
 LIBRTLSDR_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
 endif
