From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:47:52 +0100
Subject: [Buildroot] [git commit] lua-iconv: remove default definition of
	PKG_SUBDIR
Message-ID: <20170302215348.5661880468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad82a2f65de06126da2928a451020129757f3a2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The luarocks infra already provides the correct default value for
PKG_SUBDIR, so it doesn't have to be defined in the .mk file.

Therefore, _VERSION_UPSTREAM doesn't need to be defined either.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-iconv/lua-iconv.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/lua-iconv/lua-iconv.mk b/package/lua-iconv/lua-iconv.mk
index f0afa2b..dd7533a 100644
--- a/package/lua-iconv/lua-iconv.mk
+++ b/package/lua-iconv/lua-iconv.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-LUA_ICONV_VERSION_UPSTREAM = 7
-LUA_ICONV_VERSION = $(LUA_ICONV_VERSION_UPSTREAM)-1
-LUA_ICONV_SUBDIR  = lua-iconv-$(LUA_ICONV_VERSION_UPSTREAM)
+LUA_ICONV_VERSION = 7-1
 LUA_ICONV_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LUA_ICONV_LICENSE = MIT
 LUA_ICONV_LICENSE_FILES = $(LUA_ICONV_SUBDIR)/COPYING
