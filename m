From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 23:32:09 +0100
Subject: [Buildroot] [git commit] crosstool-ng: add missing dependencies
Message-ID: <20130324223349.BE7719B223@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8dfe032f7e2db454453ba868d3356d5f3afdbab5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/crosstool-ng/crosstool-ng.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 3b207a2..2d93f90 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -3,6 +3,10 @@ CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
 CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
 CROSSTOOL_NG_INSTALL_TARGET    = NO
 CROSSTOOL_NG_MAKE              = $(MAKE1)
-HOST_CROSSTOOL_NG_DEPENDENCIES = $(if $(BR2_CCACHE),host-ccache) host-gawk host-automake host-gperf
+
+HOST_CROSSTOOL_NG_DEPENDENCIES = \
+	$(if $(BR2_CCACHE),host-ccache) host-gawk \
+	host-automake host-gperf host-bison host-flex \
+	host-texinfo
 
 $(eval $(host-autotools-package))
