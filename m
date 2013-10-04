From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 16:54:40 +0200
Subject: [Buildroot] [git commit] dropbear: bump version
Message-ID: <20131004145528.4A1769B940@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69b37ad7cc3e81e04b28f608d3e015faf4f8c448
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes two security issues:

- The Dropbear server could be made to consume large amounts
of memory because decompressed packet sizes weren't checked.
Depending on the OS and hardware this might be a denial of
service.

- Valid users could be identified due to timing variations.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/dropbear.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 34dd79b..c4372ca 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2013.58
+DROPBEAR_VERSION = 2013.59
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
