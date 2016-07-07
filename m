From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 22:12:49 +0200
Subject: [Buildroot] [git commit] cifs-utils: disable PIE for m68k
Message-ID: <20160707201253.7F6077FBC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7446bf29584c78f7b448b99ad90c760b8bad9da1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PIE is not supported for uClibc-ng/m68k.

Fixes following autobuild failure:
http://autobuild.buildroot.net/results/4246de0280d4e7f8765adefd379c9dd414c316f1/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cifs-utils/cifs-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 9d4e223..c90a504 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -10,7 +10,7 @@ CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPLv3+
 CIFS_UTILS_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_STATIC_LIBS),y)
+ifneq ($(BR2_STATIC_LIBS)$(BR2_m68k),)
 CIFS_UTILS_CONF_OPTS += --disable-pie
 endif
 
