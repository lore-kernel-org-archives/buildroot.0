From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 17:38:15 +0200
Subject: [Buildroot] [git commit] legal-info: depend on patch rather than
	extract
Message-ID: <20140708153829.769669D1C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fbba2cef24421552d21112e845cf9603a32a816
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch legal-info generation dependency to patch rather than extract
so we can use debian/copyright from debian-maintained packages,
because the *orig* file alone doesn't contain the appropiate file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index bc8a12e..2bd4466 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -629,7 +629,7 @@ $(2)_MANIFEST_LICENSE_FILES ?= not saved
 # for overriden, local or normal remote packages alike, whether
 # we want to redistribute it or not.
 ifneq ($$($(2)_LICENSE_FILES),)
-$(1)-legal-info: $(1)-extract
+$(1)-legal-info: $(1)-patch
 endif
 
 # We only save the sources of packages we want to redistribute, that are
