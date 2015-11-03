From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 20:49:09 +0100
Subject: [Buildroot] [git commit] irssi: add missing dependency on
	host-pkgconf
Message-ID: <20151103194928.7225F81E4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77ec184d9924171850e6b34a15422844b1d1a578
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The irssi configure script uses pkg-config to detect the availability of
libglib2 and openssl.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/irssi/irssi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index d38d917..6857a11 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -11,7 +11,7 @@ IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.bz2
 IRSSI_SITE = http://pkgs.fedoraproject.org/repo/pkgs/irssi/$(IRSSI_SOURCE)/ecf64be47978d89a742b435a81cb47db
 IRSSI_LICENSE = GPLv2+
 IRSSI_LICENSE_FILES = COPYING
-IRSSI_DEPENDENCIES = libglib2 ncurses
+IRSSI_DEPENDENCIES = host-pkgconf libglib2 ncurses
 IRSSI_AUTORECONF = YES
 
 IRSSI_CONF_OPTS = \
