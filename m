From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 17:24:50 +0200
Subject: [Buildroot] [git commit] lirc-tools: add host-pkgconf dependency
Message-ID: <20150405152520.C77928175F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bcfa8e1ff31a5f74be2c780dc845fbb71b393f4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise, the configure script fails with "Required program
pkg-config is missing".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lirc-tools/lirc-tools.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index af332ea..6837042 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -9,6 +9,7 @@ LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
 LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)/
 LIRC_TOOLS_LICENSE = GPLv2+
 LIRC_TOOLS_LICENSE_FILES = COPYING
+LIRC_TOOLS_DEPENDENCIES = host-pkgconf
 
 LIRC_TOOLS_CONF_OPTS = \
 	--without-x \
