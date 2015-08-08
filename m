From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:45 -0000
Subject: [Buildroot] [git commit branch/next] gdbm: handle optional
	dependency gettext
Message-ID: <20150808105616.A40607FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9869ac57ea86f78b44a0eb8622772196726ac08d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdbm/gdbm.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 12e1dac..f7a4370 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -10,4 +10,8 @@ GDBM_LICENSE = GPLv3+
 GDBM_LICENSE_FILES = COPYING
 GDBM_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+GDBM_DEPENDENCIES += gettext
+endif
+
 $(eval $(autotools-package))
