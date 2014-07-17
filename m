From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 17:30:26 +0200
Subject: [Buildroot] [git commit] pkg-autotools: fix bad GETTEXTIZE_OPT
	assignment
Message-ID: <20140717153034.6B1049D26A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eada19f244bdf44042ae0c281f2ba2dbd7064f41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

HOST_PKG_GETTEXTIZE_OPT should get assigned PKG_GETTEXTIZE_OPT and not
PKG_GETTEXTIZE. Fixes:
http://autobuild.buildroot.net/results/087/087e860173069f58fa9ceb2460d7455d31b2dff8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-autotools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 50876cb..557413d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -97,7 +97,7 @@ endif
 
 ifndef $(2)_GETTEXTIZE_OPT
  ifdef $(3)_GETTEXTIZE_OPT
-  $(2)_GETTEXTIZE_OPT = $$($(3)_GETTEXTIZE)
+  $(2)_GETTEXTIZE_OPT = $$($(3)_GETTEXTIZE_OPT)
  else
   $(2)_GETTEXTIZE_OPT ?= -f
  endif
