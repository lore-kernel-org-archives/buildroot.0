From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 11:26:01 +0200
Subject: [Buildroot] [git commit] package/xmlstarlet: add host variant
Message-ID: <20170429101426.24D54818B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43198b07588c45fb4e045112eee989396b6feeb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for the Kodi skin package to control the default skin setup.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xmlstarlet/xmlstarlet.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 61d38f2..091c371 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -24,4 +24,7 @@ else
 XMLSTARLET_CONF_OPTS += --disable-static-libs
 endif
 
+HOST_XMLSTARLET_DEPENDENCIES += host-libxml2 host-libxslt
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
