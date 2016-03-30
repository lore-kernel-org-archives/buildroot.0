From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 17:01:12 +0200
Subject: [Buildroot] [git commit] weston: handle lcms dependecy
Message-ID: <20160330150133.91CF381D5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db9104f2dd147bb9313e7d8ea28904eb805b2858
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/weston.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 72190a8..e3a8f29 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -101,4 +101,11 @@ else
 WESTON_CONF_OPTS += --disable-vaapi-recorder
 endif
 
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+WESTON_CONF_OPTS += --enable-lcms
+WESTON_DEPENDENCIES += lcms2
+else
+WESTON_CONF_OPTS += --disable-lcms
+endif
+
 $(eval $(autotools-package))
