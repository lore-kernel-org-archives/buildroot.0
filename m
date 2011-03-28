From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Mar 2011 10:00:37 +0200
Subject: [Buildroot] [git commit master 1/1] external toolchain: Only prefix
	path if specified
Message-ID: <20110328081531.A815A80100@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5d6ff452add2d4e902409ed35accfa59adba37f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only prefix the external toolchain calls with its absolute path if
BR2_TOOLCHAIN_EXTERNAL_PATH is set, otherwise just assume it will
be available in the path.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index e1ffe15..f98b3e7 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -115,7 +115,11 @@ TOOLCHAIN_EXTERNAL_LOCATION=$(TOOLCHAIN_EXTERNAL_DIR)
 else
 TOOLCHAIN_EXTERNAL_LOCATION=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 endif
+ifneq ($(TOOLCHAIN_EXTERNAL_LOCATION),)
 TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_LOCATION)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
+else
+TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_PREFIX)-
+endif
 endif
 
 # Quotes are needed for spaces et al in path components.
-- 
1.7.3.4
