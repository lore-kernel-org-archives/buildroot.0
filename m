From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 09:22:51 +0200
Subject: [Buildroot] [git commit] nano: work around broken syntax
	highlighting regexes
Message-ID: <20150711072314.AB24B7FE11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc16d5444fbb0f2a303e2a4a950ee286e5338056
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: use --with-wordbounds instead of fiddling with CFLAGS.]

Signed-off-by: Pascal de Bruijn <pmjdebruijn@pcode.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nano/nano.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index b030818..9b84490 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -8,7 +8,9 @@ NANO_VERSION = 2.4.2
 NANO_SITE = $(BR2_GNU_MIRROR)/nano
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
-NANO_CONF_OPTS = --without-slang
+NANO_CONF_OPTS = \
+	--without-slang \
+	--with-wordbounds
 NANO_DEPENDENCIES = ncurses
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
