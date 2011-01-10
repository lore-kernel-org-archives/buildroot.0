From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jan 2011 23:53:30 +0100
Subject: [Buildroot] [git commit master 1/1] ltrace: fix build issue with
	parallel builds
Message-ID: <20110110225456.A894B8A3BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8664906fe782aa0edf767a68cdc6784493be6c91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With highly parallel builds, sysdep.h is not always generated before it
is needed, breaking the build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ltrace/ltrace.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 9808240..e7947f1 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -7,6 +7,7 @@ LTRACE_VERSION      = 0.5.3
 LTRACE_SOURCE       = ltrace_$(LTRACE_VERSION).orig.tar.gz
 LTRACE_PATCH        = ltrace_$(LTRACE_VERSION)-2.1.diff.gz
 LTRACE_SITE         = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/ltrace
+LTRACE_MAKE         = $(MAKE1)
 LTRACE_DEPENDENCIES = libelf
 
 # ltrace uses arch=ppc for powerpc
-- 
1.7.2.2
