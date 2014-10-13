From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Oct 2014 12:53:04 +0200
Subject: [Buildroot] [git commit] openssh: place configuration files in
	/etc/ssh
Message-ID: <20141014074530.EF791B2C4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8ae6a3b2f0c8f8d8c7d0ae1432fa0243757f41e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pkg-autotools.mk fix --sysconfdir to "/etc". This patch restore
--sysconfdir to its default value (/etc/ssh)

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 17097d5..e2f2663 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -9,7 +9,7 @@ OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3c BSD-2c Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
-OPENSSH_CONF_OPTS = --disable-lastlog --disable-utmp \
+OPENSSH_CONF_OPTS = --sysconfdir=/etc/ssh --disable-lastlog --disable-utmp \
 		--disable-utmpx --disable-wtmp --disable-wtmpx --disable-strip
 
 # uClibc toolchain for ARC doesn't support PIE at the moment
