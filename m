From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Apr 2010 09:12:39 +0200
Subject: [Buildroot] [git commit master] target: really remove the
	target/*/*.mk include
Message-ID: <20100420071958.1C9968B79D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d3a1233fbaa434b24291b6f5f245d2a748e70510
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5faae4869027 claimed to do this, but it didn't - Causing
make to error out.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Makefile.in |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/target/Makefile.in b/target/Makefile.in
index 48396d5..afe96a7 100644
--- a/target/Makefile.in
+++ b/target/Makefile.in
@@ -62,8 +62,6 @@ ifeq ($(BR2_TARGET_UBOOT),y)
 include target/u-boot/Makefile.in
 endif
 
-include target/*/*.mk
-
 # kernel rules
 # We already did add the kernel target to TARGETS and now just pull in the rules
 # to actually build this target.
-- 
1.6.3.3
