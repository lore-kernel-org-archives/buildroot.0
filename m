From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 13:50:31 +0100
Subject: [Buildroot] [git commit] at: needs host-flex and host-bison
Message-ID: <20130324130052.57E8E9B258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0b497b062bada5d05adfb3555ea9f99e973b8f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/at/at.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/at/at.mk b/package/at/at.mk
index 1cea39b..6432ae3 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -9,7 +9,7 @@ AT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/at
 # missing deps for parsetime.l
 AT_MAKE = $(MAKE1)
 AT_AUTORECONF = YES
-AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex)
+AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex) host-bison host-flex
 
 AT_CONF_OPT = \
         --with-jobdir=/var/spool/cron/atjobs \
