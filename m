From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 10:15:32 +0200
Subject: [Buildroot] [git commit] package/openvmtools: fix procps-ng library
	name
Message-ID: <20150419081557.BE4978193D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df484231d9f10842f984e571f6393570292b88ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

procps-ng libraries are now accesible on the same name as procps, thus
using the CUSTOM_PROCPS_NAME environment variable breaks compilation.

Fixes:

  http://autobuild.buildroot.net/results/2a1/2a19f84c35de0ff008c2cd1aea96f6a4f2767ee1/

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openvmtools/openvmtools.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index f180f6f..ef6544a 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -33,7 +33,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
 OPENVMTOOLS_CONF_OPTS += --with-procps
-OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps
 OPENVMTOOLS_DEPENDENCIES += procps-ng
 else
 OPENVMTOOLS_CONF_OPTS += --without-procps
