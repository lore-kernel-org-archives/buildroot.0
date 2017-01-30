From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 21:14:11 +0100
Subject: [Buildroot] [git commit] heimdal: disable parallel make
Message-ID: <20170130201643.293777FFF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6980126f26c63421d04a32b6710d9e3a380476a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It still seems to suffer from issues. Fixes:
http://autobuild.buildroot.net/results/e21/e2176cb5adacdad14371d4828f13a1c23f0e18d5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/heimdal/heimdal.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index a20ec8f..5376a6c 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -8,6 +8,7 @@ HEIMDAL_VERSION = 7.1.0
 HEIMDAL_SITE = http://www.h5l.org/dist/src
 HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
 HEIMDAL_INSTALL_STAGING = YES
+HEIMDAL_MAKE = $(MAKE1)
 # static because of -fPIC issues with e2fsprogs on x86_64 host
 HOST_HEIMDAL_CONF_OPTS = \
 	--disable-shared \
