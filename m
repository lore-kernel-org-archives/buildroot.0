From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 18:56:08 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/libkrb5: needs
 host-pkgconf for libedit
Message-ID: <20191223174947.231DD8DFB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=051fdfab97aa727ab009cce992a0551ff65c0fc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

host-pkgconf is needed to find libedit

Fixes:
 - http://autobuild.buildroot.org/results/45eee300788f46975d292b21eead97f9e9a8b5d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6812e466f9a23c4021750b2f6c726c252116bdec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libkrb5/libkrb5.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 7c199129a3..44a20b3707 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -41,7 +41,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 LIBKRB5_CONF_OPTS += --with-libedit
-LIBKRB5_DEPENDENCIES += libedit
+LIBKRB5_DEPENDENCIES += host-pkgconf libedit
 else
 LIBKRB5_CONF_OPTS += --without-libedit
 endif
