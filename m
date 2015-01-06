From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 22:05:49 +0100
Subject: [Buildroot] [git commit] fluxbox: do not autoreconf
Message-ID: <20150106210715.5B36880797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=44193b00a40b21d764a0b0f7257c893cdd437fd0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no need to have "AUTORECONF = YES" since the patch which
modified the "configure.in" file was removed in the last version bump.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fluxbox/fluxbox.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index a0f9367..31699d5 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -10,8 +10,6 @@ FLUXBOX_SITE = http://downloads.sourceforge.net/project/fluxbox/fluxbox/$(FLUXBO
 FLUXBOX_LICENSE = MIT
 FLUXBOX_LICENSE_FILES = COPYING
 
-FLUXBOX_AUTORECONF = YES
-
 FLUXBOX_CONF_OPTS = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		   --x-libraries=$(STAGING_DIR)/usr/lib
 FLUXBOX_DEPENDENCIES = xlib_libX11 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
