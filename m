From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Apr 2016 00:27:23 +0200
Subject: [Buildroot] [PATCH 05/13 v6] core/pkg-generic: add variable to
	store the package rawname-version
In-Reply-To: <cover.1461881416.git.yann.morin.1998@free.fr>
References: <cover.1461881416.git.yann.morin.1998@free.fr>
Message-ID: <c299afc659a583d605825f6d6bde49a2451d6653.1461881416.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
Changes v5 -> v6:
  - rename variable  (Thomas)
---
 package/pkg-generic.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 2c405e1..7aca958 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -399,6 +399,7 @@ ifdef $(3)_OVERRIDE_SRCDIR
 endif
 
 $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
+$(2)_RAW_BASE_NAME = $$($(2)_RAWNAME)-$$($(2)_VERSION)
 $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
 
@@ -429,7 +430,7 @@ ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $$($(3)_SOURCE)
  else
-  $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
+  $(2)_SOURCE			?= $$($(2)_RAW_BASE_NAME).tar.gz
  endif
 endif
 
-- 
1.9.1
