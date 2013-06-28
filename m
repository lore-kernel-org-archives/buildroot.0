From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:15:13 +0200
Subject: [Buildroot] [git commit] package/directfb: fixing typo in
	DIRECTFB_CONF_OPT
Message-ID: <20130628195139.1C8D29A838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2699d4f315247dd395f40397e9a0e3b5d19180c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The DIRECTFB_CONF_OPT variable was missspelled for disabling the X11
support.

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/directfb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 46f1eb9..c065eef 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -44,7 +44,7 @@ endif
 ifeq ($(BR2_PACKAGE_XSERVER),y)
 DIRECTFB_CONF_OPT += --enable-x11
 else
-DIRECTFB_CONF_OPT += -disable-x11
+DIRECTFB_CONF_OPT += --disable-x11
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_UNIQUE),y)
