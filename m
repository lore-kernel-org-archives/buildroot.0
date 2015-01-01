From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 17:04:02 +0100
Subject: [Buildroot] [git commit] ortp: do not use libsrtp
Message-ID: <20150101160413.ECD44807F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=823e90cb531e2a9e479aa39f923156cb55f7ef12
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ortp is not happy with the newly packaged libsrtp implementation, so
let's not use it.

Fixes:

  http://autobuild.buildroot.org/results/ba1/ba1e29c6b5cc7ff7ff4582ec2319598ff9b28bae/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ortp/ortp.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
index 3bcc7a9..89bfc06 100644
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -6,7 +6,10 @@
 
 ORTP_VERSION = 0.22.0
 ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
-ORTP_CONF_OPTS = --disable-strict
+
+# ortp is not happy with the libsrtp implementation packaged in
+# Buildroot
+ORTP_CONF_OPTS = --disable-strict --with-srtp=none
 ORTP_INSTALL_STAGING = YES
 ORTP_LICENSE = LGPLv2.1+
 ORTP_LICENSE_FILES = COPYING
