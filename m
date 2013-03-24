From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 23:29:06 +0100
Subject: [Buildroot] [PATCH 2/2] crosstool-ng: add missing dependencies
In-Reply-To: <1364164146-16517-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364164146-16517-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364164146-16517-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/crosstool-ng/crosstool-ng.mk |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

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
-- 
1.7.9.5
