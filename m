From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:57:38 +0200
Subject: [Buildroot] [PATCH 2/5] x11r7: make package globally visible
In-Reply-To: <cover.1316465857.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316465857.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c909524d6b4a5f5d13cbb577d124a0aa456fd123.1316465857.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All x11r7 .mk files were only included into the global chain of
makefile includes if the BR2_PACKAGE_XORG7 option was enabled. This is
not the standard way to do things in Buildroot, and it even breaks
things like running "make <pkg>-*" for a x11r7 package even if X.org
is not selected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
1.7.4.1
