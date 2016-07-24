From: Jordan Yelloz <jordan@yelloz.me>
Date: Sun, 24 Jul 2016 16:27:36 -0700
Subject: [Buildroot] [PATCH 1/4] swupdate: allowed luajit to enable HAVE_LUA
In-Reply-To: <20160724232739.14132-1-jordan@yelloz.me>
References: <20160724232739.14132-1-jordan@yelloz.me>
Message-ID: <20160724232739.14132-2-jordan@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
---
 package/swupdate/swupdate.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 313a54febd87..7a0fcaea5741 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -42,6 +42,9 @@ endif
 ifeq ($(BR2_PACKAGE_LUA),y)
 SWUPDATE_DEPENDENCIES += lua host-pkgconf
 SWUPDATE_MAKE_ENV += HAVE_LUA=y
+else ifeq ($(BR2_PACKAGE_LUAJIT),y)
+SWUPDATE_DEPENDENCIES += luajit host-pkgconf
+SWUPDATE_MAKE_ENV += HAVE_LUA=y
 else
 SWUPDATE_MAKE_ENV += HAVE_LUA=n
 endif
-- 
2.9.2
