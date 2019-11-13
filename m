From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 19:58:52 +0100
Subject: [Buildroot] [git commit] package/dropwatch: license is GPL-2.0+
Message-ID: <20191113185221.EC3D88EE4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c074fade2c5cfde60c26003c25c05471d1e00c0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dropwatch links with readline, which is GPL-3.0+, so not compatible with
GPL-2.0.  When asked about this, upstream has clarified that the license
really is GPL-2.0+:

https://github.com/nhorman/dropwatch/issues/14

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998 at free.fr: add a coomet as suggested by Baruc]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
---
 package/dropwatch/dropwatch.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 1af61458e0..769b4d4d38 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -7,7 +7,9 @@
 DROPWATCH_VERSION = 1.5.1
 DROPWATCH_SITE = $(call github,nhorman,dropwatch,v$(DROPWATCH_VERSION))
 DROPWATCH_DEPENDENCIES = libnl readline host-pkgconf $(TARGET_NLS_DEPENDENCIES)
-DROPWATCH_LICENSE = GPL-2.0
+# Until upstream updates their tree with a proper license
+# blurb: https://github.com/nhorman/dropwatch/issues/14
+DROPWATCH_LICENSE = GPL-2.0+
 DROPWATCH_LICENSE_FILES = COPYING
 # From git
 DROPWATCH_AUTORECONF = YES
