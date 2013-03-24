From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:37 +0100
Subject: [Buildroot] [PATCH 13/22] ncurses: enable shared library build on
	the host
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-14-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On the host, we generally build and install a shared library rather
than a static version of libraries. In this specific case, we will
want to build host-gettext, which builds a shared library that depends
on ncurses. And this doesn't work well if ncurses is static because it
hasn't been built with -fPIC. Therefore, let's build ncurses as shared
on the host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.9.5
