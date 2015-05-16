From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 14:20:47 +0200
Subject: [Buildroot] [git commit] package/boost: stop on the first error
	during install to staging
Message-ID: <20150516122100.A982481768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e94a9531590609d1530837c2009d96d29cc148b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-q option is missing in BOOST_INSTALL_STAGING_CMDS,
so the build doesn't stop on the first error.
This help to see what happened.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/boost.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 7060591..3fe44e3 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -148,7 +148,7 @@ define HOST_BOOST_INSTALL_CMDS
 endef
 
 define BOOST_INSTALL_STAGING_CMDS
-	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -d+1 \
+	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -q -d+1 \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPTS) \
 	--prefix=$(STAGING_DIR)/usr \
