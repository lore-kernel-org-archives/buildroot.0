From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 21:59:03 +0200
Subject: [Buildroot] [git commit] package/php: explicitly disable phpdbg
Message-ID: <20160908195915.862B882263@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c506fa737f174879f37bb73aa2033dddeba0ec3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building php, the package will also build/install phpdbg.
This patch explicitly disables this behaviour.

Signed-off-by: Theo Debrouwere <t.debrouwere@televic.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index deaf56e..7df10be 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -19,6 +19,7 @@ PHP_CONF_OPTS = \
 	--disable-all \
 	--without-pear \
 	--with-config-file-path=/etc \
+	--disable-phpdbg \
 	--disable-rpath
 PHP_CONF_ENV = \
 	ac_cv_func_strcasestr=yes \
