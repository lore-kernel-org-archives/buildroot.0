From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 21:50:46 +0200
Subject: [Buildroot] [git commit master] ipkg: remove useless configure
	options
Message-ID: <20100413195157.9A47720F99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9005b04bc0d854c3b896ffdfc56f6d6fcb417ec3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These options are part of the default set of options passed to
./configure by the AUTOTARGETS infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipkg/ipkg.mk |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/ipkg/ipkg.mk b/package/ipkg/ipkg.mk
index 5f640f6..30a27c0 100644
--- a/package/ipkg/ipkg.mk
+++ b/package/ipkg/ipkg.mk
@@ -11,7 +11,4 @@ IPKG_AUTORECONF = NO
 IPKG_INSTALL_STAGING = YES
 IPKG_INSTALL_TARGET = YES
 
-IPKG_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --prefix=/usr --sysconfdir=/etc
-
-$(eval $(call AUTOTARGETS,package,ipkg))
\ No newline at end of file
+$(eval $(call AUTOTARGETS,package,ipkg))
-- 
1.6.3.3
