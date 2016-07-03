From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 20:09:21 +0200
Subject: [Buildroot] [git commit] lvm2: fix m68k build error
Message-ID: <20160703181005.192988026B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d56f0cc554dd5deb7220323f46a7962b4ca804f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable PIE for m68k as it is not supported.

Fixes following autobuild failures:
http://autobuild.buildroot.net/results/2f976292ddbb8eddb58cc978f209f4f445b5b756/
http://autobuild.buildroot.net/results/7a2b1eef06004886be28744bf1c53d027f8d0123/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 62cc4e2..7e66aa2 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -43,7 +43,7 @@ else
 LVM2_CONF_OPTS += --disable-applib
 endif
 
-ifeq ($(BR2_arc),y)
+ifeq ($(BR2_arc)$(BR2_m68k),y)
 LVM2_CONF_ENV += ac_cv_flag_HAVE_PIE=no
 endif
 
