From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:47:49 +0100
Subject: [Buildroot] [git commit] lua-csnappy: remove default definition of
	PKG_SUBDIR
Message-ID: <20170302215348.47C6380468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79923a6bdc18a7ea178aaa2364e3fcd33905c418
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The luarocks infra already provides the correct default value for
PKG_SUBDIR, so it doesn't have to be defined in the .mk file.

Therefore, _VERSION_UPSTREAM doesn't need to be defined either.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-csnappy/lua-csnappy.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/lua-csnappy/lua-csnappy.mk b/package/lua-csnappy/lua-csnappy.mk
index 0739259..1867b60 100644
--- a/package/lua-csnappy/lua-csnappy.mk
+++ b/package/lua-csnappy/lua-csnappy.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-LUA_CSNAPPY_VERSION_UPSTREAM = 0.1.4
-LUA_CSNAPPY_VERSION = $(LUA_CSNAPPY_VERSION_UPSTREAM)-1
-LUA_CSNAPPY_SUBDIR = lua-csnappy-$(LUA_CSNAPPY_VERSION_UPSTREAM)
+LUA_CSNAPPY_VERSION = 0.1.4-1
 LUA_CSNAPPY_LICENSE = BSD-3c
 LUA_CSNAPPY_LICENSE_FILES = $(LUA_CSNAPPY_SUBDIR)/COPYRIGHT
 
