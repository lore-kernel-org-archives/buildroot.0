From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 23:08:18 +0100
Subject: [Buildroot] [git commit] package/sconeserver: location support
	needs host-pkgconf
Message-ID: <20160205221225.4C7198175E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e82f8fd2fca7c9b1f3798727942a04990af4801
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch suggested by Arnout: http://patchwork.ozlabs.org/patch/576212/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sconeserver/sconeserver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index ed1133e..592de22 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -79,7 +79,7 @@ SCONESERVER_CONF_OPTS += --without-rss
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_LOCATION),y)
-SCONESERVER_DEPENDENCIES += gpsd
+SCONESERVER_DEPENDENCIES += host-pkgconf gpsd
 SCONESERVER_CONF_OPTS += --with-location
 else
 SCONESERVER_CONF_OPTS += --without-location
