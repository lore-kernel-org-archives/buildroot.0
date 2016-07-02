From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 13:06:05 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	qrencode
Message-ID: <20160702110929.318AF81D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46d27602ffefcd503481e73a3bad759b89763f5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The support of qrencode depends of the journal gateway feature as it is
used to display the key used to seal the journal.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e57b595..c79b64c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -141,8 +141,14 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
 SYSTEMD_DEPENDENCIES += libmicrohttpd
 SYSTEMD_CONF_OPTS += --enable-microhttpd
+ifeq ($(BR2_PACKAGE_LIBQRENCODE),y)
+SYSTEMD_CONF_OPTS += --enable-qrencode
+SYSTEMD_DEPENDENCIES += libqrencode
 else
-SYSTEMD_CONF_OPTS += --disable-microhttpd
+SYSTEMD_CONF_OPTS += --disable-qrencode
+endif
+else
+SYSTEMD_CONF_OPTS += --disable-microhttpd --disable-qrencode
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
