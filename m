From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 21:17:38 +0200
Subject: [Buildroot] [git commit] package/vlc: enable gnutls if selected
Message-ID: <20200501190548.78D9290D2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d3a5da8848cc4f90ebcde46b594c28466641a9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michele Comignano <comick@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 801b99f884..76650eef7a 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -567,4 +567,11 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 VLC_DEPENDENCIES += zlib
 endif
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+VLC_CONF_OPTS += --enable-gnutls
+VLC_DEPENDENCIES += gnutls
+else
+VLC_CONF_OPTS += --disable-gnutls
+endif
+
 $(eval $(autotools-package))
