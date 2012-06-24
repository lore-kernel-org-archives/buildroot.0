From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Jun 2012 11:10:15 +0200
Subject: [Buildroot] [git commit] midori: change use of BR2_JLEVEL to
	PARALLEL_JOBS
Message-ID: <20120624095658.36B5388F3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3fa214aadf41ff35835d91f67a6502d3b9a79bfd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nathan Lynch <ntl@pobox.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/midori/midori.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 0b3439c..aa376a2 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -34,7 +34,7 @@ define MIDORI_CONFIGURE_CMDS
 endef
 
 define MIDORI_BUILD_CMDS
-       (cd $(@D); ./waf build -j $(BR2_JLEVEL))
+       (cd $(@D); ./waf build -j $(PARALLEL_JOBS))
 endef
 
 define MIDORI_INSTALL_TARGET_CMDS
