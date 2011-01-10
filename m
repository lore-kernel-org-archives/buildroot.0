From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jan 2011 23:24:58 +0100
Subject: [Buildroot] [git commit master 1/1] at: fix build issue with
	parallel builds
Message-ID: <20110110224623.1D1198A3DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=716d75350b26e4a0dab8045a5d39e1153e61b561
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With highly parallel builds, the input files for parsetime.l are not
alway present when needed, breaking the build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/at/at.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/at/at.mk b/package/at/at.mk
index 9067fa5..e9873f8 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -6,6 +6,8 @@
 AT_VERSION = 3.1.12
 AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
 AT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/at
+# missing deps for parsetime.l
+AT_MAKE = $(MAKE1)
 AT_AUTORECONF = YES
 AT_INSTALL_STAGING = NO
 AT_INSTALL_TARGET = YES
-- 
1.7.2.2
