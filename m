From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:11:59 +0200
Subject: [Buildroot] [git commit] rsyslog: add optional gnutls support
Message-ID: <20160618131931.1B7CC819B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3984a4e306acdeeba9bc2c326003852eeb1ed295
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop explicit option and handle like other dependencies]
Signed-off-by: Adrien Decostre <ad.decostre@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsyslog/rsyslog.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 40e3b33..18a5737 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -22,6 +22,13 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 RSYSLOG_DEPENDENCIES += busybox
 endif
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+RSYSLOG_DEPENDENCIES += gnutls
+RSYSLOG_CONF_OPTS += --enable-gnutls
+else
+RSYSLOG_CONF_OPTS += --disable-gnutls
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEE),y)
 RSYSLOG_DEPENDENCIES += libee
 endif
