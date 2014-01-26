From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jan 2014 23:16:55 +0100
Subject: [Buildroot] [git commit] poco: fix nios2 fenv build failure
Message-ID: <20140126222223.B98BA9C650@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b392a24adbe18ac9848bcbfbec15d8c5add7affc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable FP environment on nios2.

Fixes:
http://autobuild.buildroot.net/results/3ce/3ce9d6dc5c4e8fceebaa461e5085da7f33fda8a1/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poco/poco.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 9ee2d61..251fcc1 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -34,8 +34,8 @@ ifeq ($(LIBC),uclibc)
 POCO_CONF_OPT += --no-fpenvironment --no-wstring
 endif
 
-# sh4a is missing FE_DOWNWARD and FE_UPWARD in its fenv.h
-ifeq ($(BR2_sh4a),y)
+# architectures missing some FE_* in their fenv.h
+ifeq ($(BR2_sh4a)$(BR2_nios2),y)
 POCO_CONF_OPT += --no-fpenvironment
 endif
 
