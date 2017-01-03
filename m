From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jan 2017 16:21:18 +0100
Subject: [Buildroot] [git commit] weston: fix DEPENDENCIES typo
Message-ID: <20170103152906.72E727FB3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8718bb82cbef6c18e5f575bd758fa02b68c276c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a build failure with the PPS patchset since libva isn't populated.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/weston.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 89e16f1..3a02df0 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -109,7 +109,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBVA),y)
 WESTON_CONF_OPTS += --enable-vaapi-recorder
-WESTON_DEPENDENIES += libva
+WESTON_DEPENDENCIES += libva
 else
 WESTON_CONF_OPTS += --disable-vaapi-recorder
 endif
