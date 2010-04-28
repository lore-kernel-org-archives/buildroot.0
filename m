From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Apr 2010 23:40:47 +0200
Subject: [Buildroot] [PATCH 06/19] autotools: fix referencing to
	LIBTOOL_PATCH variable
In-Reply-To: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <88318c2d7ddd7df42d024237057b47b97b9d9029.1272490771.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.autotools.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index d8404d9..96ff91f 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -151,7 +151,7 @@ define LIBTOOL_PATCH_HOOK
 endef
 
 # default values are not evaluated yet, so don't rely on this defaulting to YES
-ifneq ($($(2)_LIBTOOL_PATCH),NO)
+ifneq ($$($(2)_LIBTOOL_PATCH),NO)
 $(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
 endif
 
-- 
1.6.3.3
