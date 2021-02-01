From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2021 19:07:51 +0100
Subject: [Buildroot] [git commit] package/luasyslog: needs host-luarocks
Message-ID: <20210201174809.9BC2386338@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91d5fe43e49f9cefaabbde3e3560ea7fdfff19c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-luarocks is needed since bump to version 2.2.0 as the package is
now using autotools infrastructure instead of luarocks

Fixes:
 - http://autobuild.buildroot.org/results/f6a9615e965905bdc0a1e62020e4b27d6653693f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luasyslog/luasyslog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luasyslog/luasyslog.mk b/package/luasyslog/luasyslog.mk
index e4fd4be91c..049e068a13 100644
--- a/package/luasyslog/luasyslog.mk
+++ b/package/luasyslog/luasyslog.mk
@@ -6,7 +6,7 @@
 
 LUASYSLOG_VERSION = 2.2.0
 LUASYSLOG_SITE = $(call github,ntd,luasyslog,$(LUASYSLOG_VERSION))
-LUASYSLOG_DEPENDENCIES = luainterpreter
+LUASYSLOG_DEPENDENCIES = host-luarocks luainterpreter
 LUASYSLOG_LICENSE = MIT
 LUASYSLOG_LICENSE_FILES = COPYING
 # fetching from github
