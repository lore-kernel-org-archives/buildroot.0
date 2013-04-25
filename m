From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Apr 2013 22:53:00 +0200
Subject: [Buildroot] [git commit] openssh: don't use a custom libexec dir
Message-ID: <20130425205441.4312A9B7F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6f71564fbee991a4a88202af541f4229bb99ff0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sftp expects to find sftp-server in the standard (/usr/libexec) location,
so ensure it gets installed there.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssh/openssh.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 3c29971..a56bb75 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -7,7 +7,7 @@
 OPENSSH_VERSION = 6.2p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
-OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
+OPENSSH_CONF_OPT = --disable-lastlog --disable-utmp \
 		--disable-utmpx --disable-wtmp --disable-wtmpx --disable-strip
 
 OPENSSH_DEPENDENCIES = zlib openssl
