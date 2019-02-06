From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed,  6 Feb 2019 04:15:30 -0500
Subject: [Buildroot] [PATCH v10 5/6] package/pkg-autotools.mk: Add
 PKG_GIR_EXTRA_LIBS_PATH variable
In-Reply-To: <20190206091531.104591-1-aduskett@gmail.com>
References: <20190206091531.104591-1-aduskett@gmail.com>
Message-ID: <20190206091531.104591-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Some packages require passing an extra libs path to gobject-introspection
in order to compile their respective typelib files. This allows users to
specify a PKG_GIR_EXTRA_LIBS_PATH variable in the respective packages mk file
that will then be passed on to the g-ir-scanner, allowing those directory paths
to be indexed.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v10:
  - Add this patch to the series.

 package/pkg-autotools.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 45de99356f..06021f95c1 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -162,6 +162,7 @@ endif
 
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPTS			?=
+$(2)_GIR_EXTRA_LIBS_PATH	?=
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPTS			?=
 $(2)_INSTALL_OPTS                ?= install
@@ -239,6 +240,8 @@ endef
 endif
 endif
 
+export GIR_EXTRA_LIBS_PATH=$$($$(PKG)_GIR_EXTRA_LIBS_PATH)
+
 $(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
 ifeq ($$($(2)_AUTORECONF),YES)
-- 
2.20.1
