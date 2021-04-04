From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 14:08:06 +0200
Subject: [Buildroot] [git commit] package/pcmanfm: fix build with
 gettext-tiny
Message-ID: <20210404114250.34E50883F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07cbc83f8f59e2e1ad8cbd34bd1091aaf2e3d8cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build of pcmanfm in version 1.3.2 with gettext-tiny

Fixes:
 - http://autobuild.buildroot.org/results/69f4e5fa44208429b143011640971a61d709d5b1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-po-de-po-fix-build-with-gettext-tiny.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/pcmanfm/0001-po-de-po-fix-build-with-gettext-tiny.patch b/package/pcmanfm/0001-po-de-po-fix-build-with-gettext-tiny.patch
new file mode 100644
index 0000000000..ededd450ae
--- /dev/null
+++ b/package/pcmanfm/0001-po-de-po-fix-build-with-gettext-tiny.patch
@@ -0,0 +1,35 @@
+From 2e51d1015ffd58f26f4ddf03a858164edcf64a8c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 26 Mar 2021 09:16:08 +0100
+Subject: [PATCH] po/de.po: fix build with gettext-tiny
+
+Build of de.gmo is broken with gettext-tiny since version 1.3.2 and
+commit 80e0f662861e6d0ad8888f61c19c0695978779bf:
+
+file=`echo de | sed 's,.*/,,'`.gmo \
+  && rm -f $file && /home/buildroot/autobuild/instance-2/output-1/host/bin/msgfmt -o $file de.po
+Makefile:102: recipe for target 'de.gmo' failed
+
+Fixes:
+ - http://autobuild.buildroot.org/results/69f4e5fa44208429b143011640971a61d709d5b1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/lxde/pcmanfm/pull/8]
+---
+ po/de.po | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/po/de.po b/po/de.po
+index 766a44e..9781ba3 100644
+--- a/po/de.po
++++ b/po/de.po
+@@ -961,8 +961,7 @@ msgstr "Diese Ordneransicht merken"
+ #: ../src/main-win-ui.c:279
+ msgid ""
+ "Check to remember view and sort as folder setting rather than global one"
+-msgstr
+-"Ansicht und Sortierung f??r dieses Verzeichnis anstelle der globalen "
++msgstr "Ansicht und Sortierung f??r dieses Verzeichnis anstelle der globalen "
+ "Einstellung merken"
+ 
+ #: ../src/main-win-ui.c:281
