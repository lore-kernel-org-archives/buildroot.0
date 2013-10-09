From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 21:21:38 +0200
Subject: [Buildroot] [git commit] linphone: fix build failure
Message-ID: <20131009194411.4D1119B99C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4db12ce1f616c3bf2d2b14172cc58997e5e38465
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script is out of sync causing deplibs linking issues so
recreate it. Fixes:
http://autobuild.buildroot.net/results/006/00673f04d0ce6cb0c5828e68f236a4eb8d7920db/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linphone/linphone.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index a4fc95c..e7e3de6 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -10,7 +10,8 @@ LINPHONE_CONF_OPT = \
 	--enable-external-ortp \
 	--enable-external-mediastreamer \
 	--disable-strict
-
+# configure is out of sync causing deplibs linking issues
+LINPHONE_AUTORECONF = YES
 LINPHONE_DEPENDENCIES = host-pkgconf ortp mediastreamer libeXosip2 speex
 LINPHONE_LICENSE = GPLv2+
 LINPHONE_LICENSE_FILES = COPYING
