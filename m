From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Dec 2016 23:32:52 +0100
Subject: [Buildroot] [git commit] putty: don't treat warnings as errors
Message-ID: <20161225223831.7F6447FA8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=203813e981ff79c6150bec5adc9d5c5c98c5d6a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/652/65246fe6357cd3cd8490bc54baa2394730dcef79/
http://autobuild.buildroot.net/results/853/85320f3b8e770bbfbec306685ad75b66e91bd6ee/
http://autobuild.buildroot.net/results/492/492a7055408ed6b388982cece41e98d956ef85f8/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/putty/putty.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index ca86c47..7603f69 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -11,6 +11,7 @@ PUTTY_SUBDIR = unix
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
 PUTTY_CONF_OPTS = --disable-gtktest
+PUTTY_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-error"
 
 ifeq ($(BR2_PACKAGE_LIBGTK2),y)
 PUTTY_CONF_OPTS += --with-gtk=2
