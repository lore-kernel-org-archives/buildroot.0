From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 8 Aug 2017 20:45:07 +0200
Subject: [Buildroot] [git commit] bind: fix configure in case lmdb devel
	files are present on the host
Message-ID: <20170809210702.5A99A816A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb95fef1e0bec4ebc0584001f337438b17c4744d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/bind/bind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 988f40e..c65568e 100644
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
