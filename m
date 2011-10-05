From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 19:13:13 +0200
Subject: [Buildroot] [git commit] x11r7: make package globally visible
Message-ID: <20111005183705.1B5728E226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9bc7b1d4ae694b818f941410d1ff59316a2bba6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All x11r7 .mk files were only included into the global chain of
makefile includes if the BR2_PACKAGE_XORG7 option was enabled. This is
not the standard way to do things in Buildroot, and it even breaks
things like running "make <pkg>-*" for a x11r7 package even if X.org
is not selected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/x11r7.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/x11r7.mk b/package/x11r7/x11r7.mk
index 7c7ae69..ea0363f 100644
--- a/package/x11r7/x11r7.mk
+++ b/package/x11r7/x11r7.mk
@@ -1,3 +1 @@
-ifeq ($(BR2_PACKAGE_XORG7),y)
 include package/x11r7/*/*.mk
-endif
