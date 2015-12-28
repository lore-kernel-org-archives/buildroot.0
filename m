From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 12:28:35 +0100
Subject: [Buildroot] [git commit] pinentry: optionally depend on libsecret
Message-ID: <20151228112950.4585F7F8AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3a2ed15eac8e9a03983c90f7f91b69a50650566
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pinentry can use libsecret when available, so we should handle this
optional dependencies properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pinentry/pinentry.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index ab7be54..09a7705 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -21,6 +21,13 @@ else
 PINENTRY_CONF_OPTS += --without-x
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSECRET),y)
+PINENTRY_CONF_OPTS += --enable-libsecret
+PINENTRY_DEPENDENCIES += libsecret
+else
+PINENTRY_CONF_OPTS += --disable-libsecret
+endif
+
 # pinentry-ncurses backend
 ifeq ($(BR2_PACKAGE_PINENTRY_NCURSES),y)
 PINENTRY_CONF_OPTS += --enable-ncurses --with-ncurses-include-dir=none
