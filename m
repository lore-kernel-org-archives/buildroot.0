From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 16 Jun 2021 08:10:02 +0200
Subject: [Buildroot] [PATCH 2/2] package/spice: drop duplicated opus handling
In-Reply-To: <20210616061002.345235-1-fontaine.fabrice@gmail.com>
References: <20210616061002.345235-1-fontaine.fabrice@gmail.com>
Message-ID: <20210616061002.345235-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

opus dependency is handled twice since commit
f33f7a4f6407f624edb4b4ffe54cb09e029a49b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/spice/spice.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index ab35265ab4..5f7bcd9d2f 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -45,11 +45,6 @@ else
 SPICE_CONF_OPTS += --disable-opus
 endif
 
-# no enable/disable, detected using pkg-config
-ifeq ($(BR2_PACKAGE_OPUS),y)
-SPICE_DEPENDENCIES += opus
-endif
-
 # We need to tweak spice.pc because it /forgets/ (for static linking) that
 # it should link against libz and libjpeg. libz is pkg-config-aware, while
 # libjpeg isn't, hence the two-line tweak
-- 
2.30.2
