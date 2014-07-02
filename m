From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 17:16:14 +0200
Subject: [Buildroot] [git commit] pkg-infra: also set PKGDIR for the
	download step
Message-ID: <20140702152823.99ED399FF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d4fd5d358966b9959a0ea9f93daa3a08c6068e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be needed to get the hash file, to check the
downloaded files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 54193d2..ab1f8d2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -602,6 +602,7 @@ $$($(2)_TARGET_PATCH):			RAWNAME=$$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
+$$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 
 # Compute the name of the Kconfig option that correspond to the
