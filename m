From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 26 Sep 2017 22:46:58 +0200
Subject: [Buildroot] [git commit] package/tor: add optional support for lzma
Message-ID: <20170926204958.95530800D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ccb665e15cc74042e8c12543d0945e1b6c6804a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to https://blog.torproject.org/tor-0317-now-released
we also need host-pkgconf for lzma support.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tor/tor.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index a68f29c..6052e09 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -30,6 +30,13 @@ ifeq ($(BR2_PACKAGE_LIBCAP),y)
 TOR_DEPENDENCIES += libcap
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+TOR_CONF_OPTS += --enable-lzma
+TOR_DEPENDENCIES += host-pkgconf xz
+else
+TOR_CONF_OPTS += --disable-lzma
+endif
+
 ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_i386)$(BR2_x86_64)$(BR2_PACKAGE_LIBSECCOMP),yy)
 TOR_CONF_OPTS += --enable-seccomp
 TOR_DEPENDENCIES += libseccomp
