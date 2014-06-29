From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 12:01:25 +0200
Subject: [Buildroot] [git commit] lzo: security bump to version 2.07
Message-ID: <20140629100143.E7D949D107@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7001f391eef299634615e8a3b7db02d03c94ee27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-4607.

[Thomas: fix small typo in comment.]

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzo/lzo.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 10107fe..e9e0b3f 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-LZO_VERSION = 2.06
+LZO_VERSION = 2.07
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_LICENSE = GPLv2+
 LZO_LICENSE_FILES = COPYING
 LZO_INSTALL_STAGING = YES
+# Our libtool patch does not apply to bundled ltmain.sh since it's too new.
+# Run autoreconf to regenerate ltmain.sh.
+LZO_AUTORECONF = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
