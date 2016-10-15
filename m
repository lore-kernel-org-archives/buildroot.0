From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 13:15:15 +0200
Subject: [Buildroot] [git commit] core/legal-info: save empty string when no
	license file
Message-ID: <20161015111912.B36F680676@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=574c14f370fdc1c8c12968766775274a07119f33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is stored in the manifest file; it is perfectly possible to have
empty fields in there.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1a37b12..12ae86f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -779,7 +779,6 @@ endif
 ifneq ($$($(2)_LICENSE_FILES),)
 $(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
 endif
-$(2)_MANIFEST_LICENSE_FILES ?= not saved
 
 # We need to extract and patch a package to be able to retrieve its
 # license files (if any) and the list of patches applied to it (if
