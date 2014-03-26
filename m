From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Mar 2014 22:41:23 +0100
Subject: [Buildroot] [git commit] cifs-utils: fix building on static
Message-ID: <20140326214648.E18B99C3A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=510ffcd66bdb74627ae7f76b3d1c7e7676c729cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable position independent executables when building on static.

Fixes:
   http://autobuild.buildroot.net/results/bb0/bb00db98477f0f81c95ac1830ef3649b30963416/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cifs-utils/cifs-utils.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 409ea53..3f4c71a 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -10,6 +10,10 @@ CIFS_UTILS_SITE    = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPLv3+
 CIFS_UTILS_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+CIFS_UTILS_CONF_OPT += --disable-pie
+endif
+
 define CIFS_UTILS_NO_WERROR
 	$(SED) 's/-Werror//' $(@D)/Makefile.in
 endef
