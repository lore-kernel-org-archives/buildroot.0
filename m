From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 19:27:28 +0200
Subject: [Buildroot] [git commit] package/pkg-autotools.mk: set
	--localstatedir=/var by default
Message-ID: <20141019093617.B4DD7B3DC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3ed7c2d6898e643dd399d926d0f94295b15a35c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

`localstatedir` is a common autoconf variable like prefix and sysconfdir. At
this time 25 autotools and one generic package uses this Makefile variable. 22
of the autotools packages use --localstatedir=/var, the remaining use custom
settings.

Setting `localstatedir` to /var is consistent with the Filesystem Hierarchy
Standard (FHS). So it's time to move it as a common definition in the
autotools infrastructure.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-autotools.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
