From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 18:48:05 +0200
Subject: [Buildroot] [git commit] package/dovecot: Add optional support for
	icu
Message-ID: <20150713170356.26D1681974@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61a9a4cb29bd115b6255db682ef10442f1309682
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Optional dependency added to fts plugin since Dovecot 2.2.17:
http://hg.dovecot.org/dovecot-2.2/diff/b179bbd226e5/configure.ac

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dovecot/dovecot.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 3b4f6d1..58666d0 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -40,6 +40,13 @@ else
 DOVECOT_CONF_OPTS += --without-bzlib
 endif
 
+ifeq ($(BR2_PACKAGE_ICU),y)
+DOVECOT_CONF_OPTS += --with-icu
+DOVECOT_DEPENDENCIES += icu
+else
+DOVECOT_CONF_OPTS += --without-icu
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 DOVECOT_CONF_OPTS += --with-libcap
 DOVECOT_DEPENDENCIES += libcap
