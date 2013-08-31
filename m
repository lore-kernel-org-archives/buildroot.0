From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:01 -0000
Subject: [Buildroot] [git commit] crosstool-ng: remove unneed explicit
	ccache dependency
Message-ID: <20130831213336.EE7F69B5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1db8f21461646b4a1ba63c0227732f569834ba3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This ccache dependency was here to enforce build order.
It is not needed anymore.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/crosstool-ng/crosstool-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index d3ee5f8..8d98db4 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -11,7 +11,7 @@ CROSSTOOL_NG_INSTALL_TARGET    = NO
 CROSSTOOL_NG_MAKE              = $(MAKE1)
 
 HOST_CROSSTOOL_NG_DEPENDENCIES = \
-	$(if $(BR2_CCACHE),host-ccache) host-gawk \
+	host-gawk \
 	host-automake host-gperf host-bison host-flex \
 	host-texinfo
 
