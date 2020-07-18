From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jul 2020 22:43:25 +0200
Subject: [Buildroot] [git commit] package./systemd: disable utmp
Message-ID: <20200718203937.B81EC805EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32f53bdfb482d0d78308e548c654898089b5c183
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From wikipedia:

    utmp maintains a full accounting of the current status of the
    system, system boot time (used by uptime), recording user
    logins at which terminals, logouts, system events etc.

This is seldom use, if at all, on an embedded device, and may expose
users' behaviour to others (by observing who logs in from where, for
example).

Forcibly disable support for utmp.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[yann.morin.1998 at free.fr: split off to its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 733d170193..a9a750a55f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -24,6 +24,7 @@ SYSTEMD_CONF_OPTS += \
 	-Drootlibdir='/usr/lib' \
 	-Dsysvinit-path= \
 	-Dsysvrcnd-path= \
+	-Dutmp=false \
 	-Dblkid=true \
 	-Dman=false \
 	-Dima=false \
