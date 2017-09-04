From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Sep 2017 23:30:50 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/samba4: add
	optional dependency to dbus
Message-ID: <20170904215238.83ABF7FFA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85a32431a7b6918282fbd6a1b450791c321a9d37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

samba4 picks up dbus as dependency if it was built before:

Checking for dbus                : yes
Checking for header dbus/dbus.h  : yes
Checking for library dbus-1      : yes

There is no configure option to control dbus support so we just make
sure dbus is built before samba4 to have reproducible builds.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 17f6c26590d22365968e7fd0d246b315b255d204)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 3ffe11e..4301393 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -32,6 +32,10 @@ else
 SAMBA4_CONF_OPTS += --disable-cups
 endif
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+SAMBA4_DEPENDENCIES += dbus
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_AVAHI_DAEMON),yy)
 SAMBA4_CONF_OPTS += --enable-avahi
 SAMBA4_DEPENDENCIES += avahi
