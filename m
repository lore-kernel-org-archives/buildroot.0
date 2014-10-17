From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 18 Oct 2014 00:36:32 +0200
Subject: [Buildroot] [PATCH 1/2] package/pkg-autotools.mk: set
	--localstatedir=/var by default
Message-ID: <1413585393-8349-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

`localstatedir` is a common autoconf variable like prefix and sysconfdir. At 
this time 25 autotools and one generic package uses this Makefile variable. 22 
of the autotools packages use --localstatedir=/var, the remaining use custom 
settings.

Setting `localstatedir` to /var is consistent with the Filesystem Hierarchy 
Standard (FHS). So it's time to move it as a common definition in the 
autotools infrastructure. 

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/pkg-autotools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 2c93dd9..3c5430f 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -134,6 +134,7 @@ define $(2)_CONFIGURE_CMDS
 		--prefix=/usr \
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
+		--localstatedir=/var \
 		--program-prefix="" \
 		--disable-gtk-doc \
 		--disable-doc \
@@ -165,6 +166,7 @@ define $(2)_CONFIGURE_CMDS
 		./configure \
 		--prefix="$$(HOST_DIR)/usr" \
 		--sysconfdir="$$(HOST_DIR)/etc" \
+		--localstatedir="$$(HOST_DIR)/var" \
 		--enable-shared --disable-static \
 		--disable-gtk-doc \
 		--disable-doc \
-- 
2.1.2
