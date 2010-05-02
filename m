From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 00:00:10 +0200
Subject: [Buildroot] [git commit master] autotools: fix referencing to
	LIBTOOL_PATCH variable
Message-ID: <20100502220950.312718A6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=87d0af93d476645d6eaab5caf6c3e8f2f05cd2b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index bbc79b7..67cc88a 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -152,7 +152,7 @@ define LIBTOOL_PATCH_HOOK
 endef
 
 # default values are not evaluated yet, so don't rely on this defaulting to YES
-ifneq ($($(2)_LIBTOOL_PATCH),NO)
+ifneq ($$($(2)_LIBTOOL_PATCH),NO)
 $(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
 endif
 
-- 
1.6.3.3
