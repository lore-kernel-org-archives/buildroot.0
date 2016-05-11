From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 23:28:54 +0200
Subject: [Buildroot] [git commit branch/next] core/pkg-generic: add variable
	to store the package rawname-version
Message-ID: <20160511212916.A840481ED2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed959089ee886293f470d2d23d7cc0716de2a017
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Introduce a new per-package variable to store the 'rawname-version'
tuple, instead of computing it every time we need it.

Currently, it's only a single location, but follow-up patches will
introduce more use of it.

Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f9c7cf8..688123c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -393,6 +393,7 @@ ifdef $(3)_OVERRIDE_SRCDIR
 endif
 
 $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
+$(2)_RAW_BASE_NAME = $$($(2)_RAWNAME)-$$($(2)_VERSION)
 $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
 
@@ -423,7 +424,7 @@ ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $$($(3)_SOURCE)
  else
-  $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
+  $(2)_SOURCE			?= $$($(2)_RAW_BASE_NAME).tar.gz
  endif
 endif
 
