From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:51:34 +0200
Subject: [Buildroot] [git commit] package/gdbm: add optional support for
	readline
Message-ID: <20170604075143.0F9C482245@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=782bcf0df7636bad4b8efc35229861ec6d4877cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

readline support was added in version 1.13:

http://puszcza.gnu.org.ua/forum/forum.php?forum_id=1145
"The gdbmtool utility now offers the usual line-editing facilities
 (if the package has been compiled with GNU Readline."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdbm/gdbm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 290e841..4e3ed76 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -14,4 +14,11 @@ ifeq ($(BR2_PACKAGE_GETTEXT),y)
 GDBM_DEPENDENCIES += gettext
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+GDBM_CONF_OPTS += --with-readline
+GDBM_DEPENDENCIES += readline
+else
+GDBM_CONF_OPTS += --without-readline
+endif
+
 $(eval $(autotools-package))
