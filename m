From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 13:47:20 +0100
Subject: [Buildroot] [git commit] ncurses: enable shared library build on
	the host
Message-ID: <20130324130051.BAD629B26A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af23d762e51be20f812b9d958268843ae4e369cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On the host, we generally build and install a shared library rather
than a static version of libraries. In this specific case, we will
want to build host-gettext, which builds a shared library that depends
on ncurses. And this doesn't work well if ncurses is static because it
hasn't been built with -fPIC. Therefore, let's build ncurses as shared
on the host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ncurses/ncurses.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index c01dfbc..eb47c36 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -116,7 +116,7 @@ define HOST_NCURSES_BUILD_CMDS
 endef
 
 HOST_NCURSES_CONF_OPT = \
-	--without-shared --without-gpm \
+	--with-shared --without-gpm \
 	--without-manpages \
 	--without-cxx \
 	--without-cxx-binding \
