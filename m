From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 May 2010 21:17:01 +0200
Subject: [Buildroot] [git commit master] package/sed: make HOST_SED_BINARY a
	simply expanded variable (:=)
Message-ID: <20100506192021.98F888A2C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=137a6ccf5a7dd5eb16a22755086e92d00d9192a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

HOST_SED_BINARY is used 2 times during startup, and is relatively
expensive to run, so make it a simple expanded variable (:=) rather
than a recursively expanded one (=).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sed/sed.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 6508725..35cedce 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -17,7 +17,7 @@ endif
 #HOST_SED_DIR:=$(STAGING_DIR)
 HOST_SED_DIR:=$(TOOLCHAIN_DIR)
 SED:=$(HOST_SED_DIR)/bin/sed -i -e
-HOST_SED_BINARY=$(shell package/sed/sedcheck.sh)
+HOST_SED_BINARY:=$(shell package/sed/sedcheck.sh)
 HOST_SED_IF_ANY=$(shell toolchain/dependencies/check-host-sed.sh)
 
 $(DL_DIR)/$(SED_SOURCE):
-- 
1.6.3.3
