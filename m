From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Oct 2010 23:32:37 +0200
Subject: [Buildroot] [git commit master 1/1] torsmo: use correct variable
	for HELP2MAN preset
Message-ID: <20101017213452.A75E88D25E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e09f7b8623daa58cac6a89a69051effae461d609
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/torsmo/torsmo.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
index a9cbc5d..2b1cb8d 100644
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -11,7 +11,7 @@ TORSMO_INSTALL_STAGING = NO
 TORSMO_INSTALL_TARGET = YES
 
 # help2man doesn't work when cross compiling
-TORSMO_CONF_ENV = HELP2MAN=''
+TORSMO_CONF_ENV = ac_cv_path_HELP2MAN=''
 TORSMO_CONF_OPT = --x-includes="-I$(STAGING_DIR)/usr/include/X11" --x-libraries="-I$(STAGING_DIR)/usr/lib" --with-x
 
 TORSMO_DEPENDENCIES = xserver_xorg-server
-- 
1.7.1
