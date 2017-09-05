From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Sep 2017 23:26:32 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] bind: fix configure in
	case lmdb devel files are present on the host
Message-ID: <20170905220138.A15D081ED2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da9f101e8000c17b56fa18c538a6f6233e93046c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fix configure failure in case lmdb devel files are present on the host
by adding --without-lmdb option (reported [1] and fix tested [2],[3] by
grunpferd at netscape.net).

Fixes:

  checking for lmdb library... yes
  checking for library containing mdb_env_create... no
  configure: error: found lmdb include but not library.

[1] http://lists.busybox.net/pipermail/buildroot/2017-August/199945.html
[2] http://lists.busybox.net/pipermail/buildroot/2017-August/199963.html
[3] http://lists.busybox.net/pipermail/buildroot/2017-August/199964.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit bb95fef1e0bec4ebc0584001f337438b17c4744d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index acc0911..c5208c0 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -24,6 +24,7 @@ BIND_CONF_ENV = \
 	BUILD_CC="$(TARGET_CC)" \
 	BUILD_CFLAGS="$(TARGET_CFLAGS)"
 BIND_CONF_OPTS = \
+	--without-lmdb \
 	--with-libjson=no \
 	--with-randomdev=/dev/urandom \
 	--enable-epoll \
