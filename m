From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Jul 2014 09:39:59 -0300
Subject: [Buildroot] [PATCH 01/13] legal-info: depend on patch rather than
	extract
Message-ID: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch legal-info generation dependency to patch rather than extract
so we can use debian/copyright from debian-maintained packages,
because the *orig* file alone doesn't contain the appropiate file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 54193d2..d091af1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -627,7 +627,7 @@ $(2)_MANIFEST_LICENSE_FILES ?= not saved
 # for overriden, local or normal remote packages alike, whether
 # we want to redistribute it or not.
 ifneq ($$($(2)_LICENSE_FILES),)
-$(1)-legal-info: $(1)-extract
+$(1)-legal-info: $(1)-patch
 endif
 
 # We only save the sources of packages we want to redistribute, that are
-- 
1.8.5.5
