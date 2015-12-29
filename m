From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 12:23:07 +0100
Subject: [Buildroot] [git commit] emlog: remove linux dependency
Message-ID: <20151229112402.477287FB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cabb083814999cae69b7eb17202e3238e169aab1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dependency on linux is automatically added by the kernel-module
infrastructure, so there is no need to explicit add it in the emlog
package.

Thanks to Arnout for spotting the issue.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/emlog/emlog.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/emlog/emlog.mk b/package/emlog/emlog.mk
index cf11961..f79b1cf 100644
--- a/package/emlog/emlog.mk
+++ b/package/emlog/emlog.mk
@@ -6,7 +6,6 @@
 
 EMLOG_VERSION = bd32494ad757c3d37469877aaf99ced3ee6ca3f8
 EMLOG_SITE = $(call github,nicupavel,emlog,$(EMLOG_VERSION))
-EMLOG_DEPENDENCIES = linux
 EMLOG_LICENSE = GPLv2
 EMLOG_LICENSE_FILES = COPYING
 
