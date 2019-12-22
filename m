From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 22:01:55 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/dante: remove
 --without-pam
Message-ID: <20191222205406.2ACF88D7B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99b339c22d27ede9369776388b0b1b89ce4fc8a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

--without-pam was wrongly put back when next was merged into master for
2019.02 in commit 13c43455a05b (Merge branch 'next')

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: mention next merge]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 525c22c9831aeb2c3a4ac4d59c117b429a682941)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dante/dante.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index 0bd036d37e..0668042bd8 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -12,7 +12,7 @@ DANTE_LICENSE_FILES = LICENSE
 # 0002-compiler.m4-do-not-remove-g-flag.patch touches a m4 file
 DANTE_AUTORECONF = YES
 
-DANTE_CONF_OPTS += --disable-client --disable-preload --without-pam
+DANTE_CONF_OPTS += --disable-client --disable-preload
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 DANTE_DEPENDENCIES += linux-pam
